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
    <div class="infobalk_description"><fmt:message key="wizardzoekconfiguratie.step1"/></div>
    <div class="infobalk_actions"><tiles:insert name="loginblock"/></div>
</div>
<html:form action="/wizardZoekConfiguratie">
    <div class="berichtenbalk">
            <tiles:insert definition="actionMessages"/>
    </div>
    <div class="wizardQuestionBlock">
        <p>
            <fmt:message key="wizardzoekconfiguratie.vraag.nieuweofbestaandebron"/>
        </p>
        <br/>
        <c:forEach items="${bronnen}" var="b">
            <input type="radio" name="bronId" value="${b.id}"/><c:out value="${b}"/><br/>
        </c:forEach>
        <input type="radio" name="bronId" value="new"><fmt:message key="wizardzoekconfiguratie.antwoord.nieuwebron"/>
    </div>
    
    <div class="wizardButtonBar">
        <html:submit property="step1" styleClass="knop"><fmt:message key='button.next'/></html:submit>
        <input type="button" class="knop" onclick="window.location='<html:rewrite page='/configZoekConfiguratie.do'/>'" value="<fmt:message key='button.cancel'/>" />
    </div>
</html:form>