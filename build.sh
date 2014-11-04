mvn clean install 2>&1 | tee build.log

ASCIIDOC_WARNINGS=$(grep -i "asciidoctor.*warning" build.log)
if [ $? -eq 0 ]; then
    echo ""
    echo "############################################################"
    echo "${ASCIIDOC_WARNINGS}"
    echo "############################################################"
    echo ""
    echo "BUILD FAILURE: ASCIIDOC WARNINGS FOUND!"
    exit 1
fi
