<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />
    <xsl:variable name="page">
        	<xsl:text>Blog entries</xsl:text>
       	</xsl:variable>

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
                        <xsl:apply-templates select="blogentryds/entry"/>
                    </ul>
      			</div>
                <xsl:if test="tweetsds/@status ='fresh'">
                <div id="sidebar" class="blogsidebar">
                	<div class="blogtitle float">
                        <h4 class="tweetheader"><xsl:value-of select="$ds-generalsettingsds"/>'s Tweets:</h4>
                   	</div>
                  	<ul>
                     	<xsl:apply-templates select="tweetsds/rss/channel/item"/>
                  	</ul>
                </div>
                </xsl:if>
 	</xsl:template>
    
    <xsl:template match="blogentryds/entry">
        <li class="blogli">
            <div class="blogtitle float">
            	<h4><xsl:value-of select="title"/></h4>
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
			 </div>
        </li>
        <h4 class="float header4">Comments (<xsl:value-of select="current()/@comments"/>)</h4>
         <div id="commentbox" class="radius float">
         	<xsl:apply-templates select="/data/commentsds/entry"/>
         </div>
         <div class="commentform">
         <xsl:for-each select="/data/events/save-comment">
         	<a name="comments"><div class="anchor"><br /></div></a>
            <p class="{@result} radius confirm">
				<xsl:choose>
					<xsl:when test="@result = 'success'">Your comment has been sent!</xsl:when>
					<xsl:otherwise><xsl:value-of select="*/@message"/></xsl:otherwise>
				</xsl:choose>
			</p>
		</xsl:for-each> 
         	<h4 class="float header4">Post a comment:</h4>
         	<form method="post" action="" enctype="multipart/form-data">
              	<input name="MAX_FILE_SIZE" type="hidden" value="5242880" />
              	<input name="fields[date]" type="hidden" />
           		<input name="fields[article]" type="hidden" value="{/data/blogentryds/entry/@id}" />
                <table class="float">
                	<tr>
                    	<td><div class="field1">Name</div></td>
                        <td><div class="field2"><input name="fields[name]" type="text" value="{/data/events/save-comment/post-values/name}" /></div></td>
                   	</tr>
                    <tr>
                    	<td><div class="field1">Email</div></td>
                        <td><div class="field2"><input name="fields[email]" type="text" value="{/data/events/save-comment/post-values/email}" /></div></td>
                   	</tr>
                    <tr>
                    	<td><div class="field1">Website</div></td>
                        <td><div class="field2"><input name="fields[website]" type="text" value="{/data/events/save-comment/post-values/website}" /></div></td>
                   	</tr>
                    <tr>
                    	<td><div class="field1">Comment</div></td>
                        <td><textarea name="fields[comment]" rows="8" cols="50" value="{/data/events/save-comment/post-values/comment}"><xsl:value-of select="/data/events/save-comment/post-values/comment"/></textarea></td>
              		</tr>
                    <tr>
                    	<td></td>
                        <td><div id="submitcontainer"><input name="action[save-comment]" type="submit" value="Post Comment" class="submit radius"/></div></td>
              		</tr>
             	</table>
			</form>
       	</div>
 	</xsl:template>
    
	<xsl:template match="commentsds/entry">
		<div class="commentcaption radius float">
      		(<xsl:number value="position()" format="1" />) <xsl:value-of select="name"/><span class="date opacity"><xsl:call-template name="format-date">
			<xsl:with-param name="date" select="date"/>
			<xsl:with-param name="format" select="'d m y, t'"/>
			</xsl:call-template></span>
            <xsl:if test="(email != '')">
            <a href="mailto:{email}" title="email {name}"><span class="emaillink opacity"></span></a>
            </xsl:if>
            <xsl:if test="(website != '')">
            <a href="{website}" tarhet="_blank" title="visit {website}"><span class="weblink opacity"></span></a>
            </xsl:if>
      	</div>
      	<div class="comment float opacity">
            <p>
                <xsl:value-of select="comment"/>
            </p>
      	</div>
	</xsl:template>
    
    <xsl:template match="gallery/item">
    	<a href="{$workspace}/images/{image/filename}" rel="lytebox[{../../@id}]" title="{description}"><img src="{$root}/image/2/70/65/5/images/{image/filename}" alt="{title}" title="{title}" class="gallerythumb"/></a>
   	</xsl:template>


</xsl:stylesheet>