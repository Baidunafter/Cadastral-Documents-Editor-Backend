<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:root="urn://x-artefacts-rosreestr-ru/incoming/inspection/1.0.1"
                xmlns:ki="urn://x-artefacts-rosreestr-ru/commons/complex-types/cadastral-engineer/1.0.2"
                xmlns:fio="urn://x-artefacts-smev-gov-ru/supplementary/commons/1.0.1"
                xmlns:doc="urn://x-artefacts-rosreestr-ru/commons/complex-types/document/1.0.1">
  <xsl:import href="Common.xslt"/>

  <xsl:template name="Document">
    <xsl:param name="pos"/>
    <xsl:param name="part"/>
    <xsl:param name="path"/>
    <xsl:param name="type"/>
    <xsl:param name="pos0"/>
    <xsl:param name="pos1"/>
    <xsl:param name="pos2"/>
    <xsl:param name="name"/>
    <xsl:if test="doc:Name!=''">
      <tr>
        <td>
          <span>
            <xsl:text>Наименование документа</xsl:text>
          </span>
        </td>
        <td colspan="3">
          <xsl:call-template name="TextBox">
            <xsl:with-param name="siz" select="75"/>
            <xsl:with-param name="val" select="doc:Name"/>
          </xsl:call-template>
        </td>
      </tr>
    </xsl:if>
    <xsl:if test="doc:CodeDocument!=''">
      <tr>
        <td>
          <span>
            <xsl:text>Тип документа (код)</xsl:text>
          </span>
        </td>
        <td colspan="3">
          <xsl:call-template name="DictBox">
            <xsl:with-param name="dic">
              <xsl:call-template name="dAllDocuments"/>
            </xsl:with-param>
            <xsl:with-param name="siz" select="75"/>
            <xsl:with-param name="val" select="doc:CodeDocument"/>
          </xsl:call-template>
        </td>
      </tr>
    </xsl:if>
    <xsl:if test="doc:Series!='' or doc:Number!=''">
      <tr>
        <td>
          <span>
            <xsl:text>Серия</xsl:text>
          </span>
        </td>
        <td>
          <xsl:call-template name="TextBox">
            <xsl:with-param name="siz" select="25"/>
            <xsl:with-param name="val" select="doc:Series"/>
          </xsl:call-template>
        </td>
        <td>
          <span>
            <xsl:text>Номер</xsl:text>
          </span>
        </td>
        <td>
          <xsl:call-template name="TextBox">
            <xsl:with-param name="siz" select="25"/>
            <xsl:with-param name="val" select="doc:Number"/>
          </xsl:call-template>
        </td>
      </tr>
    </xsl:if>
    <xsl:if test="doc:IssueOrgan!='' or doc:Date!=''">
      <tr>
        <td>
          <span>
            <xsl:text>Кем выдан</xsl:text>
          </span>
        </td>
        <td>
          <xsl:call-template name="TextBox">
            <xsl:with-param name="siz" select="25"/>
            <xsl:with-param name="val" select="doc:IssueOrgan"/>
          </xsl:call-template>
        </td>
        <td>
          <span>
            <xsl:text>Дата выдачи</xsl:text>
          </span>
        </td>
        <td>
          <xsl:call-template name="DateBox">
            <xsl:with-param name="siz" select="25"/>
            <xsl:with-param name="val" select="doc:Date"/>
          </xsl:call-template>
        </td>
      </tr>
    </xsl:if>
    <xsl:if test="doc:Desc!=''">
      <tr>
        <td>
          <span>
            <xsl:text>Особые отметки</xsl:text>
          </span>
        </td>
        <td colspan="3">
          <xsl:call-template name="TextBox">
            <xsl:with-param name="siz" select="75"/>
            <xsl:with-param name="val" select="doc:Desc"/>
          </xsl:call-template>
        </td>
      </tr>
    </xsl:if>
    <xsl:for-each select="Images/Image">
      <xsl:choose>
        <xsl:when test="$part='!Print!'">
          <xsl:call-template name="PictureInsert">
            <xsl:with-param name="path" select="$path"/>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="ImageRef">
            <xsl:with-param name="part" select="$part"/>
            <xsl:with-param name="type" select="$type"/>
            <xsl:with-param name="pos" select="$pos"/>
            <xsl:with-param name="pos0" select="$pos0"/>
            <xsl:with-param name="pos1" select="$pos1"/>
            <xsl:with-param name="pos2" select="$pos2"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>


  <xsl:template name="ClientContractor" >
    <table align="center" cellspacing="0" cellpadding="2" border="1" bgcolor="#eeeeee">
      <xsl:attribute name="width">
        <xsl:value-of select="$TableWidth"/>
      </xsl:attribute>
      <xsl:for-each select="//root:Client">
        <xsl:call-template name="Client"/>
      </xsl:for-each>
      <xsl:for-each select="//root:Contractor">
        <xsl:call-template name="Contractor"/>
      </xsl:for-each>
      <xsl:if test="//Conclusion!=''">
        <tr>
          <td>
            <span style="font-weight:bold">
              <xsl:text>Заключение кадастрового инженера</xsl:text>
            </span>
          </td>
        </tr>
        <tr>
          <td>
            <table style="WIDTH: 100%">
              <xsl:call-template name="Table4"/>
              <tr>
                <td>
                  <span>
                    <xsl:text>Заключение</xsl:text>
                  </span>
                </td>
                <td colspan="3">
                  <xsl:call-template name="TextBox">
                    <xsl:with-param name="siz" select="75"/>
                    <xsl:with-param name="val" select="//root:Conclusion"/>
                  </xsl:call-template>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </xsl:if>
    </table>
  </xsl:template>

  <xsl:template name="Client">
    <tr>
      <td>
        <p align="center">
          <span style="font-weight:bold">
            <xsl:text>ЗАКАЗЧИК РАБОТ</xsl:text>
          </span>
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <table style="WIDTH: 100%">
          <xsl:call-template name="Table4"/>
          <tr>
            <td colspan="3">
              <span style="font-weight:bold">
                <xsl:choose>
                  <xsl:when test="root:Person">Физическое лицо</xsl:when>
                  <xsl:when test="root:Organization">Юридическое лицо</xsl:when>
                  <xsl:when test="root:Governance">Орган государственной власти</xsl:when>
                  <xsl:otherwise>Иностранное юридическое лицо</xsl:otherwise>
                </xsl:choose>
              </span>
            </td>
          </tr>
          <xsl:for-each select="root:Person">
            <xsl:if test="fio:FamilyName!='' or fio:FirstName!=''">
              <tr>
                <td>
                  <span>
                    <xsl:text>Фамилия</xsl:text>
                  </span>
                </td>
                <td>
                  <xsl:call-template name="TextBox">
                    <xsl:with-param name="siz" select="25"/>
                    <xsl:with-param name="val" select="fio:FamilyName"/>
                  </xsl:call-template>
                </td>
                <td>
                  <span>
                    <xsl:text>Имя</xsl:text>
                  </span>
                </td>
                <td>
                  <xsl:call-template name="TextBox">
                    <xsl:with-param name="siz" select="25"/>
                    <xsl:with-param name="val" select="fio:FirstName"/>
                  </xsl:call-template>
                </td>
              </tr>
            </xsl:if>
            <xsl:if test="fio:Patronymic!='' or root:SNILS!=''">
              <tr>
                <td>
                  <span>
                    <xsl:text>Отчество</xsl:text>
                  </span>
                </td>
                <td>
                  <xsl:call-template name="TextBox">
                    <xsl:with-param name="siz" select="25"/>
                    <xsl:with-param name="val" select="fio:Patronymic"/>
                  </xsl:call-template>
                </td>
                <td>
                  <span>
                    <xsl:text>СНИЛС</xsl:text>
                  </span>
                </td>
                <td>
                  <xsl:call-template name="TextBox">
                    <xsl:with-param name="siz" select="25"/>
                    <xsl:with-param name="val" select="root:SNILS"/>
                  </xsl:call-template>
                </td>
              </tr>
            </xsl:if>
          </xsl:for-each>
          <xsl:for-each select="root:Organization">
            <xsl:if test="root:Name!=''">
              <tr>
                <td>
                  <span>
                    <xsl:text>Полное наименование</xsl:text>
                  </span>
                </td>
                <td colspan="3">
                  <xsl:call-template name="TextBox">
                    <xsl:with-param name="siz" select="75"/>
                    <xsl:with-param name="val" select="root:Name"/>
                  </xsl:call-template>
                </td>
              </tr>
            </xsl:if>
          </xsl:for-each>
          <xsl:for-each select="root:Governance">
            <xsl:if test="Name!=''">
              <tr>
                <td>
                  <span>
                    <xsl:text>Полное наименование</xsl:text>
                  </span>
                </td>
                <td colspan="3">
                  <xsl:call-template name="TextBox">
                    <xsl:with-param name="siz" select="75"/>
                    <xsl:with-param name="val" select="root:Name"/>
                  </xsl:call-template>
                </td>
              </tr>
            </xsl:if>
          </xsl:for-each>
          <xsl:for-each select="root:ForeignOrganization">
            <xsl:if test="root:Name!=''">
              <tr>
                <td>
                  <span>
                    <xsl:text>Полное наименование</xsl:text>
                  </span>
                </td>
                <td colspan="3">
                  <xsl:call-template name="TextBox">
                    <xsl:with-param name="siz" select="75"/>
                    <xsl:with-param name="val" select="root:Name"/>
                  </xsl:call-template>
                </td>
              </tr>
            </xsl:if>
            <xsl:if test="root:Country!=''">
              <tr>
                <td>
                  <span>
                    <xsl:text>Страна регистрации</xsl:text>
                  </span>
                </td>
                <td colspan="3">
                  <xsl:call-template name="TextBox">
                    <xsl:with-param name="siz" select="75"/>
                    <xsl:with-param name="val" select="root:Country"/>
                  </xsl:call-template>
                </td>
              </tr>
            </xsl:if>

          </xsl:for-each>
        </table>
      </td>
    </tr>
  </xsl:template>

  <xsl:template name="Contractor">
    <tr>
      <td>
        <p align="center">
          <span style="font-weight:bold">
            <xsl:text>ИСПОЛНИТЕЛЬ РАБОТ</xsl:text>
          </span>
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <table style="WIDTH: 100%">
          <xsl:call-template name="Table4"/>
          <tr>
            <td colspan="4">
              <span style="font-weight:bold">
                <xsl:text>Кадастровый инженер</xsl:text>
              </span>
            </td>
          </tr>
          <tr>
            <td>
              <span>
                <xsl:text>Фамилия</xsl:text>
              </span>
            </td>
            <td>
              <xsl:call-template name="TextBox">
                <xsl:with-param name="siz" select="25"/>
                <xsl:with-param name="val" select="fio:FamilyName"/>
              </xsl:call-template>
            </td>
            <td>
              <span>
                <xsl:text>Имя</xsl:text>
              </span>
            </td>
            <td>
              <xsl:call-template name="TextBox">
                <xsl:with-param name="siz" select="25"/>
                <xsl:with-param name="val" select="fio:FirstName"/>
              </xsl:call-template>
            </td>
          </tr>
          <xsl:if
            test="fio:Patronymic!='' or ki:NCertificate!=''">
            <tr>
              <td>
                <span>
                  <xsl:text>Отчество</xsl:text>
                </span>
              </td>
              <td>
                <xsl:call-template name="TextBox">
                  <xsl:with-param name="siz" select="25"/>
                  <xsl:with-param name="val" select="fio:Patronymic"/>
                </xsl:call-template>
              </td>
              <td>
                <span>
                  <xsl:text>Номер аттестата</xsl:text>
                </span>
              </td>
              <td colspan="3">
                <xsl:call-template name="TextBox">
                  <xsl:with-param name="siz" select="25"/>
                  <xsl:with-param name="val" select="ki:NCertificate"/>
                </xsl:call-template>
              </td>
            </tr>
          </xsl:if>
          <xsl:if test="ki:Telephone!='' or ki:Email!=''">
            <tr>
              <td>
                <span>
                  <xsl:text>Телефон</xsl:text>
                </span>
              </td>
              <td>
                <xsl:call-template name="TextBox">
                  <xsl:with-param name="siz" select="25"/>
                  <xsl:with-param name="val" select="ki:Telephone"/>
                </xsl:call-template>
              </td>
              <td>
                <span>
                  <xsl:text>E-mail</xsl:text>
                </span>
              </td>
              <td>
                <xsl:call-template name="TextBox">
                  <xsl:with-param name="siz" select="25"/>
                  <xsl:with-param name="val" select="ki:Email"/>
                </xsl:call-template>
              </td>
            </tr>
          </xsl:if>
          <xsl:if test="ki:Address!=''">
            <tr>
              <td>
                <span>
                  <xsl:text>Адрес</xsl:text>
                </span>
              </td>
              <td colspan="3">
                <xsl:call-template name="TextBox">
                  <xsl:with-param name="siz" select="75"/>
                  <xsl:with-param name="val" select="ki:Address"/>
                </xsl:call-template>
              </td>
            </tr>
          </xsl:if>
          <xsl:if test="ki:Organization/ki:Name!=''">
            <tr>
              <td>
                <span>
                  <xsl:text>Наименование организации</xsl:text>
                </span>
              </td>
              <td colspan="3">
                <xsl:call-template name="TextBox">
                  <xsl:with-param name="siz" select="75"/>
                  <xsl:with-param name="val" select="ki:Organization/ki:Name"/>
                </xsl:call-template>
              </td>
            </tr>
          </xsl:if>
          <xsl:if test="ki:Organization/ki:AddressOrganization!=''">
            <tr>
              <td>
                <span>
                  <xsl:text>Адрес организации</xsl:text>
                </span>
              </td>
              <td colspan="3">
                <xsl:call-template name="TextBox">
                  <xsl:with-param name="siz" select="75"/>
                  <xsl:with-param name="val" select="ki:Organization/ki:AddressOrganization"/>
                </xsl:call-template>
              </td>
            </tr>
          </xsl:if>
          <xsl:if test="@Date!=''">
            <tr>
              <td colspan="2">
                <span>
                  <xsl:text>Дата выполнения кадастровых работ</xsl:text>
                </span>
              </td>
              <td colspan="2">
                <xsl:call-template name="DateBox">
                  <xsl:with-param name="siz" select="50"/>
                  <xsl:with-param name="val" select="@Date"/>
                </xsl:call-template>
              </td>
            </tr>
          </xsl:if>
        </table>
      </td>
    </tr>
  </xsl:template>

  <xsl:template name="Main_Act">
    <p/>
    <table align="center" cellspacing="0" cellpadding="2" border="1" bgcolor="#eeeeee">
      <xsl:attribute name="width">
        <xsl:value-of select="$TableWidth"/>
      </xsl:attribute>
      <tr>
        <td colspan="4">
          <p align="center">
            <span style="font-weight:bold">
              <xsl:text>ОБЪЕКТ НЕДВИЖИМОСТИ</xsl:text>
            </span>
          </p>
          <table style="width:100%">
            <xsl:call-template name="Table4"/>
            <tr>
              <td>
                <span>
                  <xsl:text>Кадастровый номер объекта</xsl:text>
                </span>
              </td>
              <td colspan="3">
                <xsl:call-template name="TextBox">
                  <xsl:with-param name="siz" select="75"/>
                  <xsl:with-param name="val" select="//root:CadastralNumber"/>
                </xsl:call-template>
              </td>
            </tr>
            <tr>
              <td>
                <span>
                  <xsl:text>Тип объекта</xsl:text>
                </span>
              </td>
              <td colspan="3">
                <xsl:call-template name="DictBox">
                  <xsl:with-param name="dic">
                    <xsl:call-template name="dRealty17"/>
                  </xsl:with-param>
                  <xsl:with-param name="siz" select="75"/>
                  <xsl:with-param name="val" select="root:Object/root:ObjectType"/>
                </xsl:call-template>
              </td>
            </tr>
            <xsl:if test="DateActObs">
              <tr>
                <td>
                  <span>
                    <xsl:text>Дата обследования</xsl:text>
                  </span>
                </td>
                <td colspan="3">
                  <xsl:call-template name="DateBox">
                    <xsl:with-param name="siz" select="75"/>
                    <xsl:with-param name="val" select="DateActObs"/>
                  </xsl:call-template>
                </td>
              </tr>
            </xsl:if>
          </table>
          <br/>
          <xsl:call-template name="ClientContractor"/>
          <br/>
          <xsl:if test="root:Documents or Applied_Documents">
            <table align="center" cellspacing="0" cellpadding="2" border="1" bgcolor="#eeeeee">
              <xsl:attribute name="width">
                <xsl:value-of select="$TableWidth"/>
              </xsl:attribute>
              <tr>
                <td colspan="4">
                  <p align="center">
                    <span style="font-weight:bold">
                      <xsl:text>ДОКУМЕНТЫ</xsl:text>
                    </span>
                  </p>
                  <xsl:for-each select="root:Documents/root:Document">
                    <Table>
                      <xsl:attribute name="width">
                        <xsl:value-of select="$TableWidth"/>
                      </xsl:attribute>
                      <tr>
                        <td>
                          <span style="font-weight:bold">
                            <xsl:text>Документ </xsl:text>
                            <xsl:value-of select="position()"/>
                          </span>
                          <xsl:call-template name="Document"/>
                        </td>
                      </tr>
                    </Table>
                  </xsl:for-each>
                  <xsl:for-each select="Applied_Documents/Applied_Document">
                    <Table>
                      <xsl:attribute name="width">
                        <xsl:value-of select="$TableWidth"/>
                      </xsl:attribute>
                      <tr>
                        <td>
                          <span style="font-weight:bold">
                            <xsl:text>Документ </xsl:text>
                            <xsl:value-of select="position()"/>
                          </span>
                          <xsl:call-template name="Document"/>
                        </td>
                      </tr>
                    </Table>
                  </xsl:for-each>
                </td>
              </tr>
            </table>
          </xsl:if>
        </td>
      </tr>
    </table>
  </xsl:template>

  <xsl:template name="Main">
    <P align="center">
      <span style="font-weight:bold">
        <xsl:text>АКТ ОБСЛЕДОВАНИЯ</xsl:text>
      </span>
    </P>
    <xsl:for-each select="//root:InspectionAct">
      <xsl:call-template name="Main_Act">
        <xsl:with-param name="part" select="'Main'"/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>


</xsl:stylesheet>
