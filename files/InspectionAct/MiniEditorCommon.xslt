<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:import href="MiniEditorCommonMain.xslt"/>

  <!-- Из Forms-->
  <xsl:variable name="CodeReg" select="normalize-space(//Forms/@SetCodeReg)"/>
  <xsl:variable name="Date" select="normalize-space(//Forms/@SetDate)"/>
  <xsl:variable name="Time" select="normalize-space(//Forms/@SetTime)"/>
  <xsl:variable name="PackID" select="normalize-space(//Forms/@SetID)"/>
  <xsl:variable name="EmailTE" select="normalize-space(//Forms/@SetUID)"/>

  <!-- Наименование пакета в Исходящих -->
  <xsl:variable name="PackName">
    <xsl:value-of select="normalize-space(translate(//Form/Page/*[@Code='PackName']/*/*[@Code='PackName'],'&lt;&gt;&quot;:*?|\/','_________'))"/>
  </xsl:variable>

  <!-- Из Info-->
  <xsl:variable name="JFSender" select="normalize-space(//Form[@Code='Info']/Page[@Code='Info']/*/*/*[@Code='JF'])"/>
  <xsl:variable name="MJFDeclarant" select="normalize-space(//Form[@Code='Request']/Page[@Code='Declarants']/*[@Code='Declarant']/*[@Selected='true']/@Code)"/>
  <xsl:variable name="CodeSender" select="normalize-space(//Form[@Code='Info']/Page[@Code='Info']/*/*/*[@Code='CodeSender'])"/>
  <xsl:variable name="Organization" select="normalize-space(//Form[@Code='Info']/Page[@Code='Info']/*/*/*[@Code='Organization'])"/>
  <xsl:variable name="INNJ" select="normalize-space(//Form[@Code='Info']/Page[@Code='Info']/*/*/*[@Code='INNJ'])"/>
  <xsl:variable name="INNF" select="normalize-space(//Form[@Code='Info']/Page[@Code='Info']/*/*/*[@Code='INNF'])"/>
  <xsl:variable name="KPP" select="normalize-space(//Form[@Code='Info']/Page[@Code='Info']/*/*/*[@Code='KPP'])"/>
  <xsl:variable name="OGRN" select="normalize-space(//Form[@Code='Info']/Page[@Code='Info']/*/*/*[@Code='OGRN'])"/>
  <xsl:variable name="RegDate" select="normalize-space(//Form[@Code='Info']/Page[@Code='Info']/*/*/*[@Code='RegDate'])"/>
  <xsl:variable name="Phone" select="normalize-space(//Form[@Code='Info']/Page[@Code='Info']/*/*/*[@Code='Phone'])"/>
  <xsl:variable name="Email"  select="normalize-space(//Form[@Code='Info']/Page[@Code='Info']/*/*/*[@Code='Email'])" />
  <xsl:variable name="Region" select="normalize-space(//Form[@Code='Info']/Page[@Code='Info']/*/*/*[@Code='Region']/*[@Selected='true']/@Code)"/>
  <xsl:variable name="Address" select="normalize-space(//Form[@Code='Info']/Page[@Code='Info']/*/*/Param[@Code='Address'])"/>
  <xsl:variable name="FIO1" select="normalize-space(//Form[@Code='Info']/Page[@Code='Info']/*/*/*[@Code='FIO1'])"/>
  <xsl:variable name="FIO2" select="normalize-space(//Form[@Code='Info']/Page[@Code='Info']/*/*/*[@Code='FIO2'])"/>
  <xsl:variable name="FIO3" select="normalize-space(//Form[@Code='Info']/Page[@Code='Info']/*/*/*[@Code='FIO3'])"/>
  <xsl:variable name="DateBirth" select="normalize-space(//Form[@Code='Info']/Page[@Code='Info']/*/*/*[@Code='DateBirth'])"/>
  <xsl:variable name="PlaceBirth" select="normalize-space(//Form[@Code='Info']/Page[@Code='Info']/*/*/*[@Code='Place_Birth'])"/>
  <xsl:variable name="Appointment" select="normalize-space(//Form[@Code='Info']/Page[@Code='Info']/*/*/*[@Code='Appointment'])"/>
  <xsl:variable name="LetterNumber" select="normalize-space(//Form[@Code='Info']/Page[@Code='Info']/*/*[not(@Selected='false')]/*[@Code='LetterNumber'])"/>
  <xsl:variable name="LetterDate1" select="normalize-space(//Form[@Code='Info']/Page[@Code='Info']/*/*[not(@Selected='false')]/*[@Code='LetterDate1'])"/>
  <xsl:variable name="LetterDate2" select="normalize-space(//Form[@Code='Info']/Page[@Code='Info']/*/*[not(@Selected='false')]/*[@Code='LetterDate2'])"/>
  <xsl:variable name="CertN" select="normalize-space(//Form[@Code='Info']/Page[@Code='Info']/*/*/*[@Code='CertN'])"/>
  <xsl:variable name="NameOrganizationF" select="normalize-space(//Form[@Code='Info']/Page[@Code='Info']/*/*/*[@Code='NameOrganizationF'])"/>
  <xsl:variable name="Type_Document" select="normalize-space(//Form[@Code='Info']/Page[@Code='Info']/*/*/*[@Code='Type_Document']/*[@Selected='true']/@Code)"/>
  <xsl:variable name="DocSeries" select="normalize-space(//Form[@Code='Info']/Page[@Code='Info']/*/*/*[@Code='Series'])"/>
  <xsl:variable name="DocNumber" select="normalize-space(//Form[@Code='Info']/Page[@Code='Info']/*/*/*[@Code='Number'])"/>
  <xsl:variable name="DocDate" select="normalize-space(//Form[@Code='Info']/Page[@Code='Info']/*/*/*[@Code='Date'])"/>
  <xsl:variable name="DocIssueOrgan" select="normalize-space(//Form[@Code='Info']/Page[@Code='Info']/*/*/*[@Code='IssueOrgan'])"/>
  <xsl:variable name="LetterFile" select="normalize-space(//Form[@Code='Info']/Page[@Code='Info']/*/*[not(@Selected='false')]/*[@Code='Request'])"/>
  <xsl:variable name="CodeRecipient" select="normalize-space(//Form[@Code='Info']/Page/*/*/*[@Code='CodeRecipient'])"/>
  <xsl:variable name="NameRecipient" select="normalize-space(//Form[@Code='Info']/Page/*/*/*[@Code='NameRecipient'])"/>
  <xsl:variable name="CodeRequestDoc" select="normalize-space(//Form[@Code='Request']/Page[@Code='Request_Documents']/*[@Code='Request_Document']/*[1]/*[@Code='SubCode']/*[@Selected='true']/@Code)"/>
  <xsl:variable name="SNILS" select="normalize-space(//Form[@Code='Info']/Page[@Code='Info']/*/*/*[@Code='SNILS'])"/>
  <xsl:variable name="ImportTransforms" select="normalize-space(//Form[@Code='Info']/Page/*/*/*[@Code='ImportTransforms'])"/>
  <xsl:variable name="OID" select="normalize-space(//Form[@Code='Info']/Page/*/*/*[@Code='OID'])"/>
  <xsl:variable name="DocNameOTI" select="normalize-space(//Form[@Code='Info']/Page[@Code='Info']/*/*[not(@Selected='false')]/*[@Code='DocNameOTI'])"/>
  <xsl:variable name="Governance_Code" select="normalize-space(//Form[@Code='Info']/Page[@Code='Info']/*/*/*[@Code='Governance_Code']/*[@Selected='true']/@Code)"/>
  <xsl:variable name="agent_kind" select="normalize-space(//Form[@Code='Info']/Page[@Code='Info']/*/*/*[@Code='agent_kind'])"/>
  <xsl:variable name="TypeAddress" select="normalize-space(//Form[@Code='Info']/Page[@Code='Info']/*/*/*[@Code='TypeAddress']/*[@Selected='true']/@Code)"/>
  <xsl:variable name="GUID_Contractor">
    <xsl:choose>
      <xsl:when test="//Forms/@SetUID[.!='@' and .!='']">
        <xsl:value-of select="concat('ID',translate(//Forms/@SetUID,'@.','_'))"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="//Form[@Code='Info']/Page[@Code='Info']/*/*/*[@Code='GUID_Contractor']"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <!-- FormatCheckSettings -->
  <xsl:variable name="VersionRequest">
    <xsl:for-each select="//Forms/Form[@Code='Info']/*/*/*">
      <xsl:call-template name="Value">
        <xsl:with-param name="x" select="'VersionRequest'"/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:variable>
  <xsl:variable name="VersionReestr">
    <xsl:for-each select="//Forms/Form[@Code='Info']/*/*/*">
      <xsl:call-template name="Value">
        <xsl:with-param name="x" select="'VersionReestr'"/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:variable>
  <xsl:variable name="VersionMP">
    <xsl:for-each select="//Forms/Form[@Code='Info']/*/*/*">
      <xsl:call-template name="Value">
        <xsl:with-param name="x" select="'VersionMP'"/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:variable>
  <xsl:variable name="VersionTP">
    <xsl:for-each select="//Forms/Form[@Code='Info']/*/*/*">
      <xsl:call-template name="Value">
        <xsl:with-param name="x" select="'VersionTP'"/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:variable>
  <xsl:variable name="VersionKAISToGKN">
    <xsl:for-each select="//Forms/Form[@Code='Info']/*/*/*">
      <xsl:call-template name="Value">
        <xsl:with-param name="x" select="'VersionKAISToGKN'"/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:variable>
  <xsl:variable name="VersionStatementGRP">
    <xsl:for-each select="//Forms/Form[@Code='Info']/*/*/*">
      <xsl:call-template name="Value">
        <xsl:with-param name="x" select="'VersionStatementGRP'"/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:variable>
  <xsl:variable name="VersionBoundToGKN">
    <xsl:for-each select="//Forms/Form[@Code='Info']/*/*/*">
      <xsl:call-template name="Value">
        <xsl:with-param name="x" select="'VersionBoundToGKN'"/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:variable>
  <xsl:variable name="VersionZoneToGKN">
    <xsl:for-each select="//Forms/Form[@Code='Info']/*/*/*">
      <xsl:call-template name="Value">
        <xsl:with-param name="x" select="'VersionZoneToGKN'"/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:variable>
  <xsl:variable name="VersionSchemeParcels">
    <xsl:for-each select="//Forms/Form[@Code='Info']/*/*/*">
      <xsl:call-template name="Value">
        <xsl:with-param name="x" select="'VersionSchemaParcels'"/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:variable>
  <xsl:variable name="VersionAct">
    <xsl:for-each select="//Forms/Form[@Code='Info']/*/*/*">
      <xsl:call-template name="Value">
        <xsl:with-param name="x" select="'VersionAct'"/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:variable>
  <xsl:variable name="ProgramS">
    <xsl:for-each select="//Forms/Form[@Code='Info']/*/*/*">
      <xsl:call-template name="Value">
        <xsl:with-param name="x" select="'ProgramS'"/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:variable>
  <xsl:variable name="ProgramR">
    <xsl:for-each select="//Forms/Form[@Code='Info']/*/*/*">
      <xsl:call-template name="Value">
        <xsl:with-param name="x" select="'ProgramR'"/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:variable>

  <xsl:template name="CertN">
    <xsl:param name="CertN"/>
    <xsl:choose>
      <xsl:when test="$CertN=''">00-00-000000</xsl:when>
      <xsl:when test="7 > string-length($CertN)">00-00-111111</xsl:when>
      <xsl:when test="substring($CertN,1,1)!='0' and substring($CertN,1,1)!='1' and substring($CertN,1,1)!='2' and substring($CertN,1,1)!='3' and substring($CertN,1,1)!='4' and substring($CertN,1,1)!='5' and substring($CertN,1,1)!='6' and substring($CertN,1,1)!='7' and substring($CertN,1,1)!='8' and substring($CertN,1,1)!='9'">00-00-111111</xsl:when>
      <xsl:when test="substring($CertN,2,1)!='0' and substring($CertN,2,1)!='1' and substring($CertN,2,1)!='2' and substring($CertN,2,1)!='3' and substring($CertN,2,1)!='4' and substring($CertN,2,1)!='5' and substring($CertN,2,1)!='6' and substring($CertN,2,1)!='7' and substring($CertN,2,1)!='8' and substring($CertN,2,1)!='9'">00-00-111111</xsl:when>
      <xsl:when test="substring($CertN,3,1)!='-'">00-00-111111</xsl:when>
      <xsl:when test="substring($CertN,4,1)!='0' and substring($CertN,4,1)!='1' and substring($CertN,4,1)!='2' and substring($CertN,4,1)!='3' and substring($CertN,4,1)!='4' and substring($CertN,4,1)!='5' and substring($CertN,4,1)!='6' and substring($CertN,4,1)!='7' and substring($CertN,4,1)!='8' and substring($CertN,4,1)!='9'">00-00-111111</xsl:when>
      <xsl:when test="substring($CertN,5,1)!='0' and substring($CertN,5,1)!='1' and substring($CertN,5,1)!='2' and substring($CertN,5,1)!='3' and substring($CertN,5,1)!='4' and substring($CertN,5,1)!='5' and substring($CertN,5,1)!='6' and substring($CertN,5,1)!='7' and substring($CertN,5,1)!='8' and substring($CertN,5,1)!='9'">00-00-111111</xsl:when>
      <xsl:when test="substring($CertN,6,1)!='-'">00-00-111111</xsl:when>
      <xsl:when test="substring($CertN,7,1)!='0' and substring($CertN,7,1)!='1' and substring($CertN,7,1)!='2' and substring($CertN,7,1)!='3' and substring($CertN,7,1)!='4' and substring($CertN,7,1)!='5' and substring($CertN,7,1)!='6' and substring($CertN,7,1)!='7' and substring($CertN,7,1)!='8' and substring($CertN,7,1)!='9'">00-00-111111</xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$CertN"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template name="SNILS">
    <xsl:param name="SNILS"/>
    <xsl:choose>
      <xsl:when test="$SNILS=''">00000000000</xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="translate($SNILS,'- ','')"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- Маршрутизация по ОКАТО -->
  <xsl:variable name="RouteOKATO">
    <xsl:for-each select="//Forms/Form[@Code='Request' or @Code='RequestGeneral'][1]/*/*/*">
      <xsl:call-template name="Value">
        <xsl:with-param name="x" select="'RouteOKATO'"/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:variable>
  <xsl:template name="RouteOKATO">
    <xsl:comment>
      <xsl:value-of select="normalize-space($RouteOKATO)"/>
    </xsl:comment>
  </xsl:template>

  <!-- Для межевого плана -->
  <xsl:variable name="CustomerDate">
    <xsl:variable name="CustomerDate0">
      <xsl:choose>
        <xsl:when test="$VersionMP='04'">
          <xsl:value-of select="normalize-space(//Form[@Code='MP']/Page[@Code='Customer']/*[@Code='ContractorDate' and @Selected='true']/*/*[@Code='Date'])"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="normalize-space(//Form[@Code='MP']/Page[@Code='Customer']/*[@Code='CustomerDate' and @Selected='true']/*/*[@Code='Date'])"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$CustomerDate0!=''">
        <xsl:value-of select="$CustomerDate0"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$Date"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="Method" select="normalize-space(//Form[@Code='MP']/Page[@Code='Common']/*/*[@Selected='true']/*[@Code='Method'])"/>
  <xsl:variable name="MethodOKS">
    <xsl:value-of select="//Form[(@Code='Building' or @Code='Construction' or @Code='Uncompleted' or @Code='Flat' or @Code='Linear') and @Selected='true'][1]/*[@Code='Register']/*[@Code='Method']/*[@Selected='true']/@Code"/>
  </xsl:variable>
  <xsl:variable name="TitleRequest">
    <xsl:choose>
      <xsl:when test="//Form[@Code='MP']/Page[@Code='Common']/*/*[@Selected='true']/*[@Code='Request1'] and $Method='SP1'">
        <xsl:value-of select="normalize-space(//Form[@Code='MP']/Page[@Code='Common']/*/*[@Selected='true']/*[@Code='Request1']/*[@Selected='true']/@Code)"/>
      </xsl:when>
      <xsl:when test="$Method='SP1'">true</xsl:when>
      <xsl:otherwise>false</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:template name="EDocument">
    <xsl:param name="CodeDoc"/>
    <xsl:param name="FileID"/>
    <xsl:param name="RequestType"/>
    <xsl:param name="AddAName1" />
    <xsl:param name="AddAValue1" />
    <xsl:param name="AddAName2" />
    <xsl:param name="AddAValue2" />
    <xsl:param name="AddAName3" />
    <xsl:param name="AddAValue3" />
    <!--xsl:param name="VersionDoc"/-->
    <eDocument>
      <xsl:attribute name="CodeType">
        <xsl:choose>
          <xsl:when test="$CodeDoc='Request' and $RequestType=''">
            <xsl:text>112</xsl:text>
          </xsl:when>
          <xsl:when test="$CodeDoc='Request' and $RequestType='COST'">
            <xsl:text>004</xsl:text>
          </xsl:when>
          <xsl:when test="$CodeDoc='Request' and $RequestType='CCD'">
            <xsl:text>000</xsl:text>
          </xsl:when>
          <xsl:when test="$CodeDoc='MP' and $CodeReg='nwz'">
            <xsl:text>014</xsl:text>
          </xsl:when>
          <xsl:when test="$CodeDoc='MP' and $CodeReg='chz'">
            <xsl:text>015</xsl:text>
          </xsl:when>
          <xsl:when test="($CodeDoc='TP' or $CodeDoc='Building' or $CodeDoc='Construction' or $CodeDoc='Uncompleted' or $CodeDoc='Flat') and ($CodeReg='nwh' or $CodeReg='nwhm')">
            <xsl:text>023</xsl:text>
          </xsl:when>
          <xsl:when test="($CodeDoc='TP' or $CodeDoc='Building' or $CodeDoc='Construction' or $CodeDoc='Uncompleted' or $CodeDoc='Flat') and $CodeReg='chh'">
            <xsl:text>024</xsl:text>
          </xsl:when>
        </xsl:choose>
      </xsl:attribute>
      <xsl:attribute name="Version">
        <xsl:choose>
          <xsl:when test="$CodeDoc='Request'">
            <xsl:choose>
              <xsl:when test="$RequestType='COST'">
                <xsl:for-each select="//Forms/Form[@Code='Info']/*/*/*">
                  <xsl:call-template name="Value">
                    <xsl:with-param name="x" select="'VersionRequestCOST'"/>
                  </xsl:call-template>
                </xsl:for-each>
              </xsl:when>
              <xsl:when test="$RequestType='CCD'">
                <xsl:for-each select="//Forms/Form[@Code='Info']/*/*/*">
                  <xsl:call-template name="Value">
                    <xsl:with-param name="x" select="'VersionRequestCCD'"/>
                  </xsl:call-template>
                </xsl:for-each>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="$VersionRequest"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:when>
          <xsl:when test="$CodeDoc='MP'">
            <xsl:value-of select="$VersionMP"/>
          </xsl:when>
        </xsl:choose>
      </xsl:attribute>
      <xsl:if test="$CodeDoc='MP'">
        <xsl:attribute name="GUID">
          <xsl:choose>
            <xsl:when test="$FileID!=''">
              <xsl:value-of select="$FileID"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:text>11111111-1111-1111-1111-111111111111</xsl:text>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="$AddAValue1!=''">
        <xsl:attribute name="{$AddAName1}">
          <xsl:value-of select="$AddAValue1"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="$AddAValue2!=''">
        <xsl:attribute name="{$AddAName2}">
          <xsl:value-of select="$AddAValue2"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="$AddAValue3!=''">
        <xsl:attribute name="{$AddAName3}">
          <xsl:value-of select="$AddAValue3"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="not($CodeDoc='MP' and $VersionMP='04') and not($CodeDoc='Request' and $VersionRequest='18')">
        <Sender>
          <xsl:attribute name="Kod">
            <xsl:text>000000000000</xsl:text>
            <!--xsl:value-of select="$CodeSender"/-->
          </xsl:attribute>
          <xsl:attribute name="Name">
            <xsl:choose>
              <xsl:when test="//Form[@Code='Request']/Page[@Code='Declarants']/Alt[@Code='Declarant']/Section[@Code='J' and @Selected = 'true']">
                <xsl:for-each select="//Form[@Code='Request']/Page[@Code='Declarants']/Alt[@Code='Declarant']/Section[@Code='J' and @Selected = 'true']">
                  <xsl:call-template name="Value">
                    <xsl:with-param name="x" select="'Organization'"/>
                    <xsl:with-param name="list" select="'Organization'"/>
                    <xsl:with-param name="ListCode" select="'J'"/>
                  </xsl:call-template>
                </xsl:for-each>
              </xsl:when>
              <xsl:when test="//Form[@Code='Request']/Page[@Code='Declarants']/Alt[@Code='Declarant']/Section[@Code='F' and @Selected = 'true']">
                <xsl:for-each select="//Form[@Code='Request']/Page[@Code='Declarants']/Alt[@Code='Declarant']/Section[@Code='F' and @Selected = 'true']">
                  <xsl:call-template name="Value">
                    <xsl:with-param name="x" select="'FIO1'"/>
                    <xsl:with-param name="list" select="'Person'"/>
                    <xsl:with-param name="ListCode" select="'F'"/>
                  </xsl:call-template>
                  <xsl:text> </xsl:text>
                  <xsl:call-template name="Value">
                    <xsl:with-param name="x" select="'FIO2'"/>
                    <xsl:with-param name="list" select="'Person'"/>
                    <xsl:with-param name="ListCode" select="'F'"/>
                  </xsl:call-template>
                  <xsl:text> </xsl:text>
                  <xsl:call-template name="Value">
                    <xsl:with-param name="x" select="'FIO3'"/>
                    <xsl:with-param name="list" select="'Person'"/>
                    <xsl:with-param name="ListCode" select="'F'"/>
                  </xsl:call-template>
                </xsl:for-each>
              </xsl:when>
              <xsl:when test="$JFSender='J'">
                <xsl:value-of select="$Organization"/>
              </xsl:when>
              <xsl:when test="$JFSender='F'">
                <xsl:value-of select="$FIO1"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="$FIO2"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="$FIO3"/>
              </xsl:when>
            </xsl:choose>
          </xsl:attribute>
          <xsl:if test="$CodeDoc='MP' or ($CodeDoc='Request' and $RequestType!='')">
            <xsl:attribute name="Date_Upload">
              <xsl:value-of select="$Date"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="($CodeDoc='Request' and $RequestType!='')">
            <xsl:attribute name="Appointment">
              <xsl:value-of select="$Appointment"/>
            </xsl:attribute>
            <xsl:attribute name="FIO">
              <xsl:value-of select="$FIO1"/>
              <xsl:text> </xsl:text>
              <xsl:value-of select="$FIO2"/>
              <xsl:text> </xsl:text>
              <xsl:value-of select="$FIO3"/>
            </xsl:attribute>
            <xsl:attribute name="E_Mail">
              <xsl:value-of select="$Email"/>
            </xsl:attribute>
            <xsl:attribute name="Telephone">
              <xsl:value-of select="$Phone"/>
            </xsl:attribute>
          </xsl:if>
        </Sender>
      </xsl:if>
      <xsl:if test="($CodeDoc='Request' and ($VersionRequest='15')) or ($CodeDoc='MP' and $VersionMP!='04') or ($CodeDoc='Request' and $RequestType!='')">
        <Recipient/>
      </xsl:if>
      <xsl:if test="($CodeDoc='Request' and ($VersionRequest='18'))">
        <Recipient>
          <xsl:attribute name="Name">
            <xsl:value-of select="''"/>
          </xsl:attribute>
        </Recipient>
      </xsl:if>
      <xsl:if test="$CodeDoc='Request'">
        <xsl:call-template name="RouteOKATO"/>
      </xsl:if>
    </eDocument>
  </xsl:template>
  <xsl:template name="EDocumentExr">
    <xsl:param name="CodeDoc"/>
    <xsl:param name="VersionDoc"/>
    <eDocument>
      <xsl:attribute name="CodeType">112</xsl:attribute>
      <xsl:attribute name="Version">
        <xsl:choose>
          <xsl:when test="$VersionReestr=''">04</xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$VersionReestr"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <Sender>
        <xsl:attribute name="Kod">
          <xsl:value-of select="$CodeSender"/>
        </xsl:attribute>
        <xsl:attribute name="Name">
          <xsl:choose>
            <xsl:when test="$JFSender='J'">
              <xsl:value-of select="$Organization"/>
            </xsl:when>
            <xsl:when test="$JFSender='F'">
              <xsl:value-of select="$FIO1"/>
              <xsl:text> </xsl:text>
              <xsl:value-of select="$FIO2"/>
              <xsl:text> </xsl:text>
              <xsl:value-of select="$FIO3"/>
            </xsl:when>
          </xsl:choose>
        </xsl:attribute>
      </Sender>
      <Recipient>
        <xsl:attribute name="Kod">
          <xsl:value-of select="$CodeRecipient"/>
        </xsl:attribute>
        <xsl:attribute name="Name">
          <xsl:value-of select="$NameRecipient"/>
        </xsl:attribute>
      </Recipient>
      <xsl:if test="$CodeDoc='Request'">
        <xsl:call-template name="RouteOKATO"/>
      </xsl:if>
    </eDocument>
  </xsl:template>
  <xsl:template name="EDocumentNwr">
    <xsl:param name="CodeDoc"/>
    <xsl:param name="VersionDoc"/>
    <eDocument>
      <xsl:attribute name="CodeType">112</xsl:attribute>
      <xsl:attribute name="Version">
        <xsl:choose>
          <xsl:when test="$VersionReestr=''">06</xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$VersionReestr"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <Sender>
        <xsl:attribute name="Kod">
          <xsl:value-of select="$CodeSender"/>
        </xsl:attribute>
        <xsl:attribute name="Name">
          <xsl:choose>
            <xsl:when test="$JFSender='J'">
              <xsl:value-of select="$Organization"/>
            </xsl:when>
            <xsl:when test="$JFSender='F'">
              <xsl:value-of select="$FIO1"/>
              <xsl:text> </xsl:text>
              <xsl:value-of select="$FIO2"/>
              <xsl:text> </xsl:text>
              <xsl:value-of select="$FIO3"/>
            </xsl:when>
          </xsl:choose>
        </xsl:attribute>
      </Sender>
      <xsl:if test="$CodeDoc='Request'">
        <xsl:call-template name="RouteOKATO"/>
      </xsl:if>
    </eDocument>
  </xsl:template>
  <xsl:template name="XmlFileName">
    <xsl:param name="CodeDoc"/>
    <xsl:param name="FileID"/>
    <xsl:param name="FileExtention"/>
    <xsl:param name="Region"/>
    <xsl:variable name="Prefix">
      <xsl:choose>
        <xsl:when test="$CodeDoc='Request' and ($VersionReestr='ЕГРН 01') and $CodeReg='exr'">
          <xsl:text>req</xsl:text>
        </xsl:when>
        <xsl:when test="$CodeDoc='Request' and ($VersionReestr='ЕГРН 01')">
          <xsl:text>req</xsl:text>
        </xsl:when>
        <xsl:when test="($VersionStatementGRP='ЕГРН 01') and $CodeReg='nwr' ">
          <xsl:text>req</xsl:text>
        </xsl:when>
        <xsl:when test="$CodeDoc='Request' and ($VersionRequest='ЕГРН 01')">
          <xsl:text>req</xsl:text>
        </xsl:when>
        <xsl:when test="$CodeDoc = 'Request'">
          <xsl:text>REQ</xsl:text>
        </xsl:when>
        <!--xsl:when test="$CodeDoc = 'kais'">
          <xsl:text>KAIS</xsl:text>
        </xsl:when-->
        <xsl:when test="$CodeDoc = 'MP'">
          <xsl:text>GKUZU</xsl:text>
        </xsl:when>
        <xsl:when test="($VersionTP='06' or $VersionTP='03') and ($CodeDoc='TP' or $CodeDoc='Building' or $CodeDoc='Construction' or $CodeDoc='Uncompleted' or $CodeDoc='Flat' or $CodeDoc='ParkingPlace')">
          <xsl:text>GKUOKS</xsl:text>
        </xsl:when>
        <xsl:when test="($CodeDoc='TP' or $CodeDoc='Building' or $CodeDoc='Construction' or $CodeDoc='Uncompleted' or $CodeDoc='Flat' or $CodeDoc='ParkingPlace')">
          <xsl:text>GUOKS</xsl:text>
        </xsl:when>

        <xsl:when test="($CodeDoc='Linear')">
          <xsl:text>GKULOKS</xsl:text>
        </xsl:when>
        <xsl:when test="($CodeDoc='ConditionalPart')">
          <xsl:text>GKULPART_</xsl:text>
          <xsl:value-of select="$Region"/>
        </xsl:when>
        <xsl:when test="$CodeDoc = 'OldTP'">
          <xsl:text>TUOKS</xsl:text>
        </xsl:when>
        <xsl:when test="$CodeDoc = 'Application'">
          <xsl:text>APP</xsl:text>
        </xsl:when>
        <xsl:when test="$CodeDoc = 'StatementGRP01'">
          <xsl:text>app</xsl:text>
        </xsl:when>
        <xsl:when test="$CodeDoc = 'Forests'">
          <xsl:text>ActForest</xsl:text>
        </xsl:when>
        <xsl:when test="$CodeDoc!=''">
          <xsl:value-of select="$CodeDoc"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:text>XXX</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:value-of select="$Prefix"/>
    <xsl:text>_</xsl:text>
    <xsl:value-of select="$FileID"/>
    <xsl:text>.</xsl:text>
    <xsl:choose>
      <xsl:when test="$FileExtention!=''">
        <xsl:value-of select="$FileExtention"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>xml</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="MainElement">
    <xsl:param name="CodeDoc"/>
    <xsl:choose>
      <xsl:when test="$CodeDoc = 'Request'">
        <xsl:text>Requests_GZK_Realty</xsl:text>
      </xsl:when>
      <xsl:when test="$CodeDoc = 'MP'">
        <xsl:text>STD_MP</xsl:text>
      </xsl:when>
      <xsl:when test="($CodeDoc='TP' or $CodeDoc='Building' or $CodeDoc='Construction' or $CodeDoc='Uncompleted' or $CodeDoc='Flat')">
        <xsl:text>STD_TP</xsl:text>
      </xsl:when>
      <xsl:when test="$CodeDoc = 'OldTP'">
        <xsl:text>Register_Realty</xsl:text>
      </xsl:when>
      <xsl:when test="$CodeDoc = 'Application'">
        <xsl:text>Applied_Documents</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>XXX</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="AddFilesDescription">
    <xsl:param name="CodeDoc"/>
    <xsl:param name="AddFilesFolder"/>
    <xsl:param name="Sign">.sig</xsl:param>
    <xsl:param name="IDDoc"/>
    <xsl:param name="RequestSpecialName"/>
    <AddFiles>
      <xsl:attribute name="FolderName">
        <xsl:choose>
          <xsl:when test="$ImportTransforms='RequestOnly' and .//*[@Kind!='' and not(contains(@Name,'[%%%%%]'))]/@Name">
            <xsl:value-of select="substring-before(.//*[@Kind!='' and not(contains(@Name,'[%%%%%]'))]/@Name,'\')"/>
          </xsl:when>
          <xsl:when test="$ImportTransforms='RequestOnly' and .//Plans/Plan[not(contains(@Name,'[%%%%%]'))]/@Name">
            <xsl:value-of select="substring-before(.//Plans/Plan[not(contains(@Name,'[%%%%%]'))]/@Name,'\')"/>
          </xsl:when>
          <xsl:when test="$ImportTransforms='RequestOnly' and .//AppliedFile/@Name">
            <xsl:value-of select="substring-before(.//AppliedFile/@Name,'\')"/>
          </xsl:when>
          <xsl:when test="$ImportTransforms='RequestOnly' and .//doc2:AppliedFile/@Name" xmlns:doc2="urn://x-artefacts-rosreestr-ru/commons/complex-types/document/4.0.3">
            <xsl:value-of select="substring-before(.//doc2:AppliedFile/@Name,'\')"/>
          </xsl:when>
          <xsl:when test="$ImportTransforms='RequestOnly' and .//doci2:AppliedFile/@Name" xmlns:doci2="urn://x-artefacts-rosreestr-ru/commons/complex-types/document-info/5.0.1">
            <xsl:value-of select="substring-before(.//doci2:AppliedFile/@Name,'\')"/>
          </xsl:when>
          <xsl:when test="$ImportTransforms='RequestOnly' and .//Images/Image/@Name">
            <xsl:value-of select="substring-before(.//Images/Image/@Name,'\')"/>
          </xsl:when>
          <xsl:when test="$ImportTransforms='RequestOnly' and .//Plans/Plan/@File">
            <xsl:value-of select="substring-before(.//Plans/Plan/@File,'\')"/>
          </xsl:when>
          <xsl:when test="$ImportTransforms='RequestOnly' and .//AppliedFilePDF/@Name">
            <xsl:value-of select="substring-before(.//AppliedFilePDF/@Name,'\')"/>
          </xsl:when>
          <xsl:when test="$ImportTransforms='RequestOnly' and .//SchemeGeodesicPlotting/@Name">
            <xsl:value-of select="substring-before(.//SchemeGeodesicPlotting/@Name,'\')"/>
          </xsl:when>
          <xsl:when test="$ImportTransforms='RequestOnly' and .//SchemeDisposition/@Name">
            <xsl:value-of select="substring-before(.//SchemeDisposition/@Name,'\')"/>
          </xsl:when>
          <xsl:when test="$ImportTransforms='RequestOnly' and .//DiagramContour/@Name">
            <xsl:value-of select="substring-before(.//DiagramContour/@Name,'\')"/>
          </xsl:when>
          <xsl:when test="$AddFilesFolder=''">
            <xsl:text>.</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$AddFilesFolder"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <xsl:if test="$ImportTransforms='RequestOnly'">
        <xsl:variable name="TempFolder">
          <xsl:value-of select="../@TempFolder"/>
        </xsl:variable>
        <xsl:for-each select=".//*[@Kind='01' and not(contains(@Name,'[%%%%%]'))] | .//AppliedFile | .//Images/Image | .//Plans/Plan[not(contains(@Name,'[%%%%%]'))] |.//AppliedFilePDF|.//SchemeGeodesicPlotting|.//SchemeDisposition|.//DiagramContour">
          <xsl:variable name="Path" select="concat($TempFolder,'\',@Name,@File)" />
          <xsl:variable name="FileName" select="concat(substring-after(@Name,'\'),substring-after(@File,'\'))" />
          <AddFile>
            <xsl:attribute name="Path">
              <xsl:value-of select="$Path"/>
            </xsl:attribute>
            <xsl:attribute name="FileName">
              <xsl:value-of select="$FileName"/>
            </xsl:attribute>
          </AddFile>
          <!-- Подпись -->
          <AddFile>
            <xsl:attribute name="Path">
              <xsl:value-of select="concat($Path,$Sign)"/>
            </xsl:attribute>
            <xsl:attribute name="FileName">
              <xsl:value-of select="concat($FileName,$Sign)"/>
            </xsl:attribute>
          </AddFile>
        </xsl:for-each>
      </xsl:if>
      <xsl:variable name="Code">
        <xsl:choose>
          <xsl:when test="$CodeDoc = 'Bound'">
            <xsl:value-of select="'Zone'"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$CodeDoc"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:for-each
        select="//Form[@Selected = 'true']/Page/*[@Selected = 'true']/*[not(@Selected = 'false')]/ParamFile[. != '' and contains(@Code, $Code)]">
        <xsl:variable name="IDFormParent">
          <xsl:if test="contains(../../../../@ParentID,'_')">
            <xsl:value-of select="substring-after(../../../../@ParentID,'_')"/>
          </xsl:if>
        </xsl:variable>
        <xsl:variable name="IDForm">
          <xsl:value-of select="../../../../@ID"/>
        </xsl:variable>
        <xsl:if test="$IDDoc='' or $IDDoc=$IDForm or $IDDoc=$IDFormParent">
          <xsl:variable name="Path" select="."/>
          <xsl:variable name="FileName">
            <xsl:choose>
              <xsl:when test="@SetName!=''">
                <xsl:value-of select="@SetName"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="OurFilePrefix">
                  <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
                </xsl:call-template>
                <xsl:value-of select="position()"/>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="@SetType!=''">
              <xsl:text>.</xsl:text>
              <xsl:value-of select="@SetType"/>
            </xsl:if>
          </xsl:variable>
          <AddFile>
            <xsl:attribute name="Path">
              <xsl:value-of select="$Path"/>
            </xsl:attribute>
            <xsl:attribute name="FileName">
              <xsl:value-of select="$FileName"/>
            </xsl:attribute>
            <!-- Технический план с приложенными файлами в режиме Доп.документы, требуется извлекать пути к приложенным файлам из xml-файла  -->
            <xsl:if test="(../../self::*[@Code='Applied_DocumentTP' and @Selected='true']) and $CodeReg='add'">
              <xsl:call-template name="AddAddFilesDescription"/>
            </xsl:if>
            <!-- Межевой план с приложенными файлами в режиме Доп.документы, требуется извлекать пути к приложенным файлам из xml-файла  -->
            <xsl:if test="(../../self::*[@Code='Applied_DocumentMP' and @Selected='true']) and $CodeReg='add'">
              <xsl:call-template name="AddAddFilesDescription"/>
            </xsl:if>
            <!-- Акт обследования с приложенными файлами в режиме Доп.документы, требуется извлекать пути к приложенным файлам из xml-файла  -->
            <xsl:if test="(../../self::*[@Code='Applied_DocumentAct' and @Selected='true']) and $CodeReg='add'">
              <Namespaces>
                <Namespace Prefix="root" URI="urn://x-artefacts-rosreestr-ru/incoming/inspection/1.0.1"/>
                <Namespace Prefix="root2" URI="urn://x-artefacts-rosreestr-ru/incoming/inspection/2.0.1"/>
                <Namespace Prefix="doc" URI="urn://x-artefacts-rosreestr-ru/commons/complex-types/document/1.0.1"/>
                <Namespace Prefix="doc7" URI="urn://x-artefacts-rosreestr-ru/commons/complex-types/document/7.0.1"/>
              </Namespaces>
              <xsl:call-template name="AddAddFilesDescription"/>
            </xsl:if>
          </AddFile>

          <!-- Подпись -->
          <AddFile>
            <xsl:attribute name="Path">
              <xsl:value-of select="concat($Path,$Sign)"/>
            </xsl:attribute>
            <xsl:attribute name="FileName">
              <xsl:value-of select="concat($FileName,$Sign)"/>
            </xsl:attribute>
            <!-- Технический план с приложенными файлами в режиме Доп.документы, требуется извлекать пути к приложенным файлам из xml-файла  -->
            <xsl:if test="(../../self::*[@Code='Applied_DocumentTP' and @Selected='true']) and $CodeReg='add'">
              <!--xsl:call-template name="AddAddFilesDescription"/-->
            </xsl:if>
            <!-- Межевой план с приложенными файлами в режиме Доп.документы, требуется извлекать пути к приложенным файлам из xml-файла  -->
            <xsl:if test="(../../self::*[@Code='Applied_DocumentMP' and @Selected='true']) and $CodeReg='add'">
              <!--xsl:call-template name="AddAddFilesDescription"/-->
            </xsl:if>
            <!-- Акт обследования с приложенными файлами в режиме Доп.документы, требуется извлекать пути к приложенным файлам из xml-файла  -->
            <xsl:if test="(../../self::*[@Code='Applied_DocumentAct' and @Selected='true']) and $CodeReg='add'">
              <!--xsl:call-template name="AddAddFilesDescription"/-->
            </xsl:if>
          </AddFile>
        </xsl:if>
      </xsl:for-each>
      <xsl:if test="$RequestSpecialName!=''">
        <xsl:choose>
          <xsl:when test="contains($RequestSpecialName,'Right_Request')">
            <xsl:for-each select="Form[@Code='Request']">
              <xsl:variable name="preCount">
                <xsl:value-of select="count(Page[@Code = 'Declarants']/*[@Code = 'ReqType']/*[@Selected = 'true' and (@Code='TechnicalError' or @Code='ChangeInfo')])"/>
              </xsl:variable>
              <AddFile>
                <xsl:attribute name="Path">
                  <xsl:choose>
                    <xsl:when test="$preCount='0'">$Print\Request_app_</xsl:when>
                    <xsl:otherwise >$Print\Requestf2_app_</xsl:otherwise>
                  </xsl:choose>
                  <xsl:choose>
                    <xsl:when test="position() &lt; 10">00</xsl:when>
                    <xsl:when test="position() &lt; 100">0</xsl:when>
                  </xsl:choose>
                  <xsl:value-of select="position()"/>
                  <xsl:value-of select="substring(Page[@Code = 'Declarants']/@SetID, 4, 36)"/>
                  <xsl:text>.mdc</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="FileName">
                  <xsl:text>app_</xsl:text>
                  <xsl:choose>
                    <xsl:when test="position() &lt; 10">00</xsl:when>
                    <xsl:when test="position() &lt; 100">0</xsl:when>
                  </xsl:choose>
                  <xsl:value-of select="position()"/>
                  <xsl:value-of select="substring(Page[@Code = 'Declarants']/@SetID, 4, 33)"/>
                  <xsl:text>.</xsl:text>
                  <xsl:value-of select="substring-after($RequestSpecialName,'.')"/>
                </xsl:attribute>
              </AddFile>
            </xsl:for-each>
          </xsl:when>
          <xsl:otherwise>
            <AddFile Path="$Print\Request.mdc" >
              <xsl:attribute name="FileName">
                <xsl:value-of select="$RequestSpecialName"/>
              </xsl:attribute>
            </AddFile>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:if>
    </AddFiles>
  </xsl:template>
  <xsl:template name="AddFilesDescriptionStatement" xmlns:root="http://rosreestr.ru/services/v0.12/TRequest">
    <xsl:param name="CodeDoc"/>
    <xsl:param name="AddFilesFolder"/>
    <xsl:param name="Sign">.sig</xsl:param>
    <xsl:param name="ForRequest">true</xsl:param>
    <xsl:param name="IDDoc"/>

    <xsl:if test="$ImportTransforms='RequestOnly'">
      <xsl:variable name="TempFolder">
        <xsl:value-of select="../@TempFolder"/>
      </xsl:variable>
      <xsl:for-each select=".//*[@Kind='01' and not(contains(@Name,'[%%%%%]'))] | .//AppliedFile | .//Images/Image | .//Plans/Plan[not(contains(@Name,'[%%%%%]'))] |.//AppliedFilePDF|.//SchemeGeodesicPlotting|.//SchemeDisposition|.//DiagramContour">
        <xsl:variable name="Path" select="concat($TempFolder,'\',@Name,@File)" />
        <xsl:variable name="FileName" select="concat(substring-after(@Name,'\'),substring-after(@File,'\'))" />
        <root:file>
          <root:fileName>
            <xsl:value-of select="$FileName"/>
          </root:fileName>
        </root:file>
        <!-- Подпись -->
        <root:file>
          <root:fileName>
            <xsl:value-of select="concat($FileName,$Sign)"/>
          </root:fileName>
        </root:file>
      </xsl:for-each>
    </xsl:if>
    <xsl:for-each select="//Form[@Selected='true' and (@Code='Request' or @Code='Objects' or @Code='Subjects' or @Code='Info')  and not(@Code='Info' and $MJFDeclarant!='M') ]">
      <xsl:variable name="id">
        <xsl:value-of select="//Form[@Code='Request'][1]/@SetID"/>
      </xsl:variable>
      <xsl:for-each select="Page/*[@Selected='true' ]/*[not(@Selected='false')]/ParamFile[.!='' and contains(@Code,$CodeDoc)]">

        <xsl:variable name="IDFormParent">
          <xsl:if test="contains(../../../../@ParentID,'_')">
            <xsl:value-of select="substring-after(../../../../@ParentID,'_')"/>
          </xsl:if>
        </xsl:variable>
        <xsl:variable name="IDForm">
          <xsl:value-of select="../../../../@ID"/>
        </xsl:variable>
        <xsl:variable name="CodeForm">
          <xsl:value-of select="../../../../@Code"/>
        </xsl:variable>
        <xsl:if test="$IDDoc='' or $IDDoc=$IDForm or $IDDoc=$IDFormParent">
          <xsl:variable name="Path" select="."/>
          <xsl:variable name="FileName">
            <xsl:choose>
              <xsl:when test="@SetName!=''">
                <xsl:value-of select="@SetName"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="OurFilePrefix">
                  <xsl:with-param name="CodeDoc" select="'Request'"/>
                </xsl:call-template>
                <xsl:value-of select="position()"/>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="@SetType!=''">
              <xsl:text>.</xsl:text>
              <xsl:value-of select="@SetType"/>
            </xsl:if>
          </xsl:variable>
          <xsl:if test="$FileName!='' and not(../../@Code='Applied_DocumentMP' or ../../@Code='Applied_DocumentTP' or ../../@Code='Applied_DocumentAct' )">
            <root:file>
              <root:fileName>
                <!--xsl:value-of select="$id"/>
                <xsl:text>/</xsl:text-->
                <xsl:value-of select="$FileName"/>
              </root:fileName>
            </root:file>
            <root:file>
              <root:fileName>
                <!--xsl:value-of select="$id"/>
                <xsl:text>/</xsl:text-->
                <xsl:value-of select="concat($FileName,$Sign)"/>
              </root:fileName>
            </root:file>
          </xsl:if>
          <!-- Подпись -->
        </xsl:if>

      </xsl:for-each>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="OLD_AddFilesDescription">
    <xsl:param name="CodeDoc"/>
    <xsl:param name="AddFilesFolder"/>
    <xsl:param name="Sign">.sig</xsl:param>
    <xsl:param name="IDDoc"/>
    <AddFiles>
      <xsl:attribute name="FolderName">
        <xsl:choose>
          <xsl:when test="$ImportTransforms='RequestOnly' and .//*[@Kind!='' and not(contains(@Name,'[%%%%%]'))]/@Name">
            <xsl:value-of select="substring-before(.//*[@Kind!='' and not(contains(@Name,'[%%%%%]'))]/@Name,'\')"/>
          </xsl:when>
          <xsl:when test="$ImportTransforms='RequestOnly' and .//Plans/Plan/@Name">
            <xsl:value-of select="substring-before(.//Plans/Plan/@Name,'\')"/>
          </xsl:when>
          <xsl:when test="$ImportTransforms='RequestOnly' and .//AppliedFile/@Name">
            <xsl:value-of select="substring-before(.//AppliedFile/@Name,'\')"/>
          </xsl:when>
          <xsl:when test="$ImportTransforms='RequestOnly' and .//Images/Image/@Name">
            <xsl:value-of select="substring-before(.//Images/Image/@Name,'\')"/>
          </xsl:when>
          <xsl:when test="$ImportTransforms='RequestOnly' and .//Plans/Plan/@File">
            <xsl:value-of select="substring-before(.//Plans/Plan/@File,'\')"/>
          </xsl:when>
          <xsl:when test="$ImportTransforms='RequestOnly' and .//AppliedFilePDF/@Name">
            <xsl:value-of select="substring-before(.//AppliedFilePDF/@Name,'\')"/>
          </xsl:when>
          <xsl:when test="$ImportTransforms='RequestOnly' and .//SchemeGeodesicPlotting/@Name">
            <xsl:value-of select="substring-before(.//SchemeGeodesicPlotting/@Name,'\')"/>
          </xsl:when>
          <xsl:when test="$ImportTransforms='RequestOnly' and .//SchemeDisposition/@Name">
            <xsl:value-of select="substring-before(.//SchemeDisposition/@Name,'\')"/>
          </xsl:when>
          <xsl:when test="$ImportTransforms='RequestOnly' and .//DiagramContour/@Name">
            <xsl:value-of select="substring-before(.//DiagramContour/@Name,'\')"/>
          </xsl:when>
          <xsl:when test="$ImportTransforms='RequestOnly' and .//Plans/Plan/@Name">
            <xsl:value-of select="substring-before(.//Plans/Plan/@Name,'\')"/>
          </xsl:when>
          <xsl:when test="$AddFilesFolder=''">
            <xsl:text>.</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$AddFilesFolder"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <xsl:if test="$ImportTransforms='RequestOnly'">
        <xsl:variable name="TempFolder">
          <xsl:value-of select="../@TempFolder"/>
        </xsl:variable>
        <xsl:for-each select=".//*[@Kind='01' and not(contains(@Name,'[%%%%%]'))] | .//AppliedFile | .//Images/Image | .//Plans/Plan |.//AppliedFilePDF|.//SchemeGeodesicPlotting|.//SchemeDisposition|.//DiagramContour">
          <xsl:variable name="Path" select="concat($TempFolder,'\',@Name,@File)" />
          <xsl:variable name="FileName" select="concat(substring-after(@Name,'\'),substring-after(@File,'\'))" />
          <AddFile>
            <xsl:attribute name="Path">
              <xsl:value-of select="$Path"/>
            </xsl:attribute>
            <xsl:attribute name="FileName">
              <xsl:value-of select="$FileName"/>
            </xsl:attribute>
          </AddFile>
          <!-- Подпись -->
          <AddFile>
            <xsl:attribute name="Path">
              <xsl:value-of select="concat($Path,$Sign)"/>
            </xsl:attribute>
            <xsl:attribute name="FileName">
              <xsl:value-of select="concat($FileName,$Sign)"/>
            </xsl:attribute>
          </AddFile>
        </xsl:for-each>
      </xsl:if>
      <xsl:for-each select="//Form[@Selected='true']/Page/*[@Selected='true']/*[not(@Selected='false')]/ParamFile[.!='' and contains(@Code,$CodeDoc)]">
        <xsl:variable name="IDFormParent">
          <xsl:if test="contains(../../../../@ParentID,'_')">
            <xsl:value-of select="substring-after(../../../../@ParentID,'_')"/>
          </xsl:if>
        </xsl:variable>
        <xsl:variable name="IDForm">
          <xsl:value-of select="../../../../@ID"/>
        </xsl:variable>
        <xsl:if test="$IDDoc='' or $IDDoc=$IDForm or $IDDoc=$IDFormParent">
          <xsl:variable name="Path" select="."/>
          <xsl:variable name="FileName">
            <xsl:call-template name="OurFilePrefix">
              <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
            </xsl:call-template>
            <xsl:value-of select="position()"/>
            <xsl:if test="@SetType!=''">
              <xsl:text>.</xsl:text>
              <xsl:value-of select="@SetType"/>
            </xsl:if>
          </xsl:variable>
          <AddFile>
            <xsl:attribute name="Path">
              <xsl:value-of select="$Path"/>
            </xsl:attribute>
            <xsl:attribute name="FileName">
              <xsl:value-of select="$FileName"/>
            </xsl:attribute>
            <!-- Технический план с приложенными файлами в режиме Доп.документы, требуется извлекать пути к приложенным файлам из xml-файла  -->
            <xsl:if test="(../../self::*[@Code='Applied_DocumentTP' and @Selected='true']) and $CodeReg='add'">
              <xsl:call-template name="AddAddFilesDescription"/>
            </xsl:if>
            <!-- Межевой план с приложенными файлами в режиме Доп.документы, требуется извлекать пути к приложенным файлам из xml-файла  -->
            <xsl:if test="(../../self::*[@Code='Applied_DocumentMP' and @Selected='true']) and $CodeReg='add'">
              <xsl:call-template name="AddAddFilesDescription"/>
            </xsl:if>
            <!-- Акт обследования с приложенными файлами в режиме Доп.документы, требуется извлекать пути к приложенным файлам из xml-файла  -->
            <xsl:if test="(../../self::*[@Code='Applied_DocumentAct' and @Selected='true']) and $CodeReg='add'">
              <Namespaces>
                <Namespace Prefix="root" URI="urn://x-artefacts-rosreestr-ru/incoming/inspection/1.0.1"/>
                <Namespace Prefix="doc" URI="urn://x-artefacts-rosreestr-ru/commons/complex-types/document/1.0.1"/>
              </Namespaces>
              <xsl:call-template name="AddAddFilesDescription"/>
            </xsl:if>
          </AddFile>

          <!-- Подпись -->
          <AddFile>
            <xsl:attribute name="Path">
              <xsl:value-of select="concat($Path,$Sign)"/>
            </xsl:attribute>
            <xsl:attribute name="FileName">
              <xsl:value-of select="concat($FileName,$Sign)"/>
            </xsl:attribute>
            <!-- Технический план с приложенными файлами в режиме Доп.документы, требуется извлекать пути к приложенным файлам из xml-файла  -->
            <xsl:if test="(../../self::*[@Code='Applied_DocumentTP' and @Selected='true']) and $CodeReg='add'">
              <!--xsl:call-template name="AddAddFilesDescription"/-->
            </xsl:if>
            <!-- Межевой план с приложенными файлами в режиме Доп.документы, требуется извлекать пути к приложенным файлам из xml-файла  -->
            <xsl:if test="(../../self::*[@Code='Applied_DocumentMP' and @Selected='true']) and $CodeReg='add'">
              <!--xsl:call-template name="AddAddFilesDescription"/-->
            </xsl:if>
            <!-- Акт обследования с приложенными файлами в режиме Доп.документы, требуется извлекать пути к приложенным файлам из xml-файла  -->
            <xsl:if test="(../../self::*[@Code='Applied_DocumentAct' and @Selected='true']) and $CodeReg='add'">
              <!--xsl:call-template name="AddAddFilesDescription"/-->
            </xsl:if>
          </AddFile>
        </xsl:if>
      </xsl:for-each>
    </AddFiles>
  </xsl:template>

  <xsl:template name="AddAddFilesDescription">
    <AddFiles>
      <xsl:attribute name="FolderName">
        <xsl:call-template name="NewGUID"/>
      </xsl:attribute>
      <!-- Старые МП и ТП -->
      <AddFile FileType="binary" MaskSign="(\.sig|)" ValueNode="//AppliedFile[not(contains(@Name,'[%%%%%]'))]/@Name" CodeDoc="docum"/>
      <AddFile FileType="binary" MaskSign="(\.sig|)" ValueNode="//Images/Image/@Name" CodeDoc="docum"/>
      <AddFile FileType="binary" MaskSign="(\.sig|)" ValueNode="//Plans/Plan/@File" CodeDoc="plan"/>
      <AddFile FileType="binary" MaskSign="(\.sig|)" ValueNode="//Plans/Plan[not(contains(@Name,'[%%%%%]'))]/@Name" CodeDoc="plan"/>
      <!-- Новые МП и ТП-->
      <AddFile ValueNode="//*[@Kind!='' and not(contains(@Name,'[%%%%%]'))]/@Name" CodeDoc="docum"/>
      <!-- Акт обследования -->
      <AddFile FileType="binary" MaskSign="(\.sig|)" ValueNode="//root:Documents/root:Document/doc:AppliedFile/@Name" CodeDoc="docum"/>
      <AddFile FileType="binary" MaskSign="(\.sig|)" ValueNode="//root2:Documents/root2:Document/doc7:AppliedFile/@Name" CodeDoc="docum"/>
    </AddFiles>
  </xsl:template>

  <xsl:template name="Images">
    <xsl:param name="CodeDoc"/>
    <xsl:param name="AddFilesFolder"/>
    <xsl:if test="ParamFile[.!='']">
      <Images>
        <xsl:for-each select="ParamFile[.!='']">
          <Image>
            <xsl:attribute name="Name">
              <xsl:call-template name="AddFileReference">
                <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
                <xsl:with-param name="AddFilesFolder" select="$AddFilesFolder"/>
              </xsl:call-template>
            </xsl:attribute>
          </Image>
        </xsl:for-each>
      </Images>
    </xsl:if>
  </xsl:template>

  <xsl:template name="XmlFiles">
    <xsl:param name="CodeDoc"/>
    <xsl:param name="type"/>
    <xsl:if test="ParamFile[.!='']">
      <AppliedFiles>
        <xsl:for-each select="ParamFile[.!='']">
          <AppliedFile>
            <xsl:attribute name="type">
              <xsl:value-of select="$type"/>
            </xsl:attribute>
            <xsl:attribute name="name">
              <xsl:call-template name="AddFileReference">
                <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
              </xsl:call-template>
            </xsl:attribute>
          </AppliedFile>
        </xsl:for-each>
      </AppliedFiles>
    </xsl:if>
  </xsl:template>

  <xsl:template name="AppliedFiles">
    <xsl:param name="CodeDoc"/>
    <xsl:param name="CodeType"/>
    <xsl:if test="ParamFile[.!='']">
      <AppliedFiles>
        <xsl:for-each select="ParamFile[.!='']">
          <AppliedFile>
            <xsl:attribute name="type">
              <xsl:value-of select="$CodeType"/>
            </xsl:attribute>
            <xsl:attribute name="name">
              <xsl:call-template name="AddFileReference">
                <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
              </xsl:call-template>
            </xsl:attribute>
          </AppliedFile>
        </xsl:for-each>
      </AppliedFiles>
    </xsl:if>
  </xsl:template>

  <xsl:template name="File">
    <xsl:param name="File"/>
    <xsl:param name="Scale" select="'true'"/>
    <xsl:param name="Horizontal" select="'false'"/>
    <xsl:param name="FormatPaper" select="'A4'"/>
    <xsl:param name="Print" select="'true'"/>
    <xsl:param name="ValueScale" select="''"/>
    <xsl:param name="ViewDraft"/>
    <xsl:if test="$Print='true' and $File!=''">
      <File>
        <xsl:attribute name="Horizontal">
          <xsl:value-of select="$Horizontal"/>
        </xsl:attribute>
        <xsl:attribute name="ViewDraft">
          <xsl:value-of select="$ViewDraft"/>
        </xsl:attribute>
        <xsl:attribute name="Scale">
          <xsl:value-of select="$Scale"/>
        </xsl:attribute>
        <xsl:attribute name="FormatPaper">
          <xsl:value-of select="$FormatPaper"/>
        </xsl:attribute>
        <xsl:attribute name="Print">
          <xsl:value-of select="$Print"/>
        </xsl:attribute>
        <xsl:attribute name="ValueScale">
          <xsl:value-of select="$ValueScale"/>
        </xsl:attribute>
        <xsl:value-of select="$File"/>
      </File>
    </xsl:if>
  </xsl:template>

  <xsl:template name="NormDate">
    <xsl:param name="Date"/>
    <xsl:if test="$Date!=''">
      <xsl:text>"</xsl:text>
      <xsl:value-of select="substring($Date,9,2)"/>
      <xsl:text>"</xsl:text>
      <xsl:choose>
        <xsl:when test="substring($Date,6,2)='01'"> января </xsl:when>
        <xsl:when test="substring($Date,6,2)='02'"> февраля </xsl:when>
        <xsl:when test="substring($Date,6,2)='03'"> марта </xsl:when>
        <xsl:when test="substring($Date,6,2)='04'"> апреля </xsl:when>
        <xsl:when test="substring($Date,6,2)='05'"> мая </xsl:when>
        <xsl:when test="substring($Date,6,2)='06'"> июня </xsl:when>
        <xsl:when test="substring($Date,6,2)='07'"> июля </xsl:when>
        <xsl:when test="substring($Date,6,2)='08'"> августа </xsl:when>
        <xsl:when test="substring($Date,6,2)='09'"> сентября </xsl:when>
        <xsl:when test="substring($Date,6,2)='10'"> октября </xsl:when>
        <xsl:when test="substring($Date,6,2)='11'"> ноября </xsl:when>
        <xsl:when test="substring($Date,6,2)='12'"> декабря </xsl:when>
      </xsl:choose>
      <xsl:value-of select="substring($Date,1,4)"/>
      <xsl:text> г. </xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template name="PrintParamList">
    <xsl:param name="paramlist"/>
    <xsl:param name="separator" select="'|'"/>
    <xsl:param name="newseparator"/>
    <xsl:param name="nonulls" select="'true'"/>
    <xsl:if test="$paramlist!=''">
      <xsl:choose>
        <xsl:when test="$nonulls='true' and substring-before($paramlist,$separator)!=''">
          <xsl:value-of select="substring-before($paramlist,$separator)"/>
          <xsl:value-of select="$newseparator"/>
        </xsl:when>
        <xsl:when test="$nonulls!='true'">
          <xsl:value-of select="substring-before($paramlist,$separator)"/>
          <xsl:value-of select="$newseparator"/>
        </xsl:when>
      </xsl:choose>
      <xsl:call-template name="PrintParamList">
        <xsl:with-param name="paramlist" select="substring-after($paramlist,$separator)"/>
        <xsl:with-param name="separator" select="$separator"/>
        <xsl:with-param name="newseparator" select="$newseparator"/>
        <xsl:with-param name="nonulls" select="$nonulls"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>

  <!-- Старые ЕГРП -->
  <!--xsl:template name="AddressCLADR_EGRP">
    <xsl:param name="CodeDoc"/>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Code_OKATO'"/>
      <xsl:with-param name="List" select="'Address'"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Code_KLADR'"/>
      <xsl:with-param name="List" select="'Address'"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Postal_Code'"/>
      <xsl:with-param name="List" select="'Address'"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Region'"/>
      <xsl:with-param name="ParamPart" select="1"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'District'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'City'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Locality'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Street'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Level1'"/>
      <xsl:with-param name="AltName" select="'House'"/>
      <xsl:with-param name="ParamPart" select="2"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Level2'"/>
      <xsl:with-param name="AltName" select="'Building'"/>
      <xsl:with-param name="ParamPart" select="2"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Level3'"/>
      <xsl:with-param name="AltName" select="'Structure'"/>
      <xsl:with-param name="ParamPart" select="2"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Apartment'"/>
      <xsl:with-param name="ParamPart" select="2"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Other'"/>
      <xsl:with-param name="List" select="'Address'"/>
    </xsl:call-template>
  </xsl:template-->

  <!-- ЕГРП, ТП02 и Кад.изменения 2 -->
  <xsl:template name="AddressCLADR">
    <xsl:param name="ListCode"/>
    <xsl:param name="ThisFileType"/>
    <xsl:param name="Soviet_Village"/>
    <xsl:param name="Urban_District"/>
    <xsl:param name="CodeDoc"/>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Code_OKATO'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Code_KLADR'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Postal_Code'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Region'"/>
      <xsl:with-param name="ParamPart" select="1"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'District'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'City'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <!--Urban_District Type="р-н" Name="String"/-->
    <xsl:if test="$Urban_District!=''">
      <Urban_District Type="р-н">
        <xsl:attribute name="Name">
          <xsl:value-of select="$Urban_District"/>
        </xsl:attribute>
      </Urban_District>
    </xsl:if>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Urban_District'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <!--Soviet_Village Type="с/с" Name="String"/-->
    <xsl:if test="$Soviet_Village!=''">
      <Soviet_Village Type="с/с">
        <xsl:attribute name="Name">
          <xsl:value-of select="$Soviet_Village"/>
        </xsl:attribute>
      </Soviet_Village>
    </xsl:if>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Soviet_Village'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Locality'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Street'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Level1'"/>
      <xsl:with-param name="Attribute1" select="'Value'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Level2'"/>
      <xsl:with-param name="Attribute1" select="'Value'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Level3'"/>
      <xsl:with-param name="Attribute1" select="'Value'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Apartment'"/>
      <xsl:with-param name="Attribute1" select="'Value'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Other'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <!--Note>String</Note-->
    <!--Name_consolidation>String</Name_consolidation-->
  </xsl:template>

  <xsl:template name="AddressCLADR_New">
    <xsl:param name="ListCode"/>
    <xsl:param name="ThisFileType"/>
    <xsl:param name="Soviet_Village"/>
    <xsl:param name="Urban_District"/>
    <xsl:param name="CodeDoc"/>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Code_OKATO'"/>
      <xsl:with-param name="AltName" select="'OKATO'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Code_KLADR'"/>
      <xsl:with-param name="AltName" select="'KLADR'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Code_OKTMO'"/>
      <xsl:with-param name="AltName" select="'OKTMO'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Postal_Code'"/>
      <xsl:with-param name="AltName" select="'PostalCode'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Region'"/>
      <xsl:with-param name="ParamPart" select="1"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'District'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'City'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:if test="$Urban_District!=''">
      <UrbanDistrict Type="р-н">
        <xsl:attribute name="Name">
          <xsl:value-of select="$Urban_District"/>
        </xsl:attribute>
      </UrbanDistrict>
    </xsl:if>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Urban_District'"/>
      <xsl:with-param name="AltName" select="'UrbanDistrict'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:if test="$Soviet_Village!=''">
      <SovietVillage Type="с/с">
        <xsl:attribute name="Name">
          <xsl:value-of select="$Soviet_Village"/>
        </xsl:attribute>
      </SovietVillage>
    </xsl:if>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Soviet_Village'"/>
      <xsl:with-param name="AltName" select="'SovietVillage'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Locality'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Street'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Level1'"/>
      <xsl:with-param name="Attribute1" select="'Value'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Level2'"/>
      <xsl:with-param name="Attribute1" select="'Value'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Level3'"/>
      <xsl:with-param name="Attribute1" select="'Value'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Apartment'"/>
      <xsl:with-param name="Attribute1" select="'Value'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Other'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="AddressCLADR_New_Begin">
    <xsl:param name="ListCode"/>
    <xsl:param name="ThisFileType"/>
    <xsl:param name="Soviet_Village"/>
    <xsl:param name="Urban_District"/>
    <xsl:param name="CodeDoc"/>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Code_OKATO'"/>
      <xsl:with-param name="AltName" select="'OKATO'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Code_KLADR'"/>
      <xsl:with-param name="AltName" select="'KLADR'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Code_OKTMO'"/>
      <xsl:with-param name="AltName" select="'OKTMO'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Postal_Code'"/>
      <xsl:with-param name="AltName" select="'PostalCode'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Region'"/>
      <xsl:with-param name="ParamPart" select="1"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'District'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'City'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:if test="$Urban_District!=''">
      <UrbanDistrict Type="р-н">
        <xsl:attribute name="Name">
          <xsl:value-of select="$Urban_District"/>
        </xsl:attribute>
      </UrbanDistrict>
    </xsl:if>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Urban_District'"/>
      <xsl:with-param name="AltName" select="'UrbanDistrict'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:if test="$Soviet_Village!=''">
      <SovietVillage Type="с/с">
        <xsl:attribute name="Name">
          <xsl:value-of select="$Soviet_Village"/>
        </xsl:attribute>
      </SovietVillage>
    </xsl:if>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Soviet_Village'"/>
      <xsl:with-param name="AltName" select="'SovietVillage'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Locality'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Street'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Level1'"/>
      <xsl:with-param name="Attribute1" select="'Value'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>


  </xsl:template>

  <xsl:template name="AddressCLADR_Linear">
    <xsl:param name="ListCode"/>
    <xsl:param name="ThisFileType"/>
    <xsl:param name="Soviet_Village"/>
    <xsl:param name="Urban_District"/>
    <xsl:param name="CodeDoc"/>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Code_OKATO'"/>
      <xsl:with-param name="AltName" select="'OKATO'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Code_KLADR'"/>
      <xsl:with-param name="AltName" select="'KLADR'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Code_OKTMO'"/>
      <xsl:with-param name="AltName" select="'OKTMO'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Postal_Code'"/>
      <xsl:with-param name="AltName" select="'PostalCode'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Region'"/>
      <xsl:with-param name="ParamPart" select="1"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'District'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'City'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:if test="$Urban_District!=''">
      <UrbanDistrict Type="р-н">
        <xsl:attribute name="Name">
          <xsl:value-of select="$Urban_District"/>
        </xsl:attribute>
      </UrbanDistrict>
    </xsl:if>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Urban_District'"/>
      <xsl:with-param name="AltName" select="'UrbanDistrict'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:if test="$Soviet_Village!=''">
      <SovietVillage Type="с/с">
        <xsl:attribute name="Name">
          <xsl:value-of select="$Soviet_Village"/>
        </xsl:attribute>
      </SovietVillage>
    </xsl:if>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Soviet_Village'"/>
      <xsl:with-param name="AltName" select="'SovietVillage'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Locality'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="Address03_Begin"
                xmlns:loc="urn://x-artefacts-rosreestr-ru/commons/complex-types/address-input/2.0.1">
    <xsl:param name="ListCode"/>
    <xsl:param name="ThisFileType"/>
    <xsl:param name="CodeDoc"/>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Code_OKATO'"/>
      <xsl:with-param name="AltName" select="'loc:OKATO'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Code_KLADR'"/>
      <xsl:with-param name="AltName" select="'loc:KLADR'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Code_OKTMO'"/>
      <xsl:with-param name="AltName" select="'loc:OKTMO'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Postal_Code'"/>
      <xsl:with-param name="AltName" select="'loc:PostalCode'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Region'"/>
      <xsl:with-param name="AltName" select="'loc:Region'"/>
      <xsl:with-param name="ParamPart" select="1"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'District'"/>
      <xsl:with-param name="AltName" select="'loc:District'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'City'"/>
      <xsl:with-param name="AltName" select="'loc:City'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:variable name="Urban_District">
      <xsl:call-template name="Value">
        <xsl:with-param name="x" select="'Urban_District'"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:if test="$Urban_District!=''">
      <loc:UrbanDistrict Type="р-н">
        <xsl:attribute name="Name">
          <xsl:value-of select="$Urban_District"/>
        </xsl:attribute>
      </loc:UrbanDistrict>
    </xsl:if>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Urban_District'"/>
      <xsl:with-param name="AltName" select="'loc:UrbanDistrict'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:variable name="Soviet_Village">
      <xsl:call-template name="Value">
        <xsl:with-param name="x" select="'Soviet_Village'"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:if test="$Soviet_Village!=''">
      <loc:SovietVillage Type="с/с">
        <xsl:attribute name="Name">
          <xsl:value-of select="$Soviet_Village"/>
        </xsl:attribute>
      </loc:SovietVillage>
    </xsl:if>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Soviet_Village'"/>
      <xsl:with-param name="AltName" select="'loc:SovietVillage'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Locality'"/>
      <xsl:with-param name="AltName" select="'loc:Locality'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template name="Address05_Begin"
    xmlns:loc3="urn://x-artefacts-rosreestr-ru/commons/complex-types/address-input/6.0.1">
    <xsl:param name="ListCode"/>
    <xsl:param name="ThisFileType"/>
    <xsl:param name="CodeDoc"/>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Code_OKATO'"/>
      <xsl:with-param name="AltName" select="'loc3:OKATO'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Code_KLADR'"/>
      <xsl:with-param name="AltName" select="'loc3:KLADR'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Code_OKTMO'"/>
      <xsl:with-param name="AltName" select="'loc3:OKTMO'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Postal_Code'"/>
      <xsl:with-param name="AltName" select="'loc3:PostalCode'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Region'"/>
      <xsl:with-param name="AltName" select="'loc3:Region'"/>
      <xsl:with-param name="ParamPart" select="1"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'District'"/>
      <xsl:with-param name="AltName" select="'loc3:District'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'City'"/>
      <xsl:with-param name="AltName" select="'loc3:City'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:variable name="Urban_District">
      <xsl:call-template name="Value">
        <xsl:with-param name="x" select="'Urban_District'"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:if test="$Urban_District!=''">
      <loc3:UrbanDistrict Type="р-н">
        <xsl:attribute name="Name">
          <xsl:value-of select="$Urban_District"/>
        </xsl:attribute>
      </loc3:UrbanDistrict>
    </xsl:if>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Urban_District'"/>
      <xsl:with-param name="AltName" select="'loc3:UrbanDistrict'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:variable name="Soviet_Village">
      <xsl:call-template name="Value">
        <xsl:with-param name="x" select="'Soviet_Village'"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:if test="$Soviet_Village!=''">
      <loc3:SovietVillage Type="с/с">
        <xsl:attribute name="Name">
          <xsl:value-of select="$Soviet_Village"/>
        </xsl:attribute>
      </loc3:SovietVillage>
    </xsl:if>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Soviet_Village'"/>
      <xsl:with-param name="AltName" select="'loc3:SovietVillage'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Locality'"/>
      <xsl:with-param name="AltName" select="'loc3:Locality'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template name="Address03_End"
    xmlns:loc="urn://x-artefacts-rosreestr-ru/commons/complex-types/address-input/2.0.1"
    >
    <xsl:param name="ListCode"/>
    <xsl:param name="ThisFileType"/>
    <xsl:param name="CodeDoc"/>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Street'"/>
      <xsl:with-param name="AltName" select="'loc:Street'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Level1'"/>
      <xsl:with-param name="AltName" select="'loc:Level1'"/>
      <xsl:with-param name="Attribute1" select="'Value'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Level2'"/>
      <xsl:with-param name="AltName" select="'loc:Level2'"/>
      <xsl:with-param name="Attribute1" select="'Value'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Level3'"/>
      <xsl:with-param name="AltName" select="'loc:Level3'"/>
      <xsl:with-param name="Attribute1" select="'Value'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Apartment'"/>
      <xsl:with-param name="AltName" select="'loc:Apartment'"/>
      <xsl:with-param name="Attribute1" select="'Value'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Other'"/>
      <xsl:with-param name="AltName" select="'loc:Other'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Note'"/>
      <xsl:with-param name="AltName" select="'loc:Note'"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template name="Address05_End"
    xmlns:loc3="urn://x-artefacts-rosreestr-ru/commons/complex-types/address-input/6.0.1"
    >
    <xsl:param name="ListCode"/>
    <xsl:param name="ThisFileType"/>
    <xsl:param name="CodeDoc"/>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Street'"/>
      <xsl:with-param name="AltName" select="'loc3:Street'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Level1'"/>
      <xsl:with-param name="AltName" select="'loc3:Level1'"/>
      <xsl:with-param name="Attribute1" select="'Value'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Level2'"/>
      <xsl:with-param name="AltName" select="'loc3:Level2'"/>
      <xsl:with-param name="Attribute1" select="'Value'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Level3'"/>
      <xsl:with-param name="AltName" select="'loc3:Level3'"/>
      <xsl:with-param name="Attribute1" select="'Value'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Apartment'"/>
      <xsl:with-param name="AltName" select="'loc3:Apartment'"/>
      <xsl:with-param name="Attribute1" select="'Value'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Other'"/>
      <xsl:with-param name="AltName" select="'loc3:Other'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Note'"/>
      <xsl:with-param name="AltName" select="'loc3:Note'"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template name="Address03_Begin4"
               xmlns:loc2="urn://x-artefacts-rosreestr-ru/commons/complex-types/address-input/4.0.1"
                >
    <xsl:param name="ListCode"/>
    <xsl:param name="ThisFileType"/>
    <xsl:param name="CodeDoc"/>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Code_OKATO'"/>
      <xsl:with-param name="AltName" select="'loc2:OKATO'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Code_KLADR'"/>
      <xsl:with-param name="AltName" select="'loc2:KLADR'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Code_OKTMO'"/>
      <xsl:with-param name="AltName" select="'loc2:OKTMO'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Postal_Code'"/>
      <xsl:with-param name="AltName" select="'loc2:PostalCode'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Region'"/>
      <xsl:with-param name="AltName" select="'loc2:Region'"/>
      <xsl:with-param name="ParamPart" select="1"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'District'"/>
      <xsl:with-param name="AltName" select="'loc2:District'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'City'"/>
      <xsl:with-param name="AltName" select="'loc2:City'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:variable name="Urban_District">
      <xsl:call-template name="Value">
        <xsl:with-param name="x" select="'Urban_District'"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:if test="$Urban_District!=''">
      <loc2:UrbanDistrict Type="р-н">
        <xsl:attribute name="Name">
          <xsl:value-of select="$Urban_District"/>
        </xsl:attribute>
      </loc2:UrbanDistrict>
    </xsl:if>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Urban_District'"/>
      <xsl:with-param name="AltName" select="'loc2:UrbanDistrict'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:variable name="Soviet_Village">
      <xsl:call-template name="Value">
        <xsl:with-param name="x" select="'Soviet_Village'"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:if test="$Soviet_Village!=''">
      <loc2:SovietVillage Type="с/с">
        <xsl:attribute name="Name">
          <xsl:value-of select="$Soviet_Village"/>
        </xsl:attribute>
      </loc2:SovietVillage>
    </xsl:if>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Soviet_Village'"/>
      <xsl:with-param name="AltName" select="'loc2:SovietVillage'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Locality'"/>
      <xsl:with-param name="AltName" select="'loc2:Locality'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template name="Address03_Begin4NWHM"
    xmlns:loc2="urn://x-artefacts-rosreestr-ru/commons/complex-types/address-input/4.0.1"
    >
    <xsl:param name="ListCode"/>
    <xsl:param name="ThisFileType"/>
    <xsl:param name="CodeDoc"/>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Code_OKATO'"/>
      <xsl:with-param name="AltName" select="'loc2:OKATO'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Code_KLADR'"/>
      <xsl:with-param name="AltName" select="'loc2:KLADR'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Code_OKTMO'"/>
      <xsl:with-param name="AltName" select="'loc2:OKTMO'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Postal_Code'"/>
      <xsl:with-param name="AltName" select="'loc2:PostalCode'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Region'"/>
      <xsl:with-param name="AltName" select="'loc2:Region'"/>
      <xsl:with-param name="ParamPart" select="1"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'District'"/>
      <xsl:with-param name="AltName" select="'loc2:District'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'City'"/>
      <xsl:with-param name="AltName" select="'loc2:City'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:variable name="Urban_District">
      <xsl:call-template name="Value">
        <xsl:with-param name="x" select="'Urban_District'"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:if test="$Urban_District!=''">
      <loc2:UrbanDistrict Type="р-н">
        <xsl:attribute name="Name">
          <xsl:value-of select="$Urban_District"/>
        </xsl:attribute>
      </loc2:UrbanDistrict>
    </xsl:if>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Urban_District'"/>
      <xsl:with-param name="AltName" select="'loc2:UrbanDistrict'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:variable name="Soviet_Village">
      <xsl:call-template name="Value">
        <xsl:with-param name="x" select="'Soviet_Village'"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:if test="$Soviet_Village!=''">
      <loc2:SovietVillage Type="с/с">
        <xsl:attribute name="Name">
          <xsl:value-of select="$Soviet_Village"/>
        </xsl:attribute>
      </loc2:SovietVillage>
    </xsl:if>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Soviet_Village'"/>
      <xsl:with-param name="AltName" select="'loc2:SovietVillage'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Locality'"/>
      <xsl:with-param name="AltName" select="'loc2:Locality'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Street'"/>
      <xsl:with-param name="AltName" select="'loc2:Street'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Level1'"/>
      <xsl:with-param name="AltName" select="'loc2:Level1'"/>
      <xsl:with-param name="Attribute1" select="'Value'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="EGRNAddress_Begin"
    xmlns:address="http://rosreestr.ru/services/v0.1/commons/Address"
    >
    <xsl:param name="ListCode"/>
    <xsl:param name="ThisFileType"/>
    <xsl:param name="CodeDoc"/>
    <!--address:fias>33000900-0000-1350-0000-000000000000</address:fias-->
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Code_FIAS'"/>
      <xsl:with-param name="AltName" select="'address:fias'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="AltValue">00000000-0000-0000-0000-000000000000</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Code_OKATO'"/>
      <xsl:with-param name="AltName" select="'address:okato'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Code_OKTMO'"/>
      <xsl:with-param name="AltName" select="'address:oktmo'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Code_KLADR'"/>
      <xsl:with-param name="AltName" select="'address:kladr'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Postal_Code'"/>
      <xsl:with-param name="AltName" select="'address:postalCode'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="EGRNAddressElement3">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Region'"/>
      <xsl:with-param name="AltName" select="'region'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="EGRNAddressElement3">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'District'"/>
      <xsl:with-param name="AltName" select="'district'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
      <xsl:with-param name="EmptyCode" select="'000'"/>
    </xsl:call-template>
    <xsl:call-template name="EGRNAddressElement3">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'City'"/>
      <xsl:with-param name="AltName" select="'city'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
      <xsl:with-param name="EmptyCode" select="'000'"/>
    </xsl:call-template>
    <xsl:variable name="Urban_District">
      <xsl:call-template name="Value">
        <xsl:with-param name="x" select="'Urban_District'"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:if test="$Urban_District!=''">
      <address:urbanDistrict>
        <address:code>000</address:code>
        <address:type>р-н</address:type>
        <address:name>
          <xsl:value-of select="$Urban_District"/>
        </address:name>
      </address:urbanDistrict>
    </xsl:if>
    <xsl:call-template name="EGRNAddressElement3">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Urban_District'"/>
      <xsl:with-param name="AltName" select="'urbanDistrict'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
      <xsl:with-param name="EmptyCode" select="'000'"/>
    </xsl:call-template>

    <xsl:variable name="Soviet_Village">
      <xsl:call-template name="Value">
        <xsl:with-param name="x" select="'Soviet_Village'"/>
      </xsl:call-template>
    </xsl:variable>
    <!--   <xsl:if test="$Soviet_Village!=''">
      <address:SovietVillage Type="с/с">
        <xsl:attribute name="Name">
          <xsl:value-of select="$Soviet_Village"/>
        </xsl:attribute>
      </address:SovietVillage>
    </xsl:if>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Soviet_Village'"/>
      <xsl:with-param name="AltName" select="'loc2:SovietVillage'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>-->
    <xsl:call-template name="EGRNAddressElement3">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Locality'"/>
      <xsl:with-param name="AltName" select="'locality'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
      <xsl:with-param name="EmptyCode" select="'000'"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template name="EGRNAddress_End"
    xmlns:address="http://rosreestr.ru/services/v0.1/commons/Address"
    >
    <xsl:param name="ListCode"/>
    <xsl:param name="ThisFileType"/>
    <xsl:param name="CodeDoc"/>
    <xsl:call-template name="EGRNAddressElement3">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Street'"/>
      <xsl:with-param name="AltName" select="'street'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
      <xsl:with-param name="EmptyCode" select="'0000'"/>
    </xsl:call-template>

    <!-- Предположение что additionalElement дом -->

    <xsl:call-template name="EGRNAddressElement3">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Level2'"/>
      <xsl:with-param name="AltName" select="'additionalElement'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
      <xsl:with-param name="EmptyCode" select="'0000'"/>
    </xsl:call-template>
    <xsl:call-template name="EGRNAddressElement3">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Level3'"/>
      <xsl:with-param name="AltName" select="'subordinateElement'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
      <xsl:with-param name="EmptyCode" select="'000'"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Level1'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="AltName" select="'address:house'"/>
      <xsl:with-param name="ParamPart" select="1"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="EGRNAddressElement3">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Apartment'"/>
      <xsl:with-param name="AltName" select="'apartment'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
      <xsl:with-param name="NoCodeElement">true</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Other'"/>
      <xsl:with-param name="AltName" select="'address:other'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Note'"/>
      <xsl:with-param name="AltName" select="'address:note'"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template name="Address03_End4"
     xmlns:loc2="urn://x-artefacts-rosreestr-ru/commons/complex-types/address-input/4.0.1"
    >
    <xsl:param name="ListCode"/>
    <xsl:param name="ThisFileType"/>
    <xsl:param name="CodeDoc"/>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Street'"/>
      <xsl:with-param name="AltName" select="'loc2:Street'"/>
      <xsl:with-param name="Attribute1" select="'Name'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Level1'"/>
      <xsl:with-param name="AltName" select="'loc2:Level1'"/>
      <xsl:with-param name="Attribute1" select="'Value'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Level2'"/>
      <xsl:with-param name="AltName" select="'loc2:Level2'"/>
      <xsl:with-param name="Attribute1" select="'Value'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Level3'"/>
      <xsl:with-param name="AltName" select="'loc2:Level3'"/>
      <xsl:with-param name="Attribute1" select="'Value'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="AddressElement">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Apartment'"/>
      <xsl:with-param name="AltName" select="'loc2:Apartment'"/>
      <xsl:with-param name="Attribute1" select="'Value'"/>
      <xsl:with-param name="Attribute2" select="'Type'"/>
      <xsl:with-param name="Separator" select="'|'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Other'"/>
      <xsl:with-param name="AltName" select="'loc2:Other'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Note'"/>
      <xsl:with-param name="AltName" select="'loc2:Note'"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template name="Address03_End4NWHM"
    xmlns:loc2="urn://x-artefacts-rosreestr-ru/commons/complex-types/address-input/4.0.1"
    >
    <xsl:param name="ListCode"/>
    <xsl:param name="ThisFileType"/>
    <xsl:param name="CodeDoc"/>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Other'"/>
      <xsl:with-param name="AltName" select="'loc2:Other'"/>
      <xsl:with-param name="List" select="'Address'"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Note'"/>
      <xsl:with-param name="AltName" select="'loc2:Note'"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template name="Address03_Center4NWHM"
    xmlns:loc2="urn://x-artefacts-rosreestr-ru/commons/complex-types/address-input/4.0.1"
    >
    <xsl:param name="ListCode"/>
    <xsl:param name="ThisFileType"/>
    <xsl:param name="CodeDoc"/>
    <xsl:variable name="Level2">
      <xsl:value-of select="*[@Code='Level2']"/>
    </xsl:variable>
    <xsl:variable name="Level2Type">
      <xsl:value-of select="*[@Code='Level2Type']/*[@Selected='true']/@Code"/>
    </xsl:variable>
    <xsl:if test="$Level2!='' and ($Level2Type!='XXX' and $Level2Type!='')">
      <loc2:Level2>
        <xsl:attribute name="Value">
          <xsl:value-of select="*[@Code='Level2']"/>
        </xsl:attribute>
        <xsl:variable name="Type">
          <xsl:value-of select="*[@Code='Level2Type']/*[@Selected='true']/@Code"/>
        </xsl:variable>
        <xsl:attribute name="Type">
          <xsl:call-template name="ConvertFromKladr">
            <xsl:with-param name="value" select="$Type"/>
            <xsl:with-param name="level" select="'Level2'"/>
            <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
          </xsl:call-template>
        </xsl:attribute>
      </loc2:Level2>
    </xsl:if>
    <xsl:variable name="Level3">
      <xsl:value-of select="*[@Code='Level3']"/>
    </xsl:variable>
    <xsl:variable name="Level3Type">
      <xsl:value-of select="*[@Code='Level3Type']/*[@Selected='true']/@Code"/>
    </xsl:variable>
    <xsl:if test="$Level3!='' and ($Level3Type!='XXX' and $Level3Type!='')">
      <loc2:Level3>
        <xsl:attribute name="Value">
          <xsl:value-of select="*[@Code='Level3']"/>
        </xsl:attribute>
        <xsl:variable name="Type">
          <xsl:value-of select="*[@Code='Level3Type']/*[@Selected='true']/@Code"/>
        </xsl:variable>
        <xsl:attribute name="Type">
          <xsl:call-template name="ConvertFromKladr">
            <xsl:with-param name="value" select="$Type"/>
            <xsl:with-param name="level" select="'Level3'"/>
            <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
          </xsl:call-template>
        </xsl:attribute>
      </loc2:Level3>
    </xsl:if>
    <xsl:variable name="Apartment">
      <xsl:value-of select="*[@Code='Apartment']"/>
    </xsl:variable>
    <xsl:variable name="ApartmentType">
      <xsl:value-of select="*[@Code='dApartmentTypeType']/*[@Selected='true']/@Code"/>
    </xsl:variable>
    <xsl:if test="$Apartment!='' and ($ApartmentType!='XXX' and $ApartmentType!='')">
      <loc2:Apartment>
        <xsl:attribute name="Value">
          <xsl:value-of select="*[@Code='Apartment']"/>
        </xsl:attribute>
        <xsl:variable name="Type">
          <xsl:value-of select="*[@Code='dApartmentTypeType']/*[@Selected='true']/@Code"/>
        </xsl:variable>
        <xsl:attribute name="Type">
          <xsl:call-template name="ConvertFromKladr">
            <xsl:with-param name="value" select="$Type"/>
            <xsl:with-param name="level" select="'Apartment'"/>
            <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
          </xsl:call-template>
        </xsl:attribute>
      </loc2:Apartment>
    </xsl:if>
  </xsl:template>
  
  <xsl:template name="EGRNHeader" xmlns:stCom="http://rosreestr.ru/services/v0.1/TStatementCommons" xmlns:docs="http://rosreestr.ru/services/v0.1/commons/Documents">
    <xsl:param name="CodeReg"/>
    <xsl:param name="CodeDoc"/>
    <xsl:param name="Cadastral"/>
    <xsl:param name="Right"/>
    <xsl:param name="FormPos"/>
    <xsl:variable name="RequestGUID" select="@SetID"/>
    <xsl:variable name="Declarant" select="Page[@Code = 'Declarants']/*[@Code = 'Declarant']/*[@Selected = 'true']/@Code"/>
    <!-- запрашиваемые документы для ЕГРП -->
    <xsl:variable name="RequestDoc">
      <xsl:value-of select=" Page[@Code = 'Request_DocumentsExr']/*[@Code = 'SubCode']/*[@Selected = 'true']/@Code"/>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="($CodeReg = 'nwz' or $CodeReg = 'nwh' or $CodeReg = 'nwhm') and $Cadastral = 'true' and $Right = 'true'">
        <stCom:actionCode>659111111111</stCom:actionCode>
        <stCom:statementType>558610100000</stCom:statementType>
      </xsl:when>
      <xsl:when test="($CodeReg = 'nwz' or $CodeReg = 'nwh'  or $CodeReg = 'nwhm') and $Cadastral = 'true' and $Right != 'true'">
        <stCom:actionCode>659211111111</stCom:actionCode>
        <stCom:statementType>558610100000</stCom:statementType>
      </xsl:when>
      <xsl:when test="$CodeReg='exz' or $CodeReg='exh' or $CodeReg='exr'">
        <stCom:actionCode>659511111112</stCom:actionCode>
        <stCom:statementType>558630200000</stCom:statementType>
      </xsl:when>
      <xsl:when test="$CodeReg='ext'">
        <stCom:actionCode>659511111112</stCom:actionCode>
        <stCom:statementType>558630400000</stCom:statementType>
      </xsl:when>
      <xsl:when test="$CodeReg='exs'">
        <stCom:actionCode>659511111112</stCom:actionCode>
        <stCom:statementType>558630200000</stCom:statementType>
      </xsl:when>
      <xsl:when test="($CodeReg = 'chz' or $CodeReg = 'chh')">
        <stCom:actionCode>
          <xsl:variable name="Role">
            <xsl:for-each select="../Form[(@Code = 'CHZPart' and *[@Code = 'SubParcels']/*[@Code = 'SubParcel']/*[@Code = 'Inv' and @Selected = 'false']) and @Selected = 'true'][1]">
              <xsl:choose>
                <xsl:when test="Page[@Code = 'SubParcels']/*[@Code = 'SubParcel']/*[@Code = 'Old' and @Selected = 'true']">ChangePart</xsl:when>
                <xsl:when test="Page[@Code = 'SubParcels']/*[@Code = 'SubParcel']/*[@Code = 'New' and @Selected = 'true']">NewPart</xsl:when>
              </xsl:choose>
            </xsl:for-each>
          </xsl:variable>
          <xsl:variable name="TypeOKS_1">
            <xsl:text>Cur_Change</xsl:text>
            <xsl:choose>
              <xsl:when test="$CodeReg = 'chz'">
                <xsl:value-of select="''"/>
              </xsl:when>
              <xsl:when test="count(//Form[(@Code = 'Linear') and @Selected = 'true']) > 0">
                <xsl:value-of select="'_L'"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:for-each select="//Form[(@Code = 'Building' or @Code = 'Construction' or @Code = 'Uncompleted' or @Code = 'Flat' or @Code = 'ParkingPlace') and @Selected = 'true'][1]">
                  <xsl:text>_</xsl:text>
                  <xsl:value-of select="substring(@Code, 1, 1)"/>
                </xsl:for-each>
                <!-- Ниже: $ImportTransforms = 'RequestOnly', первый сверху код Obj_Kind -->
                <xsl:variable name="ObjKind">
                  <xsl:value-of select="//Form[@Code = 'Request' and @Selected = 'true']/Page[@Code = 'Objects']/*[@Selected = 'true']/*[1]/ParamSelect[@Code = 'Obj_Kind']/Param[@Selected = 'true']/@Code"/>
                </xsl:variable>
                <xsl:choose>
                  <xsl:when test="$ObjKind = '002001001000'"/>
                  <xsl:when test="$ObjKind = '002001002000'">_B</xsl:when>
                  <xsl:when test="$ObjKind = '002001003000'">_F</xsl:when>
                  <xsl:when test="$ObjKind = '002001004000'">_C</xsl:when>
                  <xsl:when test="$ObjKind = '002001005000'">_U</xsl:when>
                  <xsl:when test="$ObjKind = '002001009000'">_P</xsl:when>
                </xsl:choose>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:variable>
          <xsl:variable name="CurCode">
            <xsl:value-of select="../Form[@Code = 'Request']/Page[@Code = 'CurrentChanges']/*[@Code = 'Cur_Change']/*/*[contains(@Code, $TypeOKS_1)]/*[@Selected = 'true']/@Code"/>
          </xsl:variable>
          <xsl:choose>
            <xsl:when test="$Right='true'">6591</xsl:when>
            <xsl:otherwise>6592</xsl:otherwise>
          </xsl:choose>
          <xsl:choose>
            <xsl:when test="($CodeReg='chz' or $CodeReg='chh') and ($Method='SP0' or  $MethodOKS='SP0')">
              <xsl:text>11111113</xsl:text>
            </xsl:when>
            <xsl:when test="$CodeReg='chz' and $Method='SP1'">11111115</xsl:when>
            <xsl:when test="$CodeReg='chh' and ($MethodOKS='SP1' or $MethodOKS='')">11111115</xsl:when>
          </xsl:choose>
          <!--xsl:choose>
         <xsl:when test="count(//Form[@Code='Request']/*[@Code='CurrentChanges']/*[@Code='Cur_Change']/*)>1">659211111100</xsl:when>
         <xsl:when test="$Role='NewPart'">659211111113</xsl:when>
         <xsl:when test="$Role='ChangePart'">659211111113</xsl:when>
         <xsl:when test="count(//Form[@Code='Request']/*[@Code='CurrentChanges']/*[@Code='Cur_Change_Liq']/*/*[@Code='Number']/*)>0">659211111114</xsl:when>
         <xsl:when test="$CodeReg='chz'">659211111115</xsl:when>
       </xsl:choose-->
        </stCom:actionCode>

        <stCom:statementType>558610100000</stCom:statementType>
      </xsl:when>
      <xsl:when test="$CodeReg = 'sth'">
        <stCom:actionCode>
          <xsl:choose>
            <xsl:when test="$Right='true'">659111111112</xsl:when>
            <xsl:otherwise>659211111112</xsl:otherwise>
          </xsl:choose>
        </stCom:actionCode>
        <stCom:statementType>558610400000</stCom:statementType>
      </xsl:when>
      <xsl:when test="$CodeReg = 'add'">
        <stCom:actionCode>659411111120</stCom:actionCode>
        <stCom:statementType>558610800000</stCom:statementType>
      </xsl:when>
      <xsl:when test="$CodeReg = 'cor'">
        <stCom:actionCode>659411111113</stCom:actionCode>
        <stCom:statementType>558620400000</stCom:statementType>
      </xsl:when>
      <xsl:when test="$CodeReg='nwr'">
        <xsl:variable name="TypeReg" select="Page[@Code = 'Declarants']/*[@Code = 'ReqType']/*[@Selected = 'true']/@Code"/>
        <xsl:variable name="TypeChangeAction" >
          <xsl:for-each select="Page[@Code = 'Declarants']/*[@Code = 'Change']/*[1]">
            <xsl:call-template name="Value">
              <xsl:with-param name="x" select="'TypeAction'"/>
            </xsl:call-template>
          </xsl:for-each>
        </xsl:variable>
        <xsl:choose>
          <xsl:when test="$TypeReg='111100001000'">
            <stCom:actionCode>659311111111</stCom:actionCode>
            <stCom:statementType>558610100000</stCom:statementType>
          </xsl:when>
          <xsl:when test="$TypeReg='111100002000'">
            <stCom:actionCode>659311111111</stCom:actionCode>
            <stCom:statementType>558610100000</stCom:statementType>
          </xsl:when>
          <xsl:when test="$TypeReg='111100003000'">
            <stCom:actionCode>659311111113</stCom:actionCode>
            <stCom:statementType>558610100000</stCom:statementType>
          </xsl:when>
          <xsl:when test="$TypeReg='111100004000'">
            <stCom:actionCode>659311111112</stCom:actionCode>
            <stCom:statementType>558610400000</stCom:statementType>
          </xsl:when>
          <xsl:when test="$TypeReg='111100005000'">
            <stCom:actionCode>659311111114</stCom:actionCode>
            <stCom:statementType>558610100000</stCom:statementType>
          </xsl:when>
          <xsl:when test="$TypeReg='111100006000'">
            <stCom:actionCode>659311111114</stCom:actionCode>
            <stCom:statementType>558610100000</stCom:statementType>
          </xsl:when>
          <xsl:when test="$TypeReg='111100007000'">
            <stCom:actionCode>659311111114</stCom:actionCode>
            <stCom:statementType>558610100000</stCom:statementType>
          </xsl:when>
          <xsl:when test="$TypeReg='111100008000'">
            <stCom:actionCode>659311111116</stCom:actionCode>
            <stCom:statementType>558610400000</stCom:statementType>
          </xsl:when>
          <xsl:when test="$TypeReg='659311111116'">
            <stCom:actionCode>659311111116</stCom:actionCode>
            <stCom:statementType>558610500000</stCom:statementType>
          </xsl:when>
          <xsl:when test="$TypeReg='659411111112'">
            <stCom:actionCode>659411111112</stCom:actionCode>
            <stCom:statementType>
              <xsl:choose>
                <xsl:when test="$TypeChangeAction='559010215000'">558620100000</xsl:when>
                <xsl:when test="$TypeChangeAction='559010216000'">558620100000</xsl:when>
                <xsl:when test="$TypeChangeAction='559010217000'">558620100000</xsl:when>
                <xsl:when test="$TypeChangeAction='559010218000'">558620100000</xsl:when>
                <xsl:when test="$TypeChangeAction='559010219000'">558620100000</xsl:when>
                <xsl:when test="$TypeChangeAction='559010220000'">558620200000</xsl:when>
                <xsl:when test="$TypeChangeAction='559010221000'">558620200000</xsl:when>
                <xsl:when test="$TypeChangeAction='559010222000'">558620300000</xsl:when>
                <xsl:when test="$TypeChangeAction='559010223000'">558620300000</xsl:when>
                <xsl:when test="$TypeChangeAction='559010224000'">558620100000</xsl:when>
                <xsl:when test="$TypeChangeAction='559010225000'">558620700000</xsl:when>
                <xsl:when test="$TypeChangeAction='559010226000'">558620100000</xsl:when>
              </xsl:choose>
            </stCom:statementType>
          </xsl:when>
        </xsl:choose>
      </xsl:when>
    </xsl:choose>
    <stCom:creationDate>
      <xsl:value-of select="$Date"/>
      <xsl:text>T</xsl:text>
      <xsl:value-of select="$Time"/>
    </stCom:creationDate>
    <xsl:if test="$CodeReg = 'nwz' or $CodeReg = 'chz'">
      <stCom:appliedDocument>
        <docs:mapPlanDocument _id="1">
          <docs:documentTypes>
            <docs:documentTypeCode>558203000000</docs:documentTypeCode>
          </docs:documentTypes>
          <docs:name>Межевой план</docs:name>
          <docs:number>1</docs:number>
          <docs:issueDate>2001-01-01</docs:issueDate>
          <docs:attachment>
            <docs:desc>Межевой план земельного участка</docs:desc>
            <docs:fileDesc>
              <docs:file>
                <docs:fileURI>
                  <xsl:text>embedded://</xsl:text>
                  <xsl:call-template name="XmlFileName">
                    <xsl:with-param name="CodeDoc" select="'MP'"/>
                    <xsl:with-param name="FileID" select="Page[@Code = 'Register']/@SetID"/>
                    <xsl:with-param name="FileExtention" select="'zip'"/>
                  </xsl:call-template>
                </docs:fileURI>
                <docs:md5sum>md5sum4</docs:md5sum>
              </docs:file>
            </docs:fileDesc>
            <docs:receivedInPaper>
              <docs:original>
                <docs:pageCount>1</docs:pageCount>
                <docs:docCount>1</docs:docCount>
              </docs:original>
            </docs:receivedInPaper>
          </docs:attachment>
        </docs:mapPlanDocument>
      </stCom:appliedDocument>
    </xsl:if>
    <xsl:if test="$CodeReg = 'nwh' or $CodeReg = 'nwhm' or $CodeReg = 'chh'">
      <stCom:appliedDocument>
        <docs:mapPlanDocument _id="1">
          <docs:documentTypes>
            <docs:documentTypeCode>558211010000</docs:documentTypeCode>
          </docs:documentTypes>
          <docs:name>Технический план</docs:name>
          <docs:number>1</docs:number>
          <docs:issueDate>2001-01-01</docs:issueDate>
          <docs:attachment>
            <docs:desc>
              <xsl:text>Технический план </xsl:text>
              <xsl:choose>
                <xsl:when test="@Code = 'Building'">здания</xsl:when>
                <xsl:when test="@Code = 'Construction'">сооружения</xsl:when>
                <xsl:when test="@Code = 'Uncompleted'">объекта незавершенного строительства</xsl:when>
                <xsl:when test="@Code = 'Flat'">помещения</xsl:when>
              </xsl:choose>
            </docs:desc>
            <docs:fileDesc>
              <docs:file>
                <docs:fileURI>
                  <xsl:text>embedded://</xsl:text>
                  <xsl:call-template name="XmlFileName">
                    <xsl:with-param name="CodeDoc" select="'TP'"/>
                    <xsl:with-param name="FileID" select="Page[@Code = 'Register']/@SetID"/>
                    <xsl:with-param name="FileExtention" select="'zip'"/>
                  </xsl:call-template>
                </docs:fileURI>
                <docs:md5sum>md5sum4</docs:md5sum>
              </docs:file>
            </docs:fileDesc>
            <docs:receivedInPaper>
              <docs:original>
                <docs:pageCount>1</docs:pageCount>
                <docs:docCount>1</docs:docCount>
              </docs:original>
            </docs:receivedInPaper>
          </docs:attachment>
          <docs:issuer>
            <docs:name>
              <xsl:value-of select="$FIO1"/>
              <xsl:text> </xsl:text>
              <xsl:value-of select="$FIO2"/>
              <xsl:text> </xsl:text>
              <xsl:value-of select="$FIO3"/>
            </docs:name>
          </docs:issuer>
        </docs:mapPlanDocument>
      </stCom:appliedDocument>
    </xsl:if>
    <xsl:if test="$CodeReg = 'sth'">
      <stCom:appliedDocument>
        <docs:mapPlanDocument _id="1">
          <docs:documentTypes>
            <docs:documentTypeCode>558219000000</docs:documentTypeCode>
          </docs:documentTypes>
          <docs:name>Акт обследования</docs:name>
          <docs:number>1</docs:number>
          <docs:issueDate>2001-01-01</docs:issueDate>
          <docs:attachment>
            <docs:desc>Акт обследования, подтверждающий прекращение существования объекта недвижимости</docs:desc>
            <docs:fileDesc>
              <docs:file>
                <docs:fileURI>
                  <xsl:text>embedded://</xsl:text>
                  <xsl:call-template name="XmlFileName">
                    <xsl:with-param name="CodeDoc" select="'act'"/>
                    <xsl:with-param name="FileID" select="Page[@Code = 'Declarants']/@SetID"/>
                    <xsl:with-param name="FileExtention" select="'zip'"/>
                  </xsl:call-template>
                </docs:fileURI>
                <docs:md5sum>md5sum4</docs:md5sum>
              </docs:file>
              <docs:signature>
                <docs:fileURI>
                  <xsl:text>embedded://</xsl:text>
                  <xsl:call-template name="XmlFileName">
                    <xsl:with-param name="CodeDoc" select="'act'"/>
                    <xsl:with-param name="FileID" select="Page[@Code = 'Declarants']/@SetID"/>
                    <xsl:with-param name="FileExtention" select="'zip'"/>
                  </xsl:call-template>
                  <xsl:text>.sig</xsl:text>
                </docs:fileURI>
                <docs:md5sum>md5sum5</docs:md5sum>
              </docs:signature>
            </docs:fileDesc>
            <docs:receivedInPaper>
              <docs:original>
                <docs:pageCount>1</docs:pageCount>
                <docs:docCount>1</docs:docCount>
              </docs:original>
            </docs:receivedInPaper>
          </docs:attachment>
        </docs:mapPlanDocument>
      </stCom:appliedDocument>
    </xsl:if>
    <xsl:if test="Page[@Code = 'Applied_Documents']/*[(@Code = 'Applied_Document' or @Code = 'Applied_DocumentMP' or @Code = 'Applied_DocumentTP' or @Code = 'Applied_DocumentAct') and @Selected = 'true']">
      <xsl:for-each select="Page[@Code = 'Applied_Documents']/*[(@Code = 'Applied_Document' or @Code = 'Applied_DocumentMP' or @Code = 'Applied_DocumentTP' or @Code = 'Applied_DocumentAct') and @Selected = 'true']">
        <xsl:variable name="Code" select="@Code"/>
        <xsl:for-each select="*">
          <stCom:appliedDocument>
            <xsl:variable name="TestAD0">
              <xsl:call-template name="Value">
                <xsl:with-param name="x" select="'Name'"/>
                <xsl:with-param name="list" select="'NameDocument'"/>
              </xsl:call-template>
            </xsl:variable>
            <xsl:variable name="TestAD1">
              <xsl:call-template name="Value">
                <xsl:with-param name="x" select="'Kind'"/>
              </xsl:call-template>
            </xsl:variable>
            <xsl:variable name="DocElementName">
              <xsl:call-template name="EGRNDocNameFromCode">
                <xsl:with-param name="Code" select="$TestAD1"/>
              </xsl:call-template>
            </xsl:variable>
            <xsl:element name="docs:{$DocElementName}">
              <xsl:attribute name="_id">
                <xsl:value-of select="*[@Code = 'Kind']/@SetID"/>
              </xsl:attribute>
              <docs:documentTypes>
                <docs:documentTypeCode>
                  <xsl:value-of select="$TestAD1"/>
                </docs:documentTypeCode>
              </docs:documentTypes>
              <xsl:variable name="TestAD2">
                <xsl:choose>
                  <xsl:when test="$TestAD0 = ''">
                    <xsl:call-template name="Dicts">
                      <xsl:with-param name="dict">
                        <xsl:call-template name="dReg_Doc_Type"/>
                      </xsl:with-param>
                      <xsl:with-param name="code">
                        <xsl:value-of select="$TestAD1"/>
                      </xsl:with-param>
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="$TestAD0"/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:variable>
              <docs:name>
                <xsl:value-of select="$TestAD0"/>
              </docs:name>
              <xsl:variable name="TestNumber">
                <xsl:call-template name="Value">
                  <xsl:with-param name="x" select="'Number'"/>
                </xsl:call-template>
              </xsl:variable>
              <docs:number>
                <xsl:choose>
                  <xsl:when test="$TestNumber != ''">
                    <xsl:value-of select="$TestNumber"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:text>1</xsl:text>
                  </xsl:otherwise>
                </xsl:choose>
              </docs:number>
              <docs:issueDate>
                <xsl:variable name="TestDate">
                  <xsl:choose>
                    <xsl:when test="$Code = 'Applied_Document'">
                      <xsl:call-template name="Value">
                        <xsl:with-param name="x" select="'Date'"/>
                      </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="$Code = 'Applied_DocumentMP'">
                      <xsl:value-of select="//Form[@Code = 'MP']/Page/*[@Code = 'CustomerDate']/*/*[@Code = 'Date']"/>
                    </xsl:when>
                    <xsl:when test="$Code = 'Applied_DocumentTP'">
                      <xsl:value-of select="//Form[@Code = $CodeDoc]/Page/*[@Code = 'ContractorDate']/*/*[@Code = 'Date']"/>
                    </xsl:when>
                  </xsl:choose>
                </xsl:variable>
                <xsl:choose>
                  <xsl:when test="$TestDate != ''">
                    <xsl:value-of select="$TestDate"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="$Date"/>
                  </xsl:otherwise>
                </xsl:choose>
              </docs:issueDate>
              <xsl:variable name="TestAD4">
                <xsl:call-template name="Value">
                  <xsl:with-param name="x" select="'Pages0'"/>
                </xsl:call-template>
              </xsl:variable>
              <xsl:variable name="TestAD5">
                <xsl:choose>
                  <xsl:when test="$TestAD4 != ''">
                    <xsl:value-of select="$TestAD4"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:call-template name="Value">
                      <xsl:with-param name="x" select="'Pages'"/>
                    </xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:variable>
              <xsl:if test="ParamFile!=''">
                <xsl:variable name="CodeDocApp">
                  <xsl:choose>
                    <xsl:when test="$Code='Applied_Document'">Request</xsl:when>
                    <xsl:when test="$Code='Applied_DocumentMP'">MP</xsl:when>
                    <xsl:when test="$Code='Applied_DocumentTP'">TP</xsl:when>
                    <xsl:when test="$Code='Applied_DocumentAct'">Act</xsl:when>
                  </xsl:choose>
                </xsl:variable>
                <xsl:for-each select="ParamFile">
                  <docs:attachment>
                    <docs:desc>
                      <xsl:value-of select="$TestAD0"/>
                    </docs:desc>
                    <docs:fileDesc>
                      <docs:file>
                        <docs:fileURI>
                          <xsl:text>embedded://</xsl:text>
                          <xsl:call-template name="AddFileReference">
                            <xsl:with-param name="CodeDoc" select="$CodeDocApp"/>
                            <!--xsl:with-param name="AddFilesFolder" select="$RequestGUID"/-->
                          </xsl:call-template>
                        </docs:fileURI>
                        <docs:md5sum>md5sum4</docs:md5sum>
                      </docs:file>
                      <docs:signature>
                        <docs:fileURI>
                          <xsl:text>embedded://</xsl:text>
                          <xsl:call-template name="AddFileReference">
                            <xsl:with-param name="CodeDoc" select="$CodeDocApp"/>
                            <!--xsl:with-param name="AddFilesFolder" select="$RequestGUID"/-->
                          </xsl:call-template>
                          <xsl:text>.sig</xsl:text>
                        </docs:fileURI>
                        <docs:md5sum>md5sum5</docs:md5sum>
                      </docs:signature>
                    </docs:fileDesc>
                    <docs:receivedInPaper>
                      <docs:original>
                        <docs:pageCount>
                          <xsl:choose>
                            <xsl:when test="$TestAD5 != ''">
                              <xsl:value-of select="$TestAD5"/>
                            </xsl:when>
                            <xsl:otherwise>1</xsl:otherwise>
                          </xsl:choose>
                        </docs:pageCount>
                        <docs:docCount>1</docs:docCount>
                      </docs:original>
                    </docs:receivedInPaper>
                  </docs:attachment>
                </xsl:for-each>
              </xsl:if>
              <docs:issuer>
                <docs:name>
                  <xsl:choose>
                    <xsl:when test="$Code = 'Applied_Document'">
                      <xsl:call-template name="Value">
                        <xsl:with-param name="x" select="'IssueOrgan'"/>
                        <xsl:with-param name="list" select="'IssueOrgan'"/>
                      </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="$Code = 'Applied_DocumentMP' or $Code = 'Applied_DocumentTP'">
                      <xsl:choose>
                        <xsl:when test="//Form[@Code = 'MP']/Page[@Code = 'Customer']/*[@Code = 'Contractor']/*[not(@Code = 'M') and @Selected = 'true']">
                          <xsl:for-each select="//Form[@Code = 'MP']/Page[@Code = 'Customer']/*[@Code = 'Contractor']/*[@Selected = 'true']">
                            <xsl:variable name="ListC" select="@Code"/>
                            <xsl:variable name="ListN">
                              <xsl:choose>
                                <xsl:when test="@Code = 'J'">Organization</xsl:when>
                                <xsl:when test="@Code = 'F'">Person</xsl:when>
                              </xsl:choose>
                            </xsl:variable>
                            <xsl:call-template name="Value">
                              <xsl:with-param name="x" select="'FIO1'"/>
                              <xsl:with-param name="list" select="$ListN"/>
                              <xsl:with-param name="ListCode" select="$ListC"/>
                            </xsl:call-template>
                            <xsl:text> </xsl:text>
                            <xsl:call-template name="Value">
                              <xsl:with-param name="x" select="'FIO2'"/>
                              <xsl:with-param name="list" select="$ListN"/>
                              <xsl:with-param name="ListCode" select="$ListC"/>
                            </xsl:call-template>
                            <xsl:text> </xsl:text>
                            <xsl:call-template name="Value">
                              <xsl:with-param name="x" select="'FIO3'"/>
                              <xsl:with-param name="list" select="$ListN"/>
                              <xsl:with-param name="ListCode" select="$ListC"/>
                            </xsl:call-template>
                          </xsl:for-each>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:value-of select="$FIO1"/>
                          <xsl:text> </xsl:text>
                          <xsl:value-of select="$FIO2"/>
                          <xsl:text> </xsl:text>
                          <xsl:value-of select="$FIO3"/>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:when>
                  </xsl:choose>
                </docs:name>
              </docs:issuer>
            </xsl:element>
          </stCom:appliedDocument>
        </xsl:for-each>
      </xsl:for-each>
    </xsl:if>
    <xsl:if test="$Declarant = 'F' or $Declarant = 'J'">
      <xsl:for-each select="Page[@Code = 'Declarants']/*[@Code = 'Declarant']/*[(@Code = 'F' or @Code = 'J') and @Selected = 'true']">
        <xsl:variable name="ListName">
          <xsl:choose>
            <xsl:when test="@Code = 'F'">Person</xsl:when>
            <xsl:otherwise>Organization</xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <stCom:appliedDocument>
          <xsl:variable name="TestAD1">
            <xsl:call-template name="Value">
              <xsl:with-param name="x" select="'Type_Document'"/>
              <xsl:with-param name="list" select="$ListName"/>
            </xsl:call-template>
          </xsl:variable>
          <xsl:variable name="DocElementName">
            <xsl:call-template name="EGRNDocNameFromCode">
              <xsl:with-param name="Code" select="$TestAD1"/>
            </xsl:call-template>
          </xsl:variable>
          <xsl:element name="docs:{$DocElementName}">
            <xsl:attribute name="_id">901</xsl:attribute>
            <docs:documentTypes>
              <docs:documentTypeCode>
                <xsl:value-of select="$TestAD1"/>
              </docs:documentTypeCode>
            </docs:documentTypes>

            <docs:name>
              <xsl:call-template name="Dicts">
                <xsl:with-param name="dict">
                  <xsl:call-template name="dAllDocuments"/>
                </xsl:with-param>
                <xsl:with-param name="code">
                  <xsl:value-of select="$TestAD1"/>
                </xsl:with-param>
              </xsl:call-template>
            </docs:name>

            <docs:number>
              <xsl:call-template name="Value">
                <xsl:with-param name="x" select="'Number'"/>
                <xsl:with-param name="list" select="$ListName"/>
              </xsl:call-template>
            </docs:number>
            <docs:issueDate>
              <xsl:call-template name="Value">
                <xsl:with-param name="x" select="'Date'"/>
                <xsl:with-param name="list" select="$ListName"/>
              </xsl:call-template>
            </docs:issueDate>
            <xsl:variable name="Series">
              <xsl:call-template name="Value">
                <xsl:with-param name="x" select="'Series'"/>
                <xsl:with-param name="list" select="$ListName"/>
              </xsl:call-template>
            </xsl:variable>
            <xsl:if test="$Series != ''">
              <docs:series>
                <xsl:value-of select="$Series"/>
              </docs:series>
            </xsl:if>
            <docs:issuer>
              <docs:name>
                <xsl:call-template name="Value">
                  <xsl:with-param name="x" select="'IssueOrgan'"/>
                  <xsl:with-param name="list" select="$ListName"/>
                </xsl:call-template>
              </docs:name>
            </docs:issuer>
          </xsl:element>
        </stCom:appliedDocument>
      </xsl:for-each>
    </xsl:if>
    <xsl:if test="$Declarant = 'M'">

      <xsl:if test="$Type_Document != ''">
        <stCom:appliedDocument>
          <xsl:variable name="TestAD1">
            <xsl:value-of select="$Type_Document"/>
          </xsl:variable>
          <xsl:variable name="DocElementName">
            <xsl:call-template name="EGRNDocNameFromCode">
              <xsl:with-param name="Code" select="$TestAD1"/>
            </xsl:call-template>
          </xsl:variable>
          <xsl:element name="docs:{$DocElementName}">
            <xsl:attribute name="_id">901</xsl:attribute>
            <docs:documentTypes>
              <docs:documentTypeCode>
                <xsl:value-of select="$TestAD1"/>
              </docs:documentTypeCode>
            </docs:documentTypes>
            <xsl:variable name="TestAD2">
              <xsl:call-template name="Dicts">
                <xsl:with-param name="dict">
                  <xsl:call-template name="dAllDocuments"/>
                </xsl:with-param>
                <xsl:with-param name="code">
                  <xsl:value-of select="$TestAD1"/>
                </xsl:with-param>
              </xsl:call-template>
            </xsl:variable>
            <xsl:if test="$TestAD2 != ''">
              <docs:name>
                <xsl:value-of select="$TestAD2"/>
              </docs:name>
            </xsl:if>
            <docs:number>
              <xsl:value-of select="$DocNumber"/>
            </docs:number>
            <xsl:if test="$DocDate">
              <docs:issueDate>
                <xsl:value-of select="$DocDate"/>
              </docs:issueDate>
            </xsl:if>
            <xsl:if test="$DocSeries != ''">
              <docs:series>
                <xsl:value-of select="$DocSeries"/>
              </docs:series>
            </xsl:if>
            <xsl:if test="$DocIssueOrgan != ''">
              <docs:issuer>
                <docs:name>
                  <xsl:value-of select="$DocIssueOrgan"/>
                </docs:name>
              </docs:issuer>
            </xsl:if>
          </xsl:element>
        </stCom:appliedDocument>
      </xsl:if>

    </xsl:if>
    <xsl:if test="$JFSender = 'J' and $Declarant = 'M'">
      <xsl:for-each select="Page[@Code = 'Declarants']/*[@Code = 'Declarant']/*[@Code = $Declarant]">
        <xsl:variable name="LetterNumberReal">
          <xsl:choose>
            <xsl:when test="$Declarant = 'M'">
              <xsl:value-of select="$LetterNumber"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:call-template name="Value">
                <xsl:with-param name="x" select="'LetterNumber'"/>
              </xsl:call-template>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <xsl:variable name="LetterFileReal">
          <xsl:choose>
            <xsl:when test="$Declarant = 'M'">
              <xsl:value-of select="$LetterFile"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:call-template name="Value">
                <xsl:with-param name="x" select="'Request'"/>
              </xsl:call-template>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <xsl:variable name="TestAD1">
          <xsl:choose>
            <xsl:when test="$Declarant = 'M'">
              <xsl:value-of select="$LetterDate1"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:call-template name="Value">
                <xsl:with-param name="x" select="'LetterDate1'"/>
              </xsl:call-template>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <xsl:variable name="TestAD2">
          <xsl:choose>
            <xsl:when test="$Declarant = 'M'">
              <xsl:value-of select="$LetterDate2"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:call-template name="Value">
                <xsl:with-param name="x" select="'LetterDate2'"/>
              </xsl:call-template>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <xsl:variable name="TestIssueOrgan">
          <xsl:choose>
            <xsl:when test="$Declarant = 'M'">
              <xsl:value-of select="$Organization"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:call-template name="Value">
                <xsl:with-param name="x" select="'Organization'"/>
              </xsl:call-template>
              <xsl:call-template name="Value">
                <xsl:with-param name="x" select="'FIO1'"/>
              </xsl:call-template>
              <xsl:text> </xsl:text>
              <xsl:call-template name="Value">
                <xsl:with-param name="x" select="'FIO2'"/>
              </xsl:call-template>
              <xsl:text> </xsl:text>
              <xsl:call-template name="Value">
                <xsl:with-param name="x" select="'FIO3'"/>
              </xsl:call-template>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <xsl:if test="$LetterNumberReal != '' or $LetterFileReal != ''">
          <stCom:appliedDocument>
            <docs:powerOfAttorney _id="903">
              <docs:documentTypes>
                <docs:documentTypeCode>558301010000</docs:documentTypeCode>
              </docs:documentTypes>
              <!-- docs:representativeDocTypeCode -->
              <docs:name>Доверенность</docs:name>
              <docs:number>
                <xsl:value-of select="$LetterNumberReal"/>
              </docs:number>
              <docs:issueDate>
                <xsl:choose>
                  <xsl:when test="$LetterDate1 != ''">
                    <xsl:value-of select="$LetterDate1"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="$Date"/>
                  </xsl:otherwise>
                </xsl:choose>
              </docs:issueDate>
              <docs:attachment>
                <docs:desc>Доверенность</docs:desc>
                <xsl:if test="$LetterFileReal!=''">
                  <docs:fileDesc>
                    <docs:file>
                      <docs:fileURI>
                        <xsl:text>embedded://</xsl:text>
                        <xsl:if test="$Declarant != 'M'">
                          <xsl:for-each select="ParamFile">
                            <xsl:call-template name="AddFileReference">
                              <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
                              <!--xsl:with-param name="AddFilesFolder" select="$RequestGUID"/-->
                            </xsl:call-template>
                          </xsl:for-each>
                        </xsl:if>
                        <xsl:if test="$Declarant = 'M'">
                          <xsl:for-each select="//Form[@Code = 'Info']/Page[@Code = 'Info']/*/*[not(@Selected = 'false')]/ParamFile">
                            <xsl:call-template name="AddFileReference">
                              <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
                              <!--xsl:with-param name="AddFilesFolder" select="$RequestGUID"/-->
                            </xsl:call-template>
                          </xsl:for-each>

                        </xsl:if>
                      </docs:fileURI>
                      <docs:md5sum>md5sum4</docs:md5sum>
                    </docs:file>
                    <docs:signature>
                      <docs:fileURI>
                        <xsl:text>embedded://</xsl:text>
                        <xsl:if test="$Declarant != 'M'">
                          <xsl:call-template name="AddFileReference">
                            <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
                            <!--xsl:with-param name="AddFilesFolder" select="$RequestGUID"/-->
                          </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="$Declarant = 'M'">
                          <xsl:for-each select="//Form[@Code = 'Info']/Page[@Code = 'Info']/*/*[not(@Selected = 'false')]/ParamFile">
                            <xsl:call-template name="AddFileReference">
                              <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
                              <!--xsl:with-param name="AddFilesFolder" select="$RequestGUID"/-->
                            </xsl:call-template>
                          </xsl:for-each>

                        </xsl:if>
                        <xsl:text>.sig</xsl:text>
                      </docs:fileURI>
                      <docs:md5sum>md5sum5</docs:md5sum>
                    </docs:signature>
                  </docs:fileDesc>
                </xsl:if>
                <docs:receivedInPaper>
                  <docs:original>
                    <docs:pageCount>1</docs:pageCount>
                    <docs:docCount>1</docs:docCount>
                  </docs:original>
                </docs:receivedInPaper>
              </docs:attachment>
              <xsl:if test="$TestAD1 != '' and $TestAD2 != ''">
                <xsl:if test="$TestAD1 != ''">
                  <docs:durationStart>
                    <xsl:value-of select="$TestAD1"/>
                  </docs:durationStart>
                </xsl:if>
                <xsl:if test="$TestAD2 != ''">
                  <docs:durationStop>
                    <xsl:value-of select="$TestAD2"/>
                  </docs:durationStop>
                </xsl:if>
              </xsl:if>
            </docs:powerOfAttorney>
          </stCom:appliedDocument>
        </xsl:if>
      </xsl:for-each>
    </xsl:if>
    <xsl:if test="$CodeReg='exr' and ($RequestDoc='558403040000' or $RequestDoc='558403050000')">
      <xsl:for-each select="Page[@Code = 'SubjectsExr']/*[@Code = 'Document']/*">
        <xsl:variable name="Type_Document1">
          <xsl:call-template name="Value">
            <xsl:with-param name="x" select="'Code_Document'"/>
          </xsl:call-template>
        </xsl:variable>
        <xsl:if test="$Type_Document1 != ''">
          <stCom:appliedDocument>
            <xsl:variable name="TestAD1">
              <xsl:value-of select="$Type_Document1"/>
            </xsl:variable>
            <xsl:variable name="DocElementName">
              <xsl:call-template name="EGRNDocNameFromCode">
                <xsl:with-param name="Code" select="$TestAD1"/>
              </xsl:call-template>
            </xsl:variable>
            <xsl:element name="docs:{$DocElementName}">
              <xsl:attribute name="_id">
                <xsl:value-of select="*[@Code='Code_Document']/@SetID"/>
              </xsl:attribute>
              <docs:documentTypes>
                <docs:documentTypeCode>
                  <xsl:value-of select="$TestAD1"/>
                </docs:documentTypeCode>
              </docs:documentTypes>
              <xsl:variable name="TestAD2_1">
                <xsl:call-template name="Value">
                  <xsl:with-param name="x" select="'Name'"/>
                </xsl:call-template>
              </xsl:variable>
              <xsl:variable name="TestAD2">
                <xsl:call-template name="Dicts">
                  <xsl:with-param name="dict">
                    <xsl:call-template name="dAllDocuments"/>
                  </xsl:with-param>
                  <xsl:with-param name="code">
                    <xsl:value-of select="$TestAD1"/>
                  </xsl:with-param>
                </xsl:call-template>
              </xsl:variable>
              <xsl:choose>
                <xsl:when test="$TestAD2_1!=''">
                  <docs:name>
                    <xsl:value-of select="$TestAD2_1"/>
                  </docs:name>
                </xsl:when>
                <xsl:when test="$TestAD2!=''">
                  <docs:name>
                    <xsl:value-of select="$TestAD2"/>
                  </docs:name>
                </xsl:when>
              </xsl:choose>
              <xsl:call-template name="EO">
                <xsl:with-param name="Page" select="'-'"/>
                <xsl:with-param name="Section" select="'-'"/>
                <xsl:with-param name="Param" select="'Number'"/>
                <xsl:with-param name="AltName" select="'docs:number'"/>
              </xsl:call-template>
              <xsl:call-template name="EN">
                <xsl:with-param name="Page" select="'-'"/>
                <xsl:with-param name="Section" select="'-'"/>
                <xsl:with-param name="Param" select="'Date'"/>
                <xsl:with-param name="AltName" select="'docs:issueDate'"/>
              </xsl:call-template>
              <xsl:call-template name="EN">
                <xsl:with-param name="Page" select="'-'"/>
                <xsl:with-param name="Section" select="'-'"/>
                <xsl:with-param name="Param" select="'Series'"/>
                <xsl:with-param name="AltName" select="'docs:series'"/>
              </xsl:call-template>
              <xsl:variable name="Issuer">
                <xsl:call-template name="Value">
                  <xsl:with-param name="x" select="'IssueOrgan'"/>
                </xsl:call-template>
              </xsl:variable>
              <xsl:if test="$Issuer != ''">
                <docs:issuer>
                  <docs:name>
                    <xsl:value-of select="$Issuer"/>
                  </docs:name>
                </docs:issuer>
              </xsl:if>
            </xsl:element>
          </stCom:appliedDocument>
        </xsl:if>
      </xsl:for-each>
    </xsl:if>
    <xsl:variable name="ParentID">
      <xsl:value-of select="@Code"/>
      <xsl:text>_</xsl:text>
      <xsl:value-of select="@ID"/>
    </xsl:variable>
    <xsl:if test="$CodeReg='nwr'">
      <xsl:for-each select="//Form[@Code='Request'][1]/Page[@Code = 'Objects']/*[(@Code = 'DocumentRight') and @Selected = 'true']|//Form[@Code='Objects' and @ParentID=$ParentID]/Page[@Code = 'Objects']/*[(@Code = 'DocumentRight') and @Selected = 'true']">
        <xsl:for-each select="*">
          <xsl:call-template name="EGRNDocumentMain">
            <xsl:with-param name="CodeDoc" select="'Request'"/>
            <xsl:with-param name="RequestGUID" select="$RequestGUID"/>
          </xsl:call-template>
        </xsl:for-each>
      </xsl:for-each>
    </xsl:if>
    <xsl:variable name="ParentFormRequest">
      <xsl:text>Request_</xsl:text>
      <xsl:value-of select="@ID"/>
    </xsl:variable>
    <xsl:for-each select="//Form[@Code='Subjects' and @Selected='true' and @ParentID=$ParentFormRequest]">
      <xsl:variable name="Agent">
        <xsl:value-of select="*/*[@Code = 'Agent']/*[@Selected='true']/@Code"/>
      </xsl:variable>
      <xsl:variable name="AgentId">
        <xsl:value-of select="*/*[@Code = 'Agent']/@SetID"/>
      </xsl:variable>
      <xsl:variable name="Owner">
        <xsl:value-of select="*/*[@Code = 'Owner']/*[@Selected='true']/@Code"/>
      </xsl:variable>
      <xsl:if test="$Agent!='M'">
        <xsl:for-each select="Page[@Code = 'Subject']/*[(@Code = 'DocumentAgent') and @Selected = 'true']">
          <xsl:for-each select="*">
            <xsl:call-template name="EGRNDocumentMain">
              <xsl:with-param name="CodeDoc" select="'Request'"/>

              <xsl:with-param name="RequestGUID" select="$RequestGUID"/>
            </xsl:call-template>
          </xsl:for-each>
        </xsl:for-each>
      </xsl:if>

      <xsl:if test="$Agent='J' or $Agent='G' or $Owner='J' or $Owner='G'">
        <xsl:for-each select="Page[@Code = 'Subject']/*[(@Code = 'DocumentOrganization') and @Selected = 'true']">
          <xsl:for-each select="*">
            <xsl:call-template name="EGRNDocumentMain">
              <xsl:with-param name="CodeDoc" select="'Request'"/>
              <xsl:with-param name="RequestGUID" select="$RequestGUID"/>
            </xsl:call-template>
          </xsl:for-each>
        </xsl:for-each>
      </xsl:if>
      <xsl:if test="$Agent='J' or $Agent='G'">
        <xsl:for-each select="Page[@Code = 'Subject']/*[(@Code = 'Agent') and @Selected = 'true']/*[@Selected='true']">
          <xsl:call-template name="EGRNDocumentMain">
            <xsl:with-param name="CodeDoc" select="'Request'"/>
            <xsl:with-param name="RequestGUID" select="$RequestGUID"/>
          </xsl:call-template>
        </xsl:for-each>
      </xsl:if>
      <xsl:if test="$Owner = 'F'">
        <xsl:variable name="OwnerID" select="Page[@Code = 'Subject']/*[@Code = 'Owner']/@SetID"/>
        <xsl:for-each select="Page[@Code = 'Subject']/*[@Code = 'Owner']/*[(@Code = 'F') and @Selected = 'true']">
          <xsl:variable name="ListName">
            <xsl:choose>
              <xsl:when test="@Code = 'F'">Person</xsl:when>
              <xsl:otherwise>Organization</xsl:otherwise>
            </xsl:choose>
          </xsl:variable>
          <stCom:appliedDocument>
            <xsl:variable name="TestAD1">
              <xsl:call-template name="Value">
                <xsl:with-param name="x" select="'Type_Document'"/>
                <xsl:with-param name="list" select="$ListName"/>
              </xsl:call-template>
            </xsl:variable>
            <xsl:variable name="DocElementName">
              <xsl:call-template name="EGRNDocNameFromCode">
                <xsl:with-param name="Code" select="$TestAD1"/>
              </xsl:call-template>
            </xsl:variable>
            <xsl:element name="docs:{$DocElementName}">
              <xsl:attribute name="_id">
                <xsl:value-of select="$OwnerID"/>
              </xsl:attribute>
              <docs:documentTypes>
                <docs:documentTypeCode>
                  <xsl:value-of select="$TestAD1"/>
                </docs:documentTypeCode>
              </docs:documentTypes>

              <docs:name>
                <xsl:call-template name="Dicts">
                  <xsl:with-param name="dict">
                    <xsl:call-template name="dAllDocuments"/>
                  </xsl:with-param>
                  <xsl:with-param name="code">
                    <xsl:value-of select="$TestAD1"/>
                  </xsl:with-param>
                </xsl:call-template>
              </docs:name>

              <docs:number>
                <xsl:call-template name="Value">
                  <xsl:with-param name="x" select="'Number'"/>
                  <xsl:with-param name="list" select="$ListName"/>
                </xsl:call-template>
              </docs:number>
              <docs:issueDate>
                <xsl:call-template name="Value">
                  <xsl:with-param name="x" select="'Date'"/>
                  <xsl:with-param name="list" select="$ListName"/>
                </xsl:call-template>
              </docs:issueDate>
              <xsl:variable name="Series">
                <xsl:call-template name="Value">
                  <xsl:with-param name="x" select="'Series'"/>
                  <xsl:with-param name="list" select="$ListName"/>
                </xsl:call-template>
              </xsl:variable>
              <xsl:if test="$Series != ''">
                <docs:series>
                  <xsl:value-of select="$Series"/>
                </docs:series>
              </xsl:if>
              <docs:issuer>
                <docs:name>
                  <xsl:call-template name="Value">
                    <xsl:with-param name="x" select="'IssueOrgan'"/>
                    <xsl:with-param name="list" select="$ListName"/>
                  </xsl:call-template>
                </docs:name>
              </docs:issuer>
            </xsl:element>
          </stCom:appliedDocument>
        </xsl:for-each>
      </xsl:if>
      <xsl:if test="$Agent = 'J' or $Agent = 'F'">
        <xsl:variable name="AgentID" select="Page[@Code = 'Subject']/*[@Code = 'Agent']/@SetID"/>
        <xsl:for-each select="Page[@Code = 'Subject']/*[@Code = 'Agent']/*[(@Code = 'F' or @Code='J') and @Selected = 'true']">
          <xsl:variable name="ListName">
            <xsl:choose>
              <xsl:when test="@Code = 'F'">Person</xsl:when>
              <xsl:otherwise>Organization</xsl:otherwise>
            </xsl:choose>
          </xsl:variable>
          <stCom:appliedDocument>
            <xsl:variable name="TestAD1">
              <xsl:call-template name="Value">
                <xsl:with-param name="x" select="'Type_Document'"/>
                <xsl:with-param name="list" select="$ListName"/>
              </xsl:call-template>
            </xsl:variable>
            <xsl:variable name="DocElementName">
              <xsl:call-template name="EGRNDocNameFromCode">
                <xsl:with-param name="Code" select="$TestAD1"/>
              </xsl:call-template>
            </xsl:variable>
            <xsl:element name="docs:{$DocElementName}">
              <xsl:attribute name="_id">
                <xsl:value-of select="$AgentID"/>
              </xsl:attribute>
              <docs:documentTypes>
                <docs:documentTypeCode>
                  <xsl:value-of select="$TestAD1"/>
                </docs:documentTypeCode>
              </docs:documentTypes>

              <docs:name>
                <xsl:call-template name="Dicts">
                  <xsl:with-param name="dict">
                    <xsl:call-template name="dAllDocuments"/>
                  </xsl:with-param>
                  <xsl:with-param name="code">
                    <xsl:value-of select="$TestAD1"/>
                  </xsl:with-param>
                </xsl:call-template>
              </docs:name>

              <docs:number>
                <xsl:call-template name="Value">
                  <xsl:with-param name="x" select="'Number'"/>
                  <xsl:with-param name="list" select="$ListName"/>
                </xsl:call-template>
              </docs:number>
              <docs:issueDate>
                <xsl:call-template name="Value">
                  <xsl:with-param name="x" select="'Date'"/>
                  <xsl:with-param name="list" select="$ListName"/>
                </xsl:call-template>
              </docs:issueDate>
              <xsl:variable name="Series">
                <xsl:call-template name="Value">
                  <xsl:with-param name="x" select="'Series'"/>
                  <xsl:with-param name="list" select="$ListName"/>
                </xsl:call-template>
              </xsl:variable>
              <xsl:if test="$Series != ''">
                <docs:series>
                  <xsl:value-of select="$Series"/>
                </docs:series>
              </xsl:if>
              <docs:issuer>
                <docs:name>
                  <xsl:call-template name="Value">
                    <xsl:with-param name="x" select="'IssueOrgan'"/>
                    <xsl:with-param name="list" select="$ListName"/>
                  </xsl:call-template>
                </docs:name>
              </docs:issuer>
            </xsl:element>
          </stCom:appliedDocument>
        </xsl:for-each>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="EGRNDocumentMain" xmlns:stCom="http://rosreestr.ru/services/v0.1/TStatementCommons" xmlns:docs="http://rosreestr.ru/services/v0.1/commons/Documents">
    <xsl:param name="CodeDoc"/>
    <xsl:param name="CustomId"/>
    <xsl:param name="RequestGUID"/>
    <stCom:appliedDocument>
      <xsl:variable name="TestAD1">
        <xsl:call-template name="Value">
          <xsl:with-param name="x" select="'Kind'"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:variable name="id">
        <xsl:if test="$CustomId=''">
          <xsl:value-of select="*[@Code='Kind']/@SetID"/>
        </xsl:if>
        <xsl:value-of select="$CustomId"/>
      </xsl:variable>
      <xsl:variable name="DocElementName">
        <xsl:call-template name="EGRNDocNameFromCode">
          <xsl:with-param name="Code" select="$TestAD1"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:element name="docs:{$DocElementName}">
        <xsl:call-template name="EGRNDocumentBody">
          <xsl:with-param name="Kind" select="$TestAD1"/>
          <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
          <xsl:with-param name="id" select="$id">
          </xsl:with-param>
          <xsl:with-param name="RequestGUID" select="$RequestGUID"/>
        </xsl:call-template>
      </xsl:element>
    </stCom:appliedDocument>
  </xsl:template>
  <xsl:template name="EGRNDocumentBody" xmlns:docs="http://rosreestr.ru/services/v0.1/commons/Documents">
    <xsl:param name="CodeDoc"/>
    <xsl:param name="Kind"/>
    <xsl:param name="id"/>
    <xsl:param name="RequestGUID"/>
    <xsl:attribute name="_id">
      <xsl:value-of select="$id"/>
    </xsl:attribute>
    <docs:documentTypes>
      <docs:documentTypeCode>
        <xsl:value-of select="$Kind"/>
      </docs:documentTypeCode>
    </docs:documentTypes>
    <xsl:variable name="TestAD2_1">
      <xsl:call-template name="Value">
        <xsl:with-param name="x" select="'Name'"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="TestAD2">
      <xsl:call-template name="Dicts">
        <xsl:with-param name="dict">
          <xsl:call-template name="dAllDocuments"/>
        </xsl:with-param>
        <xsl:with-param name="code">
          <xsl:value-of select="$Kind"/>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$TestAD2_1!=''">
        <docs:name>
          <xsl:value-of select="$TestAD2_1"/>
        </docs:name>
      </xsl:when>
      <xsl:when test="$TestAD2!=''">
        <docs:name>
          <xsl:value-of select="$TestAD2"/>
        </docs:name>
      </xsl:when>
    </xsl:choose>
    <xsl:call-template name="EO">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Number'"/>
      <xsl:with-param name="AltName" select="'docs:number'"/>
    </xsl:call-template>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Date'"/>
      <xsl:with-param name="AltName" select="'docs:issueDate'"/>
    </xsl:call-template>
    <xsl:variable name="TestAD0">
      <xsl:call-template name="Value">
        <xsl:with-param name="x" select="'Name'"/>
        <xsl:with-param name="list" select="'NameDocument'"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="TestAD4">
      <xsl:call-template name="Value">
        <xsl:with-param name="x" select="'Pages0'"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="TestAD5">
      <xsl:choose>
        <xsl:when test="$TestAD4 != ''">
          <xsl:value-of select="$TestAD4"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="Value">
            <xsl:with-param name="x" select="'Pages'"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="ParamFile!=''">
      <xsl:for-each select="ParamFile">
        <docs:attachment>
          <docs:desc>
            <xsl:value-of select="$TestAD0"/>
          </docs:desc>
          <docs:fileDesc>
            <docs:file>
              <docs:fileURI>
                <xsl:text>embedded://</xsl:text>
                <xsl:call-template name="AddFileReference">
                  <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
                  <!--xsl:with-param name="AddFilesFolder" select="$RequestGUID"/-->
                </xsl:call-template>
              </docs:fileURI>
              <docs:md5sum>md5sum4</docs:md5sum>
            </docs:file>
            <docs:signature>
              <docs:fileURI>
                <xsl:text>embedded://</xsl:text>
                <xsl:call-template name="AddFileReference">
                  <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
                  <!--xsl:with-param name="AddFilesFolder" select="$RequestGUID"/-->
                </xsl:call-template>
                <xsl:text>.sig</xsl:text>
              </docs:fileURI>
              <docs:md5sum>md5sum5</docs:md5sum>
            </docs:signature>
          </docs:fileDesc>
          <docs:receivedInPaper>
            <docs:original>
              <docs:pageCount>
                <xsl:choose>
                  <xsl:when test="$TestAD5 != ''">
                    <xsl:value-of select="$TestAD5"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
                </xsl:choose>
              </docs:pageCount>
              <docs:docCount>1</docs:docCount>
            </docs:original>
          </docs:receivedInPaper>
        </docs:attachment>
      </xsl:for-each>
    </xsl:if>
    <xsl:call-template name="EN">
      <xsl:with-param name="Page" select="'-'"/>
      <xsl:with-param name="Section" select="'-'"/>
      <xsl:with-param name="Param" select="'Series'"/>
      <xsl:with-param name="AltName" select="'docs:series'"/>
    </xsl:call-template>
    <xsl:variable name="Issuer">
      <xsl:call-template name="Value">
        <xsl:with-param name="x" select="'IssueOrgan'"/>
      </xsl:call-template>
    </xsl:variable>
    <docs:issuer>
      <docs:name>
        <xsl:call-template name="Value">
          <xsl:with-param name="x" select="'IssueOrgan'"/>
          <xsl:with-param name="list" select="'IssueOrgan'"/>
        </xsl:call-template>
      </docs:name>
    </docs:issuer>
  </xsl:template>
  <xsl:template name="EGRNDocNameFromCode">
    <xsl:param name="Code"/>

    <xsl:choose>
      <xsl:when test="starts-with($Code, '008002')">otherDocument</xsl:when>
      <xsl:when test="starts-with($Code, '5581')">otherDocument</xsl:when>
      <xsl:when test="starts-with($Code, '5582')">otherDocument</xsl:when>
      <xsl:when test="starts-with($Code, '558402')">otherDocument</xsl:when>
      <xsl:when test="starts-with($Code, '558403')">otherDocument</xsl:when>
      <xsl:when test="starts-with($Code, '5585')">otherDocument</xsl:when>
      <xsl:when test="starts-with($Code, '555001')">paymentDocument</xsl:when>
      <xsl:when test="starts-with($Code, '555002')">paymentDocument</xsl:when>
      <xsl:when test="starts-with($Code, '555003')">paymentDocument</xsl:when>
      <xsl:when test="starts-with($Code, '555004')">paymentDocument</xsl:when>
      <xsl:when test="starts-with($Code, '555005')">paymentDocument</xsl:when>
      <xsl:when test="starts-with($Code, '008001')">idDocument</xsl:when>
      <xsl:when test="starts-with($Code, '558301010000')">powerOfAttorney</xsl:when>
      <xsl:when test="starts-with($Code, '558203000000')">mapPlanDocument</xsl:when>
      <xsl:when test="starts-with($Code, '558211010000')">mapPlanDocument</xsl:when>
      <xsl:when test="starts-with($Code, '558219000000')">mapPlanDocument</xsl:when>
      <xsl:when test="starts-with($Code, '558252000000')">mapPlanDocument</xsl:when>
      <xsl:when test="starts-with($Code, '558401')">legalAct</xsl:when>
      <!--xsl:when test="starts-with($Code, '558301')">representativeDocument</xsl:when-->
      <xsl:when test="starts-with($Code, '5588')">confirmPrivilege</xsl:when>
      <xsl:otherwise>otherDocument</xsl:otherwise>
    </xsl:choose>

  </xsl:template>
  <xsl:template name="EGRNOwner" xmlns:subj="http://rosreestr.ru/services/v0.1/commons/Subjects" xmlns:address="http://rosreestr.ru/services/v0.1/commons/Address">
    <xsl:param name="Declarant"/>


    <xsl:param name="id"/>

    <xsl:variable name="declarant_kind">
      <xsl:for-each select="Page[@Code = 'Declarants']/*[@Code = 'Declarant']/*[@Selected='true']">
        <xsl:call-template name="Value">
          <xsl:with-param name="x" select="'declarant_kind'"/>
        </xsl:call-template>
      </xsl:for-each>
    </xsl:variable>

    <xsl:if test="$Declarant = 'F'">
      <xsl:for-each select="Page[@Code = 'Declarants']/*[@Code = 'Declarant']/*[@Code = 'F' and @Selected = 'true']">
        <subj:person>
          <xsl:variable name="Email">
            <xsl:call-template name="Value">
              <xsl:with-param name="x" select="'Email'"/>
              <xsl:with-param name="list" select="'Person'"/>
            </xsl:call-template>
          </xsl:variable>

          <xsl:variable name="Telephone">
            <xsl:call-template name="Value">
              <xsl:with-param name="x" select="'Phone'"/>
              <xsl:with-param name="list" select="'Person'"/>
            </xsl:call-template>
          </xsl:variable>

          <xsl:if test="$Email != '' or $Telephone != ''">
            <subj:contactInfo>
              <xsl:if test="$Telephone != ''">
                <subj:phoneNumber>
                  <xsl:choose>
                    <xsl:when test="contains( $Telephone,'+')">
                      <xsl:value-of select="$Telephone"/>
                    </xsl:when>
                    <xsl:otherwise>+70</xsl:otherwise>
                  </xsl:choose>

                </subj:phoneNumber>
              </xsl:if>
              <xsl:if test="$Email != '' and not(contains($Email, '@technokad.rosreestr.ru'))">
                <subj:email>
                  <xsl:value-of select="$Email"/>
                </subj:email>
              </xsl:if>
            </subj:contactInfo>
          </xsl:if>
          <xsl:call-template name="EN">
            <xsl:with-param name="Page" select="'-'"/>
            <xsl:with-param name="Section" select="'-'"/>
            <xsl:with-param name="List" select="'Person'"/>
            <xsl:with-param name="Param" select="'FIO1'"/>
            <xsl:with-param name="AltName" select="'subj:surname'"/>
          </xsl:call-template>
          <xsl:call-template name="EN">
            <xsl:with-param name="Page" select="'-'"/>
            <xsl:with-param name="Section" select="'-'"/>
            <xsl:with-param name="List" select="'Person'"/>
            <xsl:with-param name="Param" select="'FIO2'"/>
            <xsl:with-param name="AltName" select="'subj:firstname'"/>
          </xsl:call-template>
          <xsl:call-template name="EN">
            <xsl:with-param name="Page" select="'-'"/>
            <xsl:with-param name="Section" select="'-'"/>
            <xsl:with-param name="List" select="'Person'"/>
            <xsl:with-param name="Param" select="'FIO3'"/>
            <xsl:with-param name="AltName" select="'subj:patronymic'"/>
          </xsl:call-template>
          <xsl:call-template name="EO">
            <xsl:with-param name="Page" select="'-'"/>
            <xsl:with-param name="Section" select="'-'"/>
            <xsl:with-param name="Param" select="'DateBirth'"/>
            <xsl:with-param name="AltName" select="'subj:birthDate'"/>
          </xsl:call-template>
          <xsl:call-template name="EO">
            <xsl:with-param name="Page" select="'-'"/>
            <xsl:with-param name="Section" select="'-'"/>
            <xsl:with-param name="Param" select="'Place_Birth'"/>
            <xsl:with-param name="AltName" select="'subj:birthPlace'"/>
          </xsl:call-template>
          <subj:idDocumentRef>
            <xsl:attribute name="documentID">
              <xsl:if test="$id=''">901</xsl:if>
              <xsl:value-of select="$id"/>
            </xsl:attribute>
          </subj:idDocumentRef>
          <xsl:if test="ParamSelectList[@Code = 'Address']/Item">
            <subj:address>
              <xsl:call-template name="EGRNAddress">
                <xsl:with-param name="CodeDoc">VersionRequest</xsl:with-param>
              </xsl:call-template>
            </subj:address>
          </xsl:if>
          <xsl:variable name="SNILS2">
            <xsl:call-template name="Value">
              <xsl:with-param name="x" select="'SNILS'"/>
              <xsl:with-param name="list" select="'Person'"/>
            </xsl:call-template>
          </xsl:variable>
          <xsl:if test="$SNILS2 != ''">
            <subj:snils>
              <xsl:value-of select="concat(substring($SNILS2, 1, 3), substring($SNILS2, 5, 3), substring($SNILS2, 9, 3), substring($SNILS2, 13, 2))"/>
            </subj:snils>
          </xsl:if>
        </subj:person>
        <subj:declarantKind>
          <xsl:choose>
            <xsl:when test="$CodeReg = 'nwz' or $CodeReg = 'nwh' or $CodeReg = 'nwhm'">
              <xsl:value-of select="'357100000001'"/>
            </xsl:when>
            <xsl:when test="$CodeReg='exz' or $CodeReg='ext' or $CodeReg='exh' or $CodeReg='exs' or $CodeReg='exr'">
              <xsl:value-of select="$declarant_kind"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="'357100000001'"/>
            </xsl:otherwise>
          </xsl:choose>
        </subj:declarantKind>
      </xsl:for-each>
    </xsl:if>
    <xsl:if test="$Declarant = 'J'">
      <xsl:for-each select="Page[@Code = 'Declarants']/*[@Code = 'Declarant']/*[@Code = 'J' and @Selected = 'true']">
        <subj:organization>
          <xsl:variable name="Email">
            <xsl:call-template name="Value">
              <xsl:with-param name="x" select="'Email'"/>
              <xsl:with-param name="list" select="'Organization'"/>
            </xsl:call-template>
          </xsl:variable>

          <xsl:variable name="Telephone">
            <xsl:call-template name="Value">
              <xsl:with-param name="x" select="'Phone'"/>
              <xsl:with-param name="list" select="'Organization'"/>
            </xsl:call-template>
          </xsl:variable>

          <xsl:variable name="address">
            <xsl:if test="ParamSelectList[@Code = 'Address']/Item">
              <subj:address>
                <xsl:call-template name="EGRNAddress">
                  <xsl:with-param name="CodeDoc">VersionRequest</xsl:with-param>
                </xsl:call-template>
              </subj:address>
            </xsl:if>
          </xsl:variable>
          <xsl:if test="$Email != '' or $Telephone != ''">
            <subj:contactInfo>
              <xsl:if test="$Telephone != ''">
                <subj:phoneNumber>
                  <xsl:choose>
                    <xsl:when test="contains( $Telephone,'+')">
                      <xsl:value-of select="$Telephone"/>
                    </xsl:when>
                    <xsl:otherwise>+70</xsl:otherwise>
                  </xsl:choose>
                </subj:phoneNumber>
              </xsl:if>
              <xsl:if test="$Email != '' and not(contains($Email, '@technokad.rosreestr.ru'))">
                <subj:email>
                  <xsl:value-of select="$Email"/>
                </subj:email>
              </xsl:if>
            </subj:contactInfo>
          </xsl:if>
          <subj:name>
            <xsl:call-template name="Value">
              <xsl:with-param name="x" select="'Organization'"/>
              <xsl:with-param name="list" select="'Organization'"/>
            </xsl:call-template>
          </subj:name>
          <xsl:call-template name="EO">
            <xsl:with-param name="Page" select="'-'"/>
            <xsl:with-param name="Section" select="'-'"/>
            <xsl:with-param name="List" select="'Organization'"/>
            <xsl:with-param name="Param" select="'KPP'"/>
            <xsl:with-param name="AltName" select="'subj:kpp'"/>
            <xsl:with-param name="AltValue" select="'000000001'"/>
          </xsl:call-template>
          <subj:nativeForeignParams>
            <subj:nativeOrgParams>
              <subj:ogrn>
                <xsl:variable name="orgOGRN">
                  <xsl:call-template name="Value">
                    <xsl:with-param name="x" select="'OGRN'"/>
                    <xsl:with-param name="list" select="'Organization'"/>
                  </xsl:call-template>
                </xsl:variable>
                <xsl:value-of select="$orgOGRN"/>
                <xsl:if test="$orgOGRN = ''">1000000000000</xsl:if>
              </subj:ogrn>
              <subj:inn>
                <xsl:variable name="orgINN">
                  <xsl:call-template name="Value">
                    <xsl:with-param name="x" select="'INNJ'"/>
                    <xsl:with-param name="list" select="'Organization'"/>
                  </xsl:call-template>
                </xsl:variable>
                <xsl:value-of select="$orgINN"/>
                <xsl:if test="$orgINN = ''">0000000001</xsl:if>
              </subj:inn>
              <subj:regDate>
                <xsl:variable name="orgRegDate">
                  <xsl:call-template name="Value">
                    <xsl:with-param name="x" select="'RegDate'"/>
                    <xsl:with-param name="list" select="'Organization'"/>
                  </xsl:call-template>
                </xsl:variable>
                <xsl:value-of select="$orgRegDate"/>
                <xsl:if test="$orgRegDate = ''">1001-01-01</xsl:if>
              </subj:regDate>
            </subj:nativeOrgParams>
          </subj:nativeForeignParams>


        </subj:organization>
        <subj:declarantKind>
          <xsl:choose>
            <xsl:when test="$CodeReg = 'nwz' or $CodeReg = 'nwh' or $CodeReg = 'nwhm'">
              <xsl:value-of select="'357100000001'"/>
            </xsl:when>
            <xsl:when test="$CodeReg='exz' or $CodeReg='ext' or $CodeReg='exh' or $CodeReg='exs' or $CodeReg='exr'">
              <xsl:value-of select="$declarant_kind"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="'357100000001'"/>
            </xsl:otherwise>
          </xsl:choose>
        </subj:declarantKind>
        <xsl:call-template name="EGRNRepresentative">
          <xsl:with-param name="declarantKind">357100000001</xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
    </xsl:if>
    <!-- Гос.орган -->
    <xsl:if test="$Declarant = 'G'">
      <xsl:for-each select="Page[@Code = 'Declarants']/*[@Code = 'Declarant']/*[@Code = 'G' and @Selected = 'true']">
        <xsl:variable name="GType">
          <xsl:call-template name="Value">
            <xsl:with-param name="x" select="'Governance_Code'"/>
          </xsl:call-template>
        </xsl:variable>
        <xsl:choose>
          <xsl:when test="$GType = '007001001003'">
            <subj:other>
              <xsl:call-template name="EGRNGoverContactInfo"/>
              <subj:name>
                <xsl:call-template name="Value">
                  <xsl:with-param name="x" select="'Organization'"/>
                  <xsl:with-param name="list" select="'Organization'"/>
                </xsl:call-template>
              </subj:name>

              <subj:inn>
                <xsl:variable name="orgINN">
                  <xsl:call-template name="Value">
                    <xsl:with-param name="x" select="'INNJ'"/>
                    <xsl:with-param name="list" select="'Organization'"/>
                  </xsl:call-template>
                </xsl:variable>
                <xsl:value-of select="$orgINN"/>
                <xsl:if test="$orgINN = ''">0000000001</xsl:if>
              </subj:inn>
              <subj:ogrn>
                <xsl:variable name="orgOGRN">
                  <xsl:call-template name="Value">
                    <xsl:with-param name="x" select="'OGRN'"/>
                    <xsl:with-param name="list" select="'Organization'"/>
                  </xsl:call-template>
                </xsl:variable>
                <xsl:value-of select="$orgOGRN"/>
                <xsl:if test="$orgOGRN = ''">1000000000000</xsl:if>
              </subj:ogrn>

            </subj:other>
          </xsl:when>
          <xsl:when test="$GType = '007001001001'">
            <subj:country>
              <xsl:call-template name="EGRNGoverContactInfo"/>
              <subj:countryCode>848000000643</subj:countryCode>
            </subj:country>
          </xsl:when>
          <xsl:when test="$GType = '007001001002'">
            <subj:rfSubject>
              <xsl:call-template name="EGRNGoverContactInfo"/>
              <subj:subjectCode>
                <xsl:value-of select="$Region"/>
              </subj:subjectCode>
            </subj:rfSubject>
          </xsl:when>
        </xsl:choose>

        <subj:declarantKind>
          <xsl:choose>
            <xsl:when test="$CodeReg = 'nwz' or $CodeReg = 'nwh' or $CodeReg = 'nwhm'">
              <xsl:value-of select="'357100000001'"/>
            </xsl:when>
            <xsl:when test="$CodeReg='exz' or $CodeReg='ext' or $CodeReg='exh' or $CodeReg='exs' or $CodeReg='exr'">
              <xsl:value-of select="$declarant_kind"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="'357100000001'"/>
            </xsl:otherwise>
          </xsl:choose>
        </subj:declarantKind>
        <xsl:call-template name="EGRNRepresentative">
          <xsl:with-param name="declarantKind">357100000001</xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
    </xsl:if>
    <xsl:if test="$Declarant = 'M' and $JFSender = 'F'">
      <xsl:call-template name="EGRNPersonM"/>
      <subj:declarantKind>

        <xsl:choose>
          <xsl:when test="$CodeReg = 'nwz' or $CodeReg = 'nwh' or $CodeReg = 'nwhm'">
            <xsl:value-of select="'357100000001'"/>
          </xsl:when>
          <xsl:when test="$CodeReg='exz' or $CodeReg='ext' or $CodeReg='exh' or $CodeReg='exs' or $CodeReg='exr'">
            <xsl:value-of select="$declarant_kind"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="'357100000001'"/>
          </xsl:otherwise>
        </xsl:choose>
      </subj:declarantKind>
    </xsl:if>
    <xsl:if test="$Declarant = 'M' and $JFSender = 'J'">
      <subj:organization>
        <xsl:variable name="Email">
          <xsl:call-template name="Value">
            <xsl:with-param name="x" select="'Email'"/>
            <xsl:with-param name="list" select="'Organization'"/>
          </xsl:call-template>
        </xsl:variable>

        <xsl:variable name="Telephone">
          <xsl:call-template name="Value">
            <xsl:with-param name="x" select="'Phone'"/>
            <xsl:with-param name="list" select="'Organization'"/>
          </xsl:call-template>
        </xsl:variable>

        <xsl:if test="$Email != '' or $Phone != ''">
          <subj:contactInfo>
            <xsl:if test="$Telephone != ''">
              <subj:phoneNumber>
                <xsl:choose>
                  <xsl:when test="contains( $Telephone,'+')">
                    <xsl:value-of select="$Telephone"/>
                  </xsl:when>
                  <xsl:otherwise>+70</xsl:otherwise>
                </xsl:choose>
              </subj:phoneNumber>
            </xsl:if>
            <xsl:if test="$Email != '' and not(contains($Email, '@technokad.rosreestr.ru'))">
              <subj:email>
                <xsl:value-of select="$Email"/>
              </subj:email>
            </xsl:if>
          </subj:contactInfo>
        </xsl:if>
        <subj:name>
          <xsl:value-of select="$Organization"/>
        </subj:name>
        <subj:kpp>
          <xsl:value-of select="$KPP"/>
          <xsl:if test="$KPP = ''">000000001</xsl:if>
        </subj:kpp>
        <subj:nativeForeignParams>
          <subj:nativeOrgParams>
            <subj:ogrn>
              <xsl:variable name="orgOGRN">
                <xsl:value-of select="$OGRN"/>
              </xsl:variable>
              <xsl:value-of select="$orgOGRN"/>
              <xsl:if test="$orgOGRN = ''">1000000000000</xsl:if>
            </subj:ogrn>
            <subj:inn>
              <xsl:variable name="orgINN">
                <xsl:value-of select="$INNJ"/>
              </xsl:variable>
              <xsl:value-of select="$orgINN"/>
              <xsl:if test="$orgINN = ''">0000000001</xsl:if>
            </subj:inn>
            <subj:regDate>
              <xsl:variable name="orgRegDate">
                <xsl:value-of select="$RegDate"/>
              </xsl:variable>
              <xsl:value-of select="$orgRegDate"/>
              <xsl:if test="$orgRegDate = ''">1001-01-01</xsl:if>
            </subj:regDate>
          </subj:nativeOrgParams>
        </subj:nativeForeignParams>

      </subj:organization>
      <subj:declarantKind>
        <xsl:choose>
          <xsl:when test="$CodeReg = 'nwz' or $CodeReg = 'nwh' or $CodeReg = 'nwhm'">
            <xsl:value-of select="'357100000004'"/>
          </xsl:when>
          <xsl:when test="$CodeReg='exz' or $CodeReg='ext' or $CodeReg='exh' or $CodeReg='exs' or $CodeReg='exr'">
            <xsl:value-of select="$declarant_kind"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="'357100000004'"/>
          </xsl:otherwise>
        </xsl:choose>
      </subj:declarantKind>
      <subj:representative>
        <subj:subject _id="902">
          <xsl:call-template name="EGRNPersonM"/>
          <subj:declarantKind>
            <xsl:choose>
              <xsl:when test="$CodeReg='exz' or $CodeReg='ext' or $CodeReg='exh' or $CodeReg='exs' or $CodeReg='exr'">
                <xsl:for-each select="//Form[@Code='Request']/Page[@Code='Declarants']/*[@Code='Declarant']/*[@Selected='true']">
                  <xsl:call-template name="Value">
                    <xsl:with-param name="x" select="'declarant_kind'"/>
                  </xsl:call-template>
                </xsl:for-each>
              </xsl:when>
              <xsl:otherwise>357100000004</xsl:otherwise>
            </xsl:choose>
          </subj:declarantKind>
        </subj:subject>
        <subj:representativeDocumentRef >
          <xsl:attribute name="documentID">
            <xsl:if test="$id=''">903</xsl:if>
            <xsl:value-of select="$id"/>
          </xsl:attribute>
        </subj:representativeDocumentRef>
      </subj:representative>
    </xsl:if>

  </xsl:template>
  <xsl:template name="s_request">
    <xsl:param name="CodeDoc"/>
    <xsl:param name="Type"/>

    <root:request xmlns:root="http://rosreestr.ru/services/v0.12/TRequest" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
      <xsl:for-each select="//Form[@Code = 'Request']">

        <root:statementFile>
          <root:fileName>
            <xsl:call-template name="XmlFileName">
              <xsl:with-param name="CodeDoc" select="@Code"/>
              <xsl:with-param name="FileID">
                <xsl:choose>
                  <xsl:when test="position() &lt; 10">00</xsl:when>
                  <xsl:when test="position() &lt; 100">0</xsl:when>
                </xsl:choose>
                <xsl:value-of select="position()"/>
                <xsl:value-of select="substring(Page[@Code = 'Declarants']/@SetID, 4, 36)"/>
              </xsl:with-param>
              <xsl:with-param name="FileExtention" select="'xml'"/>
            </xsl:call-template>
          </root:fileName>
        </root:statementFile>
      </xsl:for-each>
      <xsl:for-each select="//Form[@Code = 'Request']">
        <xsl:variable name="id">
          <xsl:value-of select="@SetID"/>
        </xsl:variable>
        <root:file>
          <root:fileName>
            <xsl:call-template name="XmlFileName">
              <xsl:with-param name="CodeDoc" select="@Code"/>
              <xsl:with-param name="FileID">

                <xsl:choose>
                  <xsl:when test="position() &lt; 10">00</xsl:when>
                  <xsl:when test="position() &lt; 100">0</xsl:when>
                </xsl:choose>
                <xsl:value-of select="position()"/>
                <xsl:value-of select="substring(Page[@Code = 'Declarants']/@SetID, 4, 36)"/>
              </xsl:with-param>

              <xsl:with-param name="FileExtention" select="'xml'"/>
            </xsl:call-template>
            <xsl:text>.sig</xsl:text>
          </root:fileName>
        </root:file>
      </xsl:for-each>
      <xsl:call-template name="AddFilesDescriptionStatement">
        <xsl:with-param name="CodeDoc" select="'Request'"/>
      </xsl:call-template>
      <xsl:if test="$CodeReg = 'nwz' or $CodeReg = 'chz'">
        <xsl:choose>
          <xsl:when test="$ImportTransforms = 'RequestOnly'">
            <xsl:for-each select="//Buffers/Buffer/STD_MP | //Buffers/Buffer/MP">
              <root:file>
                <root:fileName>
                  <xsl:call-template name="XmlFileName">
                    <xsl:with-param name="CodeDoc" select="'MP'"/>
                    <xsl:with-param name="FileID" select="eDocument/@GUID | @GUID"/>
                  </xsl:call-template>
                </root:fileName>
              </root:file>
              <root:file>
                <root:fileName>
                  <xsl:call-template name="XmlFileName">
                    <xsl:with-param name="CodeDoc" select="'MP'"/>
                    <xsl:with-param name="FileID" select="eDocument/@GUID | @GUID"/>
                  </xsl:call-template>
                  <xsl:text>.sig</xsl:text>
                </root:fileName>
              </root:file>
            </xsl:for-each>
          </xsl:when>
          <xsl:otherwise>
            <xsl:for-each select="//Form[@Code = 'MP' and not(Page/Alt[@Code = 'PrintMP']/*[@Selected = 'true']/@Code = 'NoMP')]">
              <xsl:variable name="CodeDoc1" select="@Code"/>
              <root:file>
                <root:fileName>
                  <xsl:call-template name="XmlFileName">
                    <xsl:with-param name="CodeDoc" select="$CodeDoc1"/>
                    <xsl:with-param name="FileExtention" select="'zip'"/>
                  </xsl:call-template>
                </root:fileName>
              </root:file>
              <!--root:file>
              <root:fileName>
                <xsl:call-template name="XmlFileName">
                  <xsl:with-param name="CodeDoc" select="$CodeDoc1"/>
                  <xsl:with-param name="FileExtention" select="'zip'"/>
                </xsl:call-template>
                <xsl:text>.sig</xsl:text>
              </root:fileName>
            </root:file-->
            </xsl:for-each>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:if>
      <xsl:if test="$CodeReg = 'nwh' or $CodeReg = 'chh' or $CodeReg = 'nwhm'">
        <xsl:for-each select="//Form[(@Code = 'Building' or @Code = 'Construction' or @Code = 'Uncompleted' or @Code = 'Flat') and @Selected = 'true']">
          <xsl:variable name="CodeDoc1" select="@Code"/>
          <root:file>
            <root:fileName>
              <xsl:call-template name="XmlFileName">
                <xsl:with-param name="CodeDoc" select="$CodeDoc1"/>
                <xsl:with-param name="FileID">
                  <xsl:choose>
                    <xsl:when test="position() &lt; 10">00</xsl:when>
                    <xsl:when test="position() &lt; 100">0</xsl:when>
                  </xsl:choose>
                  <xsl:value-of select="position()"/>
                  <xsl:value-of select="substring(Page[@Code = 'Register']/@SetID, 4, 36)"/>
                </xsl:with-param>
                <xsl:with-param name="FileExtention" select="'zip'"/>
              </xsl:call-template>
            </root:fileName>
          </root:file>
        </xsl:for-each>
      </xsl:if>
      <root:requestType>
        <xsl:choose>
          <xsl:when test="$CodeReg = 'nwh' or $CodeReg = 'nwhm' or $CodeReg = 'chh' or $CodeReg = 'nwz' or $CodeReg = 'chz' or $CodeReg='sth'">111300001000</xsl:when>
          <xsl:when test="$CodeReg='cor'">111300007000</xsl:when>
          <xsl:when test="$CodeReg='add'">111300002000</xsl:when>
          <xsl:when test="$CodeReg='nwr' and $Type='1'">111300001000</xsl:when>
          <xsl:when test="$CodeReg='nwr' and $Type='2'">111300007000</xsl:when>
          <xsl:when test="$CodeReg='nwr' and $Type='4'">111300012000</xsl:when>
          <xsl:when test="$CodeReg='exz' or $CodeReg='ext' or $CodeReg='exh' or $CodeReg='exr' or $CodeReg='exs'">111300003000</xsl:when>
        </xsl:choose>
      </root:requestType>
    </root:request>
  </xsl:template>
  <xsl:template name="EGRNDeliveryPlace" xmlns:stCom="http://rosreestr.ru/services/v0.1/TStatementCommons">

    <stCom:requestDeliveryMethod>

      <stCom:receivingMethodCode>electronically</stCom:receivingMethodCode>
      <xsl:choose>
        <xsl:when test="//Form[@Code='Request' or @Code='RequestGeneral']/Page[@Code='Declarants']/*[@Code='RouteOKATO']/*/*[@Code='ESTO']/*[@Selected='true']">
          <xsl:for-each select="//Form[@Code='Request' or @Code='RequestGeneral']/Page[@Code='Declarants']/*[@Code='RouteOKATO']/*/*[@Code='ESTO']/*[@Selected='true']">
            <stCom:regRightAuthority>
              <xsl:text>в </xsl:text>
              <xsl:value-of select="@Name"/>
            </stCom:regRightAuthority>
            <stCom:code>
              <xsl:value-of select="@Code"/>
            </stCom:code>
          </xsl:for-each>
        </xsl:when>
        <xsl:otherwise>
          <stCom:regRightAuthority>-</stCom:regRightAuthority>
          <stCom:code>00.000</stCom:code>
        </xsl:otherwise>
      </xsl:choose>

    </stCom:requestDeliveryMethod>
  </xsl:template>
  <xsl:template name="EGRNGoverContactInfo" xmlns:subj="http://rosreestr.ru/services/v0.1/commons/Subjects">
    <xsl:param name="isOwner"/>
    <xsl:variable name="Email">
      <xsl:call-template name="Value">
        <xsl:with-param name="x" select="'Email'"/>
        <xsl:with-param name="list" >
          <xsl:if test="$isOwner=''">Organization</xsl:if>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="Telephone">
      <xsl:call-template name="Value">
        <xsl:with-param name="x" select="'Phone'"/>
        <xsl:with-param name="list" >
          <xsl:if test="$isOwner=''">Organization</xsl:if>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="address">
      <xsl:if test="ParamSelectList[@Code = 'Address']/Item">true</xsl:if>
    </xsl:variable>
    <xsl:if test="$Email != '' or $Telephone != '' or $address='true'">
      <subj:contactInfo>
        <xsl:if test="$Telephone != ''">
          <subj:phoneNumber>
            <xsl:choose>
              <xsl:when test="contains( $Telephone,'+')">
                <xsl:value-of select="$Telephone"/>
              </xsl:when>
              <xsl:otherwise>+70</xsl:otherwise>
            </xsl:choose>
          </subj:phoneNumber>
        </xsl:if>
        <xsl:if test="$address='true'">
          <subj:postalAddress>
            <xsl:call-template name="EGRNAddress">
              <xsl:with-param name="CodeDoc">VersionRequest</xsl:with-param>
            </xsl:call-template>
          </subj:postalAddress>
        </xsl:if>
        <xsl:if test="$Email != '' and not(contains($Email, '@technokad.rosreestr.ru'))">
          <subj:email>
            <xsl:value-of select="$Email"/>
          </subj:email>
        </xsl:if>
      </subj:contactInfo>
    </xsl:if>
  </xsl:template>
  <xsl:template name="EGRNPersonM" xmlns:subj="http://rosreestr.ru/services/v0.1/commons/Subjects" xmlns:address="http://rosreestr.ru/services/v0.1/commons/Address">
    <xsl:param name="id"/>
    <subj:person>
      <xsl:if test="$Email != '' or $Phone != ''">
        <subj:contactInfo>
          <xsl:if test="$Phone != ''">
            <subj:phoneNumber>
              <xsl:value-of select="$Phone"/>
            </subj:phoneNumber>
          </xsl:if>
          <xsl:if test="$Email != '' and not(contains($Email, '@technokad.rosreestr.ru'))">
            <subj:email>
              <xsl:value-of select="$Email"/>
            </subj:email>
          </xsl:if>
        </subj:contactInfo>
      </xsl:if>
      <subj:surname>
        <xsl:value-of select="$FIO1"/>
      </subj:surname>
      <subj:firstname>
        <xsl:value-of select="$FIO2"/>
      </subj:firstname>
      <xsl:if test="$FIO3 != ''">
        <subj:patronymic>
          <xsl:value-of select="$FIO3"/>
        </subj:patronymic>
      </xsl:if>
      <subj:birthDate>
        <xsl:value-of select="$DateBirth"/>
      </subj:birthDate>
      <subj:birthPlace>
        <xsl:value-of select="$PlaceBirth"/>
      </subj:birthPlace>
      <subj:idDocumentRef >
        <xsl:attribute name="documentID">
          <xsl:if test="$id=''">901</xsl:if>
          <xsl:value-of select="$id"/>
        </xsl:attribute>
      </subj:idDocumentRef>
      <xsl:for-each select="//Form[@Code = 'Info']/Page[@Code = 'Info']/*[@Selected = 'true']/*">
        <xsl:if test="ParamSelectList[@Code = 'Address']/Item">
          <subj:address>
            <xsl:call-template name="EGRNAddress">
              <xsl:with-param name="CodeDoc">VersionRequest</xsl:with-param>
            </xsl:call-template>
          </subj:address>
        </xsl:if>
      </xsl:for-each>
      <xsl:if test="$SNILS != ''">
        <subj:snils>
          <xsl:value-of select="concat(substring($SNILS, 1, 3), substring($SNILS, 5, 3), substring($SNILS, 9, 3), substring($SNILS, 13, 2))"/>
        </subj:snils>
      </xsl:if>
    </subj:person>
  </xsl:template>
  <xsl:template name="EGRNAddress" xmlns:address="http://rosreestr.ru/services/v0.1/commons/Address">
    <xsl:param name="ListCode"/>
    <xsl:param name="ThisFileType"/>
    <xsl:param name="CodeDoc"/>
    <xsl:call-template name="EGRNAddress_Begin">
      <xsl:with-param name="CodeDoc">VersionRequest</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="EGRNAddress_End">
      <xsl:with-param name="CodeDoc">VersionRequest</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template name="EGRNRepresentative" xmlns:subj="http://rosreestr.ru/services/v0.1/commons/Subjects" xmlns:address="http://rosreestr.ru/services/v0.1/commons/Address">
    <xsl:param name="declarantKind"/>
    <xsl:param name="id"/>
    <xsl:param name="PowerOfAttorneyId"/>
    <subj:representative>
      <subj:subject>
        <xsl:attribute name="_id">
          <xsl:if test="$id=''">
            902
          </xsl:if>
          <xsl:value-of select="$id"/>
        </xsl:attribute>
        <subj:person>
          <xsl:variable name="Email">
            <xsl:call-template name="Value">
              <xsl:with-param name="x" select="'Email'"/>
              <xsl:with-param name="list" select="'Organization'"/>
            </xsl:call-template>
          </xsl:variable>

          <xsl:variable name="Telephone">
            <xsl:call-template name="Value">
              <xsl:with-param name="x" select="'Phone'"/>
              <xsl:with-param name="list" select="'Organization'"/>
            </xsl:call-template>
          </xsl:variable>

          <xsl:if test="$Email != '' or $Telephone != ''">
            <subj:contactInfo>
              <xsl:if test="$Telephone != ''">
                <subj:phoneNumber>
                  <xsl:choose>
                    <xsl:when test="contains( $Telephone,'+')">
                      <xsl:value-of select="$Telephone"/>
                    </xsl:when>
                    <xsl:otherwise>+70</xsl:otherwise>
                  </xsl:choose>
                </subj:phoneNumber>
              </xsl:if>
              <xsl:if test="$Email != '' and not(contains($Email, '@technokad.rosreestr.ru'))">
                <subj:email>
                  <xsl:value-of select="$Email"/>
                </subj:email>
              </xsl:if>
            </subj:contactInfo>
          </xsl:if>
          <subj:surname>
            <xsl:call-template name="Value">
              <xsl:with-param name="x" select="'FIO1'"/>
              <xsl:with-param name="list" select="'Organization'"/>
            </xsl:call-template>
          </subj:surname>
          <subj:firstname>
            <xsl:call-template name="Value">
              <xsl:with-param name="x" select="'FIO2'"/>
              <xsl:with-param name="list" select="'Organization'"/>
            </xsl:call-template>
          </subj:firstname>
          <xsl:variable name="AgPat">
            <xsl:call-template name="Value">
              <xsl:with-param name="x" select="'FIO3'"/>
              <xsl:with-param name="list" select="'Organization'"/>
            </xsl:call-template>
          </xsl:variable>
          <xsl:if test="$AgPat != ''">
            <subj:patronymic>
              <xsl:value-of select="$AgPat"/>
            </subj:patronymic>
          </xsl:if>
          <subj:birthDate>
            <xsl:call-template name="Value">
              <xsl:with-param name="x" select="'DateBirth'"/>
            </xsl:call-template>
          </subj:birthDate>
          <subj:birthPlace>
            <xsl:call-template name="Value">
              <xsl:with-param name="x" select="'Place_Birth'"/>
            </xsl:call-template>
          </subj:birthPlace>
          <subj:idDocumentRef >
            <xsl:attribute name="documentID">
              <xsl:if test="$id=''">901</xsl:if>
              <xsl:value-of select="$id"/>
            </xsl:attribute>
          </subj:idDocumentRef>
          <subj:address>
            <xsl:call-template name="EGRNAddress">
              <xsl:with-param name="CodeDoc">VersionRequest</xsl:with-param>
            </xsl:call-template>
          </subj:address>
          <xsl:variable name="SNILS3">
            <xsl:call-template name="Value">
              <xsl:with-param name="x" select="'SNILS'"/>
              <xsl:with-param name="list" select="'Organization'"/>
            </xsl:call-template>
          </xsl:variable>
          <xsl:if test="$SNILS3 != ''">
            <subj:snils>
              <xsl:value-of select="concat(substring($SNILS3, 1, 3), substring($SNILS3, 5, 3), substring($SNILS3, 9, 3), substring($SNILS3, 13, 2))"/>
            </subj:snils>
          </xsl:if>
        </subj:person>
        <subj:declarantKind>
          <xsl:value-of select="$declarantKind"/>
        </subj:declarantKind>
      </subj:subject>
      <subj:representativeDocumentRef>
        <xsl:attribute name="documentID">
          <xsl:if test="$PowerOfAttorneyId=''">903</xsl:if>
          <xsl:value-of select="$PowerOfAttorneyId"/>
        </xsl:attribute>
      </subj:representativeDocumentRef>
    </subj:representative>
  </xsl:template>
  <!-- Делает из списка с повторениями уникальный список -->
  <xsl:template name="UniqueList">
    <!-- Общий список номеров -->
    <xsl:param name="str"/>
    <!-- Строка уникальных номеров, в которую вносятся унникальные номера из строки str -->
    <xsl:param name="number"/>
    <!-- Номер из общего списка str -->
    <xsl:variable name="one_number">
      <xsl:value-of select="substring-before($str,'|')"/>
    </xsl:variable>
    <!-- Новый общий список номеров с удаленным первым элементом -->
    <xsl:variable name="new_str">
      <xsl:value-of select="substring-after(substring-after($str,$one_number),'|')"/>
    </xsl:variable>
    <!-- Проверка уникальности очередного номера и внесение его в строку уникальных номеров -->
    <xsl:variable name="new_number">
      <xsl:value-of select="$number"/>
      <xsl:if test="$one_number!='' and substring-before($number,$one_number)=''">
        <xsl:value-of select="$one_number"/>
        <xsl:text>|</xsl:text>
      </xsl:if>
    </xsl:variable>
    <!-- Печать очередного уникального номера -->
    <xsl:if test="$one_number!='' and substring-before($number,$one_number)=''">
      <xsl:value-of select="$one_number"/>
      <xsl:text>|</xsl:text>
    </xsl:if>
    <!-- Рекурсия, пока общий список номеров не опустеет -->
    <xsl:if test="$new_str!=''">
      <xsl:call-template name="UniqueList">
        <xsl:with-param name="str" select="$new_str"/>
        <xsl:with-param name="number" select="$new_number"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  <xsl:template name="PrintRegion">
    <xsl:param name="list"/>
    <xsl:if test="substring-before($list,'|')!=''">
      <Region>
        <xsl:value-of select="substring-before($list,'|')"/>
      </Region>
      <xsl:call-template name="PrintRegion">
        <xsl:with-param name="list" select="substring-after($list,'|')"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  <xsl:template name="PrintRegionEGRN" xmlns:root="http://rosreestr.ru/services/v0.18/TStatementRequestEGRN">
    <xsl:param name="list"/>
    <xsl:if test="substring-before($list,'|')!=''">
      <root:region>
        <xsl:value-of select="substring-before($list,'|')"/>
      </root:region>
      <xsl:call-template name="PrintRegionEGRN">
        <xsl:with-param name="list" select="substring-after($list,'|')"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  <xsl:template name="ReqTypeGlobal">
    <xsl:variable name="ReqType">
      <xsl:value-of select="Page[@Code = 'Declarants']/*[@Code = 'ReqType']/*[@Selected = 'true']/@Code"/>
    </xsl:variable>

    <xsl:choose>
      <xsl:when test="contains($ReqType,'11110000') or 
        $ReqType = 'Ownership' or  $ReqType = 'JointOwnership' or $ReqType = 'CommonShareOwnership' or $ReqType = 'OtherRight' or $ReqType = 'RightArchive' or $ReqType = 'RightMovement' or
        $ReqType = 'Encumbrance' or $ReqType = 'EncumbranceArchive' or $ReqType = 'Contract'">1</xsl:when>
      <xsl:when test="$ReqType = 'RepayMortgage' or $ReqType = 'TechnicalError' or $ReqType = 'ChangeInfo' or $ReqType='659411111112'">2</xsl:when>
      <xsl:when test="$ReqType = 'AdditionalDocuments' or $ReqType = 'Suspend' or $ReqType = 'Resume' or $ReqType = 'ReturnDocuments'">3</xsl:when>
      <xsl:when test="$ReqType='659311111116'">4</xsl:when>

    </xsl:choose>

  </xsl:template>
  <xsl:template name="GetZoneFromContour">
    <xsl:param name="ContourNumberr"/>
    <xsl:param name="Crossing_OKS"/>
    <xsl:variable name="NumberZone">
      <xsl:choose>
        <xsl:when test="$Crossing_OKS='true'">
          <xsl:for-each select="Page[@Code = 'Crossing_OKS']/*[@Code='SquareNumberZone' and @Selected = 'true']/*">
            <xsl:value-of select="*[@Code='NumberZone']"/>
          </xsl:for-each>
        </xsl:when>
        <xsl:otherwise>
          <xsl:for-each select="Page[@Code = 'Entity_Spatial']/*[@Code='SquareNumberZone' and @Selected = 'true']/*[*[contains(., '-') and $ContourNumberr>= substring-before(., '-') and substring-after(., '-') >= $ContourNumberr] or  *[@Code = 'ListZones']/* = $ContourNumberr][1]">
            <xsl:value-of select="*[@Code='NumberZone']"/>
          </xsl:for-each>
        </xsl:otherwise>
      </xsl:choose>

    </xsl:variable>
    <xsl:value-of select="$NumberZone"/>
    <xsl:if test="$NumberZone=''">0</xsl:if>
  </xsl:template>
  <xsl:template name="EGRNOwnerNWR" xmlns:subj="http://rosreestr.ru/services/v0.1/commons/Subjects" xmlns:address="http://rosreestr.ru/services/v0.1/commons/Address">
    <xsl:variable name="Owner">
      <xsl:value-of select="*[@Code = 'Owner']/*[@Selected = 'true']/@Code"/>
    </xsl:variable>
    <xsl:variable name="Agent">
      <xsl:value-of select="*[@Code = 'Agent']/*[@Selected = 'true']/@Code"/>
    </xsl:variable>
    <xsl:variable name="AgentID">
      <xsl:value-of select="*[@Code = 'Agent']/@SetID"/>
    </xsl:variable>
    <xsl:variable name="id" select="*[@Code = 'Owner']/@SetID"/>
    <!-- Правообладатель -->
    <xsl:variable name="declarant_kind">
      <xsl:for-each select="Page[@Code = 'Declarants']/*[@Code = 'Declarant']/*[@Selected = 'true']">
        <xsl:call-template name="Value">
          <xsl:with-param name="x" select="'declarant_kind'"/>
        </xsl:call-template>
      </xsl:for-each>
    </xsl:variable>
    <xsl:for-each select="*[@Code = 'Owner']/*[@Selected = 'true']">
      <xsl:choose>
        <xsl:when test="$Owner = 'M'">
          <xsl:choose>
            <xsl:when test="$JFSender = 'F'">
              <xsl:call-template name="EGRNPersonM">
                <xsl:with-param name="id" select="$id"/>
              </xsl:call-template>
              <subj:declarantKind>357100000001</subj:declarantKind>
            </xsl:when>
            <xsl:when test="$JFSender = 'J'">
              <subj:organization>
                <xsl:variable name="Email">
                  <xsl:call-template name="Value">
                    <xsl:with-param name="x" select="'Email'"/>
                    <xsl:with-param name="list" select="'Organization'"/>
                  </xsl:call-template>
                </xsl:variable>
                <xsl:variable name="Telephone">
                  <xsl:call-template name="Value">
                    <xsl:with-param name="x" select="'Phone'"/>
                    <xsl:with-param name="list" select="'Organization'"/>
                  </xsl:call-template>
                </xsl:variable>
                <xsl:if test="$Email != '' or $Phone != ''">
                  <subj:contactInfo>
                    <xsl:if test="$Telephone != ''">
                      <subj:phoneNumber>
                        <xsl:choose>
                          <xsl:when test="contains($Telephone, '+')">
                            <xsl:call-template name="PhoneFormat">
                              <xsl:with-param name="originalPhone" select="$Telephone"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>+70</xsl:otherwise>
                        </xsl:choose>
                      </subj:phoneNumber>
                    </xsl:if>
                    <xsl:if test="$Email != '' and not(contains($Email, '@technokad.rosreestr.ru'))">
                      <subj:email>
                        <xsl:value-of select="$Email"/>
                      </subj:email>
                    </xsl:if>
                  </subj:contactInfo>
                </xsl:if>
                <subj:name>
                  <xsl:value-of select="$Organization"/>
                </subj:name>
                <subj:kpp>
                  <xsl:value-of select="$KPP"/>
                  <xsl:if test="$KPP = ''">000000001</xsl:if>
                </subj:kpp>
                <subj:nativeForeignParams>
                  <subj:nativeOrgParams>
                    <subj:ogrn>
                      <xsl:variable name="orgOGRN">
                        <xsl:value-of select="$OGRN"/>
                      </xsl:variable>
                      <xsl:value-of select="$orgOGRN"/>
                      <xsl:if test="$orgOGRN = ''">1000000000000</xsl:if>
                    </subj:ogrn>
                    <subj:inn>
                      <xsl:variable name="orgINN">
                        <xsl:value-of select="$INNJ"/>
                      </xsl:variable>
                      <xsl:value-of select="$orgINN"/>
                      <xsl:if test="$orgINN = ''">0000000001</xsl:if>
                    </subj:inn>
                    <subj:regDate>
                      <xsl:variable name="orgRegDate">
                        <xsl:value-of select="$RegDate"/>
                      </xsl:variable>
                      <xsl:value-of select="$orgRegDate"/>
                      <xsl:if test="$orgRegDate = ''">1001-01-01</xsl:if>
                    </subj:regDate>
                  </subj:nativeOrgParams>
                </subj:nativeForeignParams>
              </subj:organization>
              <subj:declarantKind>
                <xsl:choose>
                  <xsl:when test="$CodeReg = 'nwz' or $CodeReg = 'nwh'">
                    <xsl:value-of select="'357100000004'"/>
                  </xsl:when>
                  <xsl:when test="$CodeReg = 'exz' or $CodeReg = 'ext' or $CodeReg = 'exh' or $CodeReg = 'exs' or $CodeReg = 'exr'">
                    <xsl:value-of select="$declarant_kind"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="'357100000004'"/>
                  </xsl:otherwise>
                </xsl:choose>
              </subj:declarantKind>
              <subj:representative>
                <subj:subject>
                  <xsl:attribute name="_id">
                    <xsl:if test="$AgentID = ''">902</xsl:if>
                    <xsl:value-of select="$AgentID"/>
                  </xsl:attribute>
                  <xsl:call-template name="EGRNPersonM">
                    <xsl:with-param name="id" select="$AgentID"/>
                  </xsl:call-template>
                  <subj:declarantKind>
                    <xsl:choose>
                      <xsl:when test="$CodeReg = 'exz' or $CodeReg = 'ext' or $CodeReg = 'exh' or $CodeReg = 'exs' or $CodeReg = 'exr'">
                        <xsl:for-each select="//Form[@Code = 'Request']/Page[@Code = 'Declarants']/*[@Code = 'Declarant']/*[@Selected = 'true']">
                          <xsl:call-template name="Value">
                            <xsl:with-param name="x" select="'declarant_kind'"/>
                          </xsl:call-template>
                        </xsl:for-each>
                      </xsl:when>
                      <xsl:otherwise>357100000004</xsl:otherwise>
                    </xsl:choose>
                  </subj:declarantKind>
                </subj:subject>
                <subj:representativeDocumentRef documentID="903"/>
              </subj:representative>
            </xsl:when>
          </xsl:choose>
        </xsl:when>
        <xsl:when test="$Owner = 'F'">
          <xsl:call-template name="EGRNPerson">
            <xsl:with-param name="id" select="$id"/>
          </xsl:call-template>
          <subj:declarantKind>357100000001</subj:declarantKind>
          <xsl:if test="$Agent != 'M'">
            <xsl:for-each select="../..">
              <xsl:call-template name="EGRNRepresentativeNWR">
                <xsl:with-param name="id" select="$AgentID"/>
                <xsl:with-param name="PowerOfAttorneyId" select="*[(@Code = 'DocumentAgent') and @Selected = 'true']/*/*[@Code = 'Kind']/@SetID"/>
                <xsl:with-param name="declarantKind">357100000001</xsl:with-param>
              </xsl:call-template>
            </xsl:for-each>
          </xsl:if>
        </xsl:when>
        <xsl:when test="$Owner = 'J'">
          <subj:organization>
            <xsl:variable name="Email">
              <xsl:call-template name="Value">
                <xsl:with-param name="x" select="'Email'"/>
              </xsl:call-template>
            </xsl:variable>
            <xsl:variable name="Telephone">
              <xsl:call-template name="Value">
                <xsl:with-param name="x" select="'Phone'"/>
              </xsl:call-template>
            </xsl:variable>
            <xsl:variable name="address">
              <xsl:if test="ParamSelectList[@Code = 'Address']/Item">true</xsl:if>
            </xsl:variable>
            <xsl:if test="$Email != '' or $Telephone != '' or $address = 'true'">
              <subj:contactInfo>
                <xsl:if test="$Telephone != ''">
                  <subj:phoneNumber>
                    <xsl:choose>
                      <xsl:when test="contains($Telephone, '+')">
                        <xsl:call-template name="PhoneFormat">
                          <xsl:with-param name="originalPhone" select="$Telephone"/>
                        </xsl:call-template>
                      </xsl:when>
                      <xsl:otherwise>+70</xsl:otherwise>
                    </xsl:choose>
                  </subj:phoneNumber>
                </xsl:if>
                <xsl:if test="$address = 'true'">
                  <subj:postalAddress>
                    <xsl:call-template name="EGRNAddress">
                      <xsl:with-param name="CodeDoc">VersionRequest</xsl:with-param>
                    </xsl:call-template>
                  </subj:postalAddress>
                </xsl:if>
                <xsl:if test="$Email != '' and not(contains($Email, '@technokad.rosreestr.ru'))">
                  <subj:email>
                    <xsl:value-of select="$Email"/>
                  </subj:email>
                </xsl:if>
              </subj:contactInfo>
            </xsl:if>
            <subj:name>
              <xsl:call-template name="Value">
                <xsl:with-param name="x" select="'Organization'"/>
              </xsl:call-template>
            </subj:name>
            <xsl:call-template name="EO">
              <xsl:with-param name="Page" select="'-'"/>
              <xsl:with-param name="Section" select="'-'"/>
              <xsl:with-param name="List" select="'Organization'"/>
              <xsl:with-param name="Param" select="'KPP'"/>
              <xsl:with-param name="AltName" select="'subj:kpp'"/>
              <xsl:with-param name="AltValue" select="'000000001'"/>
            </xsl:call-template>
            <subj:nativeForeignParams>
              <subj:nativeOrgParams>
                <subj:ogrn>
                  <xsl:variable name="orgOGRN">
                    <xsl:call-template name="Value">
                      <xsl:with-param name="x" select="'OGRN'"/>
                    </xsl:call-template>
                  </xsl:variable>
                  <xsl:value-of select="$orgOGRN"/>
                  <xsl:if test="$orgOGRN = ''">1000000000000</xsl:if>
                </subj:ogrn>
                <subj:inn>
                  <xsl:variable name="orgINN">
                    <xsl:call-template name="Value">
                      <xsl:with-param name="x" select="'INNJ'"/>
                    </xsl:call-template>
                  </xsl:variable>
                  <xsl:value-of select="$orgINN"/>
                  <xsl:if test="$orgINN = ''">0000000001</xsl:if>
                </subj:inn>
                <subj:regDate>
                  <xsl:variable name="orgRegDate">
                    <xsl:call-template name="Value">
                      <xsl:with-param name="x" select="'RegDate'"/>
                    </xsl:call-template>
                  </xsl:variable>
                  <xsl:value-of select="$orgRegDate"/>
                  <xsl:if test="$orgRegDate = ''">1001-01-01</xsl:if>
                </subj:regDate>
              </subj:nativeOrgParams>
            </subj:nativeForeignParams>
          </subj:organization>
          <subj:declarantKind>357100000001</subj:declarantKind>
          <xsl:if test="$Agent != 'M'">
            <xsl:for-each select="../..">
              <xsl:call-template name="EGRNRepresentativeNWR">
                <xsl:with-param name="id" select="$AgentID"/>
                <xsl:with-param name="PowerOfAttorneyId" select="*[(@Code = 'DocumentAgent') and @Selected = 'true']/*/*[@Code = 'Kind']/@SetID"/>
                <xsl:with-param name="declarantKind">357100000001</xsl:with-param>
              </xsl:call-template>
            </xsl:for-each>
          </xsl:if>
        </xsl:when>
        <xsl:when test="$Owner = 'G'">
          <xsl:variable name="GType">
            <xsl:call-template name="Value">
              <xsl:with-param name="x" select="'Governance_Code'"/>
            </xsl:call-template>
          </xsl:variable>
          <xsl:choose>
            <xsl:when test="$GType = '007001001003' or $GType = '007001000000'">
              <subj:other>
                <xsl:call-template name="EGRNGoverContactInfo"/>
                <subj:name>
                  <xsl:call-template name="Value">
                    <xsl:with-param name="x" select="'Organization'"/>
                  </xsl:call-template>
                </subj:name>
                <xsl:call-template name="EN">
                  <xsl:with-param name="Page" select="'-'"/>
                  <xsl:with-param name="Section" select="'-'"/>
                  <xsl:with-param name="Param" select="'INNJ'"/>
                  <xsl:with-param name="AltName" select="'subj:inn'"/>
                </xsl:call-template>
                <xsl:call-template name="EN">
                  <xsl:with-param name="Page" select="'-'"/>
                  <xsl:with-param name="Section" select="'-'"/>
                  <xsl:with-param name="Param" select="'OGRN'"/>
                  <xsl:with-param name="AltName" select="'subj:ogrn'"/>
                </xsl:call-template>
              </subj:other>
            </xsl:when>
            <xsl:when test="$GType = '007001001001'">
              <subj:country>
                <xsl:call-template name="EGRNGoverContactInfo"/>
                <subj:countryCode>848000000643</subj:countryCode>
              </subj:country>
            </xsl:when>
            <xsl:when test="$GType = '007001001002'">
              <subj:rfSubject>
                <xsl:call-template name="EGRNGoverContactInfo"/>
                <subj:subjectCode>
                  <xsl:value-of select="$Region"/>
                </subj:subjectCode>
              </subj:rfSubject>
            </xsl:when>
          </xsl:choose>
          <subj:declarantKind>
            <xsl:choose>
              <xsl:when test="$CodeReg = 'nwz' or $CodeReg = 'nwh'">
                <xsl:value-of select="'357100000001'"/>
              </xsl:when>
              <xsl:when test="$CodeReg = 'exz' or $CodeReg = 'ext' or $CodeReg = 'exh' or $CodeReg = 'exs' or $CodeReg = 'exr'">
                <xsl:value-of select="$declarant_kind"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="'357100000001'"/>
              </xsl:otherwise>
            </xsl:choose>
          </subj:declarantKind>
          <xsl:if test="$Agent != 'M'">
            <xsl:for-each select="../..">
              <xsl:call-template name="EGRNRepresentativeNWR">
                <xsl:with-param name="id" select="$AgentID"/>
                <xsl:with-param name="PowerOfAttorneyId" select="*[(@Code = 'DocumentAgent') and @Selected = 'true']/*/*[@Code = 'Kind']/@SetID"/>
                <xsl:with-param name="declarantKind">357100000001</xsl:with-param>
              </xsl:call-template>
            </xsl:for-each>
          </xsl:if>
        </xsl:when>
      </xsl:choose>
    </xsl:for-each>
    <!-- Представитель -->
  </xsl:template>
  <xsl:template name="EGRNRepresentativeNWR" xmlns:subj="http://rosreestr.ru/services/v0.1/commons/Subjects" xmlns:address="http://rosreestr.ru/services/v0.1/commons/Address">
    <xsl:param name="pos"/>
    <xsl:param name="id"/>
    <xsl:param name="PowerOfAttorneyId"/>
    <subj:representative>
      <subj:subject>
        <xsl:variable name="declarant_kind">
          <xsl:for-each select="Page[@Code = 'Declarants']/*[@Code = 'Declarant']/*[@Selected = 'true']">
            <xsl:call-template name="Value">
              <xsl:with-param name="x" select="'declarant_kind'"/>
            </xsl:call-template>
          </xsl:for-each>
        </xsl:variable>
        <xsl:for-each select="*[@Code = 'Agent']/*[@Selected = 'true']">
          <xsl:attribute name="_id">
            <xsl:choose>
              <xsl:when test="@Code = 'F'">
                <xsl:value-of select="$id"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="@SetID"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
          <xsl:if test="@Code = 'F'">
            <subj:person>
              <xsl:variable name="Email">
                <xsl:call-template name="Value">
                  <xsl:with-param name="x" select="'Email'"/>
                  <xsl:with-param name="list" select="'Person'"/>
                </xsl:call-template>
              </xsl:variable>
              <xsl:variable name="Telephone">
                <xsl:call-template name="Value">
                  <xsl:with-param name="x" select="'Phone'"/>
                  <xsl:with-param name="list" select="'Person'"/>
                </xsl:call-template>
              </xsl:variable>
              <xsl:if test="$Email != '' or $Telephone != ''">
                <subj:contactInfo>
                  <xsl:if test="$Telephone != ''">
                    <subj:phoneNumber>
                      <xsl:choose>
                        <xsl:when test="contains($Telephone, '+')">
                          <xsl:call-template name="PhoneFormat">
                            <xsl:with-param name="originalPhone" select="$Telephone"/>
                          </xsl:call-template>
                        </xsl:when>
                        <xsl:otherwise>+70</xsl:otherwise>
                      </xsl:choose>
                    </subj:phoneNumber>
                  </xsl:if>
                  <xsl:if test="$Email != '' and not(contains($Email, '@technokad.rosreestr.ru'))">
                    <subj:email>
                      <xsl:value-of select="$Email"/>
                    </subj:email>
                  </xsl:if>
                </subj:contactInfo>
              </xsl:if>
              <xsl:call-template name="EN">
                <xsl:with-param name="Page" select="'-'"/>
                <xsl:with-param name="Section" select="'-'"/>
                <xsl:with-param name="List" select="'Person'"/>
                <xsl:with-param name="Param" select="'FIO1'"/>
                <xsl:with-param name="AltName" select="'subj:surname'"/>
              </xsl:call-template>
              <xsl:call-template name="EN">
                <xsl:with-param name="Page" select="'-'"/>
                <xsl:with-param name="Section" select="'-'"/>
                <xsl:with-param name="List" select="'Person'"/>
                <xsl:with-param name="Param" select="'FIO2'"/>
                <xsl:with-param name="AltName" select="'subj:firstname'"/>
              </xsl:call-template>
              <xsl:call-template name="EN">
                <xsl:with-param name="Page" select="'-'"/>
                <xsl:with-param name="Section" select="'-'"/>
                <xsl:with-param name="List" select="'Person'"/>
                <xsl:with-param name="Param" select="'FIO3'"/>
                <xsl:with-param name="AltName" select="'subj:patronymic'"/>
              </xsl:call-template>
              <xsl:call-template name="EO">
                <xsl:with-param name="Page" select="'-'"/>
                <xsl:with-param name="Section" select="'-'"/>
                <xsl:with-param name="Param" select="'DateBirth'"/>
                <xsl:with-param name="AltName" select="'subj:birthDate'"/>
              </xsl:call-template>
              <xsl:call-template name="EO">
                <xsl:with-param name="Page" select="'-'"/>
                <xsl:with-param name="Section" select="'-'"/>
                <xsl:with-param name="Param" select="'Place_Birth'"/>
                <xsl:with-param name="AltName" select="'subj:birthPlace'"/>
              </xsl:call-template>
              <subj:idDocumentRef>
                <xsl:attribute name="documentID">
                  <xsl:value-of select="$id"/>
                </xsl:attribute>
              </subj:idDocumentRef>
              <xsl:if test="ParamSelectList[@Code = 'Address']/Item">
                <subj:address>
                  <xsl:call-template name="EGRNAddress">
                    <xsl:with-param name="CodeDoc">VersionRequest</xsl:with-param>
                  </xsl:call-template>
                </subj:address>
              </xsl:if>
              <xsl:variable name="SNILS2">
                <xsl:call-template name="Value">
                  <xsl:with-param name="x" select="'SNILS'"/>
                  <xsl:with-param name="list" select="'Person'"/>
                </xsl:call-template>
              </xsl:variable>
              <xsl:if test="$SNILS2 != ''">
                <subj:snils>
                  <xsl:value-of select="concat(substring($SNILS2, 1, 3), substring($SNILS2, 5, 3), substring($SNILS2, 9, 3), substring($SNILS2, 13, 2))"/>
                </subj:snils>
              </xsl:if>
            </subj:person>
            <subj:declarantKind>357100000001</subj:declarantKind>
          </xsl:if>
          <xsl:if test="@Code = 'J'">
            <subj:organization>
              <xsl:variable name="Email">
                <xsl:call-template name="Value">
                  <xsl:with-param name="x" select="'Email'"/>
                  <xsl:with-param name="list" select="'Organization'"/>
                </xsl:call-template>
              </xsl:variable>
              <xsl:variable name="Telephone">
                <xsl:call-template name="Value">
                  <xsl:with-param name="x" select="'Phone'"/>
                  <xsl:with-param name="list" select="'Organization'"/>
                </xsl:call-template>
              </xsl:variable>
              <xsl:if test="$Email != '' or $Telephone != ''">
                <subj:contactInfo>
                  <xsl:if test="$Telephone != ''">
                    <subj:phoneNumber>
                      <xsl:choose>
                        <xsl:when test="contains($Telephone, '+')">
                          <xsl:call-template name="PhoneFormat">
                            <xsl:with-param name="originalPhone" select="$Telephone"/>
                          </xsl:call-template>
                        </xsl:when>
                        <xsl:otherwise>+70</xsl:otherwise>
                      </xsl:choose>
                    </subj:phoneNumber>
                  </xsl:if>
                  <xsl:if test="$Email != '' and not(contains($Email, '@technokad.rosreestr.ru'))">
                    <subj:email>
                      <xsl:value-of select="$Email"/>
                    </subj:email>
                  </xsl:if>
                </subj:contactInfo>
              </xsl:if>
              <subj:name>
                <xsl:call-template name="Value">
                  <xsl:with-param name="x" select="'Organization'"/>
                  <xsl:with-param name="list" select="'Organization'"/>
                </xsl:call-template>
              </subj:name>
              <xsl:call-template name="EO">
                <xsl:with-param name="Page" select="'-'"/>
                <xsl:with-param name="Section" select="'-'"/>
                <xsl:with-param name="List" select="'Organization'"/>
                <xsl:with-param name="Param" select="'KPP'"/>
                <xsl:with-param name="AltName" select="'subj:kpp'"/>
                <xsl:with-param name="AltValue" select="'000000001'"/>
              </xsl:call-template>
              <subj:nativeForeignParams>
                <subj:nativeOrgParams>
                  <subj:ogrn>
                    <xsl:variable name="orgOGRN">
                      <xsl:call-template name="Value">
                        <xsl:with-param name="x" select="'OGRN'"/>
                        <xsl:with-param name="list" select="'Organization'"/>
                      </xsl:call-template>
                    </xsl:variable>
                    <xsl:value-of select="$orgOGRN"/>
                    <xsl:if test="$orgOGRN = ''">1000000000000</xsl:if>
                  </subj:ogrn>
                  <subj:inn>
                    <xsl:variable name="orgINN">
                      <xsl:call-template name="Value">
                        <xsl:with-param name="x" select="'INNJ'"/>
                        <xsl:with-param name="list" select="'Organization'"/>
                      </xsl:call-template>
                    </xsl:variable>
                    <xsl:value-of select="$orgINN"/>
                    <xsl:if test="$orgINN = ''">0000000001</xsl:if>
                  </subj:inn>
                  <subj:regDate>
                    <xsl:variable name="orgRegDate">
                      <xsl:call-template name="Value">
                        <xsl:with-param name="x" select="'RegDate'"/>
                        <xsl:with-param name="list" select="'Organization'"/>
                      </xsl:call-template>
                    </xsl:variable>
                    <xsl:value-of select="$orgRegDate"/>
                    <xsl:if test="$orgRegDate = ''">1001-01-01</xsl:if>
                  </subj:regDate>
                </subj:nativeOrgParams>
              </subj:nativeForeignParams>
            </subj:organization>
            <subj:declarantKind>357100000001</subj:declarantKind>
            <xsl:call-template name="EGRNRepresentative">
              <xsl:with-param name="declarantKind">357100000001</xsl:with-param>
              <xsl:with-param name="id" select="$id"/>
              <xsl:with-param name="PowerOfAttorneyId" select="*[@Code = 'Kind']/@SetID"/>
            </xsl:call-template>
          </xsl:if>
          <xsl:if test="@Code = 'G'">
            <xsl:variable name="GType">
              <xsl:call-template name="Value">
                <xsl:with-param name="x" select="'Governance_Code'"/>
              </xsl:call-template>
            </xsl:variable>
            <xsl:choose>
              <xsl:when test="$GType = '007001001003' or $GType = '007001000000'">
                <subj:other>
                  <xsl:call-template name="EGRNGoverContactInfo"/>
                  <subj:name>
                    <xsl:call-template name="Value">
                      <xsl:with-param name="x" select="'Organization'"/>
                      <xsl:with-param name="list" select="'Organization'"/>
                    </xsl:call-template>
                  </subj:name>
                  <xsl:call-template name="EN">
                    <xsl:with-param name="Page" select="'-'"/>
                    <xsl:with-param name="Section" select="'-'"/>
                    <xsl:with-param name="Param" select="'INNJ'"/>
                    <xsl:with-param name="AltName" select="'subj:inn'"/>
                    <xsl:with-param name="List" select="'Organization'"/>
                  </xsl:call-template>
                  <xsl:call-template name="EN">
                    <xsl:with-param name="Page" select="'-'"/>
                    <xsl:with-param name="Section" select="'-'"/>
                    <xsl:with-param name="Param" select="'OGRN'"/>
                    <xsl:with-param name="AltName" select="'subj:ogrn'"/>
                    <xsl:with-param name="List" select="'Organization'"/>
                  </xsl:call-template>
                </subj:other>
              </xsl:when>
              <xsl:when test="$GType = '007001001001'">
                <subj:country>
                  <xsl:call-template name="EGRNGoverContactInfo"/>
                  <subj:countryCode>848000000643</subj:countryCode>
                </subj:country>
              </xsl:when>
              <xsl:when test="$GType = '007001001002'">
                <subj:rfSubject>
                  <xsl:call-template name="EGRNGoverContactInfo"/>
                  <subj:subjectCode>
                    <xsl:value-of select="$Region"/>
                  </subj:subjectCode>
                </subj:rfSubject>
              </xsl:when>
            </xsl:choose>
            <subj:declarantKind>
              <xsl:choose>
                <xsl:when test="$CodeReg = 'nwz' or $CodeReg = 'nwh'">
                  <xsl:value-of select="'357100000001'"/>
                </xsl:when>
                <xsl:when test="$CodeReg = 'exz' or $CodeReg = 'ext' or $CodeReg = 'exh' or $CodeReg = 'exs' or $CodeReg = 'exr'">
                  <xsl:value-of select="$declarant_kind"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="'357100000001'"/>
                </xsl:otherwise>
              </xsl:choose>
            </subj:declarantKind>
            <xsl:call-template name="EGRNRepresentative">
              <xsl:with-param name="declarantKind">357100000001</xsl:with-param>
              <xsl:with-param name="PowerOfAttorneyId" select="*[@Code = 'Kind']/@SetID"/>
            </xsl:call-template>
          </xsl:if>
        </xsl:for-each>
        <!-- Гос.орган -->
        <!--xsl:if test="$Declarant = 'M' and $JFSender = 'F'"> <xsl:call-template name="EGRNPersonM"/> <subj:declarantKind> <xsl:choose> <xsl:when test="$CodeReg = 'nwz' or $CodeReg = 'nwh'"> <xsl:value-of select="'357100000001'"/> </xsl:when> <xsl:when test="$CodeReg='exz' or $CodeReg='ext' or $CodeReg='exh' or $CodeReg='exs' or $CodeReg='exr'"> <xsl:value-of select="$declarant_kind"/> </xsl:when> <xsl:otherwise> <xsl:value-of select="'357100000001'"/> </xsl:otherwise> </xsl:choose> </subj:declarantKind> </xsl:if-->
        <!--<xsl:if test="$Declarant = 'M' and $JFSender = 'J'"> <subj:organization> <xsl:variable name="Email"> <xsl:call-template name="Value"> <xsl:with-param name="x" select="'Email'"/> <xsl:with-param name="list" select="'Organization'"/> </xsl:call-template> </xsl:variable> <xsl:variable name="Telephone"> <xsl:call-template name="Value"> <xsl:with-param name="x" select="'Phone'"/> <xsl:with-param name="list" select="'Organization'"/> </xsl:call-template> </xsl:variable> <xsl:if test="$Email != '' or $Phone != ''"> <subj:contactInfo> <xsl:if test="$Telephone != ''"> <subj:phoneNumber> <xsl:choose> <xsl:when test="contains( $Telephone,'+')"> <xsl:value-of select="$Telephone"/> </xsl:when> <xsl:otherwise>+70</xsl:otherwise> </xsl:choose> </subj:phoneNumber> </xsl:if> <xsl:if test="$Email != '' and not(contains($Email, '@technokad.rosreestr.ru'))"> <subj:email> <xsl:value-of select="$Email"/> </subj:email> </xsl:if> </subj:contactInfo> </xsl:if> <subj:name> <xsl:value-of select="$Organization"/> </subj:name> <subj:kpp> <xsl:value-of select="$KPP"/> <xsl:if test="$KPP = ''">000000001</xsl:if> </subj:kpp> <subj:nativeForeignParams> <subj:nativeOrgParams> <subj:ogrn> <xsl:variable name="orgOGRN"> <xsl:value-of select="$OGRN"/> </xsl:variable> <xsl:value-of select="$orgOGRN"/> <xsl:if test="$orgOGRN = ''">1000000000000</xsl:if> </subj:ogrn> <subj:inn> <xsl:variable name="orgINN"> <xsl:value-of select="$INNJ"/> </xsl:variable> <xsl:value-of select="$orgINN"/> <xsl:if test="$orgINN = ''">0000000001</xsl:if> </subj:inn> <subj:regDate> <xsl:variable name="orgRegDate"> <xsl:value-of select="$RegDate"/> </xsl:variable> <xsl:value-of select="$orgRegDate"/> <xsl:if test="$orgRegDate = ''">1001-01-01</xsl:if> </subj:regDate> </subj:nativeOrgParams> </subj:nativeForeignParams> </subj:organization> <subj:declarantKind> <xsl:choose> <xsl:when test="$CodeReg = 'nwz' or $CodeReg = 'nwh'"> <xsl:value-of select="'357100000004'"/> </xsl:when> <xsl:when test="$CodeReg='exz' or $CodeReg='ext' or $CodeReg='exh' or $CodeReg='exs' or $CodeReg='exr'"> <xsl:value-of select="$declarant_kind"/> </xsl:when> <xsl:otherwise> <xsl:value-of select="'357100000004'"/> </xsl:otherwise> </xsl:choose> </subj:declarantKind> <subj:representative> <subj:subject _id="902"> <xsl:call-template name="EGRNPersonM"/> <subj:declarantKind> <xsl:choose> <xsl:when test="$CodeReg='exz' or $CodeReg='ext' or $CodeReg='exh' or $CodeReg='exs' or $CodeReg='exr'"> <xsl:for-each select="//Form[@Code='Request']/Page[@Code='Declarants']/*[@Code='Declarant']/*[@Selected='true']"> <xsl:call-template name="Value"> <xsl:with-param name="x" select="'declarant_kind'"/> </xsl:call-template> </xsl:for-each> </xsl:when> <xsl:otherwise>357100000004</xsl:otherwise> </xsl:choose> </subj:declarantKind> </subj:subject> <subj:representativeDocumentRef documentID="903"/> </subj:representative> </xsl:if>-->
      </subj:subject>
      <subj:representativeDocumentRef>
        <xsl:attribute name="documentID">
          <xsl:if test="$PowerOfAttorneyId = ''">903</xsl:if>
          <xsl:value-of select="$PowerOfAttorneyId"/>
        </xsl:attribute>
      </subj:representativeDocumentRef>
    </subj:representative>
  </xsl:template>
  <xsl:template name="EGRNPerson" xmlns:subj="http://rosreestr.ru/services/v0.1/commons/Subjects" xmlns:address="http://rosreestr.ru/services/v0.1/commons/Address">
    <xsl:param name="id"/>
    <subj:person>
      <xsl:variable name="Email">
        <xsl:call-template name="Value">
          <xsl:with-param name="x" select="'Email'"/>
          <xsl:with-param name="list" select="'Person'"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:variable name="Telephone">
        <xsl:call-template name="Value">
          <xsl:with-param name="x" select="'Phone'"/>
          <xsl:with-param name="list" select="'Person'"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:if test="$Email != '' or $Telephone != ''">
        <subj:contactInfo>
          <xsl:if test="$Telephone != ''">
            <subj:phoneNumber>
              <xsl:choose>
                <xsl:when test="contains($Telephone, '+')">
                  <xsl:call-template name="PhoneFormat">
                    <xsl:with-param name="originalPhone" select="$Telephone"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>+70</xsl:otherwise>
              </xsl:choose>
            </subj:phoneNumber>
          </xsl:if>
          <xsl:if test="$Email != '' and not(contains($Email, '@technokad.rosreestr.ru'))">
            <subj:email>
              <xsl:value-of select="$Email"/>
            </subj:email>
          </xsl:if>
        </subj:contactInfo>
      </xsl:if>
      <xsl:call-template name="EN">
        <xsl:with-param name="Page" select="'-'"/>
        <xsl:with-param name="Section" select="'-'"/>
        <xsl:with-param name="List" select="'Person'"/>
        <xsl:with-param name="Param" select="'FIO1'"/>
        <xsl:with-param name="AltName" select="'subj:surname'"/>
      </xsl:call-template>
      <xsl:call-template name="EN">
        <xsl:with-param name="Page" select="'-'"/>
        <xsl:with-param name="Section" select="'-'"/>
        <xsl:with-param name="List" select="'Person'"/>
        <xsl:with-param name="Param" select="'FIO2'"/>
        <xsl:with-param name="AltName" select="'subj:firstname'"/>
      </xsl:call-template>
      <xsl:call-template name="EN">
        <xsl:with-param name="Page" select="'-'"/>
        <xsl:with-param name="Section" select="'-'"/>
        <xsl:with-param name="List" select="'Person'"/>
        <xsl:with-param name="Param" select="'FIO3'"/>
        <xsl:with-param name="AltName" select="'subj:patronymic'"/>
      </xsl:call-template>
      <xsl:call-template name="EO">
        <xsl:with-param name="Page" select="'-'"/>
        <xsl:with-param name="Section" select="'-'"/>
        <xsl:with-param name="Param" select="'DateBirth'"/>
        <xsl:with-param name="AltName" select="'subj:birthDate'"/>
      </xsl:call-template>
      <xsl:call-template name="EO">
        <xsl:with-param name="Page" select="'-'"/>
        <xsl:with-param name="Section" select="'-'"/>
        <xsl:with-param name="Param" select="'Place_Birth'"/>
        <xsl:with-param name="AltName" select="'subj:birthPlace'"/>
      </xsl:call-template>
      <subj:idDocumentRef>
        <xsl:attribute name="documentID">
          <xsl:value-of select="$id"/>
        </xsl:attribute>
      </subj:idDocumentRef>
      <xsl:if test="ParamSelectList[@Code = 'Address']/Item">
        <subj:address>
          <xsl:call-template name="EGRNAddress">
            <xsl:with-param name="CodeDoc">VersionRequest</xsl:with-param>
          </xsl:call-template>
        </subj:address>
      </xsl:if>
      <xsl:variable name="SNILS2">
        <xsl:call-template name="Value">
          <xsl:with-param name="x" select="'SNILS'"/>
          <xsl:with-param name="list" select="'Person'"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:if test="$SNILS2 != ''">
        <subj:snils>
          <xsl:value-of select="concat(substring($SNILS2, 1, 3), substring($SNILS2, 5, 3), substring($SNILS2, 9, 3), substring($SNILS2, 13, 2))"/>
        </subj:snils>
      </xsl:if>
    </subj:person>
  </xsl:template>
  <xsl:template name="PhoneFormat">
    <xsl:param name="originalPhone"/>
    <xsl:value-of select="normalize-space(translate($originalPhone, '()&lt;&gt;&quot;:*?|\/-_ ', ''))"/>
  </xsl:template>
</xsl:stylesheet>
