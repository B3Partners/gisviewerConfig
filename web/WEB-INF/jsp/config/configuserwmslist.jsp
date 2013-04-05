<%--
Copyright 2007-2012 B3Partners BV.

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

<c:set var="form" value="${userWMSListForm}"/>
<c:set var="action" value="${form.map.action}"/>
<c:set var="mainid" value="${form.map.serviceId}"/>

<c:set var="focus" value="naam"/>

<div class="infobalk">
    <div class="infobalk_description">TOEGESTANE WMS</div>
    <div class="infobalk_actions"><tiles:insert name="loginblock"/></div>
</div>
    
<c:if test="${!empty services}">
    <table id="userWMSListTable" class="dataTable">
        <thead>
            <tr>
                <th style="width: 20%;">Naam</th>                    
                <th style="width: 20%;">Groep</th>                  
                <th style="width: 30%;">Url</th>
                <th style="width: 30%;">Sld url</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${services}" var="item">
                <c:url var="link" value="/configUserWMSList.do?edit=submit&serviceId=${item.id}"/>                    
                <c:set var="id_selected" value='' />
                <c:if test="${item.id == mainid}"><c:set var="id_selected" value=' class="row_selected"' /></c:if>
                <tr data-link="${link}"${id_selected}>
                    <td><c:out value="${item.name}"/></td>                     
                    <td>${item.groupname}</td>                        
                    <td>${item.url}</td>
                    <td>${item.sld_url}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</c:if>

<html:form action="/configUserWMSList" focus="${focus}">
    <div style="display: none;">
        <html:hidden property="action"/>
        <html:hidden property="alt_action"/>
        <html:hidden property="serviceId"/>
    </div>

    <div class="berichtenbalk" style="margin-top: 5px;">
        <tiles:insert definition="actionMessages"/>
    </div>

    <div class="ie7clear"></div>
    
    <div style="float: left; clear: both; width: 920px; margin-left: 15px; margin-bottom: 5px; margin-top: 25px;">
        <div style="float: left; margin-left: 10px;">
            <input type="checkbox" id="advancedToggle" /> Toon geavanceerde opties
        </div>
        <div style="float: right;">
            <c:if test="${empty form.map.serviceId}">
                <html:submit property="save" accesskey="s" styleClass="knop saveButton" onclick="return confirm('Weet u zeker dat u deze service wilt opslaan?');">
                    <fmt:message key='button.save'/>
                </html:submit>
            </c:if>
            <c:if test="${!empty form.map.serviceId}">
                <html:submit property="delete" accesskey="d" styleClass="knop removeButton" onclick="return confirm('Weet u zeker dat u deze service wilt verwijderen?');">
                    <fmt:message key="button.remove"/>
                </html:submit>

                <input type="button" class="knop" onclick="window.location='<html:rewrite page='/configUserWMSList.do' />'" value="<fmt:message key='button.cancel'/>" />

                <html:submit property="save" accesskey="s" styleClass="knop saveButton" onclick="return confirm('Weet u zeker dat u deze service wilt opslaan?');">
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
                    <label><fmt:message key="configuserwmslist.name.label"/></label>
                    <html:text property="name" size="60"/>
                    <a class="helpLink" href="#" id="helpLink_help_configuserwmslist_name">(?)</a>
                    <div id="help_configuserwmslist_name" style="display: none;" title="<fmt:message key="configuserwmslist.name.label"/>">
                        <fmt:message key="configuserwmslist.name.uitleg"/>
                    </div>
                </div>
                    
                <div class="configrow">
                    <label><fmt:message key="configuserwmslist.groupname.label"/></label>
                    <html:text property="groupname" size="60"/>
                    <a class="helpLink" href="#" id="helpLink_help_configuserwmslist_groupname">(?)</a>
                    <div id="help_configuserwmslist_groupname" style="display: none;" title="<fmt:message key="configuserwmslist.groupname.label"/>">
                        <fmt:message key="configuserwmslist.groupname.uitleg"/>
                    </div>
                </div>
                    
                <div class="configrow">
                    <label><fmt:message key="configuserwmslist.url.label"/></label>
                    <html:text property="url" size="60"/>
                    <a class="helpLink" href="#" id="helpLink_help_configuserwmslist_url">(?)</a>
                    <div id="help_configuserwmslist_url" style="display: none;" title="<fmt:message key="configuserwmslist.url.label"/>">
                        <fmt:message key="configuserwmslist.url.uitleg"/>
                    </div>
                </div>
                    
                <div class="configrow">
                    <label><fmt:message key="configuserwmslist.sld_url.label"/></label>
                    <html:text property="sld_url" size="60"/>
                    <a class="helpLink" href="#" id="helpLink_help_configuserwmslist_sld_url">(?)</a>
                    <div id="help_configuserwmslist_sld_url" style="display: none;" title="<fmt:message key="configuserwmslist.sld_url.label"/>">
                        <fmt:message key="configuserwmslist.sld_url.uitleg"/>
                    </div>
                </div>
                
            </div>
            <div class="configadvanced"></div>
    </div>
</div>

</html:form>