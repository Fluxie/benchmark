#!/usr/bin/env bash

# Cleanup the previous configuration
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BUILD_DIR="${SCRIPT_DIR}/build"
echo "${BUILD_DIR}"
rm -rf "${BUILD_DIR}"
mkdir "${BUILD_DIR}"

# Compile
cd "${BUILD_DIR}"
cmake .. -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_C_COMPILER=clang -DCMAKE_USER_MAKE_RULES_OVERRIDE=${SCRIPT_DIR}/clang_overrides.txt -DCMAKE_BUILD_TYPE=Release -DBENCHMARK_USE_LIBCXX=Yes
make
cd "${SCRIPT_DIR}"
