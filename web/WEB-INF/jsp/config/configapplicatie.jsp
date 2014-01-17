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

<c:set var="form" value="${applicatieForm}"/>
<c:set var="action" value="${form.map.action}"/>
<c:set var="mainid" value="${form.map.applicatieID}"/>

<c:set var="focus" value="naam"/>

<div class="infobalk">
    <div class="infobalk_description">APPLICATIES</div>
    <div class="infobalk_actions"><tiles:insert name="loginblock"/></div>
</div>
<c:set var="appUrl" value='http://${pageContext.request.serverName}:${pageContext.request.serverPort}/gisviewer/viewer.do?appCode='/>
<c:if test="${!empty applicaties}">
    <table id="applicatieTable" class="dataTable">
        <thead>
            <tr>
                <th style="width: 16%;">Naam</th>                                   
                <th style="width: 20%;">E-mail</th>
                <th style="width: 7%;">Versie</th>
                <th style="width: 23%;" class="{sorter: false} no-filter">Applicatiecode</th>
                <th style="width: 23%;" class="{sorter: false} no-filter">Gebruikerscode</th>
                <th style="width: 11%;" class="{sorter: false} no-filter">Acties</th>
            </tr>
        </thead>

        <tbody>
            <c:forEach items="${applicaties}" var="item">
                <c:url var="link" value="/configApplicatie.do?edit=submit&applicatieID=${item.id}"/>
                <c:url var="link_settings" value="/configKeeper.do?appcode=${item.code}" />
                <c:url var="link_copy" value="/configApplicatie.do?copy=t&applicatieID=${item.id}"/>
                <c:url var="link_cyclo" value="/configCyclomedia.do?appcode=${item.code}" />
                <c:set var="id_selected" value='' />
                <c:if test="${item.id == mainid}"><c:set var="id_selected" value=' class="row_selected"' /></c:if>
                <tr data-link="${link}"${id_selected}>
                    <td><c:out value="${item.naam}"/></td>

                    <td>${item.email}</td>

                    <td>${item.versie}</td>
                    <td>
                        <a href="${appUrl}${item.code}&amp;forceViewer=true&amp;cmsPageId=1" title="Open Applicatie" target="_new">${item.code}</a>
                    </td>
                    <td>${item.gebruikersCode}</td>
                    <td>
                        <a href="${link_settings}"><img src="images/settings.png" border="0" alt="Bekijk applicatieinstellingen" title="Bekijk applicatieinstellingen" height="20"/></a>
                        &nbsp;&nbsp;<a href="${link_copy}"><img src="images/copy.png" border="0" alt="Kopieer applicatie" title="Kopieer applicatie" height="20" onclick="return confirm('Weet u zeker dat u deze applicatie wilt kopieeren?');"/></a>
                        &nbsp;&nbsp;<a href="${link_cyclo}"><img src="images/foto.png" border="0" alt="Bekijk cyclomedia instellingen" title="Bekijk cyclomedia instellingen" height="20"/></a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</c:if>

<html:form action="/configApplicatie" focus="${focus}">
    <div style="display: none;">
        <html:hidden property="action"/>
        <html:hidden property="alt_action"/>
        <html:hidden property="applicatieID"/>
    </div>

    <div class="berichtenbalk" style="margin-top: 5px;">
        <tiles:insert definition="actionMessages"/>
    </div>

    <div class="ie7clear"></div>
    <div style="float: right; clear: both; width: 940px; margin-right: 20px; margin-bottom: 5px;">
        <div style="float: left; margin-left: 10px;">
            <input type="checkbox" id="advancedToggle" /> Toon geavanceerde opties
        </div>
        <div style="float: right;">
            <c:if test="${empty form.map.applicatieID}">
                <html:submit property="save" accesskey="s" styleClass="knop saveButton" onclick="return confirm('Weet u zeker dat u deze applicatie wilt opslaan?');">
                    <fmt:message key='button.save'/>
                </html:submit>
            </c:if>
            <c:if test="${!empty form.map.applicatieID}">
                <html:submit property="delete" accesskey="d" styleClass="knop removeButton" onclick="return confirm('Weet u zeker dat u deze applicatie wilt verwijderen?');">
                    <fmt:message key="button.remove"/>
                </html:submit>

                <input type="button" class="knop" onclick="window.location='<html:rewrite page='/configApplicatie.do' />'" value="<fmt:message key='button.cancel'/>" />

                <html:submit property="save" accesskey="s" styleClass="knop saveButton" onclick="return confirm('Weet u zeker dat u deze applicatie wilt opslaan?');">
                    <fmt:message key='button.save'/>
                </html:submit>
            </c:if>
        </div>
    </div>

    <div class="ie7clear"></div>
    <div class="tabcontents fullwidthtab">
        <div class="tabcontent defaulttab">
            <div class="configbasic">
                <div class="configrow">
                    <label><fmt:message key="configapplicatie.naam.label"/></label>
                    <html:text property="naam" size="60"/>
                    <a class="helpLink" href="#" id="helpLink_help_configapplicatie_naam">(?)</a>
                    <div id="help_configapplicatie_naam" style="display: none;" title="<fmt:message key="configapplicatie.naam.label"/>">
                        <fmt:message key="configapplicatie.naam.uitleg"/>
                    </div>
                </div>
                <div class="configrow">
                    <label><fmt:message key="configapplicatie.gebruikerscode.label"/></label>
                    <html:text property="gebruikersCode" size="60"/>
                    <a class="helpLink" href="#" id="helpLink_help_configapplicatie_gebcode">(?)</a>
                    <div id="help_configapplicatie_gebcode" style="display: none;" title="<fmt:message key="configapplicatie.gebruikerscode.label"/>">
                        <fmt:message key="configapplicatie.gebruikerscode.uitleg"/>
                    </div>
                </div>

                <div class="configrow">
                    <label><fmt:message key="configapplicatie.appcode.label"/></label>

                    <a href="${appUrl}${appcode}&amp;forceViewer=true" title="Open Applicatie" target="_new">${appcode}</a>
                    
                    <a class="helpLink" href="#" id="helpLink_help_configapplicatie_appcode">(?)</a>
                    <div id="help_configapplicatie_appcode" style="display: none;" title="<fmt:message key="configapplicatie.appcode.label"/>">
                        <fmt:message key="configapplicatie.appcode.uitleg"/>
                    </div>
                </div>

                <div class="configrow">
                    <label><fmt:message key="configapplicatie.defaultapp.label"/></label>
                    <html:checkbox property="defaultApp" />
                    <a class="helpLink" href="#" id="helpLink_help_configapplicatie_defaultapp">(?)</a>
                    <div id="help_configapplicatie_defaultapp" style="display: none;" title="<fmt:message key="configapplicatie.defaultapp.label"/>">
                        <fmt:message key="configapplicatie.defaultapp.uitleg"/>
                    </div>
                </div>

                <div class="configrow">
                    <label><fmt:message key="configapplicatie.readonly.label"/></label>
                    <html:checkbox property="readOnly" value="CHECKED"/>
                    <a class="helpLink" href="#" id="helpLink_help_configapplicatie_readonly">(?)</a>
                    <div id="help_configapplicatie_readonly" style="display: none;" title="<fmt:message key="configapplicatie.readonly.label"/>">
                        <fmt:message key="configapplicatie.readonly.uitleg"/>
                    </div>
                </div>
                
                <div class="configrow">
                    <label><fmt:message key="configapplicatie.email.label"/></label>
                    <html:text property="email" size="60"/>
                    <a class="helpLink" href="#" id="helpLink_help_configapplicatie_email">(?)</a>
                    <div id="help_configapplicatie_email" style="display: none;" title="<fmt:message key="configapplicatie.email.label"/>">
                        <fmt:message key="configapplicatie.email.uitleg"/>
                    </div>
                </div>
            </div>
            <div class="configadvanced"></div>
    </div>
</div>

</html:form>
