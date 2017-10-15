<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="utf-8" />
  
  <xsl:template match="/">
    <html>
      <head>
        <title>Kindergarten pupils</title>
      </head>
      <body>
        <h1>Kindergarten pupils</h1>
        <xsl:apply-templates select="kids" />
      </body>
    </html>
  </xsl:template>

  <xsl:template match="kids">
    <ul>
      <xsl:apply-templates>
			<xsl:with-param name="nazwa"><span style="color: black">Dziecko: </span></xsl:with-param>
      </xsl:apply-templates>
    </ul>
  </xsl:template>

<!--  <xsl:template match="*">
      <xsl:apply-templates/>
  </xsl:template>-->

  <xsl:template match="girl">
	<xsl:param name="nazwa"/>
    <li style="color: #FF4488">
      <xsl:copy-of select="$nazwa"/>  <xsl:apply-templates />
    </li>
  </xsl:template>

  <xsl:template match="boy">
	<xsl:param name="nazwa"/>
    <li style="color: blue">
      <xsl:copy-of select="$nazwa"/> <xsl:apply-templates />
    </li>
  </xsl:template>
</xsl:stylesheet>