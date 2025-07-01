<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:import href="MiniEditorCommon.xslt"/>
  <xsl:import href="MiniEditorOKSFile.xslt"/>
  <xsl:template match="/">
    <xsl:for-each select="/MiniEditor/Forms">
      <Pack>
        <xsl:attribute name="FolderName">
          <xsl:value-of select="$CodeReg"/>
          <xsl:choose>
            <xsl:when test="$PackName!=''">
              <xsl:text>_!</xsl:text>
              <xsl:value-of select="$PackName"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:text>_</xsl:text>
              <xsl:value-of select="$PackID"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
        <xsl:choose>
          <xsl:when test="$VersionAct='02'">
            <xsl:choose>
              <xsl:when test="Form[@Code='Act']/Page[@Code='CadastralNumbers']/Alt[@Code='Archive']/*[@Code='FlatsArchive' and @Selected='true']">
                <xsl:for-each select="Form[@Code='Act']/Page[@Code='CadastralNumbers']/Multi[@Code='Flats']/*">
                  <xsl:variable name="CodeDoc" select="'Act'"/>
                  <xsl:variable name="ActPos" select="position()"/>
                  <File>
                    <xsl:attribute name="FileName">
                      <xsl:text>act_</xsl:text>
                      <xsl:choose>
                        <xsl:when test="$ActPos&lt;10">00</xsl:when>
                        <xsl:when test="$ActPos&lt;100">0</xsl:when>
                      </xsl:choose>
                      <xsl:value-of select="$ActPos"/>
                      <xsl:value-of select="substring(../../../Page[@Code='Customer']/@SetID, 4,36)"/>
                      <xsl:text>.xml</xsl:text>
                    </xsl:attribute>
                    <Content>
                      <xsl:for-each select="../../..">
                        <xsl:call-template name="Act2">
                          <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
                          <xsl:with-param name="ActPos" select="$ActPos"/>
                          <xsl:with-param name="TypeOKS" select="'Flat'"/>
                        </xsl:call-template>
                      </xsl:for-each>
                    </Content>
                    <xsl:call-template name="AddFilesDescription">
                      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
                    </xsl:call-template>
                  </File>
                </xsl:for-each>
              </xsl:when>
			  <xsl:otherwise>
                <xsl:for-each select="Form[@Code='Act']">
                  <xsl:variable name="CodeDoc" select="@Code"/>
                  <File>
                    <xsl:attribute name="FileName">
                      <xsl:text>act_</xsl:text>
                      <xsl:value-of select="'001'"/>
                      <xsl:value-of select="substring(Page[@Code='Customer']/@SetID, 4,36)"/>
                      <xsl:text>.xml</xsl:text>
                    </xsl:attribute>
                    <Content>
                      <xsl:call-template name="Act2">
                        <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
                        <xsl:with-param name="TypeOKS" select="'OKS'"/>
                      </xsl:call-template>
                    </Content>
                    <xsl:call-template name="AddFilesDescription">
                      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
                    </xsl:call-template>
                  </File>
                </xsl:for-each>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:when>
          <xsl:otherwise>
            <xsl:choose>
              <xsl:when test="Form[@Code='Act']/Page[@Code='CadastralNumbers']/Alt[@Code='Archive']/*[@Code='FlatsArchive' and @Selected='true']">
                <xsl:for-each select="Form[@Code='Act']/Page[@Code='CadastralNumbers']/Multi[@Code='Flats']/*">
                  <xsl:variable name="CodeDoc" select="'Act'"/>
                  <xsl:variable name="ActPos" select="position()"/>
                  <File>
                    <xsl:attribute name="FileName">
                      <xsl:text>act_</xsl:text>
                      <xsl:choose>
                        <xsl:when test="$ActPos&lt;10">00</xsl:when>
                        <xsl:when test="$ActPos&lt;100">0</xsl:when>
                      </xsl:choose>
                      <xsl:value-of select="$ActPos"/>
                      <xsl:value-of select="substring(../../../Page[@Code='Customer']/@SetID, 4,36)"/>
                      <xsl:text>.xml</xsl:text>
                    </xsl:attribute>
                    <Content>
                      <xsl:for-each select="../../..">
                        <xsl:call-template name="Act">
                          <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
                          <xsl:with-param name="ActPos" select="$ActPos"/>
                          <xsl:with-param name="TypeOKS" select="'Flat'"/>
                        </xsl:call-template>
                      </xsl:for-each>
                    </Content>
                    <xsl:call-template name="AddFilesDescription">
                      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
                    </xsl:call-template>
                  </File>
                </xsl:for-each>
              </xsl:when>
              <xsl:otherwise>
                <xsl:for-each select="Form[@Code='Act']">
                  <xsl:variable name="CodeDoc" select="@Code"/>
                  <File>
                    <xsl:attribute name="FileName">
                      <xsl:text>act_</xsl:text>
                      <xsl:value-of select="'001'"/>
                      <xsl:value-of select="substring(Page[@Code='Customer']/@SetID, 4,36)"/>
                      <xsl:text>.xml</xsl:text>
                    </xsl:attribute>
                    <Content>
                      <xsl:call-template name="Act">
                        <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
                        <xsl:with-param name="TypeOKS" select="'OKS'"/>
                      </xsl:call-template>
                    </Content>
                    <xsl:call-template name="AddFilesDescription">
                      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
                    </xsl:call-template>
                  </File>
                </xsl:for-each>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:otherwise>
        </xsl:choose>
     
      </Pack>
    </xsl:for-each>
  </xsl:template>


</xsl:stylesheet>
