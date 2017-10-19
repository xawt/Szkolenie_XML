<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:output method="html" encoding="utf-8"
		doctype-public="-//W3C//DTD HTML 4.01//EN"
		doctype-system="http://www.w3.org/TR/html4/strict.dtd"
		version="4.01"
	/>
	
	<xsl:decimal-format name="format-polski"
		decimal-separator="," grouping-separator=" "/>
	
	<xsl:param name="kat" />
	
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
	
	<xsl:template match="sklep">
		<h1>Towary z kategorii <xsl:value-of select="$kat"/> </h1>		
		<xsl:apply-templates select="kategoria[@id-kategorii = $kat or not($kat)]"/>
		<xsl:apply-templates select="towar[@id-kategorii = $kat or not($kat)]"/>
	</xsl:template>
	
	
	<xsl:template match="kategoria">
		<div class="kategoria" id="k-{@id-kategorii}">
			<xsl:apply-templates select="nazwa"/>
			<xsl:apply-templates select="opis"/>
			
			<ul>
			<!-- w poniższym select . oznacza towar, a current() oznacza kategoria -->
			<xsl:for-each select="/sklep/towar[@id-kategorii = current()/@id-kategorii]">
				<li>
					<a href="#t-{@id-towaru}"><xsl:value-of select="nazwa"/></a>
				</li>
			</xsl:for-each>
			</ul>
		</div>
	</xsl:template>
	
	<xsl:template match="towar">
		<div class="towar" id="t-{@id-towaru}" >
			<xsl:apply-templates select="nazwa" />
			
			<p class="kategoria-towaru">
				Kategoria <a href="#k-{@id-kategorii}">
					<xsl:value-of select="/sklep/kategoria[@id-kategorii = current()/@id-kategorii]/nazwa"/>
				</a>.
			</p>
		
			<div>Cena brutto: <xsl:value-of
				select="format-number(cena, '# ###,00', 'format-polski')" /> zł</div>
			<div>Cena netto: <xsl:value-of
				select="format-number(cena div (1 + vat div 100), '# ###,00', 'format-polski')" /> zł</div>
			<div>Stawka VAT: <xsl:value-of select="vat" />%</div>
		
			<xsl:apply-templates select="opis" />
			<xsl:apply-templates select="cena-promocyjna"/>
			
			<xsl:if test="vat &lt; 23">
				<p>Ten towar posiada obniżoną stawkę VAT.</p>
			</xsl:if>
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
	
	<xsl:template match="cena-promocyjna">
		<div class="promo">
			Cena promocyjna <xsl:value-of select="format-number(., '0,00', 'format-polski')"/>
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
