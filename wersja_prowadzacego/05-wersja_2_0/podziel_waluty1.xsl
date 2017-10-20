<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output name="moj-format" method="xml" indent="yes" encoding="utf-8"/>

	<xsl:template match="/">
	
		<xsl:apply-templates select="//ExchangeRatesTable"/>
	
	</xsl:template>
	
	<xsl:template match="ExchangeRatesTable">
		
		<xsl:result-document href="{EffectiveDate}.xml"
			format="moj-format">
			
			<xsl:copy-of select="."/>
			
		
		</xsl:result-document>
		
		
	</xsl:template>
	
</xsl:stylesheet>