<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format">
	
<xsl:template match="/">
	<fo:root>
		<fo:layout-master-set>
			<fo:simple-page-master master-name="A4"
				page-height="297mm" page-width="210mm" margin="25mm">
				<fo:region-body />
			</fo:simple-page-master>
		</fo:layout-master-set>
		<fo:page-sequence master-reference="A4">
			<fo:flow flow-name="xsl-region-body"
				font-family="Arial, sans-serif"
				font-size="12pt"
			>
				<xsl:apply-templates/>
			</fo:flow>
		</fo:page-sequence>
	</fo:root>
</xsl:template>	
	
<xsl:template match="cennik">
	<fo:block-container page-break-inside="avoid">
	<fo:block font-weight="bold" font-size="1.25em"
			space-before="2em" space-after="1em">
		<xsl:text>Cennik z dnia </xsl:text>
		<xsl:value-of select="data"/>
	</fo:block>
	
	<fo:table border="solid 2pt black">
		<fo:table-header>
			<fo:table-row>
				<fo:table-cell xsl:use-attribute-sets="cell-style">
					<fo:block>Nazwa</fo:block>
				</fo:table-cell>
				<fo:table-cell xsl:use-attribute-sets="cell-style">
					<fo:block>Cena</fo:block>
				</fo:table-cell>
				<fo:table-cell xsl:use-attribute-sets="cell-style">
					<fo:block>Vat</fo:block>
				</fo:table-cell>
				<fo:table-cell xsl:use-attribute-sets="cell-style">
					<fo:block>Zmiana</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-header>
		<fo:table-body>
			<xsl:apply-templates select="towar"/>
		</fo:table-body>
	</fo:table>
	</fo:block-container>
</xsl:template>
	
<xsl:template match="towar">
	<fo:table-row>
		<fo:table-cell xsl:use-attribute-sets="cell-style">
			<fo:block>
				<xsl:apply-templates select="nazwa"/>
			</fo:block>
		</fo:table-cell>
		<fo:table-cell xsl:use-attribute-sets="cell-style">
			<fo:block>
				<xsl:value-of select="format-number(cena, '0.00')"/>
			</fo:block>
		</fo:table-cell>
		<fo:table-cell xsl:use-attribute-sets="cell-style">
			<fo:block>
				<xsl:value-of select="vat"/>
				<xsl:text>%</xsl:text>
			</fo:block>
		</fo:table-cell>
		<fo:table-cell xsl:use-attribute-sets="cell-style">
		
				<xsl:variable name="poprzednia-cena"
					select="preceding::towar[@id-towaru = current()/@id-towaru][1]/cena"/>
				<xsl:variable name="kolor">
					<xsl:choose>
						<xsl:when test="number(cena) > $poprzednia-cena">green</xsl:when>
						<xsl:when test="number(cena) &lt; $poprzednia-cena">red</xsl:when>
						<xsl:otherwise>black</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>

				<xsl:variable name="napis">
					<xsl:choose>
						<xsl:when test="number(cena) != $poprzednia-cena">
						<fo:inline font-weight="bold">
							<xsl:value-of select="format-number((cena - $poprzednia-cena) div cena, '#.##%')"/>
						</fo:inline>
						</xsl:when>
						<xsl:when test="number(cena) = $poprzednia-cena">bez zmian</xsl:when>
						<xsl:otherwise><fo:inline font-style="italic">pierwszy raz</fo:inline></xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
					
			<fo:block color="{$kolor}">
				<xsl:copy-of select="$napis"/>
			</fo:block>
		</fo:table-cell>
	</fo:table-row>
</xsl:template>

<xsl:attribute-set name="cell-style">
	<xsl:attribute name="border">solid 0.5pt #444444</xsl:attribute>
	<xsl:attribute name="padding">2pt</xsl:attribute>
</xsl:attribute-set>
	
</xsl:stylesheet>
