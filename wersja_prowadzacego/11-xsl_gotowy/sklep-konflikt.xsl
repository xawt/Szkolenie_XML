<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html" encoding="UTF-8"/>

	<xsl:template match="/">
		<html>
			<head>
				<title>Asortyment sklepu</title>
			</head>
			<body>
				<xsl:apply-templates />
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="kategoria">
		<div class="kategoria">
			<xsl:apply-templates />
		</div>
	</xsl:template>
	
	<xsl:template match="towar">
		<div class="towar">
			<xsl:apply-templates />
		</div>
	</xsl:template>
	
	<xsl:template match="nazwa">
		<h2>
			<xsl:apply-templates />
		</h2>
	</xsl:template>

	<xsl:template match="nazwa[../cena > 100]">
		<h2 style="color:red">
			<xsl:apply-templates />
		</h2>
	</xsl:template>

	<xsl:template match="nazwa[../cena > 10]">
		<h2 style="color:green">
			<xsl:apply-templates />
		</h2>
	</xsl:template>
 
	<xsl:template match="opis">
		<p>
			<xsl:apply-templates />
		</p>
	</xsl:template>
	
	<xsl:template match="cena-promocyjna">
		<p class="promo">
			Cena promocyjna: <xsl:value-of select="."/> od <xsl:value-of select="@od"/> do <xsl:value-of select="@do"/>.
		</p>
	</xsl:template>
	
	<xsl:template match="comment()">
		<p class="komentarz">Komentarz: <xsl:value-of select="."/></p>
	</xsl:template>
	
	
</xsl:stylesheet>
