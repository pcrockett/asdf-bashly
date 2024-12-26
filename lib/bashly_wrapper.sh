#!/usr/bin/env bash
set -Eeuo pipefail

current_script_path="${BASH_SOURCE[0]}"
bin_dir="$(dirname "${current_script_path}")"
install_dir="$(dirname "${bin_dir}")"
gem_home="${install_dir}/gem"

PATH="${gem_home}/bin:${PATH}" \
	BUNDLE_GEMFILE="${install_dir}/Gemfile" \
	BUNDLE_PATH="${install_dir}/artifacts" \
	GEM_HOME="${gem_home}" \
	GEM_PATH="${gem_home}" \
	bundle exec bashly "${@}"
