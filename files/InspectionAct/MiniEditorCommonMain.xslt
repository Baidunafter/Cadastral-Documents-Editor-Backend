<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:import href="Dictionary.xslt"/>
  <xsl:import href="PrintSpec.xslt"/>
  <xsl:import href="Functions.xslt"/>

  <xsl:template name="Dicts">
    <xsl:param name="dict"/>
    <xsl:param name="code"/>
    <xsl:param name="return_code"/>
    <xsl:choose>
      <xsl:when test="$dict!='' and $code!=''">
        <xsl:variable name="BcodeB">
          <xsl:text>|</xsl:text>
          <xsl:value-of select="$code"/>
          <xsl:text>|</xsl:text>
        </xsl:variable>
        <xsl:variable name="DcodeD" select="substring-before(substring-after($dict,$BcodeB),'|')"/>
        <xsl:choose>
          <xsl:when test="$DcodeD!=''">
            <xsl:value-of select="$DcodeD"/>
          </xsl:when>
          <xsl:when test="$return_code!=''">
            <xsl:value-of select="$code"/>
          </xsl:when>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text></xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template name="ConvertFromKladr">
    <xsl:param name="value"/>
    <!-- код для преобразования -->

    <!-- название шаблона словаря -->
    <xsl:param name="level"/>
    <!-- исходная версия схемы -->
    <xsl:param name="CodeDoc"/>
    <!-- желаемая версия схемы -->
    <xsl:variable name="dict">
      <xsl:call-template name="dFromKladrConvert"/>
    </xsl:variable>
    <!-- выделение нужного нам модуля -->
    <xsl:variable name="codein">
      <!-- код в формате '|номер регламента|код'  -->
      <xsl:text>|</xsl:text>
      <xsl:choose>
        <xsl:when test="substring-after($level,':')!=''">
          <xsl:value-of select="substring-after($level,':')"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$level"/>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:text>|</xsl:text>
      <xsl:value-of select="$value"/>
    </xsl:variable>
    <xsl:variable name="codein2">
      <!-- код в формате '|номер регламента|код'  -->
      <xsl:value-of select="$codein"/>
      <xsl:text>|</xsl:text>
    </xsl:variable>
    <xsl:variable name="pre_codeout">
      <xsl:text>|</xsl:text>
      <xsl:value-of select="$CodeDoc"/>
      <xsl:text>_</xsl:text>
      <xsl:value-of select="//Page[@Code='Versions']/*/*/Param[@Code=$CodeDoc]"/>
      <xsl:text>|</xsl:text>
    </xsl:variable>
    <xsl:variable name="codeout">
      <xsl:choose>
        <xsl:when test="$pre_codeout='|VersionReestr_1.16|'">|SubSchemas_|</xsl:when>
        <xsl:when test="$pre_codeout='|VersionRequest_1.03|'">|SubSchemas_|</xsl:when>
        <xsl:when test="$pre_codeout='|VersionZoneToGKN_03|'">|SchemaCommon_|</xsl:when>
        <xsl:when test="$pre_codeout='|VersionKaisToGKN_03|'">|SchemaCommon_|</xsl:when>
        <xsl:when test="$pre_codeout='|VersionStatementGRP_01|'">|VersionRequest_01|</xsl:when>
        <xsl:when test="$pre_codeout='|VersionStatementGRP_ЕГРН 01|'">|VersionRequest_01|</xsl:when>
        <xsl:when test="$pre_codeout='|VersionRequest_3.09|'">|VersionRequest_01|</xsl:when>
        <xsl:when test="$pre_codeout='|VersionReestr_06|'">|VersionRequest_18|</xsl:when>
        <xsl:when test="$pre_codeout='|VersionZoneToGKN_05|'">|VersionZoneToGKN_05|</xsl:when>
        <xsl:when test="$pre_codeout='|VersionReestr_2.00|'">|VersionReestr_2.00|</xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$pre_codeout"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$dict!='' and $value!='' and $CodeDoc!='' and (substring-after($dict,$codein)!='' or substring-before($dict,$codein)!='')">
        <xsl:variable name="block">
          <!-- поиск блока данных содержащий переданный код -->
          <xsl:call-template name="while">
            <xsl:with-param name="code" select="$codein"/>
            <!-- передаваемый код в формате '|номер версии|код'  -->
            <xsl:with-param name="string" select="$dict"/>
            <!-- исходная строка словаря -->
          </xsl:call-template>
        </xsl:variable>
        <xsl:choose>
          <xsl:when test="substring-before(substring-after($block,$codeout),'|')='-'">
            <xsl:value-of select="$value"/>
          </xsl:when>
          <xsl:when test="$block=$codein or $block=$codein2">
            <xsl:value-of select="$value"/>
          </xsl:when>
          <xsl:when test="substring-before(substring-after($block,$codeout),'|')=''">
            <xsl:value-of select="$value"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="substring-before(substring-after($block,$codeout),'|')"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$value"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template name="ConvertToKladr">
    <xsl:param name="value"/>
    <!-- код для преобразования -->
    <!-- название шаблона словаря -->
    <xsl:param name="level"/>
    <!-- исходная версия схемы -->
    <xsl:param name="CodeDoc"/>
    <!-- желаемая версия схемы -->
    <!-- выделение нужного нам модуля -->
    <xsl:variable name="dict">
      <xsl:call-template name="dToKladrConvert"/>
    </xsl:variable>
    <xsl:variable name="codein">
      <!-- код в формате '|номер регламента|код'  -->
      <xsl:text>|</xsl:text>
      <xsl:value-of select="$CodeDoc"/>
      <xsl:text>|</xsl:text>
      <xsl:value-of select="$value"/>
    </xsl:variable>

    <xsl:variable name="codein2">
      <!-- код в формате '|номер регламента|код'  -->
      <xsl:text>|</xsl:text>
      <xsl:choose>
        <xsl:when test="substring-after($level,':')!=''">
          <xsl:value-of select="substring-after($level,':')"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$level"/>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:text>|</xsl:text>
      <xsl:value-of select="$value"/>
    </xsl:variable>
    <xsl:variable name="codeout">
      <xsl:text>|</xsl:text>
      <xsl:choose>
        <xsl:when test="substring-after($level,':')!=''">
          <xsl:value-of select="substring-after($level,':')"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$level"/>
        </xsl:otherwise>
      </xsl:choose>

      <xsl:text>|</xsl:text>
    </xsl:variable>
    <xsl:choose>
      <!--xsl:when test="$in=$out">
        <xsl:value-of select="$x"/>
      </xsl:when-->
      <xsl:when test="$dict!='' and $value!='' and substring-before($dict,$codein2)='' and (substring-after($dict,$codein)!='' or substring-before($dict,$codein)!='')">

        <xsl:variable name="block">
          <!-- поиск блока данных содержащий переданный код -->
          <xsl:call-template name="while">
            <xsl:with-param name="level" select="$level"/>
            <xsl:with-param name="code" select="$codein"/>
            <!-- передаваемый код в формате '|номер версии|код'  -->
            <xsl:with-param name="string" select="$dict"/>
            <!-- исходная строка словаря -->
          </xsl:call-template>
        </xsl:variable>
        <xsl:choose>
          <xsl:when test="substring-before(substring-after($block,$codeout),'|')='-'">
            <xsl:value-of select="$value"/>
          </xsl:when>
          <xsl:when test="$block=$codein">
            <xsl:value-of select="$value"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="substring-before(substring-after($block,$codeout),'|')"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$value"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!-- Преобразование словарей между разными версиями схем -->
  <xsl:template name="while">
    <xsl:param name="level"/>
    <xsl:param name="code"/>
    <!-- передаваемый код в формате '|номер версии|код'  -->
    <xsl:param name="string"/>
    <!-- строка по которой осуществляется проход по блокам. В каждом цикле сдвиг на 1 блок -->
    <xsl:variable name="newstr">
      <!-- выделяем строку после начального кода словаря -->
      <xsl:value-of select="substring-after($string,'*')"/>
    </xsl:variable>
    <xsl:variable name="strbeforecode">
      <!-- после этого выделяем из строки newstr, идущую до переданного кода -->
      <xsl:value-of select="substring-before($newstr,$code)"/>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="substring-before($strbeforecode,'*')!='' and (substring-before($strbeforecode,$level)!='' or $level='')">
        <!-- если строка strbeforecode имеет один или несколько блоков, содержащих *, то осуществляем сдвиг к следующему блоку -->
        <xsl:call-template name="while">
          <xsl:with-param name="code" select="$code"/>
          <xsl:with-param name="string" select="$newstr"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$strbeforecode='' and not(contains($newstr,$code))">
        <xsl:value-of select="$code"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="substring-before($newstr,'#')"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template name="AddFileReference">
    <xsl:param name="CodeDoc"/>
    <xsl:param name="AddFilesFolder"/>
    <xsl:variable name="ID" select="@SetID"/>
    <xsl:variable name="Type" select="@SetType"/>
    <xsl:variable name="Name" select="@SetName"/>
    <xsl:choose>
      <xsl:when test="$AddFilesFolder=''"></xsl:when>
      <xsl:when test="$AddFilesFolder='Files'">
        <xsl:value-of select="$AddFilesFolder"/>
        <xsl:text>/</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$AddFilesFolder"/>
        <xsl:text>\</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="$Name!=''">
        <xsl:value-of select="$Name"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="OurFilePrefix">
          <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
        </xsl:call-template>
        <xsl:variable name="Code">
          <xsl:choose>
            <xsl:when test="$CodeDoc='TerritoryToGKN'">
              <xsl:value-of select="'Territory'"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$CodeDoc"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <xsl:for-each select="//Form[@Selected='true']/Page/*[@Selected='true']/*[not(@Selected='false')]/ParamFile[.!='' and contains(@Code,$Code)]">
          <xsl:if test="@SetID = $ID">
            <xsl:value-of select="position()"/>
          </xsl:if>
        </xsl:for-each>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="$Type!=''">
      <xsl:text>.</xsl:text>
      <xsl:value-of select="$Type"/>
    </xsl:if>
  </xsl:template>

  <xsl:template name="OLD_AddFileReference">
    <xsl:param name="CodeDoc"/>
    <xsl:param name="AddFilesFolder"/>
    <xsl:variable name="ID" select="@SetID"/>
    <xsl:variable name="Type" select="@SetType"/>
    <xsl:choose>
      <xsl:when test="$AddFilesFolder=''"></xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$AddFilesFolder"/>
        <xsl:text>\</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:call-template name="OurFilePrefix">
      <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
    </xsl:call-template>
    <xsl:for-each select="//Form[@Selected='true']/Page/*[@Selected='true']/*[not(@Selected='false')]/ParamFile[.!='' and contains(@Code,$CodeDoc)]">
      <xsl:if test="@SetID = $ID">
        <xsl:value-of select="position()"/>
      </xsl:if>
    </xsl:for-each>
    <xsl:if test="$Type!=''">
      <xsl:text>.</xsl:text>
      <xsl:value-of select="$Type"/>
    </xsl:if>
  </xsl:template>

  <xsl:template name="OurFilePrefix">
    <xsl:param name="CodeDoc"/>
    <xsl:choose>
      <xsl:when test="$CodeDoc='Request'">
        <xsl:text>RFile</xsl:text>
      </xsl:when>
      <xsl:when test="$CodeDoc='MP'">
        <xsl:text>MFile</xsl:text>
      </xsl:when>
      <xsl:when test="$CodeDoc='Act'">
        <xsl:text>SFile</xsl:text>
      </xsl:when>
      <xsl:when test="($CodeDoc='TP' or $CodeDoc='Building' or $CodeDoc='Construction' or $CodeDoc='Uncompleted' or $CodeDoc='Flat') or $CodeDoc='OldTP'">
        <xsl:text>TFile</xsl:text>
      </xsl:when>
      <xsl:when test="$CodeDoc='Application'">
        <xsl:text>AFile</xsl:text>
      </xsl:when>
      <xsl:when test="$CodeDoc='Zone'">
        <xsl:text>PFile</xsl:text>
      </xsl:when>
      <xsl:otherwise>File</xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="Value-">
    <xsl:param name="x"/>
    <xsl:param name="list"/>
    <xsl:param name="ListCode"/>
    <xsl:param name="pos"/>
    <xsl:variable name="V">
      <xsl:call-template name="Value">
        <xsl:with-param name="x" select="$x"/>
        <xsl:with-param name="list" select="$list"/>
        <xsl:with-param name="ListCode" select="$ListCode"/>
        <xsl:with-param name="pos" select="$pos"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$V!=''">
        <xsl:value-of select="$V"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>-</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="Value">
    <xsl:param name="x"/>
    <xsl:param name="addx"/>
    <xsl:param name="list"/>
    <xsl:param name="ListCode"/>
    <xsl:param name="selnm"/>
    <xsl:choose>
      <xsl:when test="ParamSelectList[@ListName=$list and (@Code=$ListCode or $ListCode='')]">
        <xsl:variable name="id" select="*[@ListName=$list and (@Code=$ListCode or $ListCode='')]/Item/@id"/>
        <xsl:for-each select="../../../../../Lists/List[@Name=$list]/Items/Item[@id=$id][1]">
          <xsl:choose>
            <xsl:when test="ParamSelect[@Code=$x]/Param[@Selected='true']/@Code">
              <xsl:choose>
                <xsl:when test="$selnm='true'">
                  <xsl:value-of select="normalize-space(ParamSelect[@Code=$x]/Param[@Selected='true']/@Name)"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="normalize-space(ParamSelect[@Code=$x]/Param[@Selected='true']/@Code)"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:when>
            <xsl:when test="ParamList[@Code=$x]/Param">
              <xsl:for-each select="ParamList[@Code=$x]/Param">
                <xsl:value-of select="normalize-space(.)"/>
                <xsl:text>|</xsl:text>
              </xsl:for-each>
            </xsl:when>
            <xsl:when test="*[local-name()='ParamAddress' or local-name()='ParamInfoF' or local-name()='ParamInfoJ']/*[local-name()='Param' or local-name()='ParamDate'][@Code=$x]">
              <xsl:value-of select="normalize-space(*[local-name()='ParamAddress' or local-name()='ParamInfoF' or local-name()='ParamInfoJ']/*[local-name()='Param' or local-name()='ParamDate'][@Code=$x])"/>
            </xsl:when>
            <xsl:when test="*[local-name()='ParamInfoF' or local-name()='ParamInfoJ']/ParamSelect[@Code=$x]">
              <xsl:choose>
                <xsl:when test="$selnm='true'">
                  <xsl:value-of select="normalize-space(*[local-name()='ParamInfoF' or local-name()='ParamInfoJ']/ParamSelect[@Code=$x]/Param[@Selected='true']/@Name)"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="normalize-space(*[local-name()='ParamInfoF' or local-name()='ParamInfoJ']/ParamSelect[@Code=$x]/Param[@Selected='true']/@Code)"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="normalize-space(*[@Code=$x])"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:for-each>
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="ParamSelect[@Code=$x]/Param[@Selected='true']/@Code">
            <xsl:choose>
              <xsl:when test="$selnm='true'">
                <xsl:value-of select="normalize-space(ParamSelect[@Code=$x]/Param[@Selected='true']/@Name)"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="normalize-space(ParamSelect[@Code=$x]/Param[@Selected='true']/@Code)"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:when>
          <xsl:when test="ParamList[@Code=$x]/Param">
            <xsl:for-each select="ParamList[@Code=$x]/Param">
              <xsl:value-of select="normalize-space(.)"/>
              <xsl:text>|</xsl:text>
            </xsl:for-each>
          </xsl:when>
          <xsl:when test="ParamAddress/Param[@Code=$x]">
            <xsl:value-of select="normalize-space(ParamAddress/Param[@Code=$x])"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="normalize-space(*[@Code=$x and (not(@CodeAdd) or @CodeAdd=$addx or $addx='')])"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="EN">
    <xsl:param name="Page"/>
    <xsl:param name="Section"/>
    <xsl:param name="Param"/>
    <xsl:param name="AltName"/>
    <xsl:param name="AltValue"/>
    <xsl:param name="ParamPart"/>
    <xsl:param name="Separator"/>
    <xsl:param name="List"/>
    <xsl:param name="ListCode"/>
    <xsl:param name="FilePrefix"/>
    <xsl:param name="AddFilesFolder"/>
    <xsl:param name="SelectName"/>
    <xsl:call-template name="ElementAttribute">
      <xsl:with-param name="AE_ON" select="'EN'"/>
      <xsl:with-param name="Page" select="$Page"/>
      <xsl:with-param name="Section" select="$Section"/>
      <xsl:with-param name="List" select="$List"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="Param" select="$Param"/>
      <xsl:with-param name="AltName" select="$AltName"/>
      <xsl:with-param name="AltValue" select="$AltValue"/>
      <xsl:with-param name="ParamPart" select="$ParamPart"/>
      <xsl:with-param name="Separator" select="$Separator"/>
      <xsl:with-param name="FilePrefix" select="$FilePrefix"/>
      <xsl:with-param name="AddFilesFolder" select="$AddFilesFolder"/>
      <xsl:with-param name="SelectName" select="$SelectName"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="EO">
    <xsl:param name="Page"/>
    <xsl:param name="Section"/>
    <xsl:param name="Param"/>
    <xsl:param name="AltName"/>
    <xsl:param name="AltValue"/>
    <xsl:param name="ParamPart"/>
    <xsl:param name="Separator"/>
    <xsl:param name="List"/>
    <xsl:param name="ListCode"/>
    <xsl:param name="FilePrefix"/>
    <xsl:param name="AddFilesFolder"/>
    <xsl:param name="SelectName"/>
    <xsl:call-template name="ElementAttribute">
      <xsl:with-param name="AE_ON" select="'EO'"/>
      <xsl:with-param name="Page" select="$Page"/>
      <xsl:with-param name="Section" select="$Section"/>
      <xsl:with-param name="List" select="$List"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="Param" select="$Param"/>
      <xsl:with-param name="AltName" select="$AltName"/>
      <xsl:with-param name="AltValue" select="$AltValue"/>
      <xsl:with-param name="ParamPart" select="$ParamPart"/>
      <xsl:with-param name="Separator" select="$Separator"/>
      <xsl:with-param name="FilePrefix" select="$FilePrefix"/>
      <xsl:with-param name="AddFilesFolder" select="$AddFilesFolder"/>
      <xsl:with-param name="SelectName" select="$SelectName"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="AN">
    <xsl:param name="Page"/>
    <xsl:param name="Section"/>
    <xsl:param name="Param"/>
    <xsl:param name="AltName"/>
    <xsl:param name="AltValue"/>
    <xsl:param name="ParamPart"/>
    <xsl:param name="Separator"/>
    <xsl:param name="List"/>
    <xsl:param name="ListCode"/>
    <xsl:param name="FilePrefix"/>
    <xsl:param name="AddFilesFolder"/>
    <xsl:param name="SelectName"/>
    <xsl:call-template name="ElementAttribute">
      <xsl:with-param name="AE_ON" select="'AN'"/>
      <xsl:with-param name="Page" select="$Page"/>
      <xsl:with-param name="Section" select="$Section"/>
      <xsl:with-param name="List" select="$List"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="Param" select="$Param"/>
      <xsl:with-param name="AltName" select="$AltName"/>
      <xsl:with-param name="AltValue" select="$AltValue"/>
      <xsl:with-param name="ParamPart" select="$ParamPart"/>
      <xsl:with-param name="Separator" select="$Separator"/>
      <xsl:with-param name="FilePrefix" select="$FilePrefix"/>
      <xsl:with-param name="AddFilesFolder" select="$AddFilesFolder"/>
      <xsl:with-param name="SelectName" select="$SelectName"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="AO">
    <xsl:param name="Page"/>
    <xsl:param name="Section"/>
    <xsl:param name="Param"/>
    <xsl:param name="AltName"/>
    <xsl:param name="AltValue"/>
    <xsl:param name="ParamPart"/>
    <xsl:param name="Separator"/>
    <xsl:param name="List"/>
    <xsl:param name="ListCode"/>
    <xsl:param name="FilePrefix"/>
    <xsl:param name="AddFilesFolder"/>
    <xsl:param name="SelectName"/>
    <xsl:call-template name="ElementAttribute">
      <xsl:with-param name="AE_ON" select="'AO'"/>
      <xsl:with-param name="Page" select="$Page"/>
      <xsl:with-param name="Section" select="$Section"/>
      <xsl:with-param name="List" select="$List"/>
      <xsl:with-param name="ListCode" select="$ListCode"/>
      <xsl:with-param name="Param" select="$Param"/>
      <xsl:with-param name="AltName" select="$AltName"/>
      <xsl:with-param name="AltValue" select="$AltValue"/>
      <xsl:with-param name="ParamPart" select="$ParamPart"/>
      <xsl:with-param name="Separator" select="$Separator"/>
      <xsl:with-param name="FilePrefix" select="$FilePrefix"/>
      <xsl:with-param name="AddFilesFolder" select="$AddFilesFolder"/>
      <xsl:with-param name="SelectName" select="$SelectName"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="ElementAttribute"
                xmlns:ki="urn://x-artefacts-rosreestr-ru/commons/complex-types/cadastral-engineer/1.0.2"
                xmlns:ki2="urn://x-artefacts-rosreestr-ru/commons/complex-types/cadastral-engineer/2.0.1"
                xmlns:fio="urn://x-artefacts-smev-gov-ru/supplementary/commons/1.0.1"
                xmlns:loc="urn://x-artefacts-rosreestr-ru/commons/complex-types/address-input/2.0.1"
                xmlns:loc3="urn://x-artefacts-rosreestr-ru/commons/complex-types/address-input/6.0.1"
                xmlns:org="urn://x-artefacts-rosreestr-ru/commons/complex-types/organization/3.0.1"
                xmlns:gov="urn://x-artefacts-rosreestr-ru/commons/complex-types/governance/3.0.1"
                xmlns:fl="urn://x-artefacts-rosreestr-ru/commons/complex-types/person/3.0.1"
                xmlns:doci="urn://x-artefacts-rosreestr-ru/commons/complex-types/document-info/3.1.1"
                xmlns:dcl="urn://x-artefacts-rosreestr-ru/commons/complex-types/sender/2.0.1"
                xmlns:loc2="urn://x-artefacts-rosreestr-ru/commons/complex-types/address-input/4.0.1"
                xmlns:doc2="urn://x-artefacts-rosreestr-ru/commons/complex-types/document/4.0.3"
                xmlns:gkn="urn://x-artefacts-rosreestr-gov-ru/requests/gkn/3.0.9"
                xmlns:muns="urn://x-artefacts-rosreestr-ru/commons/complex-types/municipal-service/1.0.1"
                xmlns:forg="urn://x-artefacts-rosreestr-ru/commons/complex-types/foreign-organization/1.0.2"
                xmlns:pay="urn://x-artefacts-rosreestr-ru/commons/complex-types/pay-document/1.1.2"
                xmlns:org2="urn://x-artefacts-rosreestr-ru/commons/complex-types/organization/2.0.1"
                xmlns:gen="urn://x-artefacts-rosreestr-ru/commons/complex-types/general-gkn/1.0.2"
                xmlns:qua="urn://x-artefacts-rosreestr-ru/commons/complex-types/quantity/1.0.1"
                xmlns:del="urn://x-artefacts-rosreestr-ru/commons/complex-types/delivery/1.1.1"
                xmlns:gov2="urn://x-artefacts-rosreestr-ru/commons/complex-types/governance/2.0.1"
                xmlns:fl2="urn://x-artefacts-rosreestr-ru/commons/complex-types/person/2.0.1"
                xmlns:org3="urn://x-artefacts-rosreestr-ru/commons/complex-types/organization/4.0.1"
                xmlns:fl3="urn://x-artefacts-rosreestr-ru/commons/complex-types/person/5.0.2"
                xmlns:gov3="urn://x-artefacts-rosreestr-ru/commons/complex-types/governance/5.0.1"
                xmlns:doci2="urn://x-artefacts-rosreestr-ru/commons/complex-types/document-info/5.0.1"
                xmlns:dcl2="urn://x-artefacts-rosreestr-ru/commons/complex-types/sender/5.0.1"
                xmlns:ki3="urn://x-artefacts-rosreestr-ru/commons/complex-types/cadastral-engineer/4.1.1"
                xmlns:statementgrp="urn://x-artefacts-rosreestr-gov-ru/statement/grp/1.0.1"
                xmlns:changegrp="urn://x-artefacts-rosreestr-gov-ru/statement/change-grp/1.0.1"
                xmlns:egrnrequest="http://rosreestr.ru/services/v0.18/TStatementRequestEGRN"
                xmlns:docp="urn://x-artefacts-rosreestr-ru/commons/complex-types/pay-document/1.0.2"
                xmlns:rght="urn://x-artefacts-rosreestr-ru/commons/directories/rights/1.0.1"
                xmlns:rec="urn://x-artefacts-rosreestr-ru/commons/complex-types/general-grp/1.0.1"
                xmlns:obj="urn://x-artefacts-rosreestr-ru/commons/complex-types/object-grp/1.0.1"
                xmlns:doc3="urn://x-artefacts-rosreestr-ru/commons/complex-types/document/4.0.1"
                xmlns:ntr="urn://x-artefacts-rosreestr-ru/commons/complex-types/notary/1.0.1"
                xmlns:ki6="urn://x-artefacts-rosreestr-ru/commons/complex-types/cadastral-engineer/6.0.1"
                xmlns:tObj="http://rosreestr.ru/cadastral-engineer/6.0.1"
                xmlns:address="http://rosreestr.ru/services/v0.1/commons/Address"
                xmlns:tObjE="http://rosreestr.ru/services/v0.1/commons/TObject"
                xmlns:subj="http://rosreestr.ru/services/v0.1/commons/Subjects"
                xmlns:statement="http://rosreestr.ru/services/v0.18/TStatement"
                xmlns:docs="http://rosreestr.ru/services/v0.1/commons/Documents"
                xmlns:stCom="http://rosreestr.ru/services/v0.1/TStatementCommons"
                xmlns:commons="http://rosreestr.ru/services/v0.1/commons/Commons"
                xmlns:suspensiongrp1="urn://x-artefacts-rosreestr-gov-ru/statement/suspension-grp/1.0.1"
                 >

    <xsl:param name="AE_ON"/>
    <!-- Коды Code из MiniEditor: Page - страница (Page), Section - раздел (Simple, Multi, Alt), Param - параметр (Param и др.); 
    если template применяется внутри Form, указаваются Page и Section (могут быть пустыми для параметров с уникальными кодами); 
    если template применяется внутри цикла Page/*/Section, то Page или Section должны иметь значение "-" -->
    <xsl:param name="Page"/>
    <xsl:param name="Section"/>
    <xsl:param name="Param"/>
    <!-- Наименование элемента или атрибута, если оно не совпадает с Param в MiniEditor -->
    <xsl:param name="AltName"/>
    <!-- Заглушка для обязательных атрибутов -->
    <xsl:param name="AltValue"/>
    <!-- Если значение разделено на части знаками Separator, можно выбрать часть значения по номером ParamPart -->
    <xsl:param name="ParamPart"/>
    <xsl:param name="Separator"/>
    <!-- Для ParamSelectList: List - ListName; ListCode - Code; Param - Code для параметра ParamSelectList -->
    <xsl:param name="List"/>
    <xsl:param name="ListCode"/>
    <!-- Для ParamFile -->
    <xsl:param name="FilePrefix"/>
    <xsl:param name="AddFilesFolder"/>
    <!-- Для ParamSelect - если true, то в качестве значений выбираются имена Name, а не коды Code -->
    <xsl:param name="SelectName"/>
    <xsl:variable name="Test0">
      <xsl:for-each select="(Page[$Page!='-' or $Section!='-'][($Page='' or @Code=$Page)]/*[($Section='' or @Code=$Section) and @Selected='true']/Section[not(@Selected='false')])|self::node()[$Page='-' and $Section='-']">
        <xsl:choose>
          <xsl:when test="ParamFile[@Code=concat($FilePrefix,$Param) and .!='']">
            <xsl:for-each select="ParamFile[@Code=concat($FilePrefix,$Param) and .!='']">
              <xsl:call-template name="AddFileReference">
                <xsl:with-param name="AddFilesFolder" select="$AddFilesFolder"/>
                <xsl:with-param name="CodeDoc" select="$FilePrefix"/>
              </xsl:call-template>
            </xsl:for-each>
          </xsl:when>
          <xsl:when test="$ParamPart!='' and $Separator!=''">
            <xsl:call-template name="PartValue">
              <xsl:with-param name="Part" select="$ParamPart"/>
              <xsl:with-param name="Separator" select="$Separator"/>
              <xsl:with-param name="Value">
                <xsl:call-template name="Value">
                  <xsl:with-param name="x" select="concat($FilePrefix,$Param)"/>
                  <xsl:with-param name="list" select="$List"/>
                  <xsl:with-param name="ListCode" select="$ListCode"/>
                  <xsl:with-param name="selnm" select="$SelectName"/>
                </xsl:call-template>
              </xsl:with-param>
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="Value">
              <xsl:with-param name="x" select="concat($FilePrefix,$Param)"/>
              <xsl:with-param name="list" select="$List"/>
              <xsl:with-param name="ListCode" select="$ListCode"/>
              <xsl:with-param name="selnm" select="$SelectName"/>
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
    </xsl:variable>
    <xsl:variable name="Test">
      <xsl:choose>
        <xsl:when test="$Test0='' and $AltValue!=''">
          <xsl:value-of select="$AltValue"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$Test0"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$AltName!=''">
        <xsl:choose>
          <xsl:when test="$AE_ON='AO'">
            <xsl:attribute name="{$AltName}">
              <xsl:value-of select="$Test"/>
            </xsl:attribute>
          </xsl:when>
          <xsl:when test="$AE_ON='AN'">
            <xsl:if test="$Test!=''">
              <xsl:attribute name="{$AltName}">
                <xsl:value-of select="$Test"/>
              </xsl:attribute>
            </xsl:if>
          </xsl:when>
          <xsl:when test="$AE_ON='EO'">
            <xsl:element name="{$AltName}">
              <xsl:value-of select="$Test"/>
            </xsl:element>
          </xsl:when>
          <xsl:when test="$AE_ON='EN'">
            <xsl:if test="$Test!=''">
              <xsl:element name="{$AltName}">
                <xsl:value-of select="$Test"/>
              </xsl:element>
            </xsl:if>
          </xsl:when>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="$AE_ON='AO'">
            <xsl:attribute name="{$Param}">
              <xsl:value-of select="$Test"/>
            </xsl:attribute>
          </xsl:when>
          <xsl:when test="$AE_ON='AN'">
            <xsl:if test="$Test!=''">
              <xsl:attribute name="{$Param}">
                <xsl:value-of select="$Test"/>
              </xsl:attribute>
            </xsl:if>
          </xsl:when>
          <xsl:when test="$AE_ON='EO'">
            <xsl:element name="{$Param}">
              <xsl:value-of select="$Test"/>
            </xsl:element>
          </xsl:when>
          <xsl:when test="$AE_ON='EN'">
            <xsl:if test="$Test!=''">
              <xsl:element name="{$Param}">
                <xsl:value-of select="$Test"/>
              </xsl:element>
            </xsl:if>
          </xsl:when>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template name="EGRNAddressElement3"
    xmlns:address="http://rosreestr.ru/services/v0.1/commons/Address"
    >
    <xsl:param name="Page"/>
    <xsl:param name="Section"/>
    <xsl:param name="Param"/>
    <xsl:param name="AltName"/>
    <xsl:param name="Separator"/>
    <xsl:param name="List"/>
    <xsl:param name="ListCode"/>
    <xsl:param name="ReplaceType"/>
    <xsl:param name="CodeDoc"/>
    <xsl:param name="NoCodeElement"/>
    <xsl:param name="EmptyCode"/>
    <xsl:variable name="Test">
      <xsl:for-each select="(Page[$Page!='-' or $Section!='-'][($Page='' or @Code=$Page)]/*[($Section='' or @Code=$Section) and @Selected='true']/*[not(@Selected='false')])|.">
        <xsl:call-template name="Value">
          <xsl:with-param name="x" select="$Param"/>
          <xsl:with-param name="list" select="$List"/>
          <xsl:with-param name="ListCode" select="$ListCode"/>
        </xsl:call-template>
      </xsl:for-each>
    </xsl:variable>
    
    <xsl:if test="$Test!=''">
      <xsl:variable name="ElementName">
        <xsl:choose>
          <xsl:when test="$AltName!=''">
            <xsl:value-of select="$AltName"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$Param"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:variable name="Type">
        <xsl:call-template name="PartValue">
          <xsl:with-param name="Part" select="3"/>
          <xsl:with-param name="Separator" select="$Separator"/>
          <xsl:with-param name="Value" select="$Test"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:variable name="TypeA">
        <xsl:call-template name="ConvertFromKladr">
          <xsl:with-param name="value" select="$Type"/>
          <xsl:with-param name="level" select="$ElementName"/>
          <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:variable name="VersionDoc">
        <xsl:value-of select="//Page[@Code='Versions']/*/*/Param[@Code=$CodeDoc]"/>
      </xsl:variable>
      <xsl:element name="address:{$ElementName}">
        <xsl:if test="$NoCodeElement!='true'">
        <address:code>
          <xsl:call-template name="PartValue">
            <xsl:with-param name="Part" select="1"/>
            <xsl:with-param name="Separator" select="$Separator"/>
            <xsl:with-param name="Value" select="$Test"/>
            <xsl:with-param name="EmptyValue" select="$EmptyCode"/>
          </xsl:call-template>
        </address:code>
        </xsl:if>
        <address:type>
          <xsl:choose>
            <xsl:when test="$TypeA=''">
              <xsl:value-of select="$Type"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$TypeA"/>
            </xsl:otherwise>
          </xsl:choose>
        </address:type>
        <address:name>
          <xsl:call-template name="PartValue">
            <xsl:with-param name="Part" select="2"/>
            <xsl:with-param name="Separator" select="$Separator"/>
            <xsl:with-param name="Value" select="$Test"/>
          </xsl:call-template>
        </address:name>
      </xsl:element>
    </xsl:if>
  </xsl:template>
  <xsl:template name="AddressElement"
                xmlns:loc="urn://x-artefacts-rosreestr-ru/commons/complex-types/address-input/2.0.1"
                xmlns:loc2="urn://x-artefacts-rosreestr-ru/commons/complex-types/address-input/4.0.1"
                xmlns:loc3="urn://x-artefacts-rosreestr-ru/commons/complex-types/address-input/6.0.1"
                >
    <xsl:param name="Page"/>
    <xsl:param name="Section"/>
    <xsl:param name="Param"/>
    <xsl:param name="AltName"/>
    <xsl:param name="Attribute1"/>
    <xsl:param name="Attribute2"/>
    <xsl:param name="Separator"/>
    <xsl:param name="List"/>
    <xsl:param name="ListCode"/>
    <xsl:param name="ReplaceType"/>
    <xsl:param name="CodeDoc"/>
    <xsl:variable name="Test">
      <xsl:for-each select="(Page[$Page!='-' or $Section!='-'][($Page='' or @Code=$Page)]/*[($Section='' or @Code=$Section) and @Selected='true']/*[not(@Selected='false')])|.">
        <xsl:call-template name="Value">
          <xsl:with-param name="x" select="$Param"/>
          <xsl:with-param name="list" select="$List"/>
          <xsl:with-param name="ListCode" select="$ListCode"/>
        </xsl:call-template>
      </xsl:for-each>
    </xsl:variable>

    <xsl:if test="$Test!=''">
      <xsl:variable name="ElementName">
        <xsl:choose>
          <xsl:when test="$AltName!=''">
            <xsl:value-of select="$AltName"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$Param"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:variable name="Type">
        <xsl:call-template name="PartValue">
          <xsl:with-param name="Part" select="3"/>
          <xsl:with-param name="Separator" select="$Separator"/>
          <xsl:with-param name="Value" select="$Test"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:variable name="TypeA">
        <xsl:call-template name="ConvertFromKladr">
          <xsl:with-param name="value" select="$Type"/>
          <xsl:with-param name="level" select="$ElementName"/>
          <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:variable name="VersionDoc">
        <xsl:value-of select="//Page[@Code='Versions']/*/*/Param[@Code=$CodeDoc]"/>
      </xsl:variable>
      <xsl:element name="{$ElementName}">
        <xsl:attribute name="{$Attribute1}">
          <xsl:call-template name="PartValue">
            <xsl:with-param name="Part" select="2"/>
            <xsl:with-param name="Separator" select="$Separator"/>
            <xsl:with-param name="Value" select="$Test"/>
          </xsl:call-template>
        </xsl:attribute>
        <xsl:attribute name="{$Attribute2}">
          <xsl:choose>
            <xsl:when test="$TypeA=''">
              <xsl:value-of select="$Type"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$TypeA"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
      </xsl:element>
    </xsl:if>
  </xsl:template>

  <xsl:template name="PartValue">
    <xsl:param name="Value" />
    <xsl:param name="Part" />
    <xsl:param name="Separator" />
    <xsl:param name="EmptyValue"/>
    <xsl:choose>
      <xsl:when test="$Part = ''">
        <xsl:value-of select="$Value"/>
        <xsl:if test="$Value='' and $EmptyValue!=''">
          <xsl:value-of select="$EmptyValue"/>
        </xsl:if>
      </xsl:when>
      <xsl:when test="$Part = 1 and not(contains($Value,$Separator))">
        <xsl:value-of select="$Value"/>
        <xsl:if test="$Value='' and $EmptyValue!=''">
          <xsl:value-of select="$EmptyValue"/>
        </xsl:if>
      </xsl:when>
      <xsl:when test="$Part = 1 and contains($Value,$Separator)">
        <xsl:value-of select="substring-before($Value,$Separator)"/>
        <xsl:if test="substring-before($Value,$Separator)='' and $EmptyValue!=''">
          <xsl:value-of select="$EmptyValue"/>
        </xsl:if>
      </xsl:when>
      <xsl:when test="$Part > 1 and contains($Value,$Separator)">
        <xsl:call-template name="PartValue">
          <xsl:with-param name="Value" select="substring-after($Value,$Separator)"/>
          <xsl:with-param name="Part" select="$Part - 1"/>
          <xsl:with-param name="Separator" select="$Separator"/>
          <xsl:with-param name="EmptyValue" select="$EmptyValue"/>
        </xsl:call-template>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="CadastralNumberOld">
    <!-- Общий список номеров -->
    <xsl:param name="str"/>
    <!-- Строка уникальных номеров, в которую вносятся унникальные номера из строки str -->
    <xsl:param name="number"/>
    <!-- Номер из общего списка str -->
    <xsl:variable name="correctStr">
      <xsl:if test="substring($str,1,1)!='|' and substring($str,1,1)!=''">
        <xsl:text>|</xsl:text>
      </xsl:if>
      <xsl:value-of select="$str"/>
    </xsl:variable>
    <xsl:variable name="one_number">
      <xsl:text>|</xsl:text>
      <xsl:value-of select="substring-before(substring-after($correctStr,'|'),'|')"/>
      <xsl:text>|</xsl:text>
    </xsl:variable>
    <!-- Новый общий список номеров с удаленным первым элементом -->
    <xsl:variable name="new_str">
      <xsl:text>|</xsl:text>
      <xsl:value-of select="substring-after($correctStr,$one_number)"/>
    </xsl:variable>
    <!-- Проверка уникальности очередного номера и внесение его в строку уникальных номеров -->
    <xsl:variable name="new_number">
      <xsl:value-of select="$number"/>
      <xsl:if test="$one_number!='|' and substring-after($number,$one_number)='' and substring-before($number,$one_number)='' and $one_number!=$number">
        <xsl:value-of select="substring-after($one_number,'|')"/>
      </xsl:if>
    </xsl:variable>
    <!-- Печать очередного уникального номера -->
    <xsl:if test="$one_number!='|'  and substring-after($number,$one_number)='' and substring-before($number,$one_number)='' and $one_number!=$number">
      <xsl:value-of select="substring-after($one_number,'|')"/>
    </xsl:if>
    <!-- Рекурсия, пока общий список номеров не опустеет -->
    <xsl:if test="$new_str!='|'">
      <xsl:call-template name="CadastralNumberOld">
        <xsl:with-param name="str" select="$new_str"/>
        <xsl:with-param name="number" select="$new_number"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  <!-- ГКН, Межевой план, Получение кадастрового номера, расположенного на заданной позиции -->
  <xsl:template name="GetNumberOLZ">
    <xsl:param name="str"/>
    <xsl:param name="position"/>
    <xsl:choose>
      <xsl:when test="$str=''">
        <xsl:value-of select="'-'"/>
      </xsl:when>
      <xsl:when test="$position='1'">
        <xsl:value-of select="substring-before($str,'|')"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="GetNumberOLZ">
          <xsl:with-param name="position" select="$position - 1"/>
          <xsl:with-param name="str" select="substring-after($str,'|')"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!-- ГКН, Межевой план, Получение позиции по номеру -->
  <xsl:template name="GetPositionOLZ">
    <xsl:param name="str"/>
    <xsl:param name="number"/>
    <xsl:param name="position"/>
    <xsl:choose>
      <xsl:when test="substring-before($str,'|')=$number">
        <xsl:value-of select="$position"/>
      </xsl:when>
      <xsl:when test="$str=''">
        <xsl:text>-</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="GetPositionOLZ">
          <xsl:with-param name="position" select="$position+1"/>
          <xsl:with-param name="number" select="$number"/>
          <xsl:with-param name="str" select="substring-after($str,'|')"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="AddressPrintFull">
    <xsl:param name="Other" select="'true'"/>
    <xsl:variable name="Postal">
      <xsl:call-template name="Value">
        <xsl:with-param name="x" select="'Postal_Code'"/>
        <xsl:with-param name="list" select="'Address'"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:value-of select="$Postal"/>
    <xsl:call-template name="AddressPrint">
      <xsl:with-param name="first">
        <xsl:if test="$Postal=''">true</xsl:if>
      </xsl:with-param>
      <xsl:with-param name="part">
        <xsl:call-template name="Value">
          <xsl:with-param name="x" select="'Region'"/>
          <xsl:with-param name="list" select="'Address'"/>
        </xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="AddressPrint">
      <xsl:with-param name="part">
        <xsl:call-template name="Value">
          <xsl:with-param name="x" select="'District'"/>
          <xsl:with-param name="list" select="'Address'"/>
        </xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="AddressPrint">
      <xsl:with-param name="part">
        <xsl:call-template name="Value">
          <xsl:with-param name="x" select="'City'"/>
          <xsl:with-param name="list" select="'Address'"/>
        </xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:if test="Param[@Code='Urban_District']!=''">
      <xsl:choose>
        <xsl:when test="Param[@Code='Urban_District']">
          <xsl:text>, р-н </xsl:text>
          <xsl:value-of select="Param[@Code='Urban_District']"/>
        </xsl:when>
      </xsl:choose>
    </xsl:if>
    <xsl:call-template name="AddressPrint">
      <xsl:with-param name="part">
        <xsl:call-template name="Value">
          <xsl:with-param name="x" select="'Urban_District'"/>
          <xsl:with-param name="list" select="'Address'"/>
        </xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:if test="Param[@Code='Soviet_Village']!=''">
      <xsl:choose>
        <xsl:when test="Param[@Code='Soviet_Village']">
          <xsl:text>, с/с </xsl:text>
          <xsl:value-of select="Param[@Code='Soviet_Village']"/>
        </xsl:when>
      </xsl:choose>
    </xsl:if>
    <xsl:call-template name="AddressPrint">
      <xsl:with-param name="part">
        <xsl:call-template name="Value">
          <xsl:with-param name="x" select="'Soviet_Village'"/>
          <xsl:with-param name="list" select="'Address'"/>
        </xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="AddressPrint">
      <xsl:with-param name="part">
        <xsl:call-template name="Value">
          <xsl:with-param name="x" select="'Locality'"/>
          <xsl:with-param name="list" select="'Address'"/>
        </xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="AddressPrint">
      <xsl:with-param name="part">
        <xsl:call-template name="Value">
          <xsl:with-param name="x" select="'Street'"/>
          <xsl:with-param name="list" select="'Address'"/>
        </xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="AddressPrint">
      <xsl:with-param name="part">
        <xsl:call-template name="Value">
          <xsl:with-param name="x" select="'Level1'"/>
          <xsl:with-param name="list" select="'Address'"/>
        </xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="AddressPrint">
      <xsl:with-param name="part">
        <xsl:call-template name="Value">
          <xsl:with-param name="x" select="'Level2'"/>
          <xsl:with-param name="list" select="'Address'"/>
        </xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="AddressPrint">
      <xsl:with-param name="part">
        <xsl:call-template name="Value">
          <xsl:with-param name="x" select="'Level3'"/>
          <xsl:with-param name="list" select="'Address'"/>
        </xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="AddressPrint">
      <xsl:with-param name="part">
        <xsl:call-template name="Value">
          <xsl:with-param name="x" select="'Apartment'"/>
          <xsl:with-param name="list" select="'Address'"/>
        </xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:if test="$Other='true'">
      <xsl:call-template name="AddressPrint">
        <xsl:with-param name="part">
          <xsl:call-template name="Value">
            <xsl:with-param name="x" select="'Other'"/>
            <xsl:with-param name="list" select="'Address'"/>
          </xsl:call-template>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  <xsl:template name="AddressPrintBeginNWHM">
    <xsl:param name="Other" select="'true'"/>
    <xsl:variable name="Postal">
      <xsl:call-template name="Value">
        <xsl:with-param name="x" select="'Postal_Code'"/>
        <xsl:with-param name="list" select="'Address'"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:value-of select="$Postal"/>
    <xsl:call-template name="AddressPrint">
      <xsl:with-param name="first">
        <xsl:if test="$Postal=''">true</xsl:if>
      </xsl:with-param>
      <xsl:with-param name="part">
        <xsl:call-template name="Value">
          <xsl:with-param name="x" select="'Region'"/>
          <xsl:with-param name="list" select="'Address'"/>
        </xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="AddressPrint">
      <xsl:with-param name="part">
        <xsl:call-template name="Value">
          <xsl:with-param name="x" select="'District'"/>
          <xsl:with-param name="list" select="'Address'"/>
        </xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="AddressPrint">
      <xsl:with-param name="part">
        <xsl:call-template name="Value">
          <xsl:with-param name="x" select="'City'"/>
          <xsl:with-param name="list" select="'Address'"/>
        </xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:if test="Param[@Code='Urban_District']!=''">
      <xsl:choose>
        <xsl:when test="Param[@Code='Urban_District']">
          <xsl:text>, р-н </xsl:text>
          <xsl:value-of select="Param[@Code='Urban_District']"/>
        </xsl:when>
      </xsl:choose>
    </xsl:if>
    <xsl:call-template name="AddressPrint">
      <xsl:with-param name="part">
        <xsl:call-template name="Value">
          <xsl:with-param name="x" select="'Urban_District'"/>
          <xsl:with-param name="list" select="'Address'"/>
        </xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:if test="Param[@Code='Soviet_Village']!=''">
      <xsl:choose>
        <xsl:when test="Param[@Code='Soviet_Village']">
          <xsl:text>, с/с </xsl:text>
          <xsl:value-of select="Param[@Code='Soviet_Village']"/>
        </xsl:when>
      </xsl:choose>
    </xsl:if>
    <xsl:call-template name="AddressPrint">
      <xsl:with-param name="part">
        <xsl:call-template name="Value">
          <xsl:with-param name="x" select="'Soviet_Village'"/>
          <xsl:with-param name="list" select="'Address'"/>
        </xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="AddressPrint">
      <xsl:with-param name="part">
        <xsl:call-template name="Value">
          <xsl:with-param name="x" select="'Locality'"/>
          <xsl:with-param name="list" select="'Address'"/>
        </xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="AddressPrint">
      <xsl:with-param name="part">
        <xsl:call-template name="Value">
          <xsl:with-param name="x" select="'Street'"/>
          <xsl:with-param name="list" select="'Address'"/>
        </xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="AddressPrint">
      <xsl:with-param name="part">
        <xsl:call-template name="Value">
          <xsl:with-param name="x" select="'Level1'"/>
          <xsl:with-param name="list" select="'Address'"/>
        </xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="AddressPrint">
    <xsl:param name="first"/>
    <xsl:param name="part"/>
    <xsl:variable name="return">
      <xsl:call-template name="PartAddressPrint">
        <xsl:with-param name="x" select="$part"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:if test="$return!=''">
      <xsl:if test="$first!='true'">
        <xsl:text>, </xsl:text>
      </xsl:if>
      <xsl:value-of select="$return"/>
    </xsl:if>
  </xsl:template>
  <xsl:template name="PartAddressPrint">
    <xsl:param name="x"/>
    <xsl:choose>
      <xsl:when test="contains($x, '|')">
        <xsl:variable name="Name">
          <xsl:value-of select="substring-before(substring-after($x,'|'),'|')"/>
        </xsl:variable>
        <xsl:variable name="Type">
          <xsl:value-of select="substring-after(substring-after($x,'|'),'|')"/>
        </xsl:variable>
        <xsl:choose>
          <xsl:when test="$Type!='' or $Name!=''">
            <xsl:value-of select="$Type"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="$Name"/>
          </xsl:when>
          <xsl:otherwise>-</xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$x"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
