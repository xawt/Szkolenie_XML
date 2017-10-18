<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html" encoding="UTF-8" indent="yes" version="4.01"
		doctype-public="-//W3C//DTD HTML 4.01//EN"
  		doctype-system="http://www.w3.org/TR/html4/strict.dtd"/>
	
	<xsl:decimal-format
		decimal-separator=","
		grouping-separator=" "
	/>

	<xsl:template match="/">
		<html>
			<head>
				<title>Asortyment sklepu</title>
				<xsl:call-template name="css"/>
			</head>
			<body>
				<ol>
					<xsl:for-each select="//towar">
						<li>
							<xsl:if test="@id-kategorii = 'herbata'">
								<xsl:attribute name="style">color:red</xsl:attribute>
							</xsl:if>
							<xsl:value-of select="nazwa"/>
							<xsl:text> - </xsl:text>
							<xsl:value-of select="cena"/>
						</li>
					</xsl:for-each>
				</ol>
			</body>
		</html>
	</xsl:template>
	

	
	<xsl:template name="css">
		<style type="text/css">
body {
	background-color: #FFFFCC;
	font-family: 'Verdana', 'Arial', sans-serif;
	font-size: 12pt;
}

.towar, .kategoria {
	display: block;
	background-color: white;
	min-width: 400px;
	max-width: 800px;
	margin: 1em auto;
	padding: 0.5em;
	border-style: groove;
	border-width: 6px;
	border-color: green;
}


h2 {
	text-align: center;
	display: block;
	font-size: 120%;
}

.promo {
	font-size: smaller;
}
		</style>
	</xsl:template>
	
</xsl:stylesheet>
