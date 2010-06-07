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
    <div class="infobalk_description"><fmt:message key="wizardzoekconfiguratie.step2"/></div>
    <div class="infobalk_actions"><tiles:insert name="loginblock"/></div>
</div>
<html:form action="/wizardZoekConfiguratie">
    <input type="hidden" name="bronId" value="${bronId}"/>
    <div class="berichtenbalk">
        <html:messages id="error" message="true">
            <div class="messages">&#8594; <c:out value="${error}" escapeXml="false"/>&#160;&#160;</div>
        </html:messages>
    </div>
    <div class="wizardQuestionBlock">
        <p>
            <fmt:message key="wizardzoekconfiguratie.vraag.featuretype"/>
        </p>
        <fmt:message key="configzoekconfiguratie.featuretype"/> <select name="featureType">
        <c:forEach items="${featureTypes}" var="f">
            <option value="${f}">${f}</option>
        </c:forEach>
        </select>
    </div>
    <div class="wizardButtonBar">
        <html:submit property="unspecified"><fmt:message key='button.previous'/></html:submit>
        <html:submit property="step2"><fmt:message key='button.next'/></html:submit>
    </div>
</html:form>