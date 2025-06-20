<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="UTF-8" indent="yes"/>
	<xsl:decimal-format name="calculableRound"/>
	<xsl:decimal-format name="deviseRound" decimal-separator="," grouping-separator=" "/>
	<xsl:template match="/">
		<html>
			<head>
				<title>factures en date d'edition du <xsl:value-of select="/factures/@dateeditionXML"/></title>
				<style type="text/css">
					.facture{
						height:287mm;
						width:20cm;
					}
					.numfacture{
						width:70%;
						margin-left:15%;
						border:1px solid black;
						background-color:#ACACAC;
						text-align:center;
						margin-bottom:2cm;
					}
					table{
						margin-left:5%;
						width:90%;
						
					}
				</style>
			</head>
			<body>
				<xsl:for-each select="//facture">
					<div class="facture">
						<div class="numfacture">Facture N°<xsl:value-of select="@numfacture"/></div>
						<table border="1" cellpadding="0" cellspacing="0">
							<thead>
								<tr>
									<th>ref</th>
									<th>designation</th>
									<th>€/unit.</th>
									<th>quant.</th>
									<th>Total HT</th>
								</tr>
							</thead>
							<tbody>
								<xsl:apply-templates select=".//ligne"/>
								<xsl:call-template name="total-facture">
									<xsl:with-param name="nodeFacture" select="."/>
								</xsl:call-template>
							</tbody>
						</table>
					</div>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="ligne">
		<tr>
			<td>
				<xsl:value-of select="ref"/>
			</td>
			<td>
				<xsl:value-of select="designation"/>
			</td>
			<td>
				<xsl:value-of select="phtByUnit"/>
			</td>
			<td>
				<xsl:value-of select="nbUnit"/>
			</td>
			<th>
				<xsl:value-of select="format-number(stotligne,'# ##0,00€', 'deviseRound')"/>
			</th>
		</tr>
	</xsl:template>
	<xsl:template name="total-facture">
	<xsl:param name="nodeFacture"/>
		<tr>
		<xsl:variable name="tht" select="format-number(sum($nodeFacture//stotligne),'# ##0.00', 'calculableRound')"></xsl:variable>
			<th colspan="3"/>
			<th >Total HT</th>
			<th ><xsl:value-of select="format-number($tht,'# ##0,00€', 'deviseRound')"/></th>
		</tr>
		<tr>
			<th colspan="3"/>
			<th >Total TVA</th>
			<th />
		</tr>
		<tr>
			<th colspan="3"/>
			<th >Total TTC</th>
			<th />
		</tr>
	</xsl:template>
</xsl:stylesheet>