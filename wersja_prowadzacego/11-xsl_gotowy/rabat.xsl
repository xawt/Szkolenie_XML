<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- Zmienia ceny towarów z podanej kategorii lub wszystkich jeśli brak kategorii. -->
	<xsl:param name="zmiana" select="10"/>
	<xsl:param name="kategoria" select="'kawa'"/>

	<xsl:template match="cena[../@id-kategorii = $kategoria or not($kategoria)]">
		<xsl:copy>
			<xsl:value-of select=". * (1 + $zmiana div 100)"/>
		</xsl:copy>
	</xsl:template>

	<!-- standard copy template -->
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates/>
		</xsl:copy>
	</xsl:template>
</xsl:stylesheet>