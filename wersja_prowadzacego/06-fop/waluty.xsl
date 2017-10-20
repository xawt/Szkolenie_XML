<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://www.w3.org/1999/XSL/Format fop.xsd">
	
	<xsl:template match="/">
		<fo:root font-family="Arial">
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
		<fo:block>Tabela <xsl:apply-templates select="No"/> z dnia <xsl:apply-templates select="EffectiveDate"/></fo:block>
		<xsl:apply-templates select="Rates"/>
	</xsl:template>
	
	<xsl:template match="Rates">
		<fo:table border-style="solid">
			<fo:table-body>
				<xsl:apply-templates select="Rate"/>
			</fo:table-body>
		</fo:table>
	</xsl:template>
	
	<xsl:template match="Rate">
		<fo:table-row>
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
		</fo:table-row>
	</xsl:template>
	
	<xsl:attribute-set name="styl-komorki">
		<xsl:attribute name="border-style">dotted solid</xsl:attribute>
		<xsl:attribute name="padding">1.5mm</xsl:attribute>
		
	</xsl:attribute-set>

</xsl:stylesheet>
