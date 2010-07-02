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
    <div class="infobalk_description"><fmt:message key="wizardzoekconfiguratie.step1"/></div>
    <div class="infobalk_actions"><tiles:insert name="loginblock"/></div>
</div>
<html:form action="/wizardZoekConfiguratie">
    <div class="berichtenbalk">
        <html:messages id="error" message="true">
            <div class="messages">&#8594; <c:out value="${error}" escapeXml="false"/>&#160;&#160;</div>
        </html:messages>
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
        <html:submit property="step1"><fmt:message key='button.next'/></html:submit>
        <input type="button" onclick="window.location='<html:rewrite page='/configZoekConfiguratie.do'/>'" value="<fmt:message key='button.cancel'/>"></input>
    </div>
</html:form>