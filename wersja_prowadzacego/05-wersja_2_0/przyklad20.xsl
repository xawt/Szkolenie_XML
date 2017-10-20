<xsl:stylesheet version="2.0"
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<result>
			<xsl:for-each select="1 to 100">
				<liczba>
					<x><xsl:value-of select="."/></x>
					<y><xsl:value-of select=". * ."/></y>
				</liczba>
			</xsl:for-each>
		</result>
	</xsl:template>
</xsl:stylesheet>
