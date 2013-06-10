<%--
Copyright 2007-2013 B3Partners BV.

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

<script type="text/javascript" src="<html:rewrite page="/scripts/ckeditor/ckeditor.js"/>"></script>

<c:set var="form" value="${cmsPaginaForm}"/>
<c:set var="action" value="${form.map.action}"/>
<c:set var="mainid" value="${form.map.cmsPaginaID}"/>

<c:set var="save" value="${action == 'save'}"/>
<c:set var="delete" value="${action == 'delete'}"/>

<c:set var="focus" value="titel"/>

<div class="infobalk">
    <div class="infobalk_description">CMS PAGINA CONFIGURATIE</div>
    <div class="infobalk_actions"><tiles:insert name="loginblock"/></div>
</div>

<html:form action="/configCMSPagina" onsubmit="return validateCMSPaginaForm(this)" focus="${focus}">
    <div style="display: none;">
        <html:hidden property="action"/>
        <html:hidden property="alt_action"/>
        <html:hidden property="cmsPaginaID"/>
        <input type="hidden" name="refreshLists">
    </div>
    <c:if test="${!empty cmsPaginas}">
        <table id="connectietable" class="dataTable">
            <thead>
                <tr>
                    <th style="width: 30%;">Titel</th>
                    <th style="width: 35%;">Thema</th>
                    <th style="width: 35%;">Datum</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="ci" varStatus="status" items="${cmsPaginas}">
                    <c:url var="link" value="/configCMSPagina.do?edit=submit&cmsPaginaID=${ci.id}"/>
                    <c:set var="id_selected" value='' />
                    <c:if test="${ci.id == mainid}"><c:set var="id_selected" value=' class="row_selected"' /></c:if>
                    <tr data-link="${link}"${id_selected}>
                        <td><c:out value="${ci.titel}"/></td>
                        <td><c:out value="${ci.thema}"/></td>
                        
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
                        <fmt:message key="configcmspaginatitel.label"/> <a href="#" onclick="return showHelpDialog('help_configcmspaginatitel');">(?)</a>
                        <div id="help_configcmspaginatitel" style="display: none;" title="<fmt:message key="configcmspaginatitel.label"/>">
                            <p><fmt:message key="configcmspaginatitel.uitleg"/></p>
                        </div>           
                    </td>
                    <td colspan="3">
                        <html:text property="titel" size="40"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <fmt:message key="configcmspaginatekst.label"/> <a href="#" onclick="return showHelpDialog('help_configcmspaginatekst');">(?)</a>
                        <div id="help_configcmspaginatekst" style="display: none;" title="<fmt:message key="configcmspaginatekst.label"/>">
                            <p><fmt:message key="configcmspaginatekst.uitleg"/></p>
                        </div>
                    </td>
                    <td colspan="3">
                        <html:textarea styleClass="ckeditor" property="tekst" rows="8" cols="100"/>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <fmt:message key="configcmspaginathema.label"/> <a href="#" onclick="return showHelpDialog('help_configcmspaginathema');">(?)</a>
                        <div id="help_configcmspaginathema" style="display: none;" title="<fmt:message key="configcmspaginathema.label"/>">
                            <p><fmt:message key="configcmspaginathema.uitleg"/></p>
                        </div>
                    </td>
                    <td colspan="3">
                        <html:select property="thema">
                            <html:option value="">-</html:option>
                            
                            <%-- TODO: Deze options uit design folder lezen --%>
                            <html:option value="gouda">Gemeente Gouda</html:option>
                            <html:option value="dronten">Gemeente Dronten</html:option>
                            <html:option value="solutionparc">B3P Solutionparc</html:option>                            
                        </html:select>
                    </td>
                </tr>
            </table>
        </div>

        <div class="knoppenbalk">
            <!-- Bij nieuw alleen opslaan en annuleren tonen -->
            <c:if test="${empty form.map.cmsPaginaID}">
                <div class="knoppen">
                    <input type="button" class="knop" onclick="window.location='<html:rewrite page='/configCMSPagina.do' />'" value="<fmt:message key='button.cancel'/>" />
                </div>
                <div class="knoppen">
                    <html:submit property="save" accesskey="s" styleClass="knop saveButton" onclick="return confirm('Weet u zeker dat u deze cms pagina wilt opslaan?');">
                        <fmt:message key="button.save"/>
                    </html:submit>
                </div>                
            </c:if>

            <!-- Bij bewerken nieuw, wissen en opslaan tonen -->
            <c:if test="${!empty form.map.cmsPaginaID}">
                <div class="knoppen">
                    <html:submit property="create" accesskey="n" styleClass="knop newButton">
                        <fmt:message key="button.new"/>
                    </html:submit>
                </div>
                <div class="knoppen">
                    <html:submit property="delete" accesskey="d" styleClass="knop removeButton" onclick="return confirm('Weet u zeker dat u deze cms pagina wilt verwijderen?');">
                        <fmt:message key="button.remove"/>
                    </html:submit>
                </div>
                <div class="knoppen">
                    <html:submit property="save" accesskey="s" styleClass="knop saveButton" onclick="return confirm('Weet u zeker dat u deze cms pagina wilt opslaan?');">
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