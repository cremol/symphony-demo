<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="sidebar/item">
        <li>
        	<h5 class="float"><xsl:value-of select="title"/></h5>
        	<xsl:if test="$is-logged-in">
			 	<div class="edit" onclick="return MM_openBrWindow('{$root}/symphony/publish/images/edit/{current()/@id}/','SymphonyCMS','scrollbars=yes,resizable=yes,width=1300,height=800')">Edit</div>
			 </xsl:if>
			<xsl:if test="(image/filename != '')">
          		<img src="{$root}/image/2/70/65/5/images/{image/filename}" alt="{title}" title="{title}"/>
          	</xsl:if>
        	<p>
            	<xsl:copy-of select="concat(substring(description, 1, 100), '')" disable-output-escaping="yes"/>
                <span class="sbplink"> <a href="{$root}/article/{$page}/{title/@handle}">read more...</a></span>
        	</p>
   		</li>
 	</xsl:template>
</xsl:stylesheet>