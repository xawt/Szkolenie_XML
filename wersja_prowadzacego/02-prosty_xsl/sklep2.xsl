<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:output method="html" encoding="utf-8"/>
	
	<xsl:template match="/">
		<html>
			<head>
				<title>Sklepik</title>
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

	<xsl:template match="br">
		<br/>
	</xsl:template>
	
	<xsl:template match="link">
		<a href="{@href}">
			<xsl:apply-templates />
		</a>
	</xsl:template>
	

	<xsl:template match="cena">
		<div>Cena: <xsl:apply-templates /> zł</div>
	</xsl:template>
	
	<xsl:template match="vat">
		<div>Stawka VAT: <xsl:apply-templates/>%</div>
	</xsl:template>

	<xsl:template match="cena-promocyjna">
		<div class="promo">
			Cena promocyjna <xsl:apply-templates />
		</div>
	</xsl:template>
	
	
	<xsl:template name="wstaw-css">
<style type="text/css">
body {
	background-color: #FFFFCC;
	font-family: 'Verdana', 'Arial', sans-serif;
	font-size: 12pt;
}

.towar, .kategoria {
	display: block;
	background-color: white;
	min-width: 400px;
	max-width: 600px;
	margin: 1em auto;
	padding: 0.5em;
	border-style: outset;
	border-width: 4px;
	border-color: green;
}


h2 {
	text-align: center;
	display: block;
	font-size: 120%;
}

.promo {
	font-size: smaller;
}

.rem {
	font-size: smaller;
	color: grey;
}
</style>
	</xsl:template>
		
</xsl:stylesheet>
