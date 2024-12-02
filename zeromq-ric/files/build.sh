#!/bin/env bash
set -x

GNB_BUILD_DIR="/oran/srsRAN_Project/build"
UE_BUILD_DIR="/oran/srsRAN_4G/build"

build_project() {
    if [[ -n "$1" ]]; then BUILD_DIR="$1"; fi
    if [[ ! -d "${BUILD_DIR}" ]]; then
        mkdir -p "${BUILD_DIR}"
        cd "${BUILD_DIR}" || exit

        if [[ "${BUILD_DIR}" =~ "srsRAN_Project" ]]; then
            cmake ../ -DENABLE_EXPORT=ON -DENABLE_ZEROMQ=ON
        else
            cmake ../
        fi
        make -j "$(nproc)"
    fi
}

build_project "$GNB_BUILD_DIR"
build_project "$UE_BUILD_DIR"
