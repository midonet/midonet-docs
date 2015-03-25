<?xml version='1.0'?>
<xsl:stylesheet
    version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:html="http://www.w3.org/1999/xhtml"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:d="http://docbook.org/ns/docbook"
>

    <xsl:param name="paper.type" select="'A4'"/>
    <xsl:param name="linenumbering.extension" select="'1'"/>
    <xsl:param name="linenumbering.everyNth">1</xsl:param>

    <!-- Enable wrapping in "screen" sections. -->
    <xsl:attribute-set name="monospace.verbatim.properties" use-attribute-sets="verbatim.properties monospace.properties">
        <xsl:attribute name="text-align">start</xsl:attribute>
        <xsl:attribute name="wrap-option">wrap</xsl:attribute>
    </xsl:attribute-set>

    <!-- Hyphenation works with FOP 1.1, but does not work with FOP 1.0.
    <xsl:attribute-set name="monospace.verbatim.properties" use-attribute-sets="verbatim.properties monospace.properties">
        <xsl:attribute name="text-align">start</xsl:attribute>
        <xsl:attribute name="wrap-option">wrap</xsl:attribute>
        <xsl:attribute name="hyphenate">true</xsl:attribute>
        <xsl:attribute name="hyphenation-character">&#x00bb;</xsl:attribute>
        <xsl:attribute name="margin">0.5pt</xsl:attribute>
        <xsl:attribute name="margin">2pt</xsl:attribute>
    </xsl:attribute-set>
    -->

    <xsl:attribute-set name="lit.shading.style">
        <xsl:attribute name="background-color">#993399</xsl:attribute>
    </xsl:attribute-set>        

</xsl:stylesheet>
