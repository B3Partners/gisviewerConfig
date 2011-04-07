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

<div class="infobalk">
    <div class="infobalk_description">INSTELLINGEN</div>
    <div class="infobalk_actions"><tiles:insert name="loginblock"/></div>
</div>


<div style="margin-left: 5px;">
    <h1>Viewer Ontwerp</h1>
    <span class="rolprio_intro">
        Klik op het configuratie icoon naast het ontwerp om de instellingen voor een ontwerp aan te passen.
        <!--of gebruik de pijltjes om de prioriteit van een rol te veranderen.<br/>
        Indien een gebruiker meerdere rollen  heeft wordt de configuratie van de<br/>
        bovenste rol geladen. -->
    </span>
</div>


<div class="tablesortercontainer" style="margin-top: 20px;">
    <table id="rolpriotable" class="tablesorter" style="width: 100%;">
        <thead>
            <tr>
                <th style="width: 70%;">Naam</th>
                <th style="width: 15%;" class="no-filter {sorter: false}">Prioriteit</th>
                <th style="width: 15%;" class="no-filter {sorter: false}">Verwijderen</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${rollen}" var="item">
                <c:url var="link_up" value="/configRolPrio.do?moveAction=${item}@@UP" />
                <c:url var="link_down" value="/configRolPrio.do?moveAction=${item}@@DOWN" />
                <c:url var="link_delete" value="/configRolPrio.do?delete=${item}" />
                <c:url var="link_settings" value="/configKeeper.do?rolnaam=${item}" />
                <tr>
                    <td>${item}</td>
                    <td>
                        <input type="hidden" name="link" value="${link_settings}" /><input type="hidden" name="selected" value="${id_selected}" />
                        <a href="${link_up}"><img src="images/up_30h.png" border="0" alt="Omhoog" title="Omhoog" height="20"/></a>
                        <a href="${link_down}"><img src="images/down_30h.png" border="0" alt="Omlaag" title="Omlaag" height="20"/></a>
                    </td>
                    <td><a href="${link_delete}" onclick="return confirm('Weet u zeker dat u de rol wilt verwijderen?');"><img src="images/delete_30h.png" border="0" alt="Verwijderen" title="Verwijderen" height="20"/></a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<html:form action="/configRolPrio">

    <html:hidden property="action" />
    <html:hidden property="alt_action" />

    <div style="margin-left: 5px; clear: both; margin-top: 10px;">
        <div class="berichtenbalk" style="margin-top: 5px;">
            <tiles:insert definition="actionMessages"/>
        </div>
        <table>
            <tr>
                <td>Nieuwe rol: </td>
                <td><html:text property="nieuwe_rol" size="20"/></td>
                <td>
                    <html:submit property="save" accesskey="s" styleClass="knop" onclick="return confirm('Weet u zeker dat u de rol wilt opslaan?');">
                        Opslaan
                    </html:submit>
                </td>
            </tr>
        </table>
    </div>
</html:form>

<script type="text/javascript">
    tablepager(
    'rolpriotable',
    '930', // table width in pixels
    '20', // cell height
    false // display numberOfPages dropdown
);
</script>
