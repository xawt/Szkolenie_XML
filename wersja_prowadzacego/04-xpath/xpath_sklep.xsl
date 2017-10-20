<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="xml" encoding="utf-8" indent="yes"/>

	<xsl:template match="/">
		<doc>
			<p>Przykłady zapytań XPath</p>

<!-- 			<example>
				<p>Wszystkie towary</p>
				<result>
				<xsl:copy-of select="//towar"/>
				</result>
			</example>
			<xsl:text>&#x0A;</xsl:text><xsl:comment>   ****************************   </xsl:comment><xsl:text>&#x0A;&#x0A;</xsl:text>

 -->
 
 			<example>
				<p>Nazwy towarów z kategorii herbata, które kosztują mniej niż 10 zł</p>
				<result>
				<xsl:copy-of select="//towar[@id-kategorii = 'herbata' and cena &lt; 10]/nazwa"/>
				</result>
			</example>
			<xsl:text>&#x0A;</xsl:text><xsl:comment>   ****************************   </xsl:comment><xsl:text>&#x0A;&#x0A;</xsl:text>

			<example>
				<p>Towary, które posiadają cenę promocyjną wyższą od normalnej</p>
				<result>
				<xsl:copy-of select="//towar[number(cena-promocyjna) > number(cena)]"/>
				</result>
			</example>
			<xsl:text>&#x0A;</xsl:text><xsl:comment>   ****************************   </xsl:comment><xsl:text>&#x0A;&#x0A;</xsl:text>
		
			<example>
				<p>Z punktu widzenia towaru dilmah, następny towar.</p>
				<result>
				<xsl:for-each select="//towar[@id-towaru = 'dilmah']">
					<xsl:copy-of select="following-sibling::towar[1]"/>
				</xsl:for-each>
				</result>
			</example>
			<xsl:text>&#x0A;</xsl:text><xsl:comment>   ****************************   </xsl:comment><xsl:text>&#x0A;&#x0A;</xsl:text>

			<example>
				<p>Z punktu widzenia towaru dilmah, poprzedni towar.</p>
				<result>
				<xsl:for-each select="//towar[@id-towaru = 'dilmah']">
					<xsl:copy-of select="preceding-sibling::towar[1]"/>
				</xsl:for-each>
				</result>
			</example>
			<xsl:text>&#x0A;</xsl:text><xsl:comment>   ****************************   </xsl:comment><xsl:text>&#x0A;&#x0A;</xsl:text>

			<example>
				<p>Z punktu widzenia towaru dilmah, dwa poprzednie i dwa następne towary.</p>
				<result>
				<xsl:for-each select="//towar[@id-towaru = 'dilmah']">
					<xsl:copy-of select="preceding-sibling::towar[position() >= 1 and position() &lt;= 2]
										| following-sibling::towar[position() >= 1 and position() &lt;= 2]"/>
				</xsl:for-each>
				</result>
			</example>
			<xsl:text>&#x0A;</xsl:text><xsl:comment>   ****************************   </xsl:comment><xsl:text>&#x0A;&#x0A;</xsl:text>

			<example>
				<p>Z punktu widzenia towaru dilmah, wszystkie inne towary z tej samej kategorii (zapisz ogólnie nie używając słowa herbata).</p>
				<result>
				<xsl:for-each select="//towar[@id-towaru = 'dilmah']">
					<xsl:copy-of select="//towar[@id-kategorii = current()/@id-kategorii
												and @id-towaru != current()/@id-towaru]/nazwa"/>
				</xsl:for-each>
				</result>
			</example>
			<xsl:text>&#x0A;</xsl:text><xsl:comment>   ****************************   </xsl:comment><xsl:text>&#x0A;&#x0A;</xsl:text>
		
			<example>
				<p>Z punktu widzenia towaru dilmah, wszystkie inne towary z tej samej kategorii (zapisz ogólnie nie używając słowa herbata).</p>
				<result>
				<xsl:for-each select="//towar[@id-towaru = 'dilmah']">
					<xsl:copy-of select="(preceding-sibling::towar | following-sibling::towar)[@id-kategorii = current()/@id-kategorii]/nazwa"/>
				</xsl:for-each>
				</result>
			</example>
			<xsl:text>&#x0A;</xsl:text><xsl:comment>   ****************************   </xsl:comment><xsl:text>&#x0A;&#x0A;</xsl:text>
		
			<example>
				<p>Nazwa najtańszego towaru w sklepie</p>
				<result>
				<xsl:copy-of select="//towar[not(//towar/cena &lt; cena)]/nazwa"/>
				</result>
			</example>
			<xsl:text>&#x0A;</xsl:text><xsl:comment>   ****************************   </xsl:comment><xsl:text>&#x0A;&#x0A;</xsl:text>

		</doc>
	</xsl:template>
</xsl:stylesheet>