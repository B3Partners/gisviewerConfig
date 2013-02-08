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

<c:set var="form" value="${themaDataForm}"/>
<c:set var="action" value="${form.map.action}"/>
<c:set var="mainid" value="${form.map.themaDataID}"/>

<c:set var="save" value="${action == 'save'}"/>
<c:set var="delete" value="${action == 'delete'}"/>

<c:set var="focus" value="label"/>

<script type="text/javascript" src='scripts/jquery.b3p.checkbox1.0.js'></script>

<div class="infobalk">
    <div class="infobalk_description"><fmt:message key="configadmindata.infobalk"/></div>
    <div class="infobalk_actions"><tiles:insert name="loginblock"/></div>
</div>

<html:form action="/configThemaData" focus="${focus}">
    <div style="display: none;">
        <html:hidden property="action"/>
        <html:hidden property="alt_action"/>
        <html:hidden property="themaDataID"/>
    </div>
    <div style="margin: 10px; padding: 5px 10px; background-color: #F0F0F6;">
        <table>
            <tr>
                <td style="color: #196299;">
                    Gegevensbron
                </td>
                <td colspan="3">
                    <html:select property="gegevensbronID">
                        <c:forEach var="cuItem" items="${listThemas}">
                            <html:option value="${cuItem.id}">
                                <c:out value="${cuItem.naam}"/>
                            </html:option>
                        </c:forEach>
                    </html:select>&nbsp;
                    <html:submit property="change"  styleClass="knop">
                        <fmt:message key="button.change"/>
                    </html:submit>
                    <html:submit property="createAllThemaData" styleClass="knop"><fmt:message key="configthemadata.automagisch.button"/></html:submit>
                    <%--<c:if test="${!save && !delete}">
                        <a href="#" class="datalink" onclick="javascript: document.getElementById('createAllThemaData').value='doe';submit()">Maak ontbrekende Themadata objecten voor thema</a>
                    </c:if>--%>
                    <html:submit property="updateBasisregels" styleClass="knop" onclick="return postFullTableData('Bezig met batch update');"><fmt:message key="configthemadata.updatebasisregels.button"/></html:submit>
                    </td>
                </tr>
            </table>
        </div>

    <c:if test="${!empty listThemaData}">
        <div class="tablesortercontainer">
            <table id="themadatatable" class="tablesorter">
                <thead>
                    <tr>
                        <th style="width: 15%;" class="no-filter">Status</th>
                        <th style="width: 5%;">Volgorde</th>
                        <th style="width: 10%;" class="no-filter">&nbsp;</th>                        
                        <th style="width: 15%;"><fmt:message key="configthemadata.label"/></th>                                     
                        <th style="width: 20%;" class="no-filter">&nbsp;</th>
                        <th style="width: 20%;"><fmt:message key="configthemadata.${connectieType}.kolomnaam"/></th>
                        <th style="width: 15%;" class="no-filter"><fmt:message key="configthemadata.basisregel"/></th>
                        <c:if test="${gegevensbron.editable}">
                            <th style="width: 5%;"><fmt:message key="configthemadata.bewerkbaar"/></th>
                        </c:if>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="ci" varStatus="status" items="${listThemaData}">
                        <c:set var="id_selected" value='' />
                        <c:if test="${ci.id == mainid}"><c:set var="id_selected" value='selected' /></c:if>
                        <c:url var="link" value="/configThemaData.do?edit=submit&themaDataID=${ci.id}"/>
                        <tr>
                            <td>
                                <c:set var="bracketKolomNaam" value="[${ci.id}:KOLOMNAAM]"/>
                                <c:set var="bracketCommando" value="[${ci.id}:COMMANDO]"/>
                                <c:choose>
                                    <c:when test="${fn:contains(listUglyThemaData, bracketKolomNaam)}">
                                        <span style="color: red"><fmt:message key="configthemadata.${connectieType}.kolomnaamfout"/></span>
                                    </c:when>
                                    <c:when test="${fn:contains(listUglyThemaData, bracketCommando)}">
                                        <span style="color: red"><fmt:message key="configthemadata.commandofout"/></span>
                                    </c:when>
                                    <c:otherwise>
                                        <span style="color: green">GOED</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td><c:out value="${ci.dataorder}"/></td>
                            <td><html:text property="volgordeVelden.${ci.id}" size="3" /><input type="hidden" name="link" value="${link}" /><input type="hidden" name="selected" value="${id_selected}" /></td>
                            <td><c:out value="${ci.label}"/></td>
                            <td><html:text property="labelVelden.${ci.id}" size="15" /></td>
                            <c:set var="accolade" value="}"/>
                            <td>
                                <c:choose>
                                    <c:when test="${fn:contains(ci.kolomnaam, accolade)}">
                                        <span title="<c:out value='${ci.kolomnaam}'/>"><c:out value='${fn:substringAfter(ci.kolomnaam, accolade)}'/></span>
                                    </c:when>
                                    <c:otherwise>
                                        <c:out value='${ci.kolomnaam}'/>
                                    </c:otherwise>
                                </c:choose>
                                &nbsp;</td>
                            <td>
                                <html:multibox property="basisregels" value="${ci.id}"/>
                            </td>
                            <c:if test="${gegevensbron.editable && ci.editable}">                                
                                <td>
                                    <c:out value="Ja" />
                                </td>
                            </c:if>
                            <c:if test="${gegevensbron.editable && !ci.editable}">                                
                                <td>
                                    <c:out value="Nee" />
                                </td>
                            </c:if>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </c:if>

    <div class="berichtenbalk" style="margin-top: 5px;">
        <tiles:insert definition="actionMessages"/>
    </div>
    <div class="ie7clear"></div>
    <div style="float: right; clear: both; width: 940px; margin-right: 20px; margin-bottom: 5px;">
        <div style="float: left; margin-left: 10px;">
            <input type="checkbox" id="advancedToggle" /> Toon geavanceerde opties
        </div>
        <div style="float: right;">
            <!-- Indien nieuw item maken dan alleen Opslaan en Annuleren knoppen tonen -->
            <c:if test="${empty form.map.themaDataID}">
                <div class="knoppen">
                    <html:submit property="save" accesskey="s" styleClass="knop saveButton" onclick="return confirm('Weet u zeker dat u dit veld wilt opslaan?');">
                        <fmt:message key="button.save"/>
                    </html:submit>
                </div>
                <div class="knoppen">
                    <input type="button" class="knop" onclick="window.location='<html:rewrite page='/configThemaData.do' />'" value="<fmt:message key='button.cancel'/>" />
                </div>
            </c:if>
            <!-- Indien item aan het bewerken dan Nieuw, Wissen en Opslaan knoppen tonen -->
            <c:if test="${!empty form.map.themaDataID}">
                <div class="knoppen">
                    <html:submit property="create" accesskey="n" styleClass="knop newButton">
                        <fmt:message key="button.new" />
                    </html:submit>
                </div>
                <div class="knoppen">
                    <html:submit property="delete" accesskey="d" styleClass="knop removeButton" onclick="return confirm('Weet u zeker dat u dit veld wilt verwijderen?');">
                        <fmt:message key="button.remove"/>
                    </html:submit>
                </div>
                <div class="knoppen">
                    <html:submit property="save" accesskey="s" styleClass="knop saveButton" onclick="return confirm('Weet u zeker dat u dit veld wilt opslaan?');">
                        <fmt:message key="button.save"/>
                    </html:submit>
                </div>
            </c:if>
        </div>
    </div>
    <div class="ie7clear"></div>
    <div class="tabcontents fullwidthtab">
        <div class="tabcontent defaulttab">
            <div class="configbasic">

                <div class="configrow">
                    <label><fmt:message key="configthemadata.label"/></label>
                    <html:text property="label" size="140"/>
                    <a class="helpLink" href="#" id="helpLink_help_configthemadatalabel">(?)</a>
                    <div id="help_configthemadatalabel" style="display: none;" title="<fmt:message key="configthemadata.label"/>"><fmt:message key="configthemadata.label.uitleg"/></div>
                </div>

                <div class="configrow">
                    <label><fmt:message key="configthemadata.eenheid"/></label>
                    <html:text property="eenheid" size="140"/>
                    <a class="helpLink" href="#" id="helpLink_help_configthemadataeenheid">(?)</a>
                    <div id="help_configthemadataeenheid" style="display: none;" title="<fmt:message key="configthemadata.eenheid"/>"><fmt:message key="configthemadata.eenheid.uitleg"/></div>
                </div>

                <div class="configrow">
                    <label><fmt:message key="configthemadata.basisregel"/></label>
                    <html:checkbox property="basisregel"/>
                    <a class="helpLink" href="#" id="helpLink_help_configthemadatabasisregel">(?)</a>
                    <div id="help_configthemadatabasisregel" style="display: none;" title="<fmt:message key="configthemadata.basisregel"/>"><fmt:message key="configthemadata.basisregel.uitleg"/></div>
                </div>

                <div class="configrow">
                    <label><fmt:message key="configthemadata.voorbeelden"/></label>
                    <html:text property="voorbeelden" size="140"/>
                    <a class="helpLink" href="#" id="helpLink_help_configthemadatavoorbeelden">(?)</a>
                    <div id="help_configthemadatavoorbeelden" style="display: none;" title="<fmt:message key="configthemadata.voorbeelden"/>"><fmt:message key="configthemadata.voorbeelden.uitleg"/></div>
                </div>

                <div class="configrow">
                    <label><fmt:message key="configthemadata.kolombreedte"/></label>
                    <html:text property="kolombreedte" size="140"/>
                    <a class="helpLink" href="#" id="helpLink_help_configthemadatakolombreedte">(?)</a>
                    <div id="help_configthemadatakolombreedte" style="display: none;" title="<fmt:message key="configthemadata.kolombreedte"/>"><fmt:message key="configthemadata.kolombreedte.uitleg"/></div>
                </div>

                <div class="configrow">
                    <label><fmt:message key="configthemadata.datatype"/></label>
                    <html:select property="dataTypeID">
                        <c:forEach var="cuItem" items="${listDataTypen}">
                            <html:option value="${cuItem.id}">
                                <c:out value="${cuItem.naam}"/>
                            </html:option>
                        </c:forEach>
                    </html:select>&nbsp;
                    <a class="helpLink" href="#" id="helpLink_help_configthemadatadatatype">(?)</a>
                    <div id="help_configthemadatadatatype" style="display: none;" title="<fmt:message key="configthemadata.datatype"/>"><fmt:message key="configthemadata.datatype.uitleg"/></div>
                </div>

                <div class="configrow">
                    <label><fmt:message key="configthemadata.commando"/></label>
                    <html:text property="commando" size="140"/>
                    <a class="helpLink" href="#" id="helpLink_help_configthemadatacommando">(?)</a>
                    <div id="help_configthemadatacommando" style="display: none;" title="<fmt:message key="configthemadata.commando"/>"><fmt:message key="configthemadata.commando.uitleg"/></div>
                </div>

                <c:choose>
                    <c:when test="${fn:length(listAdminTableColumns)>1}">
                        <div class="configrow">
                            <label><fmt:message key="configthemadata.${connectieType}.kolomnaam"/></label>
                            <html:select property="kolomnaam">
                                <html:option value=""/>
                                <c:forEach var="cuItem" items="${listAdminTableColumns}">
                                    <html:option value="${cuItem}"/>
                                </c:forEach>
                            </html:select>&nbsp;
                            <a class="helpLink" href="#" id="helpLink_help_configthemadata${connectieType}kolomnaam">(?)</a>
                            <div id="help_configthemadata${connectieType}kolomnaam" style="display: none;" title="<fmt:message key="configthemadata.${connectieType}.kolomnaam"/>"><fmt:message key="configthemadata.${connectieType}.kolomnaam.uitleg"/></div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="configrow">
                            <label><fmt:message key="configthemadata.kolomnaam"/></label>
                            <html:text property="kolomnaam" size="140"/>
                            <a class="helpLink" href="#" id="helpLink_help_configthemadatakolomnaam">(?)</a>
                            <div id="help_configthemadatakolomnaam" style="display: none;" title="<fmt:message key="configthemadata.kolomnaam"/>"><fmt:message key="configthemadata.kolomnaam.uitleg"/></div>
                        </div>
                    </c:otherwise>
                </c:choose>

                <div class="configrow">
                    <label><fmt:message key="configthemadata.dataorder"/></label>
                    <html:text property="dataorder" size="140"/>
                    <a class="helpLink" href="#" id="helpLink_help_configthemadatadataorder">(?)</a>
                    <div id="help_configthemadatadataorder" style="display: none;" title="<fmt:message key="configthemadata.dataorder"/>"><fmt:message key="configthemadata.dataorder.uitleg"/></div>
                </div>

                <div class="configrow">
                    <label><fmt:message key="configthemadata.omschrijving"/></label>
                    <html:text property="omschrijving" size="140"/>
                    <a class="helpLink" href="#" id="helpLink_help_configthemadataomschrijving">(?)</a>
                    <div id="help_configthemadataomschrijving" style="display: none;" title="<fmt:message key="configthemadata.omschrijving"/>"><fmt:message key="configthemadata.omschrijving.uitleg"/></div>
                </div>

                <c:if test="${gegevensbron.editable}">
                    <div class="configrow">
                        <label><fmt:message key="configthemadata.bewerkbaar"/></label>
                        <html:checkbox property="editable"/>
                        <a class="helpLink" href="#" id="helpLink_help_configthemadataeditable">(?)</a>
                        <div id="help_configthemadataeditable" style="display: none;" title="<fmt:message key="configthemadata.bewerkbaar"/>"><fmt:message key="configthemadata.bewerkbaar.uitleg"/></div>
                    </div>
                </c:if>
                <c:if test="${gegevensbron.editable}">
                    <div class="configrow">
                        <label><fmt:message key="configthemadata.defaultValues"/></label>
                        <html:text property="defaultValues" size="140"/>
                        <a class="helpLink" href="#" id="helpLink_help_configthemadatadefaultValues">(?)</a>
                        <div id="help_configthemadatadefaultValues" style="display: none;" title="<fmt:message key="configthemadata.defaultValues"/>"><fmt:message key="configthemadata.defaultValues.uitleg"/></div>
                    </div>
                </c:if>
                <div class="configrow" style="margin-top: 10px;">
                    <a class="helpLink" href="#" id="helpLink_help_configthemadata_niet_tonen">(?)</a>
                    <div id="help_configthemadata_niet_tonen" style="display: none;" title="<fmt:message key="configthemadata_niet_tonen.label"/>">
                        <fmt:message key="configthemadata_niet_tonen.uitleg"/>
                    </div>
                    <div style="float: right; margin-right: 10px;">Is er een veld wat u niet wil tonen aan de gebruiker</div>
                </div>
            </div>
            <div class="configadvanced"></div>
        </div>
    </div>
    <div style="clear: both;"></div> 
</html:form>
<script type="text/javascript">
    //$j(':checkbox').check();
    
    tablepager(
    'themadatatable',
    '930',
    '18',
    false // display numberOfPages dropdown
);
</script>