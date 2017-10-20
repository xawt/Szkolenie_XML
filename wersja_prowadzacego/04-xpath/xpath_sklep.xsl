<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="xml" encoding="utf-8" indent="yes"/>

	<xsl:template match="/">
		<doc>
			<p>Przykłady zapytań XPath</p>

			<example>
				<p>Wszystkie towary</p>
				<result>
				<xsl:copy-of select="//towar"/>
				</result>
			</example>
			<xsl:text>&#x0A;</xsl:text><xsl:comment>   ****************************   </xsl:comment><xsl:text>&#x0A;&#x0A;</xsl:text>

			<example>
				<p>Nazwy towarów z kategorii herbata, które kosztują mniej niż 10 zł</p>
				<result>
				<xsl:copy-of select="nic"/>
				</result>
			</example>
			<xsl:text>&#x0A;</xsl:text><xsl:comment>   ****************************   </xsl:comment><xsl:text>&#x0A;&#x0A;</xsl:text>

			<example>
				<p>Towary, które posiadają cenę promocyjną wyższą od normalnej</p>
				<result>
				<xsl:copy-of select="nic"/>
				</result>
			</example>
			<xsl:text>&#x0A;</xsl:text><xsl:comment>   ****************************   </xsl:comment><xsl:text>&#x0A;&#x0A;</xsl:text>
		
			<example>
				<p>Z punktu widzenia towaru dilmah, następny towar.</p>
				<result>
				<xsl:for-each select="//towar[@id-towaru = 'dilmah']">
					<xsl:copy-of select="cena"/>
				</xsl:for-each>
				</result>
			</example>
			<xsl:text>&#x0A;</xsl:text><xsl:comment>   ****************************   </xsl:comment><xsl:text>&#x0A;&#x0A;</xsl:text>

			<example>
				<p>Z punktu widzenia towaru dilmah, dwa poprzednie i dwa następne towary.</p>
				<result>
				<xsl:for-each select="//towar[@id-towaru = 'dilmah']">
					<xsl:copy-of select="cena"/>
				</xsl:for-each>
				</result>
			</example>
			<xsl:text>&#x0A;</xsl:text><xsl:comment>   ****************************   </xsl:comment><xsl:text>&#x0A;&#x0A;</xsl:text>

			<example>
				<p>Z punktu widzenia towaru dilmah, wszystkie inne towary z tej samej kategorii (zapisz ogólnie nie używając słowa herbata).</p>
				<result>
				<xsl:for-each select="//towar[@id-towaru = 'dilmah']">
					<xsl:copy-of select="cena"/>
				</xsl:for-each>
				</result>
			</example>
			<xsl:text>&#x0A;</xsl:text><xsl:comment>   ****************************   </xsl:comment><xsl:text>&#x0A;&#x0A;</xsl:text>
		
			<example>
				<p>Nazwa najtańszego towaru w sklepie</p>
				<result>
				<xsl:copy-of select="nic"/>
				</result>
			</example>
			<xsl:text>&#x0A;</xsl:text><xsl:comment>   ****************************   </xsl:comment><xsl:text>&#x0A;&#x0A;</xsl:text>

		</doc>
	</xsl:template>
</xsl:stylesheet>