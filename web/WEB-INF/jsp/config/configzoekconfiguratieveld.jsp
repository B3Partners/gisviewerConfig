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

<c:set var="form" value="${zoekConfiguratieVeldForm}"/>
<c:set var="doClose" value="${doClose}"/>
<div class="maintable">
    <div class="berichtenbalk">
        <html:messages id="error" message="true">
            <div class="messages">&#8594; <c:out value="${error}" escapeXml="false"/>&#160;&#160;</div>
        </html:messages>
    </div>
    <c:choose>
    <c:when test="${doClose == 'false' || empty doClose}">
    <html:javascript formName="zoekConfiguratieVeldForm" staticJavascript="false"/>
    <html:form action="/configZoekConfiguratieVeld" onsubmit="return validateZoekConfiguratieVeldForm(this)" focus="${focus}">
        <table style="float: left;">
            <html:hidden property="resultaatAttribuutId"/>
            <html:hidden property="zoekAttribuutId"/>
            <input type="hidden" name="zoekConfiguratieId" value="${zoekConfiguratieId}"/>
            <input type="hidden" name="attribuutType" value="${attribuutType}"/>
            <tr>
                <td><fmt:message key="configzoekconfiguratieveld.label"/>
                </td>
                <td><html:text property="label"></html:text>
                </td>
            </tr>
            <tr>
                <td><fmt:message key="configzoekconfiguratieveld.naam"/>
                </td>
                <td><html:text property="naam"></html:text>
                </td>
            </tr>
            <tr>
                <td><fmt:message key="configzoekconfiguratieveld.type"/>
                </td>
                <td>
                    <html:select property="type">
                        <html:option value="0">Geen</html:option>
                        <html:option value="1">Id</html:option>
                        <html:option value="2">Toon</html:option>
                        <html:option value="3">Geometry</html:option>
                        <html:option value="4">Kleiner dan</html:option>
                        <html:option value="5">Groter dan</html:option>
                        <html:option value="100">Straal</html:option>
                    </html:select>
                </td>
            </tr>
            <tr>
                <td><fmt:message key="configzoekconfiguratieveld.volgorde"/>
                </td>
                <td><html:text property="volgorde"></html:text>
                </td>
            </tr>
            <tr>
                <td><fmt:message key="configzoekconfiguratieveld.attribuutnaam"/>
                </td>
                <td><html:select property="attribuutnaam">
                        <c:forEach items="${attribuutNamen}" var="a">
                            <html:option value="${a}"><c:out value="${a}"/></html:option>
                        </c:forEach>
                    </html:select>
                </td>
            </tr>
            <tr>
                <td></td>
                <td><html:submit property="save"><fmt:message key="button.save"/></html:submit></td>
            </tr>
        </table>
    </html:form>
    </c:when>
        <c:otherwise>
            <script>   
                setTimeout("window.parent.refreshPage()",500);
            </script>
        </c:otherwise>
    </c:choose>
</div>



