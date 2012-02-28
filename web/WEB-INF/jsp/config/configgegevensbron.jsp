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

<c:set var="form" value="${gegevensbronForm}"/>
<c:set var="action" value="${form.map.action}"/>
<c:set var="mainid" value="${form.map.gegevensbronID}"/>

<c:set var="save" value="${action == 'save'}"/>
<c:set var="delete" value="${action == 'delete'}"/>

<c:set var="focus" value="naam"/>

<div class="infobalk">
    <div class="infobalk_description"><fmt:message key="configgb.infobalk"/></div>
    <div class="infobalk_actions"><tiles:insert name="loginblock"/></div>
</div>

<div class="berichtenbalk" style="margin-top: 5px;">
    <tiles:insert definition="actionMessages"/>
</div>

<html:form action="/configGegevensbron" focus="${focus}">
    <div style="display: none;">
        <html:hidden property="action"/>
        <html:hidden property="alt_action"/>
        <html:hidden property="gegevensbronID"/>
    </div>
    <div class="ie7clear"></div>
    <div style="float: right; clear: both; width: 940px; margin-right: 20px; margin-bottom: 5px;">
        <div style="float: left; margin-left: 270px;">
            <input type="checkbox" id="advancedToggle" /> Toon geavanceerde opties
        </div>
        <div style="float: right;">
            <!-- Indien nieuw item maken dan alleen Opslaan en Annuleren knoppen tonen -->
            <c:if test="${empty form.map.gegevensbronID}">
                <div class="knoppen">
                    <html:submit property="save" accesskey="s" styleClass="knop saveButton" onclick="return confirm('Weet u zeker dat u de gegevensbron wilt opslaan?');">
                        <fmt:message key="button.save"/>
                    </html:submit>
                </div>
                <div class="knoppen">
                    <input type="button" class="knop" onclick="window.location='<html:rewrite page='/configGegevensbron.do' />'" value="<fmt:message key='button.cancel'/>" />
                </div>
            </c:if>
            <!-- Indien item aan het bewerken dan Nieuw, Wissen en Opslaan knoppen tonen -->
            <c:if test="${!empty form.map.gegevensbronID}">
                <div class="knoppen">
                    <html:submit property="create" accesskey="n" styleClass="knop newButton">
                        <fmt:message key="button.new"/>
                    </html:submit>
                </div>
                <div class="knoppen">
                    <html:submit property="delete" accesskey="d" styleClass="knop removeButton" onclick="return confirm('Weet u zeker dat u de gegevensbron wilt verwijderen?');">
                        <fmt:message key="button.remove"/>
                    </html:submit>
                </div>
                <div class="knoppen">
                    <html:submit property="save" accesskey="s" styleClass="knop saveButton" onclick="return confirm('Weet u zeker dat u de gegevensbron wilt opslaan?');">
                        <fmt:message key="button.save"/>
                    </html:submit>
                </div>
                
                <div class="knoppen" style="margin-left: 10px;">
                    <html:submit property="copy" accesskey="c" styleClass="knop copyButton" onclick="return confirm('Weet u zeker dat u de gegevensbron wilt kopieeren?');">
                        Kopieeren
                    </html:submit>
                </div>
            </c:if>
        </div>
    </div>
    <div class="ie7clear"></div>
    <div id="treedivContainer">
        <div id="treediv"></div>
    </div>

    <div class="tabcontents treetabcontents" id="gegevensbron">
        <div class="tabcontent defaulttab">
            <div class="configbasic">

                <div id="textBox"></div>

                <div class="configrow configrowtree">
                    <label><fmt:message key="configgb_naam.label"/></label>
                    <html:text property="naam" size="80"/>
                    <a href="#" class="helpLink" id="helpLink_help_configgb_naam">(?)</a><div id="help_configgb_naam" style="display: none;" title="<fmt:message key="configgb_naam.label"/>"><fmt:message key="configgb_naam.uitleg"/></div>
                </div>

                <div class="configrow configrowtree">
                    <label><fmt:message key="configgb_bron.label"/></label>
                    <html:select property="bron" onchange="refreshFeatureList(this);" styleId='connectie_select' styleClass="configGegevensbronSelect">
                        <html:option value="">-Kies een bron-</html:option>
                        <html:option value="0">Kaartenbalie Wfs</html:option>
                        <c:forEach var="cuItem" items="${listBronnen}">
                            <html:option value="${cuItem.id}">
                                <c:out value="${cuItem.naam}"/>
                            </html:option>
                        </c:forEach>
                    </html:select>
                    <a href="#" class="helpLink" id="helpLink_help_configgb_bron">(?)</a><div id="help_configgb_bron" style="display: none;" title="<fmt:message key="configgb_bron.label"/>"><fmt:message key="configgb_bron.uitleg"/></div>
                </div>

                <c:set var="connectieType" value="jdbc"/>
                <c:if test="${form.map.bron != null}">
                    <c:if test="${form.map.bron == '0'}">
                        <c:set var="connectieType" value="wfs"/>
                    </c:if>
                </c:if>

                <div class="configrow configrowtree">
                    <label><fmt:message key="configgb_${connectieType}_admintabel.label"/></label>
                    <html:select property="admin_tabel" onchange="refreshAdminAttributeList(this);" styleId="admin_tabel_select" styleClass="configGegevensbronSelect">
                        <html:option value=""/>
                        <c:forEach var="cuItem" items="${listTables}">
                            <html:option value="${cuItem[0]}">${cuItem[1]}</html:option>
                        </c:forEach>
                    </html:select>
                    <a href="#" class="helpLink" id="helpLink_help_configgb_${connectieType}_admintabel">(?)</a><div id="help_configgb_${connectieType}_admintabel" style="display: none;" title="<fmt:message key="configgb_${connectieType}_admintabel.label"/>"><fmt:message key="configgb_${connectieType}_admintabel.uitleg"/></div>
                </div>
                <div class="configrow configrowtree">
                    <label><fmt:message key="configgb_${connectieType}_adminpk.label"/></label>
                    <html:select property="admin_pk" styleId="admin_pk_select" styleClass="configGegevensbronSelect">
                        <html:option value=""/>
                        <c:choose>
                            <c:when test="${fn:length(listAdminTableColumns)>1}">
                                <c:forEach var="cuItem" items="${listAdminTableColumns}">
                                    <html:option value="${cuItem[0]}">${cuItem[1]}</html:option>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <html:option value="Kies eerst tabel of feature..." />
                            </c:otherwise>
                        </c:choose>
                    </html:select>
                    <a href="#" class="helpLink" id="helpLink_help_configgb_${connectieType}_adminpk">(?)</a><div id="help_configgb_${connectieType}_adminpk" style="display: none;" title="<fmt:message key="configgb_${connectieType}_adminpk.label"/>"><fmt:message key="configgb_${connectieType}_adminpk.uitleg"/></div>
                </div>

                <div class="configrow configrowtree">
                    <label><fmt:message key="configgb_parent.label"/></label>
                    <html:select property="parentID" styleClass="configGegevensbronSelect">
                        <html:option value=""/>
                        <c:forEach var="cuItem" items="${alleGegevensbronnen}">
                            <c:if test="${mainid != cuItem.id}">
                                <html:option value="${cuItem.id}">
                                    <c:out value="${cuItem.naam}"/>
                                </html:option>
                            </c:if>
                        </c:forEach>
                    </html:select>
                    <a href="#" class="helpLink" id="helpLink_help_configgb_parent">(?)</a>
                    <div id="help_configgb_parent" style="display: none;" title="<fmt:message key="configgb_parent.label"/>">
                        <fmt:message key="configgb_parent.uitleg"/>
                    </div>
                </div>

                <div class="configrow configrowtree">
                    <label><fmt:message key="configgb_${connectieType}_adminfk.label"/></label>
                    <html:select property="admin_fk" styleId="admin_fk_select" styleClass="configGegevensbronSelect">
                        <html:option value=""/>
                        <c:choose>
                            <c:when test="${fn:length(listAdminTableColumns)>1}">
                                <c:forEach var="cuItem" items="${listAdminTableColumns}">
                                    <html:option value="${cuItem[0]}">${cuItem[1]}</html:option>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <html:option value="Kies eerst tabel of feature..." />
                            </c:otherwise>
                        </c:choose>
                    </html:select>
                    <a href="#" class="helpLink" id="helpLink_help_configgb_${connectieType}_adminfk">(?)</a><div id="help_configgb_${connectieType}_adminfk" style="display: none;" title="<fmt:message key="configgb_${connectieType}_adminfk.label"/>"><fmt:message key="configgb_${connectieType}_adminfk.uitleg"/></div>
                </div>

                <div class="configrow configrowtree">
                    <label><fmt:message key="configgb_${connectieType}_adminquery.label"/></label>
                    <html:text property="admin_query" size="80" styleId="admin_query_text"/>
                    <a href="#" class="helpLink" id="helpLink_help_configgb_${connectieType}_adminquery">(?)</a><div id="help_configgb_${connectieType}_adminquery" style="display: none;" title="<fmt:message key="configgb_${connectieType}_adminquery.label"/>"><fmt:message key="configgb_${connectieType}_adminquery.uitleg"/></div>
                </div>

                <div class="configrow configrowtree">
                    <label><fmt:message key="configgb_volgordenr.label"/></label>
                    <html:text property="volgordenr" size="10"/>
                    <a href="#" class="helpLink" id="helpLink_help_configgb_volgordenr">(?)</a><div id="help_configgb_volgordenr" style="display: none;" title="<fmt:message key="configgb_volgordenr.label"/>"><fmt:message key="configgb_volgordenr.uitleg"/></div>
                </div>

                <div class="configrow configrowtree">
                    <label><fmt:message key="configgb_opmerking.label"/></label>
                    <html:text property="admin_tabel_opmerkingen" size="80"/>
                    <a href="#" class="helpLink" id="helpLink_help_configgb_opmerking">(?)</a><div id="help_configgb_opmerking" style="display: none;" title="<fmt:message key="configgb_opmerking.label"/>"><fmt:message key="configgb_opmerking.uitleg"/></div>
                </div>

                <div class="configrow configrowtree" style="margin-top: 25px;">
                    <a href="configThemaData.do?gegevensbronID=${mainid}">Objectdata bewerken</a>
                </div>
            </div>
            <div class="configadvanced"></div>
        </div>
    </div>

</div>
<div style="clear: both;"></div>
</html:form>

<script type="text/javascript" src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'></script>
<script type="text/javascript" src='dwr/interface/JConfigListsUtil.js'></script>
<script type="text/javascript" src="<html:rewrite page="/scripts/gegevensbron.js"/>"></script>
<script type="text/javascript" src="<html:rewrite page="/scripts/simple_treeview.js"/>"></script>

<script type="text/javascript">

    <c:if test="${empty form.map.gegevensbronID}">
        refreshFeatureList(document.getElementById("connectie_select"));
    </c:if>

        function catchEmpty(defval){
            return defval
        }

        var pageGegevensbronId = '${form.map.gegevensbronID}';
        var themaTree = catchEmpty(${tree});
        treeview_create({
            "id": "treediv",
            "root": themaTree,
            "rootChildrenAsRoots": true,
            "itemLabelCreatorFunction": createLeaf,
            "toggleImages": {
                "collapsed": "<html:rewrite page="/images/treeview/plus.gif"/>",
                "expanded": "<html:rewrite page="/images/treeview/minus.gif"/>",
                "leaf": "<html:rewrite page="/images/treeview/leaft.gif"/>"
            },
            "saveExpandedState": true,
            "saveScrollState": true,
            "expandAll": true
        });

        var connectionTypes=new Array();
        connectionTypes["-1"]="";
        connectionTypes["0"]="wfs";
    <c:forEach var="cuItem" items="${listConnecties}">
        connectionTypes["${cuItem.id}"]="${cuItem.type}";
    </c:forEach>
</script>