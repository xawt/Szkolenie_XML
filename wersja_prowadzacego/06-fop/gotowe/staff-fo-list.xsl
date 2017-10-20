<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://www.w3.org/1999/XSL/Format fop.xsd ">

	<xsl:output method="xml" encoding="utf-8" indent="yes"/>
	
	<xsl:param name="list-indent">1.5em</xsl:param>
	<xsl:param name="list-tab">7.5em</xsl:param>

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
			<xsl:apply-templates select="name" />
			<fo:list-block space-before.minimum="12pt">
				<xsl:apply-templates select="person" />
			</fo:list-block>
		</fo:block>
	</xsl:template>


	<xsl:template match="department/name">
		<fo:block font-size="16pt" font-weight="bold" font-style="italic"  font-family="'Verdana', 'Arial', sans-serif"
				text-align="left" margin-bottom="6pt">
			<xsl:apply-templates />
		</fo:block>
	</xsl:template>


	<xsl:template match="person">
		<fo:list-item margin-top="12pt">
			<fo:list-item-label>
				<fo:block padding-top="2pt">*</fo:block>
			</fo:list-item-label>
			<fo:list-item-body margin-left="1.5em">
				<fo:block>
					<xsl:apply-templates select="first-name"/>
					<xsl:text> </xsl:text>
					<xsl:apply-templates select="last-name"/>
				</fo:block>
				<fo:list-block margin-left="{$list-indent}">
					<xsl:apply-templates select="@position" />
					<xsl:apply-templates select="phone" />
					<xsl:apply-templates select="email" />
				</fo:list-block>
			</fo:list-item-body>
		</fo:list-item>
	</xsl:template>

	<xsl:template match="@position">
		<fo:list-item>
			<fo:list-item-label>
				<fo:block>position</fo:block>
			</fo:list-item-label>
			<fo:list-item-body margin-left="{$list-tab}">
				<fo:block>
					<xsl:value-of select="." />
				</fo:block>
			</fo:list-item-body>
		</fo:list-item>
	</xsl:template>

	<xsl:template match="phone">
		<fo:list-item margin-top="3pt">
			<fo:list-item-label>
				<fo:block>
			<xsl:choose>
				<xsl:when test="@type='mobile'">mob.&#xA0;</xsl:when>
				<xsl:when test="@type='fax'">fax&#xA0;</xsl:when>
				<xsl:otherwise>tel.&#xA0;</xsl:otherwise>
			</xsl:choose>
				</fo:block>
			</fo:list-item-label>
			<fo:list-item-body margin-left="{$list-tab}">
				<fo:block>
					<xsl:apply-templates />
				</fo:block>
			</fo:list-item-body>
		</fo:list-item>
	</xsl:template>

	<xsl:template match="email">
		<fo:list-item margin-top="3pt">
			<fo:list-item-label>
				<fo:block>email</fo:block>
			</fo:list-item-label>
			<fo:list-item-body margin-left="{$list-tab}">
				<fo:block>
					<xsl:apply-templates />
				</fo:block>
			</fo:list-item-body>
		</fo:list-item>
	</xsl:template>
</xsl:stylesheet>
