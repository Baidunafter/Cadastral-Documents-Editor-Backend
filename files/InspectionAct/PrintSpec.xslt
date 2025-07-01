<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template name="Enter">
<xsl:text>
</xsl:text>
</xsl:template>
<xsl:template name="Space">
<xsl:text>     </xsl:text>
</xsl:template>
<xsl:template name="Sign">
<xsl:param name="Sign"/>
<xsl:call-template name="Enter"/>
<xsl:text>__________________</xsl:text>
<xsl:text>                                </xsl:text>
<xsl:value-of select="$Sign"/>
</xsl:template>
</xsl:stylesheet>
