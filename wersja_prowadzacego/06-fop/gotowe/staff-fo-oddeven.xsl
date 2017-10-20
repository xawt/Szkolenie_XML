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
				<fo:simple-page-master master-name="first"
					page-width="148mm" page-height="210mm" margin="3cm 3cm 3cm 3cm">
					<fo:region-body margin-bottom="26pt"/>
					<fo:region-after extent="26pt" />
				</fo:simple-page-master>

				<fo:simple-page-master master-name="left"
					page-width="148mm" page-height="210mm" margin="1cm 1cm 1cm 4cm">
					<fo:region-body margin-bottom="26pt"/>
					<fo:region-after extent="26pt" />
				</fo:simple-page-master>
				
				<fo:simple-page-master master-name="right"
					page-width="148mm" page-height="210mm" margin="1cm 4cm 1cm 1cm">
					<fo:region-body margin-bottom="26pt"/>
					<fo:region-after extent="26pt" />
				</fo:simple-page-master>

				<fo:page-sequence-master master-name="rich_master">
					<fo:repeatable-page-master-alternatives>
						<fo:conditional-page-master-reference master-reference="first" page-position="first"/>
						<fo:conditional-page-master-reference master-reference="right" odd-or-even="odd"/>
						<fo:conditional-page-master-reference master-reference="left" odd-or-even="even"/>
					</fo:repeatable-page-master-alternatives>
				</fo:page-sequence-master>
			</fo:layout-master-set>

			<fo:page-sequence master-reference="rich_master">
				<fo:static-content flow-name="xsl-region-after">
					<fo:block text-align="center">- <fo:page-number/> -</fo:block>
				</fo:static-content>
				<fo:flow flow-name="xsl-region-body">
					<xsl:apply-templates />
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>

	<xsl:template match="company">
		<fo:block font-family="'Times New Roman', 'Times', serif"
				font-size="11pt">
			<xsl:apply-templates />
		</fo:block>
	</xsl:template>

	<xsl:template match="company/name">
		<fo:block font-size="16pt" font-weight="bold" font-family="'Verdana', 'Arial', sans-serif"
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
		<fo:block font-size="14pt" font-weight="bold" font-style="italic"  font-family="'Verdana', 'Arial', sans-serif"
				text-align="left" margin-bottom="6pt">
			<xsl:apply-templates />
		</fo:block>
	</xsl:template>


	<xsl:template match="person">
		<fo:block padding="0.5em"
				margin="5mm"
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
