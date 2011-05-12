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

<c:set var="form" value="${kaartgroepForm}"/>
<c:set var="action" value="${form.map.action}"/>
<c:set var="mainid" value="${form.map.clusterID}"/>

<c:set var="save" value="${action == 'save'}"/>
<c:set var="delete" value="${action == 'delete'}"/>

<c:set var="focus" value="naam"/>

<div class="infobalk">
    <div class="infobalk_description"><fmt:message key="configcluster.infobalk"/></div>
    <div class="infobalk_actions"><tiles:insert name="loginblock"/></div>
</div>

<div class="berichtenbalk" style="margin-top: 5px;">
    <tiles:insert definition="actionMessages"/>
</div>

<html:form action="/configKaartGroep" focus="${focus}">
    <html:hidden property="action"/>
    <html:hidden property="alt_action"/>
    <html:hidden property="clusterID"/>

    <div class="ie7clear"></div>
    <div style="float: right; clear: both; width: 940px; margin-right: 20px; margin-bottom: 5px;">
        <div style="float: left; margin-left: 270px;">
            <input type="checkbox" id="advancedToggle" /> Toon geavanceerde opties
        </div>
        <div style="float: right;">
            <!-- Indien nieuw item maken dan alleen Opslaan en Annuleren knoppen tonen -->
            <c:if test="${empty form.map.clusterID}">
                <div class="knoppen">
                    <html:submit property="save" accesskey="s" styleClass="knop saveButton" onclick="return confirm('Weet u zeker dat u deze kaartgroep wilt opslaan?');">
                        <fmt:message key="button.save"/>
                    </html:submit>
                </div>
                <div class="knoppen">
                    <input type="button" class="knop" onclick="window.location='<html:rewrite page='/configKaartGroep.do' />'" value="<fmt:message key='button.cancel'/>" />
                </div>
            </c:if>
            <!-- Indien item aan het bewerken dan Nieuw, Wissen en Opslaan knoppen tonen -->
            <c:if test="${!empty form.map.clusterID}">
                <div class="knoppen">
                    <html:submit property="create" accesskey="n" styleClass="knop newButton">
                        <fmt:message key="button.new"/>
                    </html:submit>
                </div>
                <div class="knoppen">
                    <html:submit property="delete" accesskey="d" styleClass="knop removeButton" onclick="return confirm('Weet u zeker dat u deze kaartgroep wilt verwijderen?');">
                        <fmt:message key="button.remove"/>
                    </html:submit>
                </div>
                <div class="knoppen">
                    <html:submit property="save" accesskey="s" styleClass="knop saveButton" onclick="return confirm('Weet u zeker dat u deze kaartgroep wilt opslaan?');">
                        <fmt:message key="button.save"/>
                    </html:submit>
                </div>
            </c:if>
        </div>
    </div>
    <div class="ie7clear"></div>
    <div id="treedivContainer">
        <div id="treediv"></div>
    </div>

    <div class="tabcontents treetabcontents">
        <div class="tabcontent defaulttab">
            <div class="configbasic">
                <c:if test="${!empty form.map.clusterID}">
                    <div class="configrow configrowtree">
                        <label><fmt:message key="config.label.copypastelink"/></label>
                        <a href="${absoluteURIPrefix}/gisviewer/viewer.do?clusterId=${form.map.clusterID}" target="_new"><fmt:message key="config.linknaam.copypastelink"/></a>
                        <a href="#" class="helpLink" id="helpLink_help_copypastelink">(?)</a>
                        <div id="help_copypastelink" style="display: none;" title="<fmt:message key="config.label.copypastelink"/>">
                            <fmt:message key="config.copypastelink.uitleg"/>
                        </div>
                    </div>
                </c:if>

                <div class="configrow configrowtree">
                    <label><fmt:message key="configcluster.naam"/></label>
                    <html:text property="naam" size="60"/>
                </div>
                <div class="configrow configrowtree">
                    <label><fmt:message key="configcluster.metadatalink"/></label>
                    <html:text property="metadatalink"  size="60"/>
                    <a href="#" class="helpLink" id="helpLink_help_cluster_meta">(?)</a>
                    <div id="help_cluster_meta" style="display: none;" title="<fmt:message key="configcluster.metadatalink"/>">
                        <fmt:message key="configcluster.metadatalink.uitleg"/>
                    </div>
                </div>
                <div class="configrow configrowtree">
                    <label><fmt:message key="configcluster.volgorde"/></label>
                    <html:text property="belangnr" size="10"/>
                    <a href="#" class="helpLink" id="helpLink_help_cluster_volgorde">(?)</a>
                    <div id="help_cluster_volgorde" style="display: none;" title="<fmt:message key="configcluster.volgorde"/>">
                        <fmt:message key="configcluster.volgorde.uitleg"/>
                    </div>
                </div>
                <div class="configrow configrowtree">
                    <label><fmt:message key="configcluster.omschrijving"/></label>
                    <html:text property="omschrijving"  size="60"/>
                    <a href="#" class="helpLink" id="helpLink_help_cluster_omschr">(?)</a>
                    <div id="help_cluster_omschr" style="display: none;" title="<fmt:message key="configcluster.omschrijving"/>">
                        <fmt:message key="configcluster.omschrijving.uitleg"/>
                    </div>
                </div>
                <div class="configrow configrowtree">
                    <label><fmt:message key="configcluster.geenconfiglagen"/></label>
                    <html:checkbox property="default_cluster"/>
                    <a href="#" class="helpLink" id="helpLink_help_cluster_noconfig">(?)</a>
                    <div id="help_cluster_noconfig" style="display: none;" title="<fmt:message key="configcluster.geenconfiglagen"/>">
                        <fmt:message key="configcluster.geenconfiglagen.uitleg"/>
                    </div>
                </div>
                <div class="configrow configrowtree">
                    <label><fmt:message key="configcluster.onzichtbaarinlegenda"/></label>
                    <html:checkbox property="hide_legend"/>
                    <a href="#" class="helpLink" id="helpLink_help_cluster_onzichtbaar">(?)</a>
                    <div id="help_cluster_onzichtbaar" style="display: none;" title="<fmt:message key="configcluster.onzichtbaarinlegenda"/>">
                        <fmt:message key="configcluster.onzichtbaarinlegenda.uitleg"/>
                    </div>
                </div>
                <div class="configrow configrowtree">
                    <label><fmt:message key="configcluster.onzichtbaarinboom"/></label>
                    <html:checkbox property="hide_tree"/>
                    <a href="#" class="helpLink" id="helpLink_help_cluster_onzichtbaarinboom">(?)</a>
                    <div id="help_cluster_onzichtbaarinboom" style="display: none;" title="<fmt:message key="configcluster.onzichtbaarinboom"/>">
                        <fmt:message key="configcluster.onzichtbaarinboom.uitleg"/>
                        <fmt:message key="configcluster.onzichtbaar.combinatie.uitleg"/>
                    </div>
                </div>
                <div class="configrow configrowtree">
                    <label><fmt:message key="configcluster.achtergrondlagen"/></label>
                    <html:checkbox property="background_cluster"/>
                    <a href="#" class="helpLink" id="helpLink_help_cluster_achtergrond">(?)</a>
                    <div id="help_cluster_achtergrond" style="display: none;" title="<fmt:message key="configcluster.achtergrondlagen"/>">
                        <fmt:message key="configcluster.achtergrondlagen.uitleg"/>
                    </div>
                </div>

                <div class="configrow configrowtree">
                    <label><fmt:message key="configcluster.aanuitvink"/></label>
                    <html:checkbox property="callable"/>
                    <a href="#" class="helpLink" id="helpLink_help_cluster_aanuitvink">(?)</a>
                    <div id="help_cluster_aanuitvink" style="display: none;" title="<fmt:message key="configcluster.aanuitvink"/>">
                        <fmt:message key="configcluster.aanuitvink.uitleg"/>
                    </div>
                </div>
                <div class="configrow configrowtree">
                    <label><fmt:message key="configcluster.defaultaangevinkt"/></label>
                    <html:checkbox property="default_visible"/>
                    <a href="#" class="helpLink" id="helpLink_help_cluster_defaultaan">(?)</a>
                    <div id="help_cluster_defaultaan" style="display: none;" title="<fmt:message key="configcluster.defaultaangevinkt"/>">
                        <fmt:message key="configcluster.defaultaangevinkt.uitleg"/>
                    </div>
                </div>
                <div class="configrow configrowtree">
                    <label><fmt:message key="configcluster.exclusive_childs"/></label>
                    <html:checkbox property="exclusive_childs"/>
                    <a href="#" class="helpLink" id="helpLink_help_cluster_exclusive_childs">(?)</a>
                    <div id="help_cluster_exclusive_childs" style="display: none;" title="<fmt:message key="configcluster.exclusive_childs"/>">
                        <fmt:message key="configcluster.exclusive_childs.uitleg"/>
                    </div>
                </div>
                <div class="configrow configrowtree">
                    <label><fmt:message key="configcluster.oudercluster"/></label>

                    <html:select property="parentID">
                        <html:option value=""/>
                        <c:forEach var="cuItem" items="${allClusters}">
                            <c:if test="${mainid != cuItem.id}">
                                <html:option value="${cuItem.id}">
                                    <c:out value="${cuItem.naam}"/>
                                </html:option>
                            </c:if>
                        </c:forEach>
                    </html:select>
                    <a href="#" class="helpLink" id="helpLink_help_cluster_parent">(?)</a>
                    <div id="help_cluster_parent" style="display: none;" title="<fmt:message key="configcluster.oudercluster"/>">
                        <fmt:message key="configcluster.oudercluster.uitleg"/>
                    </div>
                </div>
            </div>
            <div class="configadvanced"></div>
        </div>
    </div>
    <div style="clear: both;"></div>
</html:form>

<script type="text/javascript" src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'></script>
<script type="text/javascript" src="<html:rewrite page="/scripts/kaartgroep.js"/>"></script>
<script type="text/javascript" src="<html:rewrite page="/scripts/simple_treeview.js"/>"></script>

<script type="text/javascript">
    function catchEmpty(defval){
        return defval
    }
   
    var pageClusterId = '${form.map.clusterID}';
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
</script>