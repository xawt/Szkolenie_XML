<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://www.w3.org/1999/XSL/Format fop.xsd">
	
	<xsl:template match="/">
		<fo:root font-family="Arial" font-size="10pt">
			<fo:layout-master-set>			
				<fo:simple-page-master master-name="strona"
					page-height="297mm" page-width="210mm"
					margin="15mm">
					
					<fo:region-body/>
					
				</fo:simple-page-master>
			</fo:layout-master-set>
			
			<fo:page-sequence master-reference="strona">
				<fo:flow flow-name="xsl-region-body">
					<xsl:apply-templates/>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
	
	<xsl:template match="ExchangeRatesTable">
		<fo:block-container page-break-before="always">
		<fo:block
			font-weight="bold"
			font-size="14pt"
			margin-bottom="6pt"
		>Tabela <xsl:apply-templates select="No"/> z dnia <xsl:apply-templates select="EffectiveDate"/></fo:block>
		<xsl:apply-templates select="Rates"/>
		</fo:block-container>
	</xsl:template>
	
	<xsl:template match="Rates">
		<fo:table border-style="solid">
			<fo:table-header>
				<fo:table-row>
					<fo:table-cell xsl:use-attribute-sets="styl-komorki-h">
						<fo:block>Kod</fo:block>
					</fo:table-cell>
					<fo:table-cell xsl:use-attribute-sets="styl-komorki-h">
						<fo:block>Waluta</fo:block>
					</fo:table-cell>
					<fo:table-cell xsl:use-attribute-sets="styl-komorki-h">
						<fo:block>Kurs</fo:block>
					</fo:table-cell>
					<fo:table-cell xsl:use-attribute-sets="styl-komorki-h">
						<fo:block>Poprzedni kurs</fo:block>
					</fo:table-cell>
					<fo:table-cell xsl:use-attribute-sets="styl-komorki-h">
						<fo:block>Zmiana %</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-header>
			<fo:table-body>
				<xsl:apply-templates select="Rate">
					<xsl:sort select="Code" order="descending"/>
				</xsl:apply-templates>
			</fo:table-body>
		</fo:table>
	</xsl:template>
	
	<xsl:template match="Rate">
		<xsl:variable name="poprzedni-kurs"
			select="preceding::Rate[Code = current()/Code][1]/Mid"/>
			
		<xsl:variable name="kolor">
			<xsl:choose>
				<xsl:when test="Mid > $poprzedni-kurs">#BBFFDD</xsl:when>
				<xsl:when test="Mid &lt; $poprzedni-kurs">#FFCCCC</xsl:when>
				<xsl:otherwise>white</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
	
		<fo:table-row background-color="{$kolor}">
			<fo:table-cell xsl:use-attribute-sets="styl-komorki">
				<fo:block>
				<xsl:apply-templates select="Code"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell xsl:use-attribute-sets="styl-komorki">
				<fo:block>
				<xsl:apply-templates select="Currency"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell xsl:use-attribute-sets="styl-komorki">
				<fo:block>
				<xsl:apply-templates select="Mid"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell xsl:use-attribute-sets="styl-komorki">
				<fo:block>
				<xsl:value-of select="$poprzedni-kurs"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell xsl:use-attribute-sets="styl-komorki">
				<fo:block>
				<xsl:value-of select="format-number((Mid - $poprzedni-kurs) div $poprzedni-kurs, '0.0%')"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	
	<xsl:attribute-set name="styl-komorki">
		<xsl:attribute name="border-style">dotted solid</xsl:attribute>
		<xsl:attribute name="padding">1mm 2mm</xsl:attribute>
		<xsl:attribute name="text-align">center</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="styl-komorki-h" use-attribute-sets="styl-komorki">
		<xsl:attribute name="border-bottom-style">double</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
	</xsl:attribute-set>
</xsl:stylesheet>
