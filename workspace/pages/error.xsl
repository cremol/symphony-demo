<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />
	<xsl:include href="../utilities/master.xsl"/>
	<xsl:include href="../utilities/sidebar.xsl"/>
    
    <xsl:template match="data">
    	<xsl:variable name="page">jaap</xsl:variable>
    	<div id="content">
        	<xsl:attribute name="style">width:870px;</xsl:attribute>    
            <h4>The page you requested,</h4><h5>"<xsl:value-of select="$current-url"/>",</h5><h4>does not exist.</h4>
       	</div>
        <xsl:if test="/data/baseds/entry/sidebar/@items != ''">
        <div id="sidebar">
        	<div class="blogtitle">
        		<h4>Items:</h4>
            </div>
            <ul>
        		<xsl:apply-templates select="/data/baseds/entry/sidebar/item"/>
            </ul>
        </div>
        </xsl:if>
	</xsl:template>
    
</xsl:stylesheet>