<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://www.w3.org/1999/XSL/Format fop.xsd ">

	<xsl:output method="xml" encoding="utf-8" indent="yes" />
	
	<xsl:attribute-set name="cell-props">
		<xsl:attribute name="padding">2pt 2pt 1pt 2pt</xsl:attribute>
	</xsl:attribute-set>

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
					<fo:block>
						<xsl:text>Employees of </xsl:text>
						<fo:inline color="#553300">
							<xsl:value-of select="/company/name" />
						</fo:inline>
						<xsl:text>.</xsl:text>
					</fo:block>
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
		<fo:block font-size="18pt" font-weight="bold"
			font-family="'Verdana', 'Arial', sans-serif" text-align="center"
			margin="12pt 0">
			<xsl:apply-templates />
		</fo:block>
	</xsl:template>

	<xsl:template match="department">
		<fo:block space-before.minimum="12pt" space-after.minimum="6pt" page-break-inside="avoid">
			<xsl:apply-templates select="name" />
			<fo:table border="solid 2pt black">
				<fo:table-column border-style="solid" border-width="1pt" column-width="56mm"/>
				<fo:table-column  border-style="solid" border-width="1pt" column-width="32mm"/>
				<fo:table-column  border-style="solid" border-width="1pt" column-width="32mm"/>
				<fo:table-column  border-style="solid" border-width="1pt" column-width="56mm"/>
				<fo:table-header>
					<fo:table-row border-bottom-style="double" border-bottom-width="2pt"
						background-color="aliceblue">
						<fo:table-cell xsl:use-attribute-sets="cell-props">
							<fo:block font-weight="bold">Name</fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="cell-props">
							<fo:block font-weight="bold">Position</fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="cell-props">
							<fo:block font-weight="bold">Phone</fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="cell-props">
							<fo:block font-weight="bold">Email</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-header>
				<fo:table-body>
					<xsl:apply-templates select="person" />
				</fo:table-body>
			</fo:table>
		</fo:block>
	</xsl:template>


	<xsl:template match="department/name">
		<fo:block font-size="16pt" font-weight="bold" font-style="italic"
			font-family="'Verdana', 'Arial', sans-serif" text-align="left"
			margin-bottom="6pt">
			<xsl:apply-templates />
		</fo:block>
	</xsl:template>

	<xsl:template match="person">
		<fo:table-row border-bottom-style="dotted" border-bottom-width="0.5pt">
			<fo:table-cell xsl:use-attribute-sets="cell-props">
				<fo:block>
					<xsl:apply-templates select="first-name" />
					<xsl:text> </xsl:text>
					<xsl:apply-templates select="last-name" />
				</fo:block>
			</fo:table-cell>
			<fo:table-cell xsl:use-attribute-sets="cell-props">
				<fo:block>
					<xsl:apply-templates select="@position" />
				</fo:block>
			</fo:table-cell>
			<fo:table-cell xsl:use-attribute-sets="cell-props">
				<fo:block>
					<xsl:apply-templates select="phone[1]" />
				</fo:block>
			</fo:table-cell>
			<fo:table-cell xsl:use-attribute-sets="cell-props">
				<fo:block>
					<xsl:apply-templates select="email" />
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
</xsl:stylesheet>
