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
<script type='text/javascript' src="<html:rewrite page='/dwr/engine.js' module=''/>"></script>
<script type='text/javascript' src="<html:rewrite page='/dwr/interface/JZoekConfiguratieUtil.js' module=''/>"></script>
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

<%-- Hidden veld hier nodig om usecaching waarde van stap 2 correct
over te nemen. Anders wordt bij het aanmaken van nieuw zoekveld
de usecaching waarde verkeerd gezet omdat ook stap 3 uit Actionw erdt aangeroepen
--%>
<c:if test="${usecaching == '1'}">
    <input type="hidden" name="usecaching" value="1"/>
</c:if>
              
<input type="hidden" name="step3" id="stepElement"/>
<input type="hidden" name="bronId" value="${bronId}"/>
<input type="hidden" name="featureType" value="${featureType}"/>
<input type="hidden" id="zoekConfiguratieId" name="zoekConfiguratieId" value="${zoekConfiguratieId}"/>

<div class="berichtenbalk">
            <tiles:insert definition="actionMessages"/>
</div>

<div style="margin-left: 5px;">
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
                                        <c:set var="label" value="${z.label}"/>
                                        <c:set var="attrNaam" value="${z.attribuutnaam}"/>

                                        <c:if test="${!empty label}">
                                            <c:out value="${label}"/>
                                        </c:if>

                                        <c:if test="${empty label}">
                                            <c:out value="${attrNaam}"/>
                                        </c:if>
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
                                        <c:set var="label" value="${r.label}"/>
                                        <c:set var="attrNaam" value="${r.attribuutnaam}"/>

                                        <c:if test="${!empty label}">
                                            <c:out value="${label}"/>
                                        </c:if>

                                        <c:if test="${empty label}">
                                            <c:out value="${attrNaam}"/>
                                        </c:if>
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
                    <div class="addZoekerVeld" onclick="addAttribuut(${zoekConfiguratieId},'zoek')">+ Nieuw zoekveld</div>
                </td>

                <td valign="top">
                    <div class="addZoekerVeld" onclick="addAttribuut(${zoekConfiguratieId},'resultaat')">+ Nieuw resultaatveld</div>
                </td>
            </tr>
        </table>
        <c:if test="${not empty parentZoekVelden}">
            <div class="tipsContainer">
                <fmt:message key="wizardzoekconfiguratie.parentzoekvelden"/>
                <ul>
                    <c:forEach items="${parentZoekVelden}" var="r">
                        <c:set value="Tekst of nummer" var="type"/>
                        <c:if test="${r.type == 3}">
                            <c:set var="type" value="Geometry"/>
                        </c:if>
                        <li>
                            <c:out value="${r.attribuutnaam}"/>(<c:out value="${type}"/>)
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>
        <c:if test="${not empty tips}">
            <div class="tipsContainer">
                <fmt:message key="wizardzoekconfiguratie.tip"/>
                <ul>
                    <c:forEach items="${tips}" var="tip">
                        <li><fmt:message key="${tip}"/></li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>
    </div> <!-- einde div wizardQuestionBlock -->

    <div class="knoppenbalk">
        <html:submit property="step2" styleClass="knop"><fmt:message key='button.previous'/></html:submit>
        <html:submit property="step5" styleClass="knop"><fmt:message key='button.next'/></html:submit>
        <input type="button" class="knop" onclick="openStartPage()"value="<fmt:message key='button.ok'/>"/>
    </div>
    
</div> <!-- einde div content -->

</html:form>

<!-- Als je /> gebruikt om iframe tag af te sluiten wordt footer niet getoont ? -->
<div id="dialogPopUp">
    <iframe id="iframeZoekConfiguratieVeld" frameborder="0"></iframe>
</div>
