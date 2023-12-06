#!/usr/bin/env bash

set -euo pipefail

GH_REPO="https://github.com/DannyBen/bashly"
TOOL_NAME="bashly"
TOOL_TEST="bashly --version"

fail() {
	echo -e "asdf-$TOOL_NAME: $*"
	exit 1
}

curl_opts=(-fsSL)

if [ -n "${GITHUB_API_TOKEN:-}" ]; then
	curl_opts=("${curl_opts[@]}" -H "Authorization: token $GITHUB_API_TOKEN")
fi

sort_versions() {
	sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
		LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_github_tags() {
	git ls-remote --tags --refs "$GH_REPO" |
		grep -o 'refs/tags/.*' | cut -d/ -f3- |
		sed 's/^v//'
}

list_all_versions() {
	list_github_tags
}

download_release() {
	local version download_dir
	version="$1"
	download_dir="$2"

	local gem_home="${download_dir}/gem_home"
	mkdir -p "${gem_home}"

	GEM_HOME="${gem_home}" gem install "${TOOL_NAME}:${version}"
}

install_version() {
	local install_type="$1"
	local version="$2"
	local plugin_dir="${3}"
	local install_path="${4}"
	local bin_dir="${install_path}/bin"

	if [ "$install_type" != "version" ]; then
		fail "asdf-$TOOL_NAME supports release installs only"
	fi

	(
		mkdir -p "${install_path}"

		echo "installing ${ASDF_DOWNLOAD_PATH} to ${install_path}..."
		cp -r "${ASDF_DOWNLOAD_PATH}/"* "${install_path}"

		mkdir -p "${bin_dir}"
		cp "${plugin_dir}/lib/bashly_wrapper.sh" "${bin_dir}/bashly"

		local tool_cmd
		tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"
		test -x "$bin_dir/$tool_cmd" || fail "Expected $bin_dir/$tool_cmd to be executable."

		echo "$TOOL_NAME $version installation was successful!"
	) || (
		rm -rf "$install_path"
		fail "An error occurred while installing $TOOL_NAME $version."
	)
}
