<%--
Copyright 2007-2011 B3Partners BV.

This program is distributed under the terms
of the GNU General Public License.

You should have received a copy of the GNU General Public License
along with this software. If not, see http://www.gnu.org/licenses/gpl.html

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
--%>
<%@include file="/WEB-INF/jsp/taglibs.jsp" %>
<%@ page isELIgnored="false"%>

<script type="text/javascript" src="<html:rewrite page="/scripts/ckeditor4/ckeditor.js"/>"></script>

<c:set var="form" value="${cmsForm}"/>
<c:set var="action" value="${form.map.action}"/>
<c:set var="mainid" value="${form.map.tekstBlokID}"/>

<c:set var="save" value="${action == 'save'}"/>
<c:set var="delete" value="${action == 'delete'}"/>

<c:set var="focus" value="titel"/>

<div class="infobalk">
    <div class="infobalk_description">CMS CONFIGURATIE</div>
    <div class="infobalk_actions"><tiles:insert name="loginblock"/></div>
</div>

<html:form action="/configCMS" onsubmit="return validateCMSForm(this)" focus="${focus}">
    <div style="display: none;">
        <html:hidden property="action"/>
        <html:hidden property="alt_action"/>
        <html:hidden property="tekstBlokID"/>
        <input type="hidden" name="refreshLists">
    </div>
    <c:if test="${!empty tekstBlokken}">
        <table id="connectietable" class="dataTable">
            <thead>
                <tr>
                    <th style="width: 10%;" class="{sorter:'digit'}">Volgorde</th>
                    <th style="width: 25%;">Titel</th>
                    <th style="width: 25%;">Url</th>
                    <th style="width: 10%;">Toon url</th>
                    <th style="width: 15%;">Pagina</th>
                    <th style="width: 15%;">Datum</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="ci" varStatus="status" items="${tekstBlokken}">
                    <c:url var="link" value="/configCMS.do?edit=submit&tekstBlokID=${ci.id}"/>
                    <c:set var="id_selected" value='' />
                    <c:if test="${ci.id == mainid}"><c:set var="id_selected" value=' class="row_selected"' /></c:if>
                    <tr data-link="${link}"${id_selected}>
                        <td><c:out value="${ci.volgordeNr}"/></td>
                        <td><c:out value="${ci.titel}"/></td>
                        <td><c:out value="${ci.url}"/></td>
                        <td>
                            <c:if test="${ci.toonUrl}">
                                <c:out value="Ja"/>
                            </c:if>
                            <c:if test="${!ci.toonUrl}">
                                <c:out value="Nee"/>
                            </c:if>
                        </td>
                        <td><c:out value="${ci.cmsPagina}"/></td>
                        <td><fmt:formatDate value="${ci.cdate}" pattern="dd-MM-yyyy HH:mm"/></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>

    <div id="content_style" style="float: left; clear: left;">
        <div class="berichtenbalk" style="margin-top: 5px;">
            <tiles:insert definition="actionMessages"/>
        </div>

        <div class="maintable" style="margin-top: 5px;">

            <table cellpadding="2" cellspacing="2" border="0">
                <tr>
                    <td>
                        <fmt:message key="configcmstitel.label"/> <a href="#" onclick="return showHelpDialog('help_configcmstitel');">(?)</a>
                        <div id="help_configcmstitel" style="display: none;" title="<fmt:message key="configcmstitel.label"/>">
                            <p><fmt:message key="configcmstitel.uitleg"/></p>
                        </div>           
                    </td>
                    <td colspan="3">
                        <html:text property="titel" size="40"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <fmt:message key="configcmstekst.label"/> <a href="#" onclick="return showHelpDialog('help_configcmstekst');">(?)</a>
                        <div id="help_configcmstekst" style="display: none;" title="<fmt:message key="configcmstekst.label"/>">
                            <p><fmt:message key="configcmstekst.uitleg"/></p>
                        </div>
                    </td>
                    <td colspan="3">
                        <html:textarea styleClass="ckeditor" property="tekst" rows="8" cols="100"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <fmt:message key="configcmsurl.label"/> <a href="#" onclick="return showHelpDialog('help_configcmsurl');">(?)</a>
                        <div id="help_configcmsurl" style="display: none;" title="<fmt:message key="configcmsurl.label"/>">
                            <p><fmt:message key="configcmsurl.uitleg"/></p>
                        </div>
                    </td>
                    <td colspan="3">
                        <html:text property="url" size="40"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <fmt:message key="configcmsurlinhoud.label"/> <a href="#" onclick="return showHelpDialog('help_configcmsurlinhoud');">(?)</a>
                        <div id="help_configcmsurlinhoud" style="display: none;" title="<fmt:message key="configcmsurlinhoud.label"/>">
                            <p><fmt:message key="configcmsurlinhoud.uitleg"/></p>
                        </div>
                    </td>
                    <td colspan="3">
                        <html:checkbox property="toonUrl" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <fmt:message key="configcmsinlogicon.label"/> <a href="#" onclick="return showHelpDialog('help_configcmsinlogicon');">(?)</a>
                        <div id="help_configcmsinlogicon" style="display: none;" title="<fmt:message key="configcmsinlogicon.label"/>">
                            <p><fmt:message key="configcmsinlogicon.uitleg"/></p>
                        </div>
                    </td>
                    <td colspan="3">
                        <html:checkbox property="inlogIcon" />
                    </td>
                </tr>

                <!-- Loop door cms pagina's -->
                <tr>
                    <td>
                        <fmt:message key="configcmspagina.label"/> <a href="#" onclick="return showHelpDialog('help_configcmspagina');">(?)</a>
                        <div id="help_configcmspagina" style="display: none;" title="<fmt:message key="configcmspagina.label"/>">
                            <p><fmt:message key="configcmspagina.uitleg"/></p>
                        </div>
                    </td>
                    <td colspan="3">
                        <html:select property="cmsPagina">
                            <html:option value="">NIET TONEN</html:option>

                            <c:forEach var="pageItem" items="${cmsPaginas}">
                                <html:option value="${pageItem.id}">
                                    <c:out value="${pageItem.titel}"/>
                                </html:option>
                            </c:forEach>
                        </html:select>
                    </td>
                </tr>

                <tr>
                    <td>
                        <fmt:message key="configcmsvolgorde.label"/> <a href="#" onclick="return showHelpDialog('help_configcmsvolgorde');">(?)</a>
                        <div id="help_configcmsvolgorde" style="display: none;" title="<fmt:message key="configcmsvolgorde.label"/>">
                            <p><fmt:message key="configcmsvolgorde.uitleg"/></p>
                        </div>
                    </td>
                    <td colspan="3">
                        <html:text property="volgordeNr" size="10"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <fmt:message key="configcmskleur.label"/> <a href="#" onclick="return showHelpDialog('help_configcmskleur');">(?)</a>
                        <div id="help_configcmskleur" style="display: none;" title="<fmt:message key="configcmskleur.label"/>">
                            <p><fmt:message key="configcmskleur.uitleg"/></p>
                        </div>
                    </td>
                    <td colspan="3">
                        <html:text property="kleur" size="40"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <fmt:message key="configcmshoogte.label"/> <a href="#" onclick="return showHelpDialog('help_configcmshoogte');">(?)</a>
                        <div id="help_configcmshoogte" style="display: none;" title="<fmt:message key="configcmshoogte.label"/>">
                            <p><fmt:message key="configcmshoogte.uitleg"/></p>
                        </div>
                    </td>
                    <td colspan="3">
                        <html:text property="hoogte" size="40"/>
                    </td>
                </tr>
            </table>
        </div>

        <div class="knoppenbalk">
            <!-- Bij nieuw alleen opslaan en annuleren tonen -->
            <c:if test="${empty form.map.tekstBlokID}">
                <div class="knoppen">
                    <input type="button" class="knop" onclick="window.location='<html:rewrite page='/configCMS.do' />'" value="<fmt:message key='button.cancel'/>" />
                </div>
                <div class="knoppen">
                    <html:submit property="save" accesskey="s" styleClass="knop saveButton" onclick="return confirm('Weet u zeker dat u dit tekstblok wilt opslaan?');">
                        <fmt:message key="button.save"/>
                    </html:submit>
                </div>                
            </c:if>

            <!-- Bij bewerken nieuw, wissen en opslaan tonen -->
            <c:if test="${!empty form.map.tekstBlokID}">
                <div class="knoppen">
                    <html:submit property="create" accesskey="n" styleClass="knop newButton">
                        <fmt:message key="button.new"/>
                    </html:submit>
                </div>
                <div class="knoppen">
                    <html:submit property="delete" accesskey="d" styleClass="knop removeButton" onclick="return confirm('Weet u zeker dat u dit tekstblok wilt verwijderen?');">
                        <fmt:message key="button.remove"/>
                    </html:submit>
                </div>
                <div class="knoppen">
                    <html:submit property="save" accesskey="s" styleClass="knop saveButton" onclick="return confirm('Weet u zeker dat u dit tekstblok wilt opslaan?');">
                        <fmt:message key="button.save"/>
                    </html:submit>
                </div>
            </c:if>
        </div>
    </div>
</html:form>
<script type="text/javascript">
    var globalrows;
</script>