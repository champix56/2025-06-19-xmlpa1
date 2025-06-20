<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text"/>
	<xsl:template match="/">idclient;numfacture;nb articles;totalHT;tva
<xsl:apply-templates select="//facture"/>
	</xsl:template>
	<xsl:template match="/factures/facture"><xsl:value-of select="@idclient"/>;<xsl:value-of select="@numfacture"/>;<xsl:value-of select="sum(.//nbUnit)"/>;<xsl:value-of select="sum(.//stotligne)"/>;<xsl:value-of select="sum(.//stotligne)*0.25"/>;
</xsl:template>
</xsl:stylesheet>
