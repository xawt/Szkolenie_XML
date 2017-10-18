<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:param name="o_ile_procent" select="0"/>

	<xsl:output method="xml"/>

	<xsl:template match="cena">
		<cena>
			<!-- Kropka tu oznacza starą cenę, bo jesteśmy już w elemencie <cena> -->
			<xsl:value-of select="format-number(. + . * $o_ile_procent div 100, '0.00')"/>
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
