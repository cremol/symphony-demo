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
    	<div id="content">
        	<xsl:attribute name="style">width:520px;</xsl:attribute>    
            <xsl:apply-templates select="articleds/entry"/>
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
    
    <xsl:template match="articleds/entry">
    	<div class="blogtitle">
     		<h4><xsl:value-of select="title"/></h4>
     	</div>
      	<xsl:if test="(image/filename != '')">
            <img src="{$root}/image/1/850/0/images/{image/filename}" alt="{title}" title="{title}" class="galleryimg">
                <xsl:attribute name="style">
                <xsl:choose>
                    <xsl:when test="/data/baseds/entry/sidebar/@items != ''">width:520px;</xsl:when>
                    <xsl:otherwise>width:100%;</xsl:otherwise>
           		</xsl:choose>
                </xsl:attribute>
                </img>
      	</xsl:if>
    	<xsl:if test="(description != '')">
            <div class="imgdescription float">
            	<p>
      				<xsl:copy-of select="description"/>
              	</p>
           	</div>
       	</xsl:if>
    </xsl:template>
</xsl:stylesheet>