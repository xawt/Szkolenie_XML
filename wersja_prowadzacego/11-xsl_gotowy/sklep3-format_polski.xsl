<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html" encoding="UTF-8"/>
	
	
	<xsl:decimal-format name="format-polski"
		decimal-separator=","
		grouping-separator=" "
	/>
	

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
			
			<p>Cena brutto: <xsl:value-of
				select="format-number(cena, '# ###,00', 'format-polski')"/>
			</p>
			<p>Cena netto: <xsl:value-of
				select="format-number(cena div (1 + vat div 100), '0,00', 'format-polski')"/>
			</p>
		</div>
	</xsl:template>
	
	<xsl:template match="nazwa">
		<h2>
			<xsl:apply-templates />
		</h2>
	</xsl:template>
 
	<xsl:template match="opis">
		<p>
			<xsl:apply-templates />
		</p>
	</xsl:template>
	
	<xsl:template match="em">
		<strong>
			<xsl:apply-templates />
		</strong>
	</xsl:template>

	<xsl:template match="term">
		<dfn>
			<xsl:apply-templates />
		</dfn>
	</xsl:template>

	<xsl:template match="rem">
		<span class="rem">
			<xsl:apply-templates />
		</span>
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
