<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<title>Sekcje</title>
			</head>
			<body>
				<xsl:apply-templates/>
			</body>
		</html>
	</xsl:template>
	
	
	<xsl:template match="section">
		<div style="margin:1em">
			<xsl:apply-templates/>			
		</div>
	</xsl:template>

	<xsl:template match="title">
		<xsl:element name="h{count(ancestor::section)+1}">
			<xsl:apply-templates/>			
		</xsl:element>
	</xsl:template>



	<xsl:template match="p">
		<p>
			<xsl:apply-templates/>			
		</p>
	</xsl:template>


</xsl:stylesheet>