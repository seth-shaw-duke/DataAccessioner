<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">

    <fits xmlns="http://hul.harvard.edu/ois/xml/ns/fits/fits_output">
		<identification>
			<identity>
				<xsl:attribute name="format">
					<xsl:value-of select="string('WordPerfect Document')" />
				</xsl:attribute>
				<xsl:attribute name="mimetype">
					<xsl:value-of select="//METADATA/TYPE" />
				</xsl:attribute>
			</identity>		
		</identification>
		
 		<fileinfo>
			<creatingApplicationName>
				<xsl:value-of select="//PRODUCT"/>
			</creatingApplicationName>
			
			<creatingApplicationVersion>
			    <xsl:variable name="majorVersion" select="concat(substring-before(//MAJOR-VERSION,'.'), '.')" />
				<xsl:value-of select="concat($majorVersion,//MINOR-VERSION)"/>
			</creatingApplicationVersion>
			
		</fileinfo>
		
		<metadata>	
		<document>
							
			<title>
				<xsl:value-of select="normalize-space(//SUMMARY/NAME)"/>
			</title>
			
			<author>
				<xsl:value-of select="//SUMMARY/AUTHOR"/>
			</author>			
	
			<isProtected>
				<xsl:choose>
					<xsl:when test="//ENCRYPTED='true'">
						<xsl:value-of select="string('yes')"/>
					</xsl:when>
				</xsl:choose>				
			</isProtected>

		</document>	
		</metadata>
	</fits>	

</xsl:template>


</xsl:stylesheet>