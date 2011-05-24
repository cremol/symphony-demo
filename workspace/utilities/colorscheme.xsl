<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="entry"><style type="text/css">

body, #lbOverlay.grey {
	background-color:<xsl:choose>
		<xsl:when test="body-background-color ='#'">#f6f6f6</xsl:when>
		<xsl:when test="body-background-color ='None'">#f6f6f6</xsl:when>
		<xsl:otherwise><xsl:value-of select="body-background-color"/></xsl:otherwise>
	</xsl:choose>;
}

#header, #footer {
	background-color:<xsl:choose>
		<xsl:when test="header-background-color ='#'">#353530</xsl:when>
		<xsl:when test="header-background-color ='None'">#353530</xsl:when>
		<xsl:otherwise><xsl:value-of select="header-background-color"/></xsl:otherwise>
	</xsl:choose>;
}

#nav, 
#nav li ul li:hover {
	background-color:<xsl:choose>
		<xsl:when test="menu-background-color ='#'">#d6d6c7</xsl:when>
		<xsl:when test="menu-background-color ='None'">#d6d6c7</xsl:when>
		<xsl:otherwise><xsl:value-of select="menu-background-color"/></xsl:otherwise>
	</xsl:choose>;
}

#nav a {
	color:<xsl:choose>
		<xsl:when test="menu-text-color ='#'">#444444</xsl:when>
		<xsl:when test="menu-text-color ='None'">#444444</xsl:when>
		<xsl:otherwise><xsl:value-of select="menu-text-color"/></xsl:otherwise>
	</xsl:choose>;
}

/* show sublevel 1-6 */
#nav li:hover ul,
#nav ul li:hover ul, 
#nav ul ul li:hover ul,
#nav ul ul ul li:hover ul, 
#nav ul ul ul ul li:hover ul,
#nav ul ul ul ul ul li:hover ul {
	display:block;
	background-color:<xsl:choose>
		<xsl:when test="menu-background-color ='#'">#e4e4e0</xsl:when>
		<xsl:when test="menu-background-color ='None'">#e4e4e0</xsl:when>
		<xsl:otherwise><xsl:value-of select="menu-background-color"/></xsl:otherwise>
	</xsl:choose>;
	-moz-box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.1);
	-webkit-box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.1);
	background-image:none;
}

#nav a:hover {
	color:<xsl:choose>
		<xsl:when test="menu-text-hover-color ='#'">#f3f3f3</xsl:when>
		<xsl:when test="menu-text-hover-color ='None'">#f3f3f3</xsl:when>
		<xsl:otherwise><xsl:value-of select="menu-text-hover-color"/></xsl:otherwise>
	</xsl:choose>;
}

.websitetitle {
	color:<xsl:choose>
		<xsl:when test="website-title-color ='#'">#FFF</xsl:when>
		<xsl:when test="website-title-color ='None'">#FFF</xsl:when>
		<xsl:otherwise><xsl:value-of select="website-title-color"/></xsl:otherwise>
	</xsl:choose>;
	font-size:<xsl:value-of select="website-title-fontsize"/>;
}

h1, h2, h3, h4, h5, h3 a, a {
	color:<xsl:choose>
		<xsl:when test="captions-color ='#'">#999</xsl:when>
		<xsl:when test="captions-color ='None'">#999</xsl:when>
		<xsl:otherwise><xsl:value-of select="captions-color"/></xsl:otherwise>
	</xsl:choose>;
}

h1, h2, h3, h4 {
	font-family:<xsl:value-of select="website-title-webfont"/>, arial, serif;
}

body {
	color:<xsl:choose>
		<xsl:when test="paragraph-color ='#'">#333</xsl:when>
		<xsl:when test="paragraph-color ='None'">#333</xsl:when>
		<xsl:otherwise><xsl:value-of select="paragraph-color"/></xsl:otherwise>
	</xsl:choose>;
}

</style>
	
</xsl:template>

</xsl:stylesheet>