<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:import href="colorscheme.xsl"/>
    <xsl:import href="string-replace.xsl"/>

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />
	
	<xsl:variable name="is-logged-in" select="/data/logged-in-author/author"/>

    <xsl:template match="/">
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
                <meta name="title" content="{$website-name}" />
                <meta name="description" content="description" />
                <meta name="keywords" content="keywords" />
                <meta name="author" content="XpressZo - www.xpresszo.com" />
                <meta name="generator" content="Symphony CMS v{$symphony-version}" />
                <title><xsl:choose>
                                <xsl:when test="data/generalsettingsds/entry/website-title !=''"><xsl:value-of select="data/generalsettingsds/entry/website-title"/></xsl:when>
                                <xsl:otherwise>Symphony Demo</xsl:otherwise>
                            </xsl:choose> / <xsl:value-of select="$page"/></title>
                <link href="{$workspace}/css/style.css" rel="stylesheet" type="text/css" />
                <link href="{$workspace}/css/lytebox.css" rel="stylesheet" type="text/css" />
                <xsl:variable name="fontnameencode">
                    <xsl:call-template name="string-replace">
                        <xsl:with-param name="haystack" select="data/generalsettingsds/entry/website-title-webfont/item" />
                        <xsl:with-param name="search" select="' '" />
                        <xsl:with-param name="replace" select="'+'" />
                    </xsl:call-template>
                </xsl:variable>     
                <link href='http://fonts.googleapis.com/css?family={$fontnameencode}' rel='stylesheet' type='text/css' />
                <script type="text/javascript" src="{$workspace}/scripts/jquery-1.4.4.min.js"></script>
                <script type="text/javascript" src="{$workspace}/scripts/jquery.cycle.all.min.js"></script>
                <script type="text/javascript" src="{$workspace}/scripts/scripts.js"></script>
                <script type="text/javascript" src="{$workspace}/scripts/lytebox.js"></script>
                
                <xsl:apply-templates select="data/generalsettingsds/entry"/>
			</head>
            
            <body>
                    <div id="header">
                        <h1 class="websitetitle">
                            <xsl:choose>
                                <xsl:when test="data/generalsettingsds/entry/website-title !=''"><xsl:copy-of select="data/generalsettingsds/entry/website-title"/></xsl:when>
                                <xsl:otherwise>Symphony Demo</xsl:otherwise>
                            </xsl:choose>
                        </h1>
                    </div>
                    <ul id="nav" class="shadow">
                        <li><a href="{$root}">Home</a></li>
                        <xsl:apply-templates select="data/navds/entry[not(parent-page/item)]"/>
                    </ul>
                    <div id="layout">
                        <xsl:apply-templates />
                    </div>
                    <div id="marginbottom"></div>
                <div id="footer">
              		<p id="credit">Powered by <a href="http://symphony-cms.com" target="_blank">Symphony CMS v<xsl:value-of select="$symphony-version"/></a></p>
                	<p id="user"><xsl:value-of select="/data/events/login-info/name"/></p>
             	</div>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="navds/entry">
        <li>
            <xsl:if test="current()/title[@handle = $page]">
         	<xsl:attribute name="class">active</xsl:attribute>
           	</xsl:if>   
            <a href="{$root}/page/{title/@handle}"><xsl:value-of select="title"/></a>
            <xsl:if test="../entry[parent-page/item/@id = current()/@id]">
           	<ul>
                <xsl:apply-templates select="../entry[parent-page/item/@id = current()/@id]" />
          	</ul>
            </xsl:if>
       </li>
    </xsl:template>

</xsl:stylesheet>