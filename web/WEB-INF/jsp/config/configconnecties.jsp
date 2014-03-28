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

<c:set var="form" value="${connectieForm}"/>
<c:set var="action" value="${form.map.action}"/>
<c:set var="mainid" value="${form.map.bronId}"/>

<c:set var="save" value="${action == 'save'}"/>
<c:set var="delete" value="${action == 'delete'}"/>

<c:set var="focus" value="naam"/>

<div class="infobalk">
    <div class="infobalk_description">BRON CONFIGURATIE</div>
    <div class="infobalk_actions"><tiles:insert name="loginblock"/></div>
</div>

<html:javascript formName="connectieForm" staticJavascript="false"/>
<html:form action="/configConnectie" onsubmit="return validateConnectieForm(this)" focus="${focus}">
    <div style="display: none;">
        <html:hidden property="action"/>
        <html:hidden property="alt_action"/>
        <html:hidden property="bronId"/>
        <input type="hidden" name="refreshLists">
    </div>
    <c:if test="${!empty allConnecties}">
        <table id="connectietable" class="dataTable">
            <thead>
                <tr>
                    <!-- <th style="width: 10%;">Status</th> -->
                    <th style="width: 5%;" class="{sorter:'digit'}">Volgorde</th>
                    <th style="width: 25%;"><label><fmt:message key="configconnectie.naam"/></th>
                    <th style="width: 70%;"><label><fmt:message key="configconnectie.url"/></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="ci" varStatus="status" items="${allConnecties}">
                    <c:url var="link" value="/configConnectie.do?edit=submit&bronId=${ci.id}"/>
                    <c:set var="id_selected" value='' />
                    <c:if test="${ci.id == mainid}"><c:set var="id_selected" value=' class="row_selected"' /></c:if>
                    <tr data-link="${link}"${id_selected}>
                        <%--
                        <td>
                            <c:set var="testId" value="${ci.id}"/>

                            <c:choose>
                                <c:when test="${fn:contains(validBronIds, testId)}">
                                    <span style="color: green">GOED</span>
                                </c:when>
                                <c:otherwise>
                                    <span style="color: red">FOUT</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        --%>
                        <td><c:out value="${ci.volgorde}"/></td>
                        <td><c:out value="${ci.naam}"/></td>
                        <td><c:out value="${ci.url}"/></td>
                        </div>
                    </c:forEach>
            </tbody>
        </table>
    </c:if>

    <div class="berichtenbalk" style="margin-top: 5px;">
        <tiles:insert definition="actionMessages"/>
    </div>
    <div class="ie7clear"></div>
    <div style="float: right; clear: both; width: 940px; margin-right: 20px; margin-bottom: 5px;">
        <div style="float: left; margin-left: 10px;">
            <input type="checkbox" id="advancedToggle" data-cookie-key="connecties" /> Toon geavanceerde opties
        </div>
        <div style="float: right;">
            <!-- Bij nieuw alleen opslaan en annuleren tonen -->
            <c:if test="${empty form.map.bronId}">
                <div class="knoppen">
                    <html:submit property="save" accesskey="s" styleClass="knop saveButton" onclick="return confirm('Weet u zeker dat u deze bron wilt opslaan?');">
                        <fmt:message key="button.save"/>
                    </html:submit>
                </div>
                <div class="knoppen">
                    <input type="button" class="knop" onclick="window.location='<html:rewrite page='/configConnectie.do' />'" value="<fmt:message key='button.cancel'/>" />
                </div>
            </c:if>

            <!-- Bij bewerken nieuw, wissen en opslaan tonen -->
            <c:if test="${!empty form.map.bronId}">
                <div class="knoppen">
                    <html:submit property="create" accesskey="n" styleClass="knop newButton">
                        <fmt:message key="button.new"/>
                    </html:submit>
                </div>
                <div class="knoppen">
                    <html:submit property="delete" accesskey="d" styleClass="knop removeButton" onclick="return confirm('Weet u zeker dat u deze bron wilt verwijderen?');">
                        <fmt:message key="button.remove"/>
                    </html:submit>
                </div>
                <div class="knoppen">
                    <html:submit property="save" accesskey="s" styleClass="knop saveButton" onclick="return confirm('Weet u zeker dat u deze bron wilt opslaan?');">
                        <fmt:message key="button.save"/>
                    </html:submit>
                </div>
            </c:if>
        </div>
    </div>
    <div class="ie7clear"></div>
    <div class="tabcontents fullwidthtab">
        <div class="tabcontent defaulttab">
            <div class="configbasic">
                <div class="configrow">
                    <label><fmt:message key="configconnectie.naam"/></label>
                    <html:text property="naam" size="140"/>                   
                </div>
                <div class="configrow">
                    <label><fmt:message key="configconnectie.url"/></label>
                    <html:text property="url" size="140"/>
                    <a class="helpLink" href="#" id="helpLink_help_configconnectie">(?)</a>
                    <div id="help_configconnectie" style="display: none;" title="<fmt:message key="configconnectie.url"/>">
                        <fmt:message key="configconnectie.url.uitleg"/>
                    </div>
                </div>
                <div class="configrow">
                    <label><fmt:message key="configconnectie.gebruikersnaam"/></label>
                    <html:text property="gebruikersnaam" size="140"/>
                </div>
                <div class="configrow">
                    <label><fmt:message key="configconnectie.wachtwoord"/></label>
                    <html:password property="wachtwoord" size="140"/>
                </div>
                <div class="configrow">
                    <label><fmt:message key="configconnectie.volgorde"/></label>
                    <html:text property="volgorde" size="140"/>
                </div>
                </table>
            </div>
            <div class="configadvanced"></div>
        </div>
    </div>
    <div style="clear: both;"></div>
</html:form>
<script type="text/javascript">
    var globalrows;
</script>