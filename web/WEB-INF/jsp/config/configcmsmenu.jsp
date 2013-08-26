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

<script type="text/javascript" src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'></script>
<script type="text/javascript" src='dwr/interface/JCrossWebAppUtil.js'></script>

<c:set var="form" value="${cmsMenuForm}"/>
<c:set var="action" value="${form.map.action}"/>
<c:set var="mainid" value="${form.map.cmsMenuID}"/>

<c:set var="save" value="${action == 'save'}"/>
<c:set var="delete" value="${action == 'delete'}"/>

<c:set var="focus" value="titel"/>

<div class="infobalk">
    <div class="infobalk_description">CMS MENU CONFIGURATIE</div>
    <div class="infobalk_actions"><tiles:insert name="loginblock"/></div>
</div>

<html:form action="/configCMSMenu" onsubmit="return validateCMSMenuForm(this)" focus="${focus}">
    <div style="display: none;">
        <html:hidden property="action"/>
        <html:hidden property="alt_action"/>
        <html:hidden property="cmsMenuID"/>
        <input type="hidden" name="refreshLists">
    </div>
    <c:if test="${!empty cmsMenus}">
        <table id="connectietable" class="dataTable">
            <thead>
                <tr>
                    <th style="width: 30%;">Titel</th>
                    <th style="width: 35%;">Datum</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="ci" varStatus="status" items="${cmsMenus}">
                    <c:url var="link" value="/configCMSMenu.do?edit=submit&cmsMenuID=${ci.id}" />
                    <c:set var="id_selected" value='' />
                    <c:if test="${ci.id == mainid}">
                        <c:set var="id_selected" value=' class="row_selected"' />
                    </c:if>
                    <tr data-link="${link}"${id_selected} >
                        <td><c:out value="${ci.titel}"/></td>
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
                        <fmt:message key="configcmsmenutitel.label"/> <a href="#" onclick="return showHelpDialog('help_configcmsmenutitel');">(?)</a>
                        <div id="help_configcmsmenutitel" style="display: none;" title="<fmt:message key="configcmsmenutitel.label"/>">
                            <p><fmt:message key="configcmsmenutitel.uitleg"/></p>
                        </div>           
                    </td>
                    <td colspan="3">
                        <html:text property="titel" size="40"/>
                    </td>
                </tr>
            </table>
        </div>

        <p>
        <h2>Koppel beschikbare menu items</h2><br/>
        
        <table>
            <c:forEach var="cmsMenuItem" items="${cmsMenuItems}">
                <tr>
                    <td>
                        <html:multibox property="cmsMenuItemsAan">
                            <c:out value="${cmsMenuItem.id}"/>
                        </html:multibox>
                    </td>
                    <td>
                        <c:out value="${cmsMenuItem.titel}"/>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </p>

    <div class="knoppenbalk">
        <!-- Bij nieuw alleen opslaan en annuleren tonen -->
        <c:if test="${empty form.map.cmsMenuID}">
            <div class="knoppen">
                <input type="button" class="knop" onclick="window.location = '<html:rewrite page='/configCMSMenu.do' />'" value="<fmt:message key='button.cancel'/>" />
            </div>
            <div class="knoppen">
                <html:submit property="save" accesskey="s" styleClass="knop saveButton" onclick="return confirm('Weet u zeker dat u dit cms menu wilt opslaan?');">
                    <fmt:message key="button.save"/>
                </html:submit>
            </div>                
        </c:if>

        <!-- Bij bewerken nieuw, wissen en opslaan tonen -->
        <c:if test="${!empty form.map.cmsMenuID}">
            <div class="knoppen">
                <html:submit property="create" accesskey="n" styleClass="knop newButton">
                    <fmt:message key="button.new"/>
                </html:submit>
            </div>
            <div class="knoppen">
                <html:submit property="delete" accesskey="d" styleClass="knop removeButton" onclick="return confirm('Weet u zeker dat u dit cms menu wilt verwijderen?');">
                    <fmt:message key="button.remove"/>
                </html:submit>
            </div>
            <div class="knoppen">
                <html:submit property="save" accesskey="s" styleClass="knop saveButton" onclick="return confirm('Weet u zeker dat u dit cms menu wilt opslaan?');">
                    <fmt:message key="button.save"/>
                </html:submit>
            </div>
        </c:if>
    </div>
</div>
</html:form>