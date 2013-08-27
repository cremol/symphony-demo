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
    <xsl:include href="../utilities/date-time.xsl"/>
    <xsl:include href="../utilities/twitterformatter.xsl"/>
    
    <xsl:template match="data">
    	<div id="content">
        	<xsl:attribute name="style">
           	<xsl:choose>
                <xsl:when test="tweetsds/@status ='fresh'">width:520px;</xsl:when>
                <xsl:otherwise>width:870px;</xsl:otherwise>
           	</xsl:choose>
         	</xsl:attribute>    
            <ul>
                <xsl:apply-templates select="blogds/entry"/>
            </ul>
      	</div>
        <xsl:if test="tweetsds/@status ='fresh'">
        <div id="sidebar">
     		<div class="blogtitle float">
        		<h4 class="tweetheader"><xsl:value-of select="$ds-generalsettingsds"/>'s Tweets:</h4>
           	</div>
          	<ul>
           		<xsl:apply-templates select="tweetsds/rss/channel/item"/>
        	</ul>
        </div>
        </xsl:if>
 	</xsl:template>
    
    <xsl:template match="blogds/entry">
        <li class="blogli">
            <div class="blogtitle float">
            	<h4><a href="{$root}/blog-entry/{title/@handle}/#comments"><xsl:value-of select="title"/></a></h4>
				<xsl:if test="$is-logged-in">
			 		<div class="edit" onclick="return MM_openBrWindow('{$root}/symphony/publish/blog/edit/{current()/@id}/','SymphonyCMS','scrollbars=yes,resizable=yes,width=1300,height=800')">Edit</div>
			 	</xsl:if>
            </div>
           	<xsl:if test="(image/filename != '')">
          		<img src="{$root}/image/2/700/410/5/images/{image/filename}" alt="{title}" title="{title}" class="galleryimg"/>
           	</xsl:if>
            <div class="blogcontent">
            	<xsl:attribute name="style">
            	<xsl:choose>
                	<xsl:when test="/data/tweetsds/@status ='fresh'">width:100%;margin-bottom:15px;</xsl:when>
                    <xsl:otherwise>width:620px;margin-bottom:50px;</xsl:otherwise>
               	</xsl:choose>
         		</xsl:attribute>
            	<xsl:copy-of select="description"/><br />
                <xsl:apply-templates select="current()/gallery/item"/>
            </div>
            <div class="blogmeta">
            	<xsl:attribute name="style">
            	<xsl:choose>
                	<xsl:when test="/data/tweetsds/@status ='fresh'">float:left;</xsl:when>
                    <xsl:otherwise>float:right;width:170px;padding-top:40px;</xsl:otherwise>
               	</xsl:choose>
         		</xsl:attribute>
            	<p class="opacity">
                    Author: <b><xsl:value-of select="author"/></b>
                    Published: <xsl:call-template name="format-date">
                    <xsl:with-param name="date" select="date"/>
                    <xsl:with-param name="format" select="'D m Y'"/>
                    </xsl:call-template>
               	</p>
                <a href="{$root}/blog-entry/{title/@handle}/#comments">Comments: (<xsl:value-of select="current()/@comments"/>)</a>	
			 </div>
        </li>
 	</xsl:template>
    
    <xsl:template match="gallery/item">
    	<a href="{$workspace}/images/{image/filename}" rel="lytebox[{../../@id}]" title="{description}"><img src="{$root}/image/2/70/65/5/images/{image/filename}" alt="{title}" title="{title}" class="gallerythumb"/></a>
   	</xsl:template>

</xsl:stylesheet>