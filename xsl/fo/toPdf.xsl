<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="xml" version="1.0" omit-xml-declaration="no" encoding="utf-8" indent="yes"/>
	<xsl:template match="/">
		<fo:root>
			<fo:layout-master-set>
				<fo:simple-page-master master-name="A4" page-height="297mm" page-width="21cm">
					<fo:region-body margin-top="2cm"/>
					<fo:region-before extent="2cm"/>
				</fo:simple-page-master>
			</fo:layout-master-set>
			<fo:page-sequence master-reference="A4">
				<fo:static-content flow-name="xsl-region-before">
					<fo:block>
				En tete
			</fo:block>
				</fo:static-content>
				<fo:flow flow-name="xsl-region-body">
					<fo:block>
						<fo:block text-align="center" font-size="23pt" color="skyblue">
							<xsl:value-of select="/photos/titre"/>
						</fo:block>
						<xsl:apply-templates select="//pages/page"/>
					</fo:block>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
	<xsl:template match="page">
		<fo:block break-before="page">
			<fo:table>
				<fo:table-column column-width="98mm"/>
				<fo:table-column column-width="98mm"/>
				<fo:table-body>
					<fo:table-row height="110mm">
						<xsl:apply-templates select=".//image[position()&lt;=2]"/>
					</fo:table-row>
					<xsl:if test="count(image)>2">
						<fo:table-row>
							<xsl:apply-templates select=".//image[position()&gt;=3]"/>
						</fo:table-row>
					</xsl:if>
				</fo:table-body>
			</fo:table>
		</fo:block>
	</xsl:template>
	<xsl:template match="page/image">
		<fo:table-cell width="100%">
			<fo:block text-align="center">
				<fo:external-graphic src="{concat(@path,@href)}" scaling="inherit" content-height="98mm" content-width="98mm"/>
				<fo:block/>
				<xsl:value-of select="."/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
</xsl:stylesheet>