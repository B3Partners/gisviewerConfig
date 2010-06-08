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

<script type='text/javascript' src="<html:rewrite page='/dwr/interface/JZoekConfiguratieUtil.js' module=''/>">
</script>
<script type='text/javascript' src="<html:rewrite page='/dwr/engine.js' module=''/>"></script>
<script type="text/javascript" src="<html:rewrite page='/scripts/wizardZoekConfiguratie.js' module=''/>"></script>
<div class="infobalk">
    <div class="infobalk_description"><fmt:message key="wizardzoekconfiguratie.step4"/></div>
    <div class="infobalk_actions"><tiles:insert name="loginblock"/></div>
</div>
<script type="text/javascript">
    var attribuutFormUrl="<html:rewrite page='/configZoekConfiguratieVeld.do' module=''/>";
    var startPage="<html:rewrite page='/configZoekConfiguratie.do' module=''/>";
</script>
<html:form action="/wizardZoekConfiguratie">
    <input type="hidden" name="step3" id="stepElement"/>
    <input type="hidden" name="bronId" value="${bronId}"/>
    <input type="hidden" name="featureType" value="${featureType}"/>
    <input type="hidden" id="zoekConfiguratieId" name="zoekConfiguratieId" value="${zoekConfiguratieId}"/>
    <div class="berichtenbalk">
        <html:messages id="error" message="true">
            <div class="messages">&#8594; <c:out value="${error}" escapeXml="false"/>&#160;&#160;</div>
        </html:messages>
    </div>
    <div class="wizardQuestionBlock">
        <p>
            <fmt:message key="wizardzoekconfiguratie.vraag.geefattributen"/>
        </p>
        <table>
            <tr>
                <td><fmt:message key="configzoekconfiguratie.zoekattribuut"/>
                </td>
                <td>
                    <fmt:message key="configzoekconfiguratie.resultaatattribuut"/>
                </td>          
            </tr>
            <tr>
                <td><div class="zoekConfiguratieVeldenContainer">
                        <table>
                            <c:forEach var="z" items="${zoekVelden}">
                                <tr title="Wijzig: <c:out value='${z}'/>">
                                    <td class="zoekConfiguratieAttribuutNaam" onclick="openZoekAttribuutForm(${z.id})">
                                        <c:out value="${z.attribuutnaam}"/>
                                    </td>
                                    <td>
                                        <div style="cursor: pointer;" title="Delete: <c:out value='${z}'/>" onclick="removeZoekAttribuut(${z.id})">delete</div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                <td valign="top">
                    <div class="zoekConfiguratieVeldenContainer">
                        <table>
                            <c:forEach var="r" items="${resultaatVelden}">
                                <tr title="Wijzig: <c:out value='${r}'/>">
                                    <td class="zoekConfiguratieAttribuutNaam" onclick="openResultaatAttribuutForm(${r.id})">
                                        <c:out value="${r.attribuutnaam}"/>
                                    </td>
                                    <td>
                                        <div style="cursor: pointer;" title="Delete: <c:out value='${r}'/>" onclick="removeResultaatAttribuut(${r.id})">delete</div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <div style="cursor: pointer;" onclick="addAttribuut(${zoekConfiguratieId},'zoek')">+</div>
                </td>

                <td valign="top">
                    <div style="cursor: pointer;" onclick="addAttribuut(${zoekConfiguratieId},'resultaat')">+</div>
                </td>
            </tr>
        </table>
        <c:if test="${not empty tips}">
            <div class="tipsContainer">
                Tips
                <ul>
                    <c:forEach items="${tips}" var="tip">
                        <li><fmt:message key="${tip}"/></li>
                    </c:forEach>                    
                </ul>
            </div>
        </c:if>
    </div>
    <div class="wizardButtonBar">
        <html:submit property="step2"><fmt:message key='button.previous'/></html:submit>
        <input type="button" onclick="openStartPage()"value="<fmt:message key='button.ok'/>"/>
    </div>
</html:form>

<div id ="dialogPopUp">
    <iframe id="iframeZoekConfiguratieVeld"/>
</div>