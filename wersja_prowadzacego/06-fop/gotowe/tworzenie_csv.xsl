<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="text" encoding="utf-8"/>
	
	<xsl:param name="SEPARATOR">;</xsl:param>
	<xsl:param name="NL"><xsl:text>&#x0A;</xsl:text></xsl:param>

	<xsl:template match="/">
		<!-- To rozwiązanie działa przy założeniu, że każda tabela zawiera te same waluty w tej samej kolejności -->
		<xsl:text>Data</xsl:text>
		<xsl:copy-of select="$SEPARATOR"/>
		<xsl:text>Nr tabeli</xsl:text>
		<xsl:for-each select="//ExchangeRatesTable[1]//Rate">
			<xsl:value-of select="Code"/>
			<xsl:copy-of select="$SEPARATOR"/>
		</xsl:for-each>
	
		<xsl:for-each select="//ExchangeRatesTable">
			<xsl:value-of select="EffectiveDate"/>
			<xsl:copy-of select="$SEPARATOR"/>
			<xsl:value-of select="No"/>
			
			<xsl:for-each select="Rates/Rate">
				<xsl:copy-of select="$SEPARATOR"/>
				<xsl:value-of select="Mid"/>
			</xsl:for-each>
			
			<xsl:copy-of select="$NL"/>
		</xsl:for-each>
		
	</xsl:template>
</xsl:stylesheet>