<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://www.w3.org/1999/XSL/Format fop.xsd">
	
	<xsl:param name="ile-kolumn" select="4"/>
	
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
		<fo:block-container page-break-inside="avoid">
		<fo:block
			font-weight="bold"
			font-size="14pt"
			margin-bottom="6pt"
			margin-top="12pt"
		>Tabela <xsl:apply-templates select="No"/> z dnia <xsl:apply-templates select="EffectiveDate"/></fo:block>
		<xsl:apply-templates select="Rates"/>
		</fo:block-container>
	</xsl:template>
	
	<xsl:template match="Rates">
		<fo:table>
			<xsl:call-template name="repeat">
				<xsl:with-param name="n" select="$ile-kolumn"/>
				<xsl:with-param name="tresc">
					<fo:table-column width="3cm"/>
				</xsl:with-param>
			</xsl:call-template>
			<fo:table-body>
				<xsl:call-template name="wypisz-kilka">
					<xsl:with-param name="rekordy" select="Rate"/>
				</xsl:call-template>
			</fo:table-body>
		</fo:table>
	</xsl:template>
	
	<xsl:template match="Rate">
		<fo:table-cell xsl:use-attribute-sets="styl-komorki">
				<fo:block>
				<xsl:apply-templates select="Code"/>
				<xsl:text> : </xsl:text>
				<xsl:apply-templates select="Mid"/>
				</fo:block>
			</fo:table-cell>
	</xsl:template>
	
	<xsl:template name="wypisz-kilka">
		<xsl:param name="ile" select="$ile-kolumn"/>
		<xsl:param name="rekordy"/>
		<xsl:variable name="reszta" select="$rekordy[position() > $ile]"/>
		
		<fo:table-row>
			<xsl:apply-templates select="$rekordy[position() &lt;= $ile]"/>
		</fo:table-row>
		<xsl:if test="$reszta">
			<xsl:call-template name="wypisz-kilka">
				<xsl:with-param name="rekordy" select="$reszta"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="repeat">
		<xsl:param name="tresc"/>
		<xsl:param name="n" select="0"/>
		
		<xsl:if test="$n > 0">
			<xsl:copy-of select="$tresc"/>
			<xsl:call-template name="repeat">
				<xsl:with-param name="tresc" select="$tresc"/>
				<xsl:with-param name="n" select="$n - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	
	<xsl:attribute-set name="styl-komorki">
		<xsl:attribute name="border-style">solid</xsl:attribute>
		<xsl:attribute name="padding">1mm 2mm</xsl:attribute>
		<xsl:attribute name="text-align">center</xsl:attribute>
	</xsl:attribute-set>

</xsl:stylesheet>
