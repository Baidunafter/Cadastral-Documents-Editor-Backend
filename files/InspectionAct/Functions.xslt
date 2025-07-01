<?xml version="1.0" encoding="windows-1251"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:callbackObject="urn:XFCECallback">
  <xsl:template name="NewGUID">
    <xsl:value-of select="callbackObject:NewGUID()"/>
  </xsl:template>
  <xsl:template name="NewGUIDForGUID">
    <xsl:param name="oldGuid"/>
    <xsl:value-of select="callbackObject:NewGUIDForGUID($oldGuid)"/>
  </xsl:template>
  <xsl:template name="RoundHalfToEven">
    <xsl:param name="value"/>
    <xsl:param name="precision"/>
    <xsl:value-of select="callbackObject:RoundHalfToEven($value, $precision)"/>
  </xsl:template>
</xsl:stylesheet>
