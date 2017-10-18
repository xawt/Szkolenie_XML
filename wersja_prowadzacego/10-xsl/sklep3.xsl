<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html"/>

	<xsl:template match="/">
		<html>
			<head>
				<title>Sklep z towarami</title>
				<xsl:call-template name="wstaw-css"/>
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
		<div>Cena: <xsl:value-of select="format-number(. , '0.00')"/> zł</div>
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

	<xsl:template name="wstaw-css">
<style type="text/css">
body {
	background-color: #FFFFAA;
}

.kategoria, .towar {
	display: block;
	min-width: 320px;
	max-width: 520px;
	margin: 30px auto;
	padding: 10px;
	border-style: solid;
	border-width: 2px;
	border-color: blue;
}

.kategoria {
	background-color: #DDFFFF;
}

.towar {
	background-color: #FFFFFF;
}

nazwa {
	display: block;
	font-weight: bold;
	font-size: larger;
	text-align: center;
	margin-bottom: 0.5em;
}

dfn {
	font-weight: bold;
	color: navy;
}
</style>
	</xsl:template>
</xsl:stylesheet>
