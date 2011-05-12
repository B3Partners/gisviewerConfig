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

<c:set var="form" value="${themaForm}"/>
<c:set var="action" value="${form.map.action}"/>
<c:set var="mainid" value="${form.map.themaID}"/>

<c:set var="save" value="${action == 'save'}"/>
<c:set var="delete" value="${action == 'delete'}"/>

<c:set var="focus" value="naam"/>
<script type="text/javascript" src='dwr/engine.js'></script>
<script type="text/javascript" src='dwr/util.js'></script>
<script type="text/javascript" src='dwr/interface/JConfigListsUtil.js'></script>
<script type="text/javascript" src="<html:rewrite page="/scripts/configthema.js"/>"></script>

<div class="infobalk">
    <div class="infobalk_description"><fmt:message key="configthema.infobalk"/></div>
    <div class="infobalk_actions"> <tiles:insert name="loginblock"/> </div>
</div>

<html:form action="/configThema" focus="${focus}">
    <div style="display: none;">
        <html:hidden property="action"/>
        <html:hidden property="alt_action"/>
        <html:hidden property="themaID"/>
        <html:hidden property="wms_url"/>
        <html:hidden property="wms_layers"/>
        <html:hidden property="wms_legendlayer"/>
        <html:hidden property="wms_querylayers"/>
        <input type="hidden" name="refreshLists">
    </div>

    <c:if test="${!empty allThemas}">
        <div class="tablesortercontainer">
            <table id="themalisttable" class="tablesorter">
                <thead>
                    <tr>
                        <th style="width: 10%;" class="{sorter:'digit'}">Volgorde</th>
                        <th style="width: 30%;">Naam</th>
                        <th style="width: 20%;"><fmt:message key="configthema.cluster"/></th>
                        <th style="width: 10%;">Objectdata</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="ci" varStatus="status" items="${allThemas}">
                        <c:url var="link" value="/configThema.do?edit=submit&themaID=${ci.id}" />
                        <c:set var="id_selected" value='' />
                        <c:if test="${ci.id == mainid}"><c:set var="id_selected" value='selected' /></c:if>
                        <tr>
                            <td><c:out value="${ci.belangnr}"/>&nbsp;<input type="hidden" name="link" value="${link}" /><input type="hidden" name="selected" value="${id_selected}" /></td>
                            <td><c:out value="${ci.naam}"/>&nbsp;</td>
                            <td><c:out value="${ci.cluster.naam}"/></td>

                            <c:set var="accolade" value="}"/>

                            <td>                                                            
                                <c:if test="${!empty ci.gegevensbron}">
                                    &nbsp;<html:link page="/configThemaData.do?gegevensbronID=${ci.gegevensbron.id}">Bewerken</html:link>&nbsp;
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </c:if>

    <div class="berichtenbalk">
        <tiles:insert definition="actionMessages"/>
    </div>
    <div class="ie7clear"></div>
    <div style="float: left; clear: both; width: 920px; margin-left: 15px; margin-bottom: 5px; margin-top: 25px;">
        <div style="float: left; margin-left: 155px;">
            <input type="checkbox" id="advancedToggle" /> Toon geavanceerde opties
        </div>
        <div style="float: right;">
            <c:if test="${empty form.map.themaID}">
                <div class="knoppen">
                    <html:submit property="save" accesskey="s" styleClass="knop saveButton" onclick="return confirm('Weet u zeker dat u deze kaartlaag wilt opslaan?');">
                        <fmt:message key="button.save"/>
                    </html:submit>
                </div>
                <div class="knoppen">
                    <input type="button" class="knop" onclick="window.location='<html:rewrite page='/configThema.do' />'" value="<fmt:message key='button.cancel'/>" />
                </div>
            </c:if>
            <!-- Indien item aan het bewerken dan Nieuw, Wissen en Opslaan knoppen tonen -->
            <c:if test="${!empty form.map.themaID}">               
                <div class="knoppen">
                    <html:submit property="create" accesskey="n" styleClass="knop newButton">
                        <fmt:message key="button.new"/>
                    </html:submit>
                </div>
                <div class="knoppen">
                    <html:submit property="delete" accesskey="d" styleClass="knop removeButton" onclick="return confirm('Weet u zeker dat u deze kaartlaag wilt verwijderen?');">
                        <fmt:message key="button.remove"/>
                    </html:submit>
                </div>
                <div class="knoppen">
                    <html:submit property="save" accesskey="s" styleClass="knop saveButton" onclick="return confirm('Weet u zeker dat u deze kaartlaag wilt opslaan?');">
                        <fmt:message key="button.save"/>
                    </html:submit>
                </div>                            
            </c:if>
        </div>
    </div>
    <div class="ie7clear"></div>
    <div class="tablabels">
        <div class="tablabel" id="label_algemeen">
            Algemeen
        </div>
        <div class="tablabel" id="label_gegevensbron">
            Gegevensbron
        </div>
        <div class="tablabel" id="label_kaart">
            Kaart
        </div>
        <div class="tablabel" id="label_opties">
            Opties
        </div>
    </div>

    <div class="tabcontents">
        <div class="tabcontent content_algemeen">
            <div class="configbasic">
                
                <div class="configrow configrowfull">
                    <label><fmt:message key="configthema.naam"/></label>
                    <html:text property="naam" size="140"/>
                    <a class="helpLink" href="#" id="helpLink_help_configthemanaam">(?)</a>
                    <div id="help_configthemanaam" style="display: none;" title="<fmt:message key="configthema.naam"/>"><fmt:message key="configthema.naam.uitleg"/></div>
                </div>

                <div class="configrow configrowfull">
                    <label><fmt:message key="configthema.cluster"/></label>
                    <html:select property="clusterID" styleClass="configSelect">
                        <c:forEach var="cuItem" items="${allClusters}">
                            <html:option value="${cuItem.id}">
                                <c:out value="${cuItem.naam}"/>
                            </html:option>
                        </c:forEach>
                    </html:select>
                    <a class="helpLink" href="#" id="helpLink_help_configthemacluser">(?)</a><div id="help_configthemacluser" style="display: none;" title="<fmt:message key="configthema.cluster"/>"><fmt:message key="configthema.cluster.uitleg"/></div>
                </div>
                
                <div class="configrow configrowfull">
                    <label><fmt:message key="configthema.belangnr"/></label>
                    <html:text property="belangnr" size="5"/>
                    <a class="helpLink" href="#" id="helpLink_help_configthemabelangnr">(?)</a><div id="help_configthemabelangnr" style="display: none;" title="<fmt:message key="configthema.belangnr"/>"><fmt:message key="configthema.belangnr.uitleg"/></div>
                </div>
            </div>

            <div class="configadvanced">
                <c:if test="${!empty form.map.themaID}">
                <div class="configrow configrowfull">
                    <label><fmt:message key="config.label.copypastelink"/></label>
                    <div style="float: left;"><a href="${absoluteURIPrefix}/gisviewer/viewer.do?id=${form.map.themaID}" target="_new"><fmt:message key="config.linknaam.copypastelink"/></a></div>
                    <a class="helpLink" href="#" id="helpLink_help_copypastelink">(?)</a>
                    <div id="help_copypastelink" style="display: none;" title="<fmt:message key="config.label.copypastelink"/>">
                        <fmt:message key="config.copypastelink.uitleg"/>
                    </div>
                </div>
                </c:if>

                <div class="configrow configrowfull">
                    <label><fmt:message key="configthema.metadatalink"/></label>
                    <html:text property="metadatalink" size="140"/>
                    <a class="helpLink" href="#" id="helpLink_help_configthemametadatalink">(?)</a><div id="help_configthemametadatalink" style="display: none;" title="<fmt:message key="configthema.metadatalink"/>"><fmt:message key="configthema.metadatalink.uitleg"/></div>
                </div>

                <div class="configrow configrowfull">
                    <label><fmt:message key="configthema.opmerkingen"/></label>
                    <html:text property="opmerkingen" size="140"/>
                    <a class="helpLink" href="#" id="helpLink_help_configthemaopmerkingen">(?)</a><div id="help_configthemaopmerkingen" style="display: none;" title="<fmt:message key="configthema.opmerkingen"/>"><fmt:message key="configthema.opmerkingen.uitleg"/></div>
                </div>
            </div>

        </div>

        <div class="tabcontent content_gegevensbron">
            <div class="configbasic">
                <div class="configrow configrowfull">
                    <label><fmt:message key="configthema_gegevensbron.label"/></label>
                    <html:select property="gegevensbron">
                        <html:option value="-1">Geen gegevensbron</html:option>
                        <c:forEach var="cuItem" items="${listBronnen}">
                            <html:option value="${cuItem.id}">
                                <c:out value="${cuItem.naam}"/>
                            </html:option>
                        </c:forEach>
                    </html:select>
                    <a class="helpLink" href="#" id="helpLink_help_configthema_gegevensbron">(?)</a><div id="help_configthema_gegevensbron" style="display: none;" title="<fmt:message key="configthema_gegevensbron.label"/>"><fmt:message key="configthema_gegevensbron.uitleg"/></div>
                </div>
                <div class="configadvanced"></div>
            </div>
        </div>

        <div class="tabcontent content_kaart">
            <div class="configbasic">

                <c:choose>
                    <c:when test="${fn:length(listLayers)>1}">
                        <div class="configrow configrowfull">
                            <label><fmt:message key="configthema.wmslayers"/></label>
                            <html:select property="wms_layers_real" styleClass="configSelect">
                                <html:option value=""/>
                                <c:forEach var="cuItem" items="${listLayers}">
                                    <html:option value="${cuItem.name}">${cuItem}</html:option>
                                </c:forEach>
                            </html:select>
                            <a class="helpLink" href="#" id="helpLink_help_configthemawmslayers">(?)</a><div id="help_configthemawmslayers" style="display: none;" title="<fmt:message key="configthema.wmslayers"/>"><fmt:message key="configthema.wmslayers.uitleg"/></div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="configrow configrowfull">
                            <label><fmt:message key="configthema.wmslayers"/></label>
                            <html:text property="wms_layers_real" size="140"/>
                            <a class="helpLink" href="#" id="helpLink_help_configthemawmslayers">(?)</a><div id="help_configthemawmslayers" style="display: none;" title="<fmt:message key="configthema.wmslayers"/>"><fmt:message key="configthema.wmslayers.uitleg"/></div>
                        </div>
                    </c:otherwise>
                </c:choose>
                
                <c:choose>
                    <c:when test="${fn:length(listLegendLayers)>1}">
                        <div class="configrow configrowfull">
                            <label><fmt:message key="configthema.wmslegendlayers"/></label>
                            <html:select property="wms_legendlayer_real" styleClass="configSelect">
                                <html:option value=""/>
                                <c:forEach var="cuItem" items="${listLegendLayers}">
                                    <html:option value="${cuItem.name}">${cuItem}</html:option>
                                </c:forEach>
                            </html:select>
                            <a class="helpLink" href="#" id="helpLink_help_configthemawmslegendlayers">(?)</a><div id="help_configthemawmslegendlayers" style="display: none;" title="<fmt:message key="configthema.wmslegendlayers"/>"><fmt:message key="configthema.wmslegendlayers.uitleg"/></div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="configrow configrowfull">
                            <label><fmt:message key="configthema.wmslegendlayers"/></label>
                            <html:text property="wms_legendlayer_real" size="140"/>
                            <a class="helpLink" href="#" id="helpLink_help_configthemawmslegendlayers">(?)</a><div id="help_configthemawmslegendlayers" style="display: none;" title="<fmt:message key="configthema.wmslegendlayers"/>"><fmt:message key="configthema.wmslegendlayers.uitleg"/></div>
                        </div>
                    </c:otherwise>
                </c:choose>
                
            </div>
            <div class="configadvanced">
                <c:choose>
                    <c:when test="${fn:length(listLayers)>1}">
                        <div class="configrow configrowfull">
                            <label><fmt:message key="configthema.wmsquerylayers"/></label>
                            <c:set var="queryDisabled" value="true"/>
                            <c:if test="${fn:length(form.map.admin_tabel) <= 0}">
                                <c:set var="queryDisabled" value="false"/>
                            </c:if>
                            <html:select property="wms_querylayers_real" styleId="wms_querylayers_real" disabled="${queryDisabled}" styleClass="configSelect">
                                <html:option value=""/>
                                <c:forEach var="cuItem" items="${listLayers}">
                                    <html:option value="${cuItem.name}">${cuItem}</html:option>
                                </c:forEach>
                            </html:select>
                            <a class="helpLink" href="#" id="helpLink_help_configthemawmsquerylayers">(?)</a><div id="help_configthemawmsquerylayers" style="display: none;" title="<fmt:message key="configthema.wmsquerylayers"/>"><fmt:message key="configthema.wmsquerylayers.uitleg"/></div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="configrow configrowfull">
                            <label><fmt:message key="configthema.wmsquerylayers"/></label>
                            <html:text property="wms_querylayers_real" size="140"/>
                            <a class="helpLink" href="#" id="helpLink_help_configthemawmsquerylayers">(?)</a><div id="help_configthemawmsquerylayers" style="display: none;" title="<fmt:message key="configthema.wmsquerylayers"/>"><fmt:message key="configthema.wmsquerylayers.uitleg"/></div>
                        </div>
                    </c:otherwise>
                </c:choose>

                <div class="configrow configrowfull">
                    <label><fmt:message key="configthema.maptip"/></label>
                    <html:text property="thema_maptip" size="140"/>
                    <a class="helpLink" href="#" id="helpLink_help_configthemamaptip">(?)</a><div id="help_configthemamaptip" style="display: none;" title="<fmt:message key="configthema.maptip"/>"><fmt:message key="configthema.maptip.uitleg"/></div>
                </div>

                <div class="configrow configrowfull">
                    <label><fmt:message key="configthema.sldattribuut"/></label>
                    <html:text property="sldattribuut" size="50"/>
                    <a class="helpLink" href="#" id="helpLink_help_configthemasldattribuut">(?)</a><div id="help_configthemasldattribuut" style="display: none;" title="<fmt:message key="configthema.sldattribuut"/>"><fmt:message key="configthema.sldattribuut.uitleg"/></div>
                </div>

            </div>
        </div>

        <div class="tabcontent content_opties">
            <div class="configbasic">
                
                <div class="configrow configrowfull">
                    <label><fmt:message key="configthema.defaultvisible"/></label>
                    <html:checkbox property="visible"/>
                    <a class="helpLink" href="#" id="helpLink_help_configthemadefaultvisible">(?)</a><div id="help_configthemadefaultvisible" style="display: none;" title="<fmt:message key="configthema.defaultvisible"/>"><fmt:message key="configthema.defaultvisible.uitleg"/></div>
                </div>
                <div class="configrow configrowfull">
                    <label><fmt:message key="cfg_layoutAdminData.label"/></label>
                    <html:select property="layoutadmindata">
                        <html:option value=""><fmt:message key="cfg_layoutAdminData.0"/></html:option>
                        <html:option value="admindata1"><fmt:message key="cfg_layoutAdminData.1"/></html:option>
                        <html:option value="admindata2"><fmt:message key="cfg_layoutAdminData.2"/></html:option>
                        <html:option value="admindata3"><fmt:message key="cfg_layoutAdminData.3"/></html:option>
                        <html:option value="all_vertical"><fmt:message key="cfg_layoutAdminData.all_vertical"/></html:option>
                        <html:option value="all_vertical_tab1"><fmt:message key="cfg_layoutAdminData.all_vertical_tab1"/></html:option>
                        <html:option value="all_vertical_tab2"><fmt:message key="cfg_layoutAdminData.all_vertical_tab2"/></html:option>
                        <html:option value="all_vertical_tab3"><fmt:message key="cfg_layoutAdminData.all_vertical_tab3"/></html:option>
                        <html:option value="all_vertical_tab4"><fmt:message key="cfg_layoutAdminData.all_vertical_tab4"/></html:option>
                        <html:option value="all_vertical_tab5"><fmt:message key="cfg_layoutAdminData.all_vertical_tab5"/></html:option>
                        <html:option value="multi_admindata"><fmt:message key="cfg_layoutAdminData.multi"/></html:option>
                    </html:select>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_layoutAdminData">(?)</a>
                    <div id="help_cfg_layoutAdminData" style="display: none;" title="<fmt:message key="cfg_layoutAdminData.label"/>">
                        <fmt:message key="cfg_layoutAdminData.uitleg"/>
                    </div>
                </div>
            </div>
            <div class="configadvanced">
                
                <div class="configrow configrowfull">
                    <label><fmt:message key="configthema.locatiethema"/></label>
                    <html:checkbox property="locatie_thema"/>
                    <a class="helpLink" href="#" id="helpLink_help_configthemalocatiethema">(?)</a><div id="help_configthemalocatiethema" style="display: none;" title="<fmt:message key="configthema.locatiethema"/>"><fmt:message key="configthema.locatiethema.uitleg"/></div>
                </div>
                <div class="configrow configrowfull">
                    <label><fmt:message key="configthema.analysethema"/></label>
                    <html:checkbox property="analyse_thema"/>
                    <a class="helpLink" href="#" id="helpLink_help_configthemaanalysethema">(?)</a><div id="help_configthemaanalysethema" style="display: none;" title="<fmt:message key="configthema.analysethema"/>"><fmt:message key="configthema.analysethema.uitleg"/></div>
                </div>
                
            </div>
        </div>
    </div>
    <div class="clearBoth"></div>

</html:form>

<script type="text/javascript">
    //create layerobjects for autofill
    var layersObject = new Object();
    <c:if test="${not empty listLayers}">
        <c:forEach var="cuItem" items="${listLayers}">
            var layerObject=new Object();
            layerObject.name="${cuItem.name}";
            layerObject.title="${cuItem.title}";
            layerObject.metadata="${cuItem.metadata}";
            layersObject["${cuItem.name}"]=layerObject;
        </c:forEach>
    </c:if>
        //check if the object has a legend
    <c:if test="${not empty listLegendLayers}">
        <c:forEach var="cuItem" items="${listLegendLayers}">
            if (layersObject["${cuItem.name}"]){
                layersObject["${cuItem.name}"].legend=true;
            }
        </c:forEach>
    </c:if>

        tablepager(
        'themalisttable',
        //'textExtraction: myCellParser',
        '930', // table width in pixels
        '14', // cell height
        false // display numberOfPages dropdown
    );

        var pageConnectionType="${connectieType}";
        var currentConnectionType="${connectieType}";
        var connectionTypes=new Array();
        connectionTypes["-1"]="";
        connectionTypes["0"]="wfs";
    <c:forEach var="cuItem" items="${listConnecties}">
        connectionTypes["${cuItem.id}"]="${cuItem.type}";
    </c:forEach>
</script>
