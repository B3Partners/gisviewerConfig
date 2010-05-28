<%--
B3P Gisviewer is an extension to Flamingo MapComponents making      
it a complete webbased GIS viewer and configuration tool that    
works in cooperation with B3P Kaartenbalie.  
                    
Copyright 2006, 2007, 2008 B3Partners BV

This file is part of B3P Gisviewer.

B3P Gisviewer is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

B3P Gisviewer is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with B3P Gisviewer.  If not, see <http://www.gnu.org/licenses/>.
--%>
<%@include file="/WEB-INF/jsp/taglibs.jsp" %>
<%@ page isELIgnored="false"%>


<div class="infobalk">
    <div class="infobalk_description">CONNECTIE CONFIG</div>
    <div class="infobalk_actions"><tiles:insert name="loginblock"/></div>
</div>
<div>
    <table id="zoekconfiguratieTable" class="tablesorter">
        <thead>
            <tr>
                <th><fmt:message key="configzoeker.id"/></th>
                <th><fmt:message key="configzoeker.naam"/></th>
                <th><fmt:message key="configzoeker.featuretype"/></th>
                <th><fmt:message key="configzoeker.parentbron"/></th>
                <th><fmt:message key="configzoeker.parentzoekconfiguratie"/></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="zc" varStatus="status" items="${zoekconfiguraties}">
                <c:set var="id_selected" value="" />
                <c:if test="${zc.id == mainid}"><c:set var="id_selected" value='selected' /></c:if>
                <c:url var="link" value="/configConnectie.do?edit=submit&id=${ci.id}"/>
                <tr>
                    <td><c:out value="${zc.id}"/></td>
                    <td><c:out value="${zc.naam}"/></td>
                    <td><c:out value="${zc.featureType}"/></td>
                    <td><c:out value="${zc.parentBron}"/></td>
                    <td><c:out value="${zc.parentZoekConfiguratie}"/></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
       
<script type="text/javascript">
    $j(document).ready(function() {
        tablesort(
            'zoekconfiguratieTable',
            '153',
            '900'
        );
        $j("#zoekconfiguratieTable > tbody > tr").each(function(){
            if($j(this).find("input[name=selected]").val() == "selected") {
                $j(this).addClass("ui-state-highlight");
                $j("#zoekconfiguratieTable").parent().parent().scrollTop(($j(this).position().top - $j(this).parent().position().top)-1);
            }
            $j(this).click(function() {
                window.location.href=$j(this).find("input[name=link]").val();
            });
        });
    });
</script>