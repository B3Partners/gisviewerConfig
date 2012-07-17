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
<script type='text/javascript' src="<html:rewrite page='/dwr/interface/JZoekConfiguratieUtil.js' module=''/>">
</script>
<script type="text/javascript" src="<html:rewrite page='/scripts/wizardZoekConfiguratie.js' module=''/>"></script>
<div class="infobalk">
    <div class="infobalk_description"><fmt:message key="wizardzoekconfiguratie.step3"/></div>
    <div class="infobalk_actions"><tiles:insert name="loginblock"/></div>
</div>
<html:form action="/wizardZoekConfiguratie">
    <input type="hidden" name="bronId" value="${bronId}"/>
    <input type="hidden" name="zoekConfiguratieId" value="${zoekConfiguratieId}"/>
    <input type="hidden" name="featureType" value="${featureType}"/>
    <input type="hidden" id="hiddenDelete" name="delete"/>
    <div class="berichtenbalk">
            <tiles:insert definition="actionMessages"/>
    </div>
    <div class="wizardQuestionBlock">
        <p>
            <fmt:message key="wizardzoekconfiguratie.vraag.geefnaam"/>
        </p>
        <table>
            <tr>
                <td><fmt:message key="configzoekconfiguratie.naam"/>:</td>
                <td><input type="text" name="naam" value="${naam}"/></td>
            </tr>
            <tr>
                <td><fmt:message key="configzoekconfiguratie.vervolgzoeker"/></td>
                <td>
                    <select name="parentZoekConfiguratie">
                        <option value="">Geen</option>
                        <c:forEach items="${zoekConfiguraties}" var="z">                           
                            <c:choose>                                
                                <c:when test="${z.id == parentZoekConfiguratie}">
                                    <option value="${z.id}" selected="true"><c:out value="${z}"/></option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${z.id}"><c:out value="${z.naam}"/></option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </select>
                </td>

            </tr>
        </table>

        <p><fmt:message key="configzoekconfiguratie.usecaching.uitleg"/></p>

        <table>
            <tr>
                <td><fmt:message key="configzoekconfiguratie.usecaching"/></td>
                <td>
                    <c:choose>
                        <c:when test="${usecaching == '1'}">
                            <input type="checkbox" name="usecaching" checked="checked"/>
                        </c:when>
                        <c:otherwise>
                            <input type="checkbox" name="usecaching"/>
                        </c:otherwise>
                    </c:choose>
                </td>               
            </tr>
        </table>
    </div>

    <div class="wizardButtonBar">
        <c:if test="${empty zoekConfiguratieId}">
            <html:submit property="step1" styleClass="knop"><fmt:message key='button.previous'/></html:submit>
        </c:if>
        
        <c:if test="${not empty zoekConfiguratieId}">
            <input type="button" class="knop removeButton" onclick="deleteZoekConfiguratie(${zoekConfiguratieId})" value="<fmt:message key='button.remove'/>" />
            <input type="button" class="knop" onclick="window.location='<html:rewrite page='/configZoekConfiguratie.do'/>'" value="<fmt:message key='button.cancel'/>" />
        </c:if>

        <html:submit property="step3" styleClass="knop"><fmt:message key='button.next'/></html:submit>
    </div>
</html:form>