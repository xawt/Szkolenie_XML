<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html" encoding="utf-8" />

	<xsl:template match="/">
		<html>
			<head>
				<title>
					<xsl:text>Employees of </xsl:text>
					<xsl:value-of select="/company/name" />
				</title>
				<style type="text/css">
					<xsl:call-template name="css"/>
				</style>
			</head>
			<body>
				<xsl:apply-templates />
			</body>
		</html>
	</xsl:template>

	<xsl:template match="name">
		<h1>
			<xsl:apply-templates />
		</h1>
	</xsl:template>

	<xsl:template match="person">
		<xsl:variable name="boss">
			<xsl:if test="@position='chief'">boss</xsl:if>
		</xsl:variable>
		<div class="person {$boss}">
			<div class="name">
				<xsl:apply-templates select="first-name" />
				<xsl:text> </xsl:text>
				<xsl:apply-templates select="last-name" />
			</div>
			<div class="phone">
				<xsl:apply-templates select="phone" />
			</div>
			<div class="email">
				<xsl:apply-templates select="email" />
			</div>
		</div>
	</xsl:template>
	
	<xsl:template match="phone">
		<xsl:text> </xsl:text><xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template name="css"><![CDATA[
body {
	background-color: #FFFFDD;
	color: #000000;
	padding:10px;
	font-family: 'Times New Roman', 'Times', serif;
	font-size: 12pt;
}

.department {
	margin: 30px auto;
}

h1 {
	font-size: 1.5em;
	font-family: 'Verdana', 'Arial', sans-serif;
	font-weight: bold;
	text-align: center;
}

h2 {
	font-size: 1.3em;
	font-family: 'Verdana', 'Arial', sans-serif;
	font-weight: bold;
}

.person {
	margin: 10px auto 10px 30px;
	padding: 0.75em 1em;
	width: 200px;
	border-style: solid;
	border-width: 2px;
	border-color: #002288;
	background-color: #FFFFFF;
}

.boss {
	background-color: #DDFFDD;
}

.position {
	font-size: smaller;
}

.name {
	font-size:larger;
}

.boss .name {
	font-weight: bold;
}

.email {
	font-style: italic;
}
]]></xsl:template>
</xsl:stylesheet>
