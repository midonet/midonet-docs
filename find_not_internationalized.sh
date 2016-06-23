find ./docs/ -name "book_*.adoc" | grep -v title | xargs grep ".adoc" | grep -v "{lang}"

