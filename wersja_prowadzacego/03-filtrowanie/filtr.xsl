<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="xml" encoding="utf-8" indent="yes"/>
	
	<xsl:param name="kat"/>

	<xsl:template match="/sklep">
		<sklep>
			<xsl:copy-of select="*[@id-kategorii = $kat or not($kat)]"/>
		</sklep>
	</xsl:template>
</xsl:stylesheet>
