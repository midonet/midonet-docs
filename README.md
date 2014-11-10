# MidoNet Documentation

This repository includes the following [MidoNet](http://www.midonet.org/)
documentation:

 * MidoNet Quick Start Guide for RHEL 7 / Icehouse
 * MidoNet Quick Start Guide for Ubuntu 14.04 / Icehouse
 * MidoNet REST API

Consult the [MidoNet Wiki](http://wiki.midonet.org/) for instructions on how to
contribute.

## Requirements

This project requires [Apache Maven](https://maven.apache.org/). You may get the
latest version from the
[download section](https://maven.apache.org/download.cgi) and follow the
[installation instructions](https://maven.apache.org/download.cgi#Installation_Instructions).

## Build Instructions

To build all documents and necessary dependencies, run `mvn clean install` in
the base directory.

## Technical Implementation

The documentation's source format is [AsciiDoc](https://en.wikipedia.org/wiki/AsciiDoc).

In short, the build process can be summarized as follows:

* Conversion from AsciiDoc to Docbook XML
* Generation of HTML and PDF from Docbook XML

Conversion from AsciiDoc to Docbook XML is done by the 
[asciidoctor-maven-plugin](http://asciidoctor.org/docs/asciidoctor-maven-plugin/).
The resulting Docbook XML is then rendered to HTML and PDF by using the
[midonet-docs-maven-plugin](https://github.com/midonet/midonet-docs/tree/master/tools/midonet-docs-maven-plugin),
a modified version of the
[clouddocs-maven-plugin](https://github.com/rackerlabs/clouddocs-maven-plugin)
(which has been enhanced to include a MidoNet-specific branding).

The latter one internally uses
[Docbook's Web-based Help](http://docbook.sourceforge.net/release/xsl/current/webhelp/docs/ch01.html)
to generate a CSS-based HTML page with content search and TOC.

## File System Structure

### Top-level directories


| Directory       | Purpose                       |
| --------------- | ----------------------------- |
| `build`         | Maven project files           |
| `customization` | PDF and WebHelp customization |
| `docs`          | Document sources              |

The `build` directory contains the documents' Maven project files, each located
in a sub directory specific to a certain document.

The `docs` directory contains the document sources, each located within the
`src` directory of the specific document's sub directory.

The `tools` directory contains the source code of the midonet-docs-maven-plugin.

Some documents, e.g. the Quick Start Guide, share common sources and make use of
[Include Files](http://asciidoctor.org/docs/asciidoc-syntax-quick-reference/#include-files)
based on certain conditions (like the Operating system or OpenStack version).

These conditions are defined in the document's POM file and being processed at
build time.

## Output Files

After a successful build, the outputs for a document can be found in the
`target/docbkx/webhelp` directory underneath the document's build directory.

### Examples

Quick Start Guide for Ubuntu 14.04 / Icehouse:

| Directory                                                            | Purpose             |
| -------------------------------------------------------------------- |-------------------- |
| `docs/quick-start-guide/src`                                         | AsciiDoc Sources    |
| `build/quick-start-guide_ubuntu-1404_icehouse`                       | Maven project file  |
| `build/quick-start-guide_ubuntu-1404_icehouse/target/docbkx/webhelp` | Outputs (HTML, PDF) |

Quick Start Guide for RHEL 7 / Icehouse:

| Directory                                                       | Purpose             |
| --------------------------------------------------------------- |-------------------- |
| `docs/quick-start-guide/src`                                    | AsciiDoc Sources    |
| `build/quick-start-guide_rhel-7_icehouse`                       | Maven project file  |
| `build/quick-start-guide_rhel-7_icehouse/target/docbkx/webhelp` | Outputs (HTML, PDF) |

REST API:

| Directory                              | Purpose             |
| -------------------------------------- |-------------------- |
| `docs/rest-api/src`                    | AsciiDoc Source     |
| `build/rest-api`                       | Maven project file  |
| `build/rest-api/target/docbkx/webhelp` | Outputs (HTML, PDF) |
