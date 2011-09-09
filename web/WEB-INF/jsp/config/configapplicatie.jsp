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

<c:set var="form" value="${applicatieForm}"/>
<c:set var="action" value="${form.map.action}"/>
<c:set var="mainid" value="${form.map.applicatieID}"/>

<c:set var="focus" value="naam"/>

<div class="infobalk">
    <div class="infobalk_description">APPLICATIES</div>
    <div class="infobalk_actions"><tiles:insert name="loginblock"/></div>
</div>

<c:if test="${!empty applicaties}">
    <div class="tablesortercontainer" style="margin-top: 20px;">
        <table id="applicatieTable" class="tablesorter" style="width: 100%;">
            <thead>
                <tr>
                    <th style="width: 40%;">Naam</th>
                    <th style="width: 25%;">Code</th>
                    <th style="width: 20%;">Datum gebruikt</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach items="${applicaties}" var="item">
                    <c:set var="id_selected" value="" />
                    <c:if test="${item.id == mainid}"><c:set var="id_selected" value='selected' /></c:if>
                    <c:url var="link" value="/configApplicatie.do?edit=submit&applicatieID=${item.id}"/>
                    <tr>
                        <td><c:out value="${item.naam}"/><input type="hidden" name="link" value="${link}" /><input type="hidden" name="selected" value="${id_selected}" /></td>
                        <td>${item.code}</td>
                        <td>${item.datum_gebruikt}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</c:if>

<html:form action="/configApplicatie" focus="${focus}">
    <div style="display: none;">
        <html:hidden property="action"/>
        <html:hidden property="alt_action"/>
        <html:hidden property="applicatieID"/>
        <input type="hidden" name="refreshLists">
    </div>

    <div style="margin-left: 5px; clear: both; margin-top: 10px;">
        <div class="berichtenbalk" style="margin-top: 5px;">
            <tiles:insert definition="actionMessages"/>
        </div>

        <h2>Applicatie</h2>
        
        <table>
            <tr>
                <td>Naam</td>
                <td><html:text property="naam" size="20"/></td>
            </tr>
            <tr>
                <td>Code</td>
                <td><html:text property="code" size="20"/></td>
            </tr>
            <tr>
                <td>Gebruikers code</td>
                <td><html:text property="gebruikersCode" size="20"/></td>
            </tr>
            <tr>
                <td>Parent</td>
                <td><html:text property="parent" size="20"/></td>
            </tr>
            <tr>
                <td>Datum gebruikt</td>
                <td><html:text property="datum_gebruikt" size="20"/></td>
            </tr>
        </table>

        <div class="knoppenbalk">
            <c:if test="${empty form.map.applicatieID}">
                <html:submit property="save" accesskey="s" styleClass="knop saveButton" onclick="return confirm('Weet u zeker dat u deze applicatie wilt opslaan?');">
                    Opslaan
                </html:submit>
            </c:if>
            <c:if test="${!empty form.map.applicatieID}">
                <html:submit property="save" accesskey="s" styleClass="knop saveButton" onclick="return confirm('Weet u zeker dat u deze applicatie wilt opslaan?');">
                    Opslaan
                </html:submit>

                <input type="button" class="knop" onclick="window.location='<html:rewrite page='/configApplicatie.do' />'" value="<fmt:message key='button.cancel'/>" />
                
                <html:submit property="delete" accesskey="d" styleClass="knop removeButton" onclick="return confirm('Weet u zeker dat u deze applicatie wilt verwijderen?');">
                    <fmt:message key="button.remove"/>
                </html:submit>
            </c:if>
        </div>

    </div>
</html:form>

<script type="text/javascript">
    tablepager (
        'applicatieTable',
        '930', // table width in pixels
        '20', // cell height
        false // display numberOfPages dropdown
    );
</script>
