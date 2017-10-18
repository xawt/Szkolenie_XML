<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html"/>

	<xsl:template match="/">
		<html>
			<head>
				<title>Sklep z towarami</title>
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
	
	<xsl:template match="cena">
		<div>Cena: <xsl:apply-templates/> zł</div>
	</xsl:template>
	
	<xsl:template match="vat">
		<div>Stawka VAT: <xsl:apply-templates/>%</div>
	</xsl:template>
	
	<xsl:template match="cena-promocyjna">
	</xsl:template>
	
	<xsl:template match="opis">
		<p>
			<xsl:apply-templates/>
		</p>
	</xsl:template>

	<xsl:template match="em">
		<em>
			<xsl:apply-templates />
		</em>
	</xsl:template>
	
	<xsl:template match="term">
		<dfn>
			<xsl:apply-templates />
		</dfn>
	</xsl:template>

	<xsl:template match="br">
		<br/>
	</xsl:template>

	<xsl:template match="link">
		<a href="{@href}">
			<xsl:apply-templates />
		</a>
	</xsl:template>
	
</xsl:stylesheet>
