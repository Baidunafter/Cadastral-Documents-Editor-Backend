<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="MiniEditorCommon.xslt"/>
  <xsl:template name="Act2">
    <xsl:param name="CodeDoc"/>
    <xsl:param name="ActPos"/>
    <xsl:param name="TypeOKS"/>
    <InspectionAct xmlns="urn://x-artefacts-rosreestr-ru/incoming/inspection/2.0.1"
      xmlns:fio="urn://x-artefacts-smev-gov-ru/supplementary/commons/1.0.1"
      xmlns:ki6="urn://x-artefacts-rosreestr-ru/commons/complex-types/cadastral-engineer/6.0.1"
      xmlns:dre4="urn://x-artefacts-rosreestr-ru/commons/directories/realty/4.0.1"
      xmlns:simple11="urn://x-artefacts-rosreestr-ru/commons/simple-types/11.0.1"
      xmlns:simple7="urn://x-artefacts-rosreestr-ru/commons/simple-types/7.0.1"
      xmlns:simple12="urn://x-artefacts-rosreestr-ru/commons/simple-types/12.0.1"
      xmlns:daldoc4="urn://x-artefacts-rosreestr-ru/commons/directories/all-documents/4.0.1"
      xmlns:simple4="urn://x-artefacts-rosreestr-ru/commons/simple-types/4.1.1"
      xmlns:doc7="urn://x-artefacts-rosreestr-ru/commons/complex-types/document/7.0.1"
      xmlns:dapplf1="urn://x-artefacts-rosreestr-ru/commons/directories/applied-file/1.0.1"
      xmlns:simple1="urn://x-artefacts-rosreestr-ru/commons/simple-types/1.0"
      xmlns:simple2="urn://x-artefacts-rosreestr-ru/commons/simple-types/2.0.1"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      GUID="11111111-1111-1111-1111-111111111111">
      <xsl:attribute name="NameSoftware">ТехноКад-Экспресс</xsl:attribute>
      <xsl:attribute name="VersionSoftware">
        <xsl:value-of select="/MiniEditor/@Version"/>
      </xsl:attribute>
      <Contractor>
        <xsl:call-template name="AN">
          <xsl:with-param name="Page" select="'Customer'"/>
          <xsl:with-param name="Section" select="'CustomerDate'"/>
          <xsl:with-param name="Param" select="'Date'"/>
        </xsl:call-template>
        <xsl:variable name="Contractor">
          <xsl:choose>
            <xsl:when test="Page[@Code='Customer']/*[@Code='Contractor']/*[not(@Selected='false')]/@Code='F'">Person</xsl:when>
            <xsl:when test="Page[@Code='Customer']/*[@Code='Contractor']/*[not(@Selected='false')]/@Code='J'">Organization</xsl:when>
            <xsl:otherwise>M</xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
      
        <xsl:choose>
          <xsl:when test="$Contractor='M'">
            <fio:FamilyName>
              <xsl:value-of select="$FIO1"/>
            </fio:FamilyName>
            <fio:FirstName>
              <xsl:value-of select="$FIO2"/>
            </fio:FirstName>
            <xsl:if test="$FIO3">
              <fio:Patronymic>
                <xsl:value-of select="$FIO3"/>
              </fio:Patronymic>
            </xsl:if>
            <ki6:RegistryNumber>
              <xsl:for-each select="Page[@Code='Customer']/*[@Code='ContractorRegNumber' and @Selected='true']/*">
                <xsl:value-of select="*[@Code='Number']"/>
              </xsl:for-each>
            </ki6:RegistryNumber>
            <xsl:choose>
              <xsl:when test="$SNILS!=''">
                <ki6:SNILS>
                  <xsl:value-of select="translate($SNILS,'- ','')"/>
                </ki6:SNILS>
              </xsl:when>
              <xsl:otherwise>
                <ki6:SNILS>
                <xsl:value-of select="'00000000000'"/>
                </ki6:SNILS>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:choose>
              <xsl:when test="$Phone!=''">
                <ki6:Telephone>
                  <xsl:value-of select="$Phone"/>
                </ki6:Telephone>
              </xsl:when>
              <xsl:otherwise>
                <ki6:Telephone>
                  <xsl:value-of select="'+7(000)0000000'"/>
                </ki6:Telephone>
              </xsl:otherwise>
            </xsl:choose>
            <ki6:Address>
              <xsl:for-each select="//Form[@Code='Info']/Page[@Code='Info']/*/*/*[@Code='Address']">
                <xsl:value-of select="."/>
              </xsl:for-each>
            </ki6:Address>
            <xsl:choose>
              <xsl:when test="$Email!=''">
                <ki6:Email>
                  <xsl:value-of select="$Email"/>
                </ki6:Email>
              </xsl:when>
              <xsl:otherwise>
                <ki6:Email>
                  <xsl:value-of select="'--@--.AA'"/>
                </ki6:Email>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="$JFSender='J'">
              <ki6:Organization>
                <ki6:Name>
                  <xsl:value-of select="$Organization"/>
                </ki6:Name>
                <ki6:AddressOrganization>
                  <xsl:value-of select="$Address"/>
                </ki6:AddressOrganization>
              </ki6:Organization>
            </xsl:if>
            <xsl:variable name="SelfRegulatoryOrganization">
              <xsl:value-of select="Page[@Code='Customer']/*[@Code='NameSRO' and @Selected='true']/*/*[@Code='Name']"/>
            </xsl:variable>
            <xsl:if test="$SelfRegulatoryOrganization!=''">
              <ki6:SelfRegulatoryOrganization>
                <xsl:value-of select="$SelfRegulatoryOrganization"/>
              </ki6:SelfRegulatoryOrganization>
            </xsl:if>
            <xsl:variable name="NumberAgreement">
              <xsl:value-of select="Page[@Code='Customer']/*[@Code='ContractorNumber' and @Selected='true']/*/*[@Code='Number']"/>
            </xsl:variable>
            <xsl:variable name="DateAgreement">
              <xsl:value-of select="Page[@Code='Customer']/*[@Code='ContractorNumber' and @Selected='true']/*/*[@Code='Date']"/>
            </xsl:variable>
            <ki6:AgreementCadWork>
              <ki6:NumberAgreement>
                <xsl:value-of select="$NumberAgreement"/>
              </ki6:NumberAgreement>
              <ki6:DateAgreement>
                <xsl:value-of select="$DateAgreement"/>
              </ki6:DateAgreement>
            </ki6:AgreementCadWork>
            <!--xsl:if test="$JFSender='F' and $NameOrganizationF!=''">
                            <ki6:Organization>
                              <ki6:Name>
                                <xsl:value-of select="$Organization"/>
                              </ki6:Name>
                            </ki6:Organization>
                          </xsl:if-->
          </xsl:when>
          <xsl:when test="$Contractor!='M'">
            <xsl:for-each select="Page[@Code='Customer']/*[@Code='Contractor']/*[not(@Selected='false')]">
              <xsl:call-template name="EO" >
                <xsl:with-param name="Page" select="'-'"/>
                <xsl:with-param name="Section" select="'-'"/>
                <xsl:with-param name="List" select="$Contractor"/>
                <xsl:with-param name="Param" select="'FIO1'"/>
                <xsl:with-param name="AltName" select="'fio:FamilyName'"/>
              </xsl:call-template>
              <xsl:call-template name="EO">
                <xsl:with-param name="Page" select="'-'"/>
                <xsl:with-param name="Section" select="'-'"/>
                <xsl:with-param name="List" select="$Contractor"/>
                <xsl:with-param name="Param" select="'FIO2'"/>
                <xsl:with-param name="AltName" select="'fio:FirstName'"/>
              </xsl:call-template>
              <xsl:call-template name="EN">
                <xsl:with-param name="Page" select="'-'"/>
                <xsl:with-param name="Section" select="'-'"/>
                <xsl:with-param name="List" select="$Contractor"/>
                <xsl:with-param name="Param" select="'FIO3'"/>
                <xsl:with-param name="AltName" select="'fio:Patronymic'"/>
              </xsl:call-template>
              <xsl:variable name="CertN">
                <xsl:call-template name="Value">
                  <xsl:with-param name="x" select="'CertN'"/>
                  <xsl:with-param name="list" select="$Contractor"/>
                </xsl:call-template>
              </xsl:variable>
              <ki6:RegistryNumber>
                <xsl:for-each select="../../*[@Code='ContractorRegNumber' and @Selected='true']/*">
                  <xsl:value-of select="*[@Code='Number']"/>
                </xsl:for-each>
              </ki6:RegistryNumber>
              <xsl:variable name="SNILS2">
                <xsl:call-template name="Value">
                  <xsl:with-param name="x" select="'SNILS'"/>
                  <xsl:with-param name="list" select="$Contractor"/>
                </xsl:call-template>
              </xsl:variable>
              <xsl:variable name="Email2">
                <xsl:call-template name="Value">
                  <xsl:with-param name="x" select="'Email'"/>
                  <xsl:with-param name="list" select="$Contractor"/>
                </xsl:call-template>
              </xsl:variable>
              <xsl:variable name="Phone2">
                <xsl:call-template name="Value">
                  <xsl:with-param name="x" select="'Phone'"/>
                  <xsl:with-param name="list" select="$Contractor"/>
                </xsl:call-template>
              </xsl:variable>
              <xsl:choose>
                <xsl:when test="$SNILS2!=''">
                  <ki6:SNILS>
                    <xsl:value-of select="translate($SNILS2,'- ','')"/>
                  </ki6:SNILS>
                </xsl:when>
                <xsl:otherwise>
                  <ki6:SNILS>
                    <xsl:value-of select="'00000000000'"/>
                  </ki6:SNILS>
                </xsl:otherwise>
              </xsl:choose>
              <xsl:choose>
                <xsl:when test="$Phone2!=''">
                  <ki6:Telephone>
                    <xsl:value-of select="$Phone2"/>
                  </ki6:Telephone>
                </xsl:when>
                <xsl:otherwise>
                  <ki6:Telephone>
                    <xsl:value-of select="'+7(000)0000000'"/>
                  </ki6:Telephone>
                </xsl:otherwise>
              </xsl:choose>
              <xsl:variable name="AddressOrganizationOld">
                <xsl:value-of select="count(Param[@Code='AddressOrganization'])"/>
              </xsl:variable>
              <xsl:choose>
                <xsl:when test="$AddressOrganizationOld = 1">
                  <xsl:call-template name="EO">
                    <xsl:with-param name="Page" select="'-'"/>
                    <xsl:with-param name="Section" select="'-'"/>
                    <xsl:with-param name="List" select="$Contractor"/>
                    <xsl:with-param name="Param" select="'Address'"/>
                    <xsl:with-param name="AltName" select="'ki6:Address'"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="EO">
                    <xsl:with-param name="Page" select="'-'"/>
                    <xsl:with-param name="Section" select="'-'"/>
                    <xsl:with-param name="List" select="$Contractor"/>
                    <xsl:with-param name="Param" select="'Address'"/>
                    <xsl:with-param name="AltName" select="'ki6:Address'"/>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
              <xsl:choose>
                <xsl:when test="$Email2!=''">
                  <ki6:Email>
                    <xsl:value-of select="$Email2"/>
                  </ki6:Email>
                </xsl:when>
                <xsl:otherwise>
                  <ki6:Email>
                    <xsl:value-of select="'--@--.AA'"/>
                  </ki6:Email>
                </xsl:otherwise>
              </xsl:choose>
          
              <xsl:if test="$Contractor='Organization'">
                <ki6:Organization>
                  <xsl:call-template name="EO">
                    <xsl:with-param name="Page" select="'-'"/>
                    <xsl:with-param name="Section" select="'-'"/>
                    <xsl:with-param name="List" select="$Contractor"/>
                    <xsl:with-param name="Param" select="'Organization'"/>
                    <xsl:with-param name="AltName" select="'ki6:Name'"/>
                  </xsl:call-template>
                  <xsl:choose>
                    <xsl:when test="$AddressOrganizationOld = 1">
                      <ki6:AddressOrganization>
                        <xsl:value-of select="Param[@Code='AddressOrganization']"/>
                      </ki6:AddressOrganization>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:call-template name="EO">
                        <xsl:with-param name="Page" select="'-'"/>
                        <xsl:with-param name="Section" select="'-'"/>
                        <xsl:with-param name="List" select="$Contractor"/>
                        <xsl:with-param name="Param" select="'Address'"/>
                        <xsl:with-param name="AltName" select="'ki6:AddressOrganization'"/>
                      </xsl:call-template>
                    </xsl:otherwise>
                  </xsl:choose>
                </ki6:Organization>
              </xsl:if>
            </xsl:for-each>
            <xsl:variable name="SelfRegulatoryOrganization">
              <xsl:value-of select="Page[@Code='Customer']/*[@Code='NameSRO' and @Selected='true']/*/*[@Code='Name']"/>
            </xsl:variable>
            <xsl:if test="$SelfRegulatoryOrganization!=''">
              <ki6:SelfRegulatoryOrganization>
                <xsl:value-of select="$SelfRegulatoryOrganization"/>
              </ki6:SelfRegulatoryOrganization>
            </xsl:if>
            <xsl:variable name="NumberAgreement">
              <xsl:value-of select="Page[@Code='Customer']/*[@Code='ContractorNumber' and @Selected='true']/*/*[@Code='Number']"/>
            </xsl:variable>
            <xsl:variable name="DateAgreement">
              <xsl:value-of select="Page[@Code='Customer']/*[@Code='ContractorNumber' and @Selected='true']/*/*[@Code='Date']"/>
            </xsl:variable>
            <ki6:AgreementCadWork>
              <ki6:NumberAgreement>
                <xsl:value-of select="$NumberAgreement"/>
              </ki6:NumberAgreement>
              <ki6:DateAgreement>
                <xsl:value-of select="$DateAgreement"/>
              </ki6:DateAgreement>
            </ki6:AgreementCadWork>
          </xsl:when>
        </xsl:choose>
      </Contractor>
      <Client>
        <xsl:for-each
          select="Page[@Code = 'Customer']/Alt[@Code = 'Customer' and @Selected = 'true']/*[@Selected = 'true']">
        <xsl:variable name="Client">
          <xsl:value-of select="@Code"/>
        </xsl:variable>
        <xsl:element name="{$Client}">
          <xsl:if test="$Client = 'Person'">
            <fio:FamilyName>
              <xsl:call-template name="Value">
                <xsl:with-param name="x" select="'FamilyName'"/>
              </xsl:call-template>
            </fio:FamilyName>
            <fio:FirstName>
              <xsl:call-template name="Value">
                <xsl:with-param name="x" select="'FirstName'"/>
              </xsl:call-template>
            </fio:FirstName>
            <xsl:variable name="Patronymic">
              <xsl:call-template name="Value">
                <xsl:with-param name="x" select="'Patronymic'"/>
              </xsl:call-template>
            </xsl:variable>
            <xsl:if test="$Patronymic != ''">
              <fio:Patronymic>
                <xsl:value-of select="$Patronymic"/>
              </fio:Patronymic>
            </xsl:if>
            <xsl:variable name="SNILS">
              <xsl:call-template name="Value">
                <xsl:with-param name="x" select="'SNILS'"/>
              </xsl:call-template>
            </xsl:variable>
            <xsl:if test="$SNILS != ''">
              <SNILS>
                <xsl:value-of select="translate($SNILS, '- ', '')"/>
              </SNILS>
            </xsl:if>
          </xsl:if>
          <xsl:if test="$Client != 'Person'">
            <Name>
              <xsl:call-template name="Value">
                <xsl:with-param name="x" select="'Name'"/>
              </xsl:call-template>
            </Name>
          </xsl:if>
          <xsl:if test="$Client = 'ForeignOrganization'">
            <Country>
              <xsl:call-template name="Value">
                <xsl:with-param name="x" select="'Country'"/>
              </xsl:call-template>
            </Country>
          </xsl:if>
        </xsl:element>
        </xsl:for-each>
      </Client>
      <Object>
        <xsl:choose>
          <xsl:when test="$TypeOKS = 'Flat'">
            <xsl:for-each select="Page[@Code = 'CadastralNumbers']/*[@Code = 'Flats']/*">
              <xsl:if test="position() = $ActPos">
                <CadastralNumber>
                  <xsl:call-template name="Value">
                    <xsl:with-param name="x" select="'CadastralNumber'"/>
                  </xsl:call-template>
                </CadastralNumber>
                <ObjectType>002001003000</ObjectType>
              </xsl:if>
            </xsl:for-each>
          </xsl:when>
          <xsl:otherwise>
            <xsl:for-each
              select="Page[@Code = 'CadastralNumbers']/Alt[@Code = 'Archive']/*[@Code = 'ObjectArchive' and @Selected = 'true']">
              <CadastralNumber>
                <xsl:call-template name="Value">
                  <xsl:with-param name="x" select="'CadastralNumber'"/>
                </xsl:call-template>
              </CadastralNumber>
              <ObjectType>
                <xsl:call-template name="Value">
                  <xsl:with-param name="x" select="'Obj'"/>
                </xsl:call-template>
              </ObjectType>
            </xsl:for-each>
            <xsl:for-each select="Page[@Code = 'CadastralNumbers']/*[@Code = 'CadastralNumber']/*">
              <CadastralNumber>
                <xsl:call-template name="Value">
                  <xsl:with-param name="x" select="'CadastralNumber'"/>
                </xsl:call-template>
              </CadastralNumber>
              <ObjectType>
                <xsl:call-template name="Value">
                  <xsl:with-param name="x" select="'Obj'"/>
                </xsl:call-template>
              </ObjectType>
            </xsl:for-each>
          </xsl:otherwise>
        </xsl:choose>
        <RightRegisteredUnregistered>
        <xsl:value-of select="Page[@Code = 'CadastralNumbers']/*[@Code = 'RightRegisteredUnregistered']/*[@Selected='true']/@Code"/>
        </RightRegisteredUnregistered>
      </Object>
      <xsl:if
        test="//Page[@Code = 'Applied_Documents']/*[(@Code = 'Applied_Document') and @Selected = 'true']">
        <Documents>
          <xsl:for-each
            select="Page[@Code = 'Applied_Documents']/*[(@Code = 'Applied_Document') and @Selected = 'true']">
            <xsl:variable name="Code" select="@Code"/>
            <xsl:for-each select="*">
              <Document>
                <doc7:CodeDocument>
                  <xsl:call-template name="Value">
                    <xsl:with-param name="x" select="'Kind'"/>
                  </xsl:call-template>
                </doc7:CodeDocument>
                <xsl:variable name="NameDocument">
                <xsl:call-template name="Value">
                  <xsl:with-param name="x" select="'Name'"/>
                  <xsl:with-param name="list" select="'NameDocument'"/>
                </xsl:call-template>
                </xsl:variable>
                <xsl:if test="$NameDocument!=''">
                <doc7:Name>
                  <xsl:value-of select="$NameDocument"/>
                </doc7:Name>
                </xsl:if>
                <xsl:variable name="Series">
                  <xsl:call-template name="Value">
                    <xsl:with-param name="x" select="'Series'"/>
                  </xsl:call-template>
                </xsl:variable>
                <xsl:if test="$Series!=''">
                <doc7:Series>
                  <xsl:value-of select="$Series"/>
                </doc7:Series>
                </xsl:if>
                <doc7:Number>
                  <xsl:call-template name="Value">
                    <xsl:with-param name="x" select="'Number'"/>
                  </xsl:call-template>
                </doc7:Number>
                <doc7:Date>
                  <xsl:call-template name="Value">
                    <xsl:with-param name="x" select="'Date'"/>
                  </xsl:call-template>
                </doc7:Date>
                <xsl:variable name="IssueOrgan">
                  <xsl:call-template name="Value">
                    <xsl:with-param name="x" select="'IssueOrgan'"/>
                    <xsl:with-param name="list" select="'IssueOrgan'"/>
                  </xsl:call-template>
                </xsl:variable>
                <xsl:if test="$IssueOrgan!=''">
                <doc7:IssueOrgan>
                  <xsl:value-of select="$IssueOrgan"/>
                </doc7:IssueOrgan>
                </xsl:if>
                <xsl:variable name="Desc">
                  <xsl:call-template name="Value">
                    <xsl:with-param name="x" select="'Desc'"/>
                  </xsl:call-template>
                </xsl:variable>
                <xsl:if test="$Desc!=''">
                <doc7:Desc>
                 <xsl:value-of select="$Desc"/>
                </doc7:Desc>
                </xsl:if>
                <xsl:for-each select="ParamFile[. != '']">
                  <doc7:AppliedFile>
                    <xsl:attribute name="Kind">
                      <xsl:value-of select="'01'"/>
                    </xsl:attribute>
                    <xsl:attribute name="Name">
                      <xsl:call-template name="AddFileReference">
                        <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
                      </xsl:call-template>
                    </xsl:attribute>
                  </doc7:AppliedFile>
                </xsl:for-each>
              </Document>
            </xsl:for-each>
          </xsl:for-each>
        </Documents>
      </xsl:if>
      <xsl:variable name="Conclusion">
        <xsl:if test="Page[@Code = 'Customer']/*[@Code = 'Conclusion' and @Selected = 'true']">
          <xsl:value-of
            select="Page[@Code = 'Customer']/*[@Code = 'Conclusion' and @Selected = 'true']/*/*[@Code = 'Conclusion']"
          />
        </xsl:if>
      </xsl:variable>
      <xsl:variable name="ContractorSROName">
        <xsl:value-of
          select="Page[@Code = 'Customer']/*[@Code = 'NameSRO' and @Selected = 'true']/*/*[@Code = 'Name']"
        />
      </xsl:variable>
      <xsl:variable name="ContractorSRONumberID">
        <xsl:value-of
          select="Page[@Code = 'Customer']/*[@Code = 'ContractorSRO' and @Selected = 'true']/*/*[@Code = 'NumberID']"
        />
      </xsl:variable>
      <xsl:variable name="ContractorSROReestrNumber">
        <xsl:value-of
          select="Page[@Code = 'Customer']/*[@Code = 'ContractorSRO' and @Selected = 'true']/*/*[@Code = 'ReestrNumber']"
        />
      </xsl:variable>
      <xsl:variable name="Contractor">
        <xsl:choose>
          <xsl:when
            test="Page[@Code = 'Customer']/*[@Code = 'Contractor']/*[not(@Selected = 'false')]/@Code = 'F'"
            >Person</xsl:when>
          <xsl:when
            test="Page[@Code = 'Customer']/*[@Code = 'Contractor']/*[not(@Selected = 'false')]/@Code = 'J'"
            >Organization</xsl:when>
          <xsl:otherwise>M</xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:variable name="SRODate"
        select="Page[@Code = 'Customer']/*[@Code = 'ContractorSRO' and @Selected = 'true']/*/*[@Code = 'Date']"/>
      <xsl:variable name="ContractorSRODate">
        <xsl:call-template name="NormDate">
          <xsl:with-param name="Date" select="$SRODate"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:variable name="CadastralIngeneer">
        <xsl:choose>
          <xsl:when test="$Contractor = 'M'">
            <xsl:value-of select="$FIO1"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="$FIO2"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="$FIO3"/>
          </xsl:when>
          <xsl:when test="$Contractor != 'M'">
            <xsl:for-each
              select="Page[@Code = 'Customer']/*[@Code = 'Contractor']/*[not(@Selected = 'false')]">
              <xsl:call-template name="EO">
                <xsl:with-param name="Page" select="'-'"/>
                <xsl:with-param name="Section" select="'-'"/>
                <xsl:with-param name="List" select="$Contractor"/>
                <xsl:with-param name="Param" select="'FIO1'"/>
                <xsl:with-param name="AltName" select="'fio:FamilyName'"/>
              </xsl:call-template>
              <xsl:text> </xsl:text>
              <xsl:call-template name="EO">
                <xsl:with-param name="Page" select="'-'"/>
                <xsl:with-param name="Section" select="'-'"/>
                <xsl:with-param name="List" select="$Contractor"/>
                <xsl:with-param name="Param" select="'FIO2'"/>
                <xsl:with-param name="AltName" select="'fio:FirstName'"/>
              </xsl:call-template>
              <xsl:text> </xsl:text>
              <xsl:call-template name="EN">
                <xsl:with-param name="Page" select="'-'"/>
                <xsl:with-param name="Section" select="'-'"/>
                <xsl:with-param name="List" select="$Contractor"/>
                <xsl:with-param name="Param" select="'FIO3'"/>
                <xsl:with-param name="AltName" select="'fio:Patronymic'"/>
              </xsl:call-template>
            </xsl:for-each>
          </xsl:when>
        </xsl:choose>
      </xsl:variable>
      
      <Conclusion>
       
          <xsl:value-of select="$Conclusion"/>
          <xsl:if test="Page[@Code = 'Customer']/*[@Code = 'ContractorSRO' and @Selected = 'true']">
            <xsl:text> Акт обследования подготовил кадастровый инженер </xsl:text>
            <xsl:value-of select="$CadastralIngeneer"/><xsl:text>, являющийся членом СРО КИ </xsl:text>
            <xsl:value-of select="$ContractorSROName"/> (уникальный реестровый номер кадастрового
            инженера в реестре членов СРО КИ N <xsl:value-of select="$ContractorSRONumberID"/>).
            Сведения о СРО КИ <xsl:value-of select="$ContractorSROName"/> содержатся в государственном
            реестре СРО КИ (уникальный номер реестровой записи от <xsl:value-of
              select="$ContractorSRODate"/> N <xsl:value-of select="$ContractorSROReestrNumber"/>).
          </xsl:if>
        
      </Conclusion>
    </InspectionAct>


  </xsl:template>
  <xsl:template name="Act">
    <xsl:param name="CodeDoc"/>
    <xsl:param name="ActPos"/>
    <xsl:param name="TypeOKS"/>
    <InspectionAct xmlns="urn://x-artefacts-rosreestr-ru/incoming/inspection/1.0.1"
      xmlns:ki="urn://x-artefacts-rosreestr-ru/commons/complex-types/cadastral-engineer/1.0.2"
      xmlns:fio="urn://x-artefacts-smev-gov-ru/supplementary/commons/1.0.1"
      xmlns:doc="urn://x-artefacts-rosreestr-ru/commons/complex-types/document/1.0.1"
      GUID="11111111-1111-1111-1111-111111111111">
      <xsl:attribute name="NameSoftware">ТехноКад-Экспресс</xsl:attribute>
      <xsl:attribute name="VersionSoftware">
        <xsl:value-of select="/MiniEditor/@Version"/>
      </xsl:attribute>
      <xsl:call-template name="RouteOKATO"/>
      <Contractor>
        <xsl:call-template name="AN">
          <xsl:with-param name="Page" select="'Customer'"/>
          <xsl:with-param name="Section" select="'CustomerDate'"/>
          <xsl:with-param name="Param" select="'Date'"/>
        </xsl:call-template>
        <xsl:variable name="Contractor">
          <xsl:choose>
            <xsl:when
              test="Page[@Code = 'Customer']/*[@Code = 'Contractor']/*[not(@Selected = 'false')]/@Code = 'F'"
              >Person</xsl:when>
            <xsl:when
              test="Page[@Code = 'Customer']/*[@Code = 'Contractor']/*[not(@Selected = 'false')]/@Code = 'J'"
              >Organization</xsl:when>
            <xsl:otherwise>M</xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <xsl:choose>
          <xsl:when test="$Contractor = 'M'">
            <fio:FamilyName>
              <xsl:value-of select="$FIO1"/>
            </fio:FamilyName>
            <fio:FirstName>
              <xsl:value-of select="$FIO2"/>
            </fio:FirstName>
            <xsl:if test="$FIO3">
              <fio:Patronymic>
                <xsl:value-of select="$FIO3"/>
              </fio:Patronymic>
            </xsl:if>
            <ki:NCertificate>
              <xsl:call-template name="CertN">
                <xsl:with-param name="CertN" select="$CertN"/>
              </xsl:call-template>
            </ki:NCertificate>
            <ki:Telephone>
              <xsl:value-of select="$Phone"/>
            </ki:Telephone>
            <ki:Address>
              <xsl:value-of select="$Address"/>
            </ki:Address>
            <xsl:if test="$Email != ''">
              <ki:Email>
                <xsl:value-of select="$Email"/>
              </ki:Email>
            </xsl:if>
            <xsl:if test="$JFSender = 'J'">
              <ki:Organization>
                <ki:Name>
                  <xsl:value-of select="$Organization"/>
                </ki:Name>
                <ki:AddressOrganization>
                  <xsl:value-of select="$Address"/>
                </ki:AddressOrganization>
              </ki:Organization>
            </xsl:if>
            <!--xsl:if test="$JFSender='F' and $NameOrganizationF!=''">
                            <ki:Organization>
                              <ki:Name>
                                <xsl:value-of select="$Organization"/>
                              </ki:Name>
                            </ki:Organization>
                          </xsl:if-->
          </xsl:when>
          <xsl:when test="$Contractor != 'M'">
            <xsl:for-each
              select="Page[@Code = 'Customer']/*[@Code = 'Contractor']/*[not(@Selected = 'false')]">
              <xsl:call-template name="EO">
                <xsl:with-param name="Page" select="'-'"/>
                <xsl:with-param name="Section" select="'-'"/>
                <xsl:with-param name="List" select="$Contractor"/>
                <xsl:with-param name="Param" select="'FIO1'"/>
                <xsl:with-param name="AltName" select="'fio:FamilyName'"/>
              </xsl:call-template>
              <xsl:call-template name="EO">
                <xsl:with-param name="Page" select="'-'"/>
                <xsl:with-param name="Section" select="'-'"/>
                <xsl:with-param name="List" select="$Contractor"/>
                <xsl:with-param name="Param" select="'FIO2'"/>
                <xsl:with-param name="AltName" select="'fio:FirstName'"/>
              </xsl:call-template>
              <xsl:call-template name="EN">
                <xsl:with-param name="Page" select="'-'"/>
                <xsl:with-param name="Section" select="'-'"/>
                <xsl:with-param name="List" select="$Contractor"/>
                <xsl:with-param name="Param" select="'FIO3'"/>
                <xsl:with-param name="AltName" select="'fio:Patronymic'"/>
              </xsl:call-template>
              <xsl:variable name="CertN">
                <xsl:call-template name="Value">
                  <xsl:with-param name="x" select="'CertN'"/>
                  <xsl:with-param name="list" select="$Contractor"/>
                </xsl:call-template>
              </xsl:variable>
              <ki:NCertificate>
                <xsl:call-template name="CertN">
                  <xsl:with-param name="CertN" select="$CertN"/>
                </xsl:call-template>
              </ki:NCertificate>
              <xsl:call-template name="EO">
                <xsl:with-param name="Page" select="'-'"/>
                <xsl:with-param name="Section" select="'-'"/>
                <xsl:with-param name="List" select="$Contractor"/>
                <xsl:with-param name="Param" select="'Phone'"/>
                <xsl:with-param name="AltName" select="'ki:Telephone'"/>
              </xsl:call-template>
              <xsl:variable name="AddressOrganizationOld">
                <xsl:value-of select="count(Param[@Code = 'AddressOrganization'])"/>
              </xsl:variable>
              <xsl:choose>
                <xsl:when test="$AddressOrganizationOld = 1">
                  <xsl:call-template name="EO">
                    <xsl:with-param name="Page" select="'-'"/>
                    <xsl:with-param name="Section" select="'-'"/>
                    <xsl:with-param name="List" select="$Contractor"/>
                    <xsl:with-param name="Param" select="'Address'"/>
                    <xsl:with-param name="AltName" select="'ki:Address'"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="EO">
                    <xsl:with-param name="Page" select="'-'"/>
                    <xsl:with-param name="Section" select="'-'"/>
                    <xsl:with-param name="Param" select="'AddressJ'"/>
                    <xsl:with-param name="AltName" select="'ki:Address'"/>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
              <xsl:call-template name="EN">
                <xsl:with-param name="Page" select="'-'"/>
                <xsl:with-param name="Section" select="'-'"/>
                <xsl:with-param name="List" select="$Contractor"/>
                <xsl:with-param name="Param" select="'Email'"/>
                <xsl:with-param name="AltName" select="'ki:Email'"/>
              </xsl:call-template>
              <xsl:if test="$Contractor = 'Organization'">
                <ki:Organization>
                  <xsl:call-template name="EO">
                    <xsl:with-param name="Page" select="'-'"/>
                    <xsl:with-param name="Section" select="'-'"/>
                    <xsl:with-param name="List" select="$Contractor"/>
                    <xsl:with-param name="Param" select="'Organization'"/>
                    <xsl:with-param name="AltName" select="'ki:Name'"/>
                  </xsl:call-template>
                  <xsl:choose>
                    <xsl:when test="$AddressOrganizationOld = 1">
                      <ki:AddressOrganization>
                        <xsl:value-of select="Param[@Code = 'AddressOrganization']"/>
                      </ki:AddressOrganization>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:call-template name="EO">
                        <xsl:with-param name="Page" select="'-'"/>
                        <xsl:with-param name="Section" select="'-'"/>
                        <xsl:with-param name="List" select="$Contractor"/>
                        <xsl:with-param name="Param" select="'Address'"/>
                        <xsl:with-param name="AltName" select="'ki:AddressOrganization'"/>
                      </xsl:call-template>
                    </xsl:otherwise>
                  </xsl:choose>
                </ki:Organization>
              </xsl:if>
            </xsl:for-each>
          </xsl:when>
        </xsl:choose>
      </Contractor>
      <xsl:for-each
        select="Page[@Code = 'Customer']/Alt[@Code = 'Customer' and @Selected = 'true']/*[@Selected = 'true']">
        <Client>
          <xsl:variable name="Client">
            <xsl:value-of select="@Code"/>
          </xsl:variable>
          <xsl:element name="{$Client}">
            <xsl:if test="$Client = 'Person'">
              <fio:FamilyName>
                <xsl:call-template name="Value">
                  <xsl:with-param name="x" select="'FamilyName'"/>
                </xsl:call-template>
              </fio:FamilyName>
              <fio:FirstName>
                <xsl:call-template name="Value">
                  <xsl:with-param name="x" select="'FirstName'"/>
                </xsl:call-template>
              </fio:FirstName>
              <xsl:variable name="Patronymic">
                <xsl:call-template name="Value">
                  <xsl:with-param name="x" select="'Patronymic'"/>
                </xsl:call-template>
              </xsl:variable>
              <xsl:if test="$Patronymic != ''">
                <fio:Patronymic>
                  <xsl:value-of select="$Patronymic"/>
                </fio:Patronymic>
              </xsl:if>
              <xsl:variable name="SNILS">
                <xsl:call-template name="Value">
                  <xsl:with-param name="x" select="'SNILS'"/>
                </xsl:call-template>
              </xsl:variable>
              <xsl:if test="$SNILS != ''">
                <SNILS>
                  <xsl:value-of select="translate($SNILS, '- ', '')"/>
                </SNILS>
              </xsl:if>
            </xsl:if>
            <xsl:if test="$Client != 'Person'">
              <Name>
                <xsl:call-template name="Value">
                  <xsl:with-param name="x" select="'Name'"/>
                </xsl:call-template>
              </Name>
            </xsl:if>
            <xsl:if test="$Client = 'ForeignOrganization'">
              <Country>
                <xsl:call-template name="Value">
                  <xsl:with-param name="x" select="'Country'"/>
                </xsl:call-template>
              </Country>
            </xsl:if>
          </xsl:element>
        </Client>
      </xsl:for-each>
      <Object>
        <xsl:choose>
          <xsl:when test="$TypeOKS = 'Flat'">
            <xsl:for-each select="Page[@Code = 'CadastralNumbers']/*[@Code = 'Flats']/*">
              <xsl:if test="position() = $ActPos">
                <CadastralNumber>
                  <xsl:call-template name="Value">
                    <xsl:with-param name="x" select="'CadastralNumber'"/>
                  </xsl:call-template>
                </CadastralNumber>
                <ObjectType>002001003000</ObjectType>
              </xsl:if>
            </xsl:for-each>
          </xsl:when>
          <xsl:otherwise>
            <xsl:for-each
              select="Page[@Code = 'CadastralNumbers']/Alt[@Code = 'Archive']/*[@Code = 'ObjectArchive' and @Selected = 'true']">
              <CadastralNumber>
                <xsl:call-template name="Value">
                  <xsl:with-param name="x" select="'CadastralNumber'"/>
                </xsl:call-template>
              </CadastralNumber>
              <ObjectType>
                <xsl:call-template name="Value">
                  <xsl:with-param name="x" select="'Obj'"/>
                </xsl:call-template>
              </ObjectType>
            </xsl:for-each>
            <xsl:for-each select="Page[@Code = 'CadastralNumbers']/*[@Code = 'CadastralNumber']/*">
              <CadastralNumber>
                <xsl:call-template name="Value">
                  <xsl:with-param name="x" select="'CadastralNumber'"/>
                </xsl:call-template>
              </CadastralNumber>
              <ObjectType>
                <xsl:call-template name="Value">
                  <xsl:with-param name="x" select="'Obj'"/>
                </xsl:call-template>
              </ObjectType>
            </xsl:for-each>
          </xsl:otherwise>
        </xsl:choose>

      </Object>
      <xsl:if
        test="//Page[@Code = 'Applied_Documents']/*[(@Code = 'Applied_Document') and @Selected = 'true']">
        <Documents>
          <xsl:for-each
            select="Page[@Code = 'Applied_Documents']/*[(@Code = 'Applied_Document') and @Selected = 'true']">
            <xsl:variable name="Code" select="@Code"/>
            <xsl:for-each select="*">
              <Document>
                <doc:CodeDocument>
                  <xsl:call-template name="Value">
                    <xsl:with-param name="x" select="'Kind'"/>
                  </xsl:call-template>
                </doc:CodeDocument>
                <doc:Name>
                  <xsl:call-template name="Value">
                    <xsl:with-param name="x" select="'Name'"/>
                    <xsl:with-param name="list" select="'NameDocument'"/>
                  </xsl:call-template>
                </doc:Name>
                <doc:Series>
                  <xsl:call-template name="Value">
                    <xsl:with-param name="x" select="'Series'"/>
                  </xsl:call-template>
                </doc:Series>
                <doc:Number>
                  <xsl:call-template name="Value">
                    <xsl:with-param name="x" select="'Number'"/>
                  </xsl:call-template>
                </doc:Number>
                <doc:Date>
                  <xsl:call-template name="Value">
                    <xsl:with-param name="x" select="'Date'"/>
                  </xsl:call-template>
                </doc:Date>
                <doc:IssueOrgan>
                  <xsl:call-template name="Value">
                    <xsl:with-param name="x" select="'IssueOrgan'"/>
                    <xsl:with-param name="list" select="'IssueOrgan'"/>
                  </xsl:call-template>
                </doc:IssueOrgan>
                <doc:Desc>
                  <xsl:call-template name="Value">
                    <xsl:with-param name="x" select="'Desc'"/>
                  </xsl:call-template>
                </doc:Desc>
                <xsl:for-each select="ParamFile[. != '']">
                  <doc:AppliedFile>
                    <xsl:attribute name="Kind">
                      <xsl:value-of select="'01'"/>
                    </xsl:attribute>
                    <xsl:attribute name="Name">
                      <xsl:call-template name="AddFileReference">
                        <xsl:with-param name="CodeDoc" select="$CodeDoc"/>
                      </xsl:call-template>
                    </xsl:attribute>
                  </doc:AppliedFile>
                </xsl:for-each>
              </Document>
            </xsl:for-each>
          </xsl:for-each>
        </Documents>
      </xsl:if>
      <xsl:variable name="Conclusion">
        <xsl:if test="Page[@Code = 'Customer']/*[@Code = 'Conclusion' and @Selected = 'true']">
          <xsl:value-of
            select="Page[@Code = 'Customer']/*[@Code = 'Conclusion' and @Selected = 'true']/*/*[@Code = 'Conclusion']"
          />
        </xsl:if>
      </xsl:variable>
      <xsl:variable name="ContractorSROName">
        <xsl:value-of
          select="Page[@Code = 'Customer']/*[@Code = 'NameSRO' and @Selected = 'true']/*/*[@Code = 'Name']"
        />
      </xsl:variable>
      <xsl:variable name="ContractorSRONumberID">
        <xsl:value-of
          select="Page[@Code = 'Customer']/*[@Code = 'ContractorSRO' and @Selected = 'true']/*/*[@Code = 'NumberID']"
        />
      </xsl:variable>
      <xsl:variable name="ContractorSROReestrNumber">
        <xsl:value-of
          select="Page[@Code = 'Customer']/*[@Code = 'ContractorSRO' and @Selected = 'true']/*/*[@Code = 'ReestrNumber']"
        />
      </xsl:variable>
      <xsl:variable name="Contractor">
        <xsl:choose>
          <xsl:when
            test="Page[@Code = 'Customer']/*[@Code = 'Contractor']/*[not(@Selected = 'false')]/@Code = 'F'"
            >Person</xsl:when>
          <xsl:when
            test="Page[@Code = 'Customer']/*[@Code = 'Contractor']/*[not(@Selected = 'false')]/@Code = 'J'"
            >Organization</xsl:when>
          <xsl:otherwise>M</xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:variable name="SRODate"
        select="Page[@Code = 'Customer']/*[@Code = 'ContractorSRO' and @Selected = 'true']/*/*[@Code = 'Date']"/>
      <xsl:variable name="ContractorSRODate">
        <xsl:call-template name="NormDate">
          <xsl:with-param name="Date" select="$SRODate"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:variable name="CadastralIngeneer">
        <xsl:choose>
          <xsl:when test="$Contractor = 'M'">
            <xsl:value-of select="$FIO1"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="$FIO2"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="$FIO3"/>
          </xsl:when>
          <xsl:when test="$Contractor != 'M'">
            <xsl:for-each
              select="Page[@Code = 'Customer']/*[@Code = 'Contractor']/*[not(@Selected = 'false')]">
              <xsl:call-template name="EO">
                <xsl:with-param name="Page" select="'-'"/>
                <xsl:with-param name="Section" select="'-'"/>
                <xsl:with-param name="List" select="$Contractor"/>
                <xsl:with-param name="Param" select="'FIO1'"/>
                <xsl:with-param name="AltName" select="'fio:FamilyName'"/>
              </xsl:call-template>
              <xsl:text> </xsl:text>
              <xsl:call-template name="EO">
                <xsl:with-param name="Page" select="'-'"/>
                <xsl:with-param name="Section" select="'-'"/>
                <xsl:with-param name="List" select="$Contractor"/>
                <xsl:with-param name="Param" select="'FIO2'"/>
                <xsl:with-param name="AltName" select="'fio:FirstName'"/>
              </xsl:call-template>
              <xsl:text> </xsl:text>
              <xsl:call-template name="EN">
                <xsl:with-param name="Page" select="'-'"/>
                <xsl:with-param name="Section" select="'-'"/>
                <xsl:with-param name="List" select="$Contractor"/>
                <xsl:with-param name="Param" select="'FIO3'"/>
                <xsl:with-param name="AltName" select="'fio:Patronymic'"/>
              </xsl:call-template>
            </xsl:for-each>
          </xsl:when>
        </xsl:choose>
      </xsl:variable>
      <Conclusion>
        <xsl:value-of select="$Conclusion"/>
        <xsl:if test="Page[@Code = 'Customer']/*[@Code = 'ContractorSRO' and @Selected = 'true']">
          <xsl:text> Акт обследования подготовил кадастровый инженер </xsl:text>
          <xsl:value-of select="$CadastralIngeneer"/><xsl:text>, являющийся членом СРО КИ </xsl:text>
          <xsl:value-of select="$ContractorSROName"/> (уникальный реестровый номер кадастрового
          инженера в реестре членов СРО КИ N <xsl:value-of select="$ContractorSRONumberID"/>).
          Сведения о СРО КИ <xsl:value-of select="$ContractorSROName"/> содержатся в государственном
          реестре СРО КИ (уникальный номер реестровой записи от <xsl:value-of
            select="$ContractorSRODate"/> N <xsl:value-of select="$ContractorSROReestrNumber"/>).
        </xsl:if>
      </Conclusion>

    </InspectionAct>

  </xsl:template>
</xsl:stylesheet>
