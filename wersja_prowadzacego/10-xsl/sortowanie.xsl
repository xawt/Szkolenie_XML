<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="xml"/>

	<xsl:template match="/">
		<sklep>
			<xsl:for-each select="/sklep/kategoria">
				<xsl:sort select="nazwa" data-type="text"/>
				<xsl:copy-of select="."/>
				<xsl:for-each select="/sklep/towar[@id-kategorii = current()/@id-kategorii]">
					<xsl:sort select="cena" data-type="number" order="descending"/>
					<xsl:copy-of select="."/>
				</xsl:for-each>
			</xsl:for-each>
		</sklep>
	</xsl:template>
</xsl:stylesheet>
