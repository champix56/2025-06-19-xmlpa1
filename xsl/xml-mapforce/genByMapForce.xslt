<?xml version="1.0" encoding="UTF-8"?><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs">
	<xsl:output method="xml" encoding="UTF-8" indent="yes" />
	<xsl:template match="/">
		<xsl:variable name="var1_initial" select="."/>
		<factures>
			<xsl:for-each select="factures/facture">
				<xsl:variable name="var2_cur" select="."/>
				<facture>
					<xsl:attribute name="idfacture">
						<xsl:value-of select="@numfacture"/>
					</xsl:attribute>
					<xsl:attribute name="nomClient">
						<xsl:value-of select="number(@idclient)"/>
					</xsl:attribute>
					<prixAvgArticle>
						<xsl:value-of select="(sum(lignes/ligne/phtByUnit) div count(lignes/ligne/phtByUnit))"/>
					</prixAvgArticle>
					<ligneAvg>
						<xsl:value-of select="(sum(lignes/ligne/stotligne) div count(lignes/ligne/stotligne))"/>
					</ligneAvg>
					<nbLignes>
						<xsl:value-of select="count(lignes/ligne)"/>
					</nbLignes>
				</facture>
			</xsl:for-each>
		</factures>
	</xsl:template>
</xsl:stylesheet>
