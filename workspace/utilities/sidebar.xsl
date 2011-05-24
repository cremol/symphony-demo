<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="sidebar/item">
        <li>
        	<h5 class="float"><xsl:value-of select="title"/></h5>
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