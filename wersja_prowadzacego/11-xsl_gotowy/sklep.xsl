<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html" encoding="UTF-8" indent="yes" version="4.01"
		doctype-public="-//W3C//DTD HTML 4.01//EN"
  		doctype-system="http://www.w3.org/TR/html4/strict.dtd"/>
	
	<xsl:decimal-format
		decimal-separator=","
		grouping-separator=" "
	/>

	<xsl:template match="/">
		<html>
			<head>
				<title>Asortyment sklepu</title>
				<xsl:call-template name="css"/>
			</head>
			<body>
				<xsl:comment>Dokument wygenerowany w Vavatechu.</xsl:comment>
				<h1>Sklep - wersja z dodatkami</h1>
				<xsl:apply-templates />
				
				<div>
					<h1>Podsumowanie</h1>
					<p>Liczba towarów: <xsl:value-of select="count(//towar)"/></p>
					<p>Średnia cena: <xsl:value-of select="sum(//towar/cena) div count(//towar)"/></p>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="kategoria">
		<div class="kategoria" id="K-{@id-kategorii}">
			<xsl:apply-templates select="nazwa"/>
			<xsl:apply-templates select="opis"/>
			
			<ul>
				<xsl:for-each select="//towar[@id-kategorii=current()/@id-kategorii]">
					<xsl:sort select="nazwa"/>
				
					<li><a href="#T-{@id-towaru}"><xsl:value-of select="nazwa"/></a></li>
				</xsl:for-each>
			
			</ul>
		</div>
	</xsl:template>
	
	<xsl:template match="towar">
		
		<div class="towar" id="T-{@id-towaru}">
			<xsl:apply-templates select="nazwa" />
			
			<p>Kategoria:
				<a href="#K-{@id-kategorii}">
					<xsl:value-of
						select="//kategoria[@id-kategorii=current()/@id-kategorii]/nazwa"/>
				</a>
			</p>
			
			<p>Następnych towarów: <xsl:value-of select="count(following::towar)"/></p>
			<p>Nastepny towar z tej samej kategorii: <xsl:value-of select="following-sibling::towar[@id-kategorii = current()/@id-kategorii][1]/nazwa"/></p>
			
			<p>Cena brutto: <xsl:value-of
				select="format-number(cena, '# ###,00')"/>
			</p>
			<p>Cena netto: <xsl:value-of
				select="format-number(cena div (1 + vat div 100), '0,00')"/>
			</p>

			<xsl:apply-templates select="opis" />
			<xsl:apply-templates select="cena-promocyjna" />
		</div>
	</xsl:template>
	
	<xsl:template match="nazwa">
		<h2>
			<xsl:apply-templates />
		</h2>
	</xsl:template>
 
	<xsl:template match="opis">
		<p class="opis">
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

	<xsl:template match="inny-towar">
		<a href="#T-{@ref}">
			<xsl:value-of select="//towar[@id-towaru = current()/@ref]/nazwa"/>
		</a>
	</xsl:template>

	<xsl:template match="cena-promocyjna">
		<p class="promo">
			Cena promocyjna: <xsl:value-of select="."/> od <xsl:value-of select="@od"/> do <xsl:value-of select="@do"/>.
		</p>
	</xsl:template>
	
	<xsl:template match="comment()">
		<p class="komentarz">Komentarz: <xsl:value-of select="."/></p>
	</xsl:template>
	
	<xsl:template name="css">
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
	max-width: 800px;
	margin: 1em auto;
	padding: 0.5em;
	border-style: groove;
	border-width: 6px;
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
		</style>
	</xsl:template>
	
</xsl:stylesheet>
