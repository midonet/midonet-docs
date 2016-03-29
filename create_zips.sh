#!/bin/bash
shopt -s globstar
set -e

#
# List of directories to be zipped.
#
BUILD_DIRS=(
    'operation-guide_en'
    'operation-guide_ja'
    'quick-start-guide_rhel-7_kilo-osp_en'
    'quick-start-guide_rhel-7_kilo-rdo_en'
    'quick-start-guide_rhel-7_kilo-rdo_ja'
    'quick-start-guide_rhel-7_liberty-rdo_en'
    'quick-start-guide_rhel-7_liberty-rdo_ja'
    'quick-start-guide_sles-12_liberty-soc_en'
    'quick-start-guide_ubuntu-1404_kilo_en'
    'quick-start-guide_ubuntu-1404_kilo_ja'
    'quick-start-guide_ubuntu-1404_liberty_en'
    'quick-start-guide_ubuntu-1404_liberty_ja'
    'reference-architecture_en'
    'reference-architecture_ja'
    'rest-api_en'
    'troubleshooting-guide_en'
    'troubleshooting-guide_ja'
)

#
# Copy PDFs and create ZIPs for HTML.
#
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
TIMESTAMP=$(date +%Y-%m-%d)
mkdir -p ${SCRIPT_DIR}/target
rm -f ${SCRIPT_DIR}/target/*.pdf
rm -f ${SCRIPT_DIR}/target/*.zip
for BUILD_DIR in "${BUILD_DIRS[@]}"; do
    PDF_PATH=$(ls build/${BUILD_DIR}/target/docbkx/webhelp/**/*.pdf)
    echo $PDF_PATH
    PDF_NAME=$(basename ${PDF_PATH})
    echo $PDF_NAME
    cp ${PDF_PATH} ${SCRIPT_DIR}/target/$(basename ${PDF_PATH} .pdf)_\($(date +%Y-%m-%d\)).pdf
    cd build/${BUILD_DIR}/target/docbkx/webhelp/
    zip -r ${SCRIPT_DIR}/target/$(basename ${PDF_PATH} .pdf)_\($(date +%Y-%m-%d\)).html.zip .
    cd ${SCRIPT_DIR}
done

mkdir -p ${SCRIPT_DIR}/target/EN
mkdir -p ${SCRIPT_DIR}/target/JA

mv ${SCRIPT_DIR}/target/*_EN_* ${SCRIPT_DIR}/target/EN
mv ${SCRIPT_DIR}/target/*_JA_* ${SCRIPT_DIR}/target/JA

ls -alh target/EN
ls -alh target/JA

echo "---------------------------------------------------------------"
echo "SUCCESS"
echo "---------------------------------------------------------------"
