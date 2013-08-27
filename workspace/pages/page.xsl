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
        	<xsl:attribute name="style">
          	<xsl:choose>
             	<xsl:when test="/data/baseds/entry/sidebar/@items &gt; '0'">width:520px;</xsl:when>
               	<xsl:otherwise>width:870px;</xsl:otherwise>
           	</xsl:choose>
         	</xsl:attribute>    
            <xsl:apply-templates select="baseds/entry"/>
            <div class="slideshowcontainer">
            	<div class="prevnext">
               	<xsl:if test="/data/baseds/entry/slideshow/@items &gt; '0'">
                    <xsl:choose>
                    <xsl:when test="/data/baseds/entry/slideshow/@items='1'">
                    </xsl:when>  
                    <xsl:otherwise>
                        <a id="prev" href="#" title="previous image"></a><a id="next" href="#" style="margin-left:20px;" title="next image"></a>
                    </xsl:otherwise>
                    </xsl:choose>
            	</xsl:if>
                </div>
				<ul class="slideshow">
                    <xsl:apply-templates select="/data/baseds/entry/slideshow/item"/>
                </ul>
            </div>    
       	</div>
        <xsl:if test="/data/baseds/entry/sidebar/@items &gt; '0'">
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
    
    <xsl:template match="baseds/entry">
    	<div class="blogtitle float">
            <h4><xsl:value-of select="title"/></h4>
            <xsl:if test="$is-logged-in">
			 	<div class="edit" onclick="return MM_openBrWindow('{$root}/symphony/publish/pages/edit/{current()/@id}/','SymphonyCMS','scrollbars=yes,resizable=yes,width=1300,height=800')">Edit</div>
			 </xsl:if>
		</div>
      	<div class="blogcontent">
        	<xsl:copy-of select="content"/>
      	</div>
    </xsl:template>
    
    <xsl:template match="slideshow/item">
        <li class="slide">
            <div class="title">
            	<xsl:value-of select="title"/>
           	</div>
       		<xsl:if test="(image/filename != '')">
       			<img src="{$root}/image/1/850/0/images/{image/filename}" alt="{title}" title="{title}" class="galleryimg">
                <xsl:attribute name="style">
                <xsl:choose>
                    <xsl:when test="/data/baseds/entry/sidebar/@items &gt; '0'">width:520px;</xsl:when>
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
        </li>
 	</xsl:template>

</xsl:stylesheet>