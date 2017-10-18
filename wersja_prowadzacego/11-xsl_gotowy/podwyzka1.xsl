<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="xml"/>

	<xsl:template match="cena">
		<cena>
			<xsl:value-of select="format-number(. * 1.1, '0.00')"/>
		</cena>
	</xsl:template>

	<xsl:template match="cena-promocyjna">
		<!-- Usuwa ceny promocyjne -->
	</xsl:template>

	<!-- standard copy template -->
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates/>
		</xsl:copy>
	</xsl:template>
	
</xsl:stylesheet>
