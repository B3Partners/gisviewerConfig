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

<script type='text/javascript' src="<html:rewrite page='/dwr/interface/JZoekConfiguratieUtil.js' module=''/>">
</script>
<script type='text/javascript' src="<html:rewrite page='/dwr/engine.js' module=''/>"></script>
<script type="text/javascript" src="<html:rewrite page='/scripts/wizardZoekConfiguratie.js' module=''/>"></script>
<div class="infobalk">
    <div class="infobalk_description"><fmt:message key="wizardzoekconfiguratie.step5"/></div>
    <div class="infobalk_actions"><tiles:insert name="loginblock"/></div>
</div>
<html:form action="/wizardZoekConfiguratie">
    <input type="hidden" name="bronId" value="${bronId}"/>
<input type="hidden" id="zoekConfiguratieId" name="zoekConfiguratieId" value="${zoekConfiguratieId}"/>
    <div class="berichtenbalk">
            <tiles:insert definition="actionMessages"/>
    </div>
    
    <script type="text/javascript">
        var attribuutFormUrl="<html:rewrite page='/configZoekConfiguratieVeld.do' module=''/>";
        var startPage="<html:rewrite page='/configZoekConfiguratie.do' module=''/>";
    </script>

    <div class="wizardQuestionBlock">
        <p style="margin-left: 10px;">
            <fmt:message key="wizardzoekconfiguratie.vraag.kaartlaag"/>
        </p>
        <div class="tablesortercontainer">
            <table id="kaartlaagselectietable" class="tablesorter">
                <thead>
                    <tr>
                        <th style="width: 10%;" class="no-filter"></th>
                        <th style="width: 90%;">Kaartlaag</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="laag" items="${themas}">
                    <tr>
                        <td>
                            <html:multibox property="layersAan">
                                <c:out value="${laag.id}"/>
                            </html:multibox>
                        </td>
                        <td>
                            <c:out value="${laag.naam}"/>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="wizardButtonBar">
        <html:submit property="step3" styleClass="knop"><fmt:message key='button.previous'/></html:submit> 
        <html:submit property="saveStep5" styleClass="knop"><fmt:message key='button.save'/></html:submit>
    </div>
</html:form>
<script type="text/javascript">
    tablepager(
        'kaartlaagselectietable',
        '650',
        '16',
        false
    );
</script>