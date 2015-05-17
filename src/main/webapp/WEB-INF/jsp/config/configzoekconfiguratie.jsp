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

<script type="text/javascript">
    var attribuutFormUrl="<html:rewrite page='/configZoekConfiguratieVeld.do' module=''/>";
</script>
<script type='text/javascript' src="<html:rewrite page='/dwr/engine.js' module=''/>"></script>
<script type='text/javascript' src="<html:rewrite page='/dwr/interface/JZoekConfiguratieUtil.js' module=''/>">
</script>
<script type="text/javascript" src="<html:rewrite page='/scripts/zoekConfiguratie.js' module=''/>"></script>

<c:set var="form" value="${zoekConfiguratieForm}"/>

<div class="infobalk">
    <div class="infobalk_description">ZOEKINGANG CONFIGURATIE</div>
    <div class="infobalk_actions"><tiles:insert name="loginblock"/></div>
</div>
    
<c:if test="${!empty zoekConfiguraties}">
    <table id="zoekconfiguratieTable" class="dataTable">
        <thead>
            <tr>
                <th style="width: 5%;" class="{sorter:'digit'}">ID</th>
                <th style="width: 20%;"><fmt:message key="configzoekconfiguratie.naam"/></th>
                <th style="width: 20%;"><fmt:message key="configzoekconfiguratie.featuretype"/></th>
                <th style="width: 35%;"><fmt:message key="configzoekconfiguratie.parentbron"/></th>
                <th style="width: 20%;"><fmt:message key="configzoekconfiguratie.parentzoekconfiguratie"/></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="zc" varStatus="status" items="${zoekConfiguraties}">
                <c:url var="link" value="/wizardZoekConfiguratie.do?step2=submit&zoekConfiguratieId=${zc.id}"/>
                <c:set var="id_selected" value='' />
                <c:if test="${zc.id == mainid}"><c:set var="id_selected" value=' class="row_selected"' /></c:if>
                <tr data-link="${link}"${id_selected}>
                    <td><c:out value="${zc.id}"/></td>
                    <td><c:out value="${zc.naam}"/></td>
                    <td><c:out value="${zc.featureType}"/></td>
                    <td><c:out value="${zc.parentBron}"/></td>
                    <td><c:out value="${zc.parentZoekConfiguratie}"/></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</c:if>

<div class="berichtenbalk" style="margin-top: 5px;">
    <tiles:insert definition="actionMessages"/>
</div>

<div id="content_style" style="float: left; clear: left;">
    <input type="button" class="knop newButton" onclick="window.location='<html:rewrite page='/wizardZoekConfiguratie.do'/>'" value="<fmt:message key='button.new'/>"/>
</div>