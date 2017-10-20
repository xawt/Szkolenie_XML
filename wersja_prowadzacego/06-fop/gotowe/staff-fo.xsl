<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://www.w3.org/1999/XSL/Format fop.xsd ">

	<xsl:output method="xml" encoding="utf-8" indent="yes"/>

	<xsl:template match="/">
		<fo:root>
			<fo:layout-master-set>
				<fo:simple-page-master master-name="A4"
					page-width="210mm" page-height="297mm" margin="1cm">
					<fo:region-body margin="16pt 0" />
					<fo:region-before extent="16pt" />
				</fo:simple-page-master>
			</fo:layout-master-set>

			<fo:page-sequence master-reference="A4">
				<fo:static-content flow-name="xsl-region-before">
					<fo:block><xsl:text>Employees of </xsl:text>
					<fo:inline color="#553300"><xsl:value-of select="/company/name"/></fo:inline>
					<xsl:text>.</xsl:text></fo:block>
				</fo:static-content>
				<fo:flow flow-name="xsl-region-body">
					<xsl:apply-templates />
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>

	<xsl:template match="company">
		<fo:block font-family="'Times New Roman', 'Times', serif"
				font-size="12pt">
			<xsl:apply-templates />
		</fo:block>
	</xsl:template>

	<xsl:template match="company/name">
		<fo:block font-size="18pt" font-weight="bold" font-family="'Verdana', 'Arial', sans-serif"
				text-align="center" margin="12pt 0">
			<xsl:apply-templates />
		</fo:block>
	</xsl:template>

	<xsl:template match="department">
		<fo:block space-before.minimum="12pt" space-after.minimum="6pt">
			<xsl:apply-templates />
		</fo:block>
	</xsl:template>


	<xsl:template match="department/name">
		<fo:block font-size="16pt" font-weight="bold" font-style="italic"  font-family="'Verdana', 'Arial', sans-serif"
				text-align="left" margin-bottom="6pt">
			<xsl:apply-templates />
		</fo:block>
	</xsl:template>


	<xsl:template match="person">
		<fo:block padding="0.5em"
				margin="5mm 100mm 5mm 10mm"
				border-width="1.5pt"
				border-style="solid"
				border-color="#553300"
				page-break-inside="avoid">
			<xsl:attribute name="background-color">
				<xsl:choose>
					<xsl:when test="@position = 'chief'">#DDFFDD</xsl:when>
					<xsl:otherwise>#DDDDDD</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<fo:block font-size="14pt">
				<xsl:apply-templates select="first-name" />
				<xsl:text> </xsl:text>
				<xsl:apply-templates select="last-name" />
			</fo:block>
			<fo:block margin-top="0.5em">
				<xsl:apply-templates select="phone" />
			</fo:block>
			<fo:block margin-top="0.5em">
				<xsl:apply-templates select="email" />
			</fo:block>
		</fo:block>
	</xsl:template>

	<xsl:template match="person[@position='chief']/last-name">
		<fo:inline font-weight="bold">
			<xsl:apply-templates />
		</fo:inline>
	</xsl:template>

	<xsl:template match="phone">
		<fo:block>
			<xsl:choose>
				<xsl:when test="@type='mobile'">mob.&#xA0;</xsl:when>
				<xsl:when test="@type='fax'">fax&#xA0;</xsl:when>
				<xsl:otherwise>tel.&#xA0;</xsl:otherwise>
			</xsl:choose>
			<xsl:apply-templates />
		</fo:block>
	</xsl:template>

	<xsl:template match="email">
		<fo:block font-style="italic">
			<xsl:apply-templates />
		</fo:block>
	</xsl:template>
</xsl:stylesheet>
