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
    <div id="content_style">
        <div class="berichtenbalk">
            <tiles:insert definition="actionMessages"/>
        </div>

        <div id="config_tab_header_container">
            <div class="config_tab_header" id="tab-algemeen-header">Algemeen</div>
            <div class="config_tab_header" id="tab-gegevensbron-header">Gegevensbron</div>
            <div class="config_tab_header" id="tab-kaart-header">Kaart</div>         
            <div class="config_tab_header" id="tab-themaopties-header">Opties</div>
            <div class="config_tab_header" id="tab-geavanceerd-header">Geavanceerd</div>
        </div>

        <div class="maintable">

            <div class="config_tab" id="tab-algemeen-content">
                <table cellpadding="2" cellspacing="2" border="0">

                    <c:if test="${!empty form.map.themaID}">
                    <tr>
                        <td>
                        <fmt:message key="config.label.copypastelink"/>
                        <a href="#" onclick="return showHelpDialog('help_copypastelink');">(?)</a>
                        <div id="help_copypastelink" style="display: none;" title="<fmt:message key="config.label.copypastelink"/>">
                            <p><fmt:message key="config.copypastelink.uitleg"/></p>
                        </div>
                        </td>
                        <td>
                            <a href="${absoluteURIPrefix}/gisviewer/viewer.do?id=${form.map.themaID}" target="_new"><fmt:message key="config.linknaam.copypastelink"/></a>
                        </td>
                    </tr>
                    </c:if>

                    <tr><td>
                            <fmt:message key="configthema.naam"/> <a href="#" onclick="return showHelpDialog('help_configthemanaam');">(?)</a><div id="help_configthemanaam" style="display: none;" title="<fmt:message key="configthema.naam"/>"><p><fmt:message key="configthema.naam.uitleg"/></p></div>
                    </td><td colspan="3"><html:text property="naam" size="140"/></td></tr>
                    <tr><td><fmt:message key="configthema.metadatalink"/> <a href="#" onclick="return showHelpDialog('help_configthemametadatalink');">(?)</a><div id="help_configthemametadatalink" style="display: none;" title="<fmt:message key="configthema.metadatalink"/>"><p><fmt:message key="configthema.metadatalink.uitleg"/></p></div></td><td colspan="3"><html:text property="metadatalink" size="140"/></td></tr>
                    <tr class="optionalConfigItems">
                        <td>
                            <fmt:message key="configthema.code"/> <a href="#" onclick="return showHelpDialog('help_configthemacode');">(?)</a><div id="help_configthemacode" style="display: none;" title="<fmt:message key="configthema.code"/>"><p><fmt:message key="configthema.code.uitleg"/></p></div>
                        </td>
                        <td colspan="3">
                            <html:select property="themaCode" styleClass="configSelect">
                                <html:option value="1">Oorspronkelijk Thema (1)</html:option>
                                <html:option value="2">Nieuw Thema (2)</html:option>
                                <html:option value="3">Thema niet meer in gebruik (3)</html:option>
                            </html:select>&nbsp;
                        </td>
                    </tr>
                    <tr><td><fmt:message key="configthema.belangnr"/> <a href="#" onclick="return showHelpDialog('help_configthemabelangnr');">(?)</a><div id="help_configthemabelangnr" style="display: none;" title="<fmt:message key="configthema.belangnr"/>"><p><fmt:message key="configthema.belangnr.uitleg"/></p></div></td><td colspan="3"><html:text property="belangnr" size="140"/></td></tr>
                    <tr>
                        <td>
                            <fmt:message key="configthema.cluster"/> <a href="#" onclick="return showHelpDialog('help_configthemacluser');">(?)</a><div id="help_configthemacluser" style="display: none;" title="<fmt:message key="configthema.cluster"/>"><p><fmt:message key="configthema.cluster.uitleg"/></p></div>
                        </td>
                        <td colspan="3">
                            <html:select property="clusterID" styleClass="configSelect">
                                <c:forEach var="cuItem" items="${allClusters}">
                                    <html:option value="${cuItem.id}">
                                        <c:out value="${cuItem.naam}"/>
                                    </html:option>
                                </c:forEach>
                            </html:select>&nbsp;
                        </td>
                    </tr>
                    <tr><td><fmt:message key="configthema.opmerkingen"/> <a href="#" onclick="return showHelpDialog('help_configthemaopmerkingen');">(?)</a><div id="help_configthemaopmerkingen" style="display: none;" title="<fmt:message key="configthema.opmerkingen"/>"><p><fmt:message key="configthema.opmerkingen.uitleg"/></p></div></td><td colspan="3"><html:text property="opmerkingen" size="140"/></td></tr>
                </table>
            </div>

            <div class="config_tab" id="tab-themaopties-content">
                <table cellpadding="2" cellspacing="2" border="0">
                    <tr><td><fmt:message key="configthema.locatiethema"/> <a href="#" onclick="return showHelpDialog('help_configthemalocatiethema');">(?)</a><div id="help_configthemalocatiethema" style="display: none;" title="<fmt:message key="configthema.locatiethema"/>"><p><fmt:message key="configthema.locatiethema.uitleg"/></p></div></td><td colspan="3"><html:checkbox property="locatie_thema"/></td></tr>
                    <tr><td><fmt:message key="configthema.analysethema"/> <a href="#" onclick="return showHelpDialog('help_configthemaanalysethema');">(?)</a><div id="help_configthemaanalysethema" style="display: none;" title="<fmt:message key="configthema.analysethema"/>"><p><fmt:message key="configthema.analysethema.uitleg"/></p></div></td><td colspan="3"><html:checkbox property="analyse_thema"/></td></tr>
                    <tr><td><fmt:message key="configthema.defaultvisible"/> <a href="#" onclick="return showHelpDialog('help_configthemadefaultvisible');">(?)</a><div id="help_configthemadefaultvisible" style="display: none;" title="<fmt:message key="configthema.defaultvisible"/>"><p><fmt:message key="configthema.defaultvisible.uitleg"/></p></div></td><td colspan="3"><html:checkbox property="visible"/></td></tr>
                
                    <tr>
                        <td>
                            <fmt:message key="cfg_layoutAdminData.label"/>
                            <a href="#" onclick="return showHelpDialog('help_cfg_layoutAdminData');">(?)</a>
                            <div id="help_cfg_layoutAdminData" style="display: none;" title="<fmt:message key="cfg_layoutAdminData.label"/>">
                                <p><fmt:message key="cfg_layoutAdminData.uitleg"/></p>
                            </div>
                        </td>
                        <td>
                            <html:select property="layoutadmindata">
                                <html:option value=""><fmt:message key="cfg_layoutAdminData.0"/></html:option>
                                <html:option value="admindata1"><fmt:message key="cfg_layoutAdminData.1"/></html:option>
                                <html:option value="admindata2"><fmt:message key="cfg_layoutAdminData.2"/></html:option>
                                <html:option value="admindata3"><fmt:message key="cfg_layoutAdminData.3"/></html:option>
                            </html:select>
                        </td>
                    </tr>

                </table>
            </div>

            <div class="config_tab" id="tab-gegevensbron-content">
                <table cellpadding="2" cellspacing="2" border="0">

                    <tr>
                        <td>
                            <fmt:message key="configthema_gegevensbron.label"/> <a href="#" onclick="return showHelpDialog('help_configthema_gegevensbron');">(?)</a><div id="help_configthema_gegevensbron" style="display: none;" title="<fmt:message key="configthema_gegevensbron.label"/>"><p><fmt:message key="configthema_gegevensbron.uitleg"/></p></div>
                        </td>
                        <td colspan="3">
                            <html:select property="gegevensbron" styleClass="configBronSelect">
                                <html:option value="-1">Geen gegevensbron</html:option>
                                <c:forEach var="cuItem" items="${listBronnen}">
                                    <html:option value="${cuItem.id}">
                                        <c:out value="${cuItem.naam}"/>
                                    </html:option>
                                </c:forEach>
                            </html:select>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="config_tab" id="tab-kaart-content">
                <table cellpadding="2" cellspacing="2" border="0">
                    <c:choose>
                        <c:when test="${fn:length(listLayers)>1}">
                            <tr>
                                <td><fmt:message key="configthema.wmslayers"/> <a href="#" onclick="return showHelpDialog('help_configthemawmslayers');">(?)</a><div id="help_configthemawmslayers" style="display: none;" title="<fmt:message key="configthema.wmslayers"/>"><p><fmt:message key="configthema.wmslayers.uitleg"/></p></div></td>
                                <td colspan="3">
                                    <html:select property="wms_layers_real" styleClass="configSelect">
                                        <html:option value=""/>
                                        <c:forEach var="cuItem" items="${listLayers}">
                                            <html:option value="${cuItem.name}">${cuItem}</html:option>
                                        </c:forEach>
                                    </html:select>&nbsp;
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <tr><td><fmt:message key="configthema.wmslayers"/> <a href="#" onclick="return showHelpDialog('help_configthemawmslayers');">(?)</a><div id="help_configthemawmslayers" style="display: none;" title="<fmt:message key="configthema.wmslayers"/>"><p><fmt:message key="configthema.wmslayers.uitleg"/></p></div></td><td colspan="3"><html:text property="wms_layers_real" size="140"/></td></tr>
                        </c:otherwise>
                    </c:choose>
                    <tr><td><fmt:message key="configthema.sldattribuut"/> <a href="#" onclick="return showHelpDialog('help_configthemasldattribuut');">(?)</a><div id="help_configthemasldattribuut" style="display: none;" title="<fmt:message key="configthema.sldattribuut"/>"><p><fmt:message key="configthema.sldattribuut.uitleg"/></p></div></td><td colspan="3"><html:text property="sldattribuut" size="50"/></td></tr>
                    <c:choose>
                        <c:when test="${fn:length(listLayers)>1}">
                            <tr>
                                <td><fmt:message key="configthema.wmsquerylayers"/> <a href="#" onclick="return showHelpDialog('help_configthemawmsquerylayers');">(?)</a><div id="help_configthemawmsquerylayers" style="display: none;" title="<fmt:message key="configthema.wmsquerylayers"/>"><p><fmt:message key="configthema.wmsquerylayers.uitleg"/></p></div></td>
                                <td colspan="3">
                                    <c:set var="queryDisabled" value="true"/>
                                    <c:if test="${fn:length(form.map.admin_tabel) <= 0}">
                                        <c:set var="queryDisabled" value="false"/>
                                    </c:if>
                                    <html:select property="wms_querylayers_real" styleId="wms_querylayers_real" disabled="${queryDisabled}" styleClass="configSelect">
                                        <html:option value=""/>
                                        <c:forEach var="cuItem" items="${listLayers}">
                                            <html:option value="${cuItem.name}">${cuItem}</html:option>
                                        </c:forEach>
                                    </html:select>&nbsp;
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <tr><td><fmt:message key="configthema.wmsquerylayers"/> <a href="#" onclick="return showHelpDialog('help_configthemawmsquerylayers');">(?)</a><div id="help_configthemawmsquerylayers" style="display: none;" title="<fmt:message key="configthema.wmsquerylayers"/>"><p><fmt:message key="configthema.wmsquerylayers.uitleg"/></p></div></td><td colspan="3"><html:text property="wms_querylayers_real" size="140"/></td></tr>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${fn:length(listLegendLayers)>1}">
                            <tr>
                                <td><fmt:message key="configthema.wmslegendlayers"/> <a href="#" onclick="return showHelpDialog('help_configthemawmslegendlayers');">(?)</a><div id="help_configthemawmslegendlayers" style="display: none;" title="<fmt:message key="configthema.wmslegendlayers"/>"><p><fmt:message key="configthema.wmslegendlayers.uitleg"/></p></div></td>
                                <td colspan="3">
                                    <html:select property="wms_legendlayer_real" styleClass="configSelect">
                                        <html:option value=""/>
                                        <c:forEach var="cuItem" items="${listLegendLayers}">
                                            <html:option value="${cuItem.name}">${cuItem}</html:option>
                                        </c:forEach>
                                    </html:select>&nbsp;
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <tr><td><fmt:message key="configthema.wmslegendlayers"/> <a href="#" onclick="return showHelpDialog('help_configthemawmslegendlayers');">(?)</a><div id="help_configthemawmslegendlayers" style="display: none;" title="<fmt:message key="configthema.wmslegendlayers"/>"><p><fmt:message key="configthema.wmslegendlayers.uitleg"/></p></div></td><td colspan="3"><html:text property="wms_legendlayer_real" size="140"/></td></tr>
                        </c:otherwise>
                    </c:choose>
					
					<tr>
                        <td><fmt:message key="configthema.maptip"/> <a href="#" onclick="return showHelpDialog('help_configthemamaptip');">(?)</a><div id="help_configthemamaptip" style="display: none;" title="<fmt:message key="configthema.maptip"/>"><p><fmt:message key="configthema.maptip.uitleg"/></p></div></td>
                        <td colspan="3">
                            <html:text property="thema_maptip" size="140"/>
                        </td>
                    </tr

                    <tr><td colspan="4">&nbsp;</td></tr>
                    <tr class="optionalConfigItems"><td><fmt:message key="configthema.updatefreqindagen"/> <a href="#" onclick="return showHelpDialog('help_configthemaupdatefreqindagen');">(?)</a><div id="help_configthemaupdatefreqindagen" style="display: none;" title="<fmt:message key="configthema.updatefreqindagen"/>"><p><fmt:message key="configthema.updatefreqindagen.uitleg"/></p></div></td><td colspan="3"><html:text property="update_frequentie_in_dagen" size="140"/></td></tr>
                </table>
            </div>
        </div>

        <div class="knoppenbalk">
            <!-- Indien nieuw item maken dan alleen Opslaan en Annuleren knoppen tonen -->
            <c:if test="${empty form.map.themaID}">
                <div class="knoppen">
                    <html:submit property="save" accesskey="s" styleClass="knop" onmouseover="this.className='knopover';" onmouseout="this.className='knop';" onclick="return confirm('Weet u zeker dat u deze kaartlaag wilt opslaan?');">
                        <fmt:message key="button.save"/>
                    </html:submit>
                </div>
                <div class="knoppen">
                    <input type="button" onclick="window.location='<html:rewrite page='/configThema.do' />'" value="<fmt:message key='button.cancel'/>" />
                </div>
            </c:if>
            <!-- Indien item aan het bewerken dan Nieuw, Wissen en Opslaan knoppen tonen -->
            <c:if test="${!empty form.map.themaID}">               
                <div class="knoppen">
                    <html:submit property="create" accesskey="n" styleClass="knop" onmouseover="this.className='knopover';" onmouseout="this.className='knop';">
                        <fmt:message key="button.new"/>
                    </html:submit>
                </div>
                <div class="knoppen">
                    <html:submit property="delete" accesskey="d" styleClass="knop" onclick="return confirm('Weet u zeker dat u deze kaartlaag wilt verwijderen?');" onmouseover="this.className='knopover';" onmouseout="this.className='knop';">
                        <fmt:message key="button.remove"/>
                    </html:submit>
                </div>
                <div class="knoppen">
                    <html:submit property="save" accesskey="s" styleClass="knop" onmouseover="this.className='knopover';" onmouseout="this.className='knop';" onclick="return confirm('Weet u zeker dat u deze kaartlaag wilt opslaan?');">
                        <fmt:message key="button.save"/>
                    </html:submit>
                </div>                            
            </c:if>
        </div>

        <script type="text/javascript">
            // Tabs
            createTabs('config_tab_header_container');
            firstTab('tab-algemeen-header');
        </script>
    </div>
</html:form>

<script type="text/javascript">
    tablepager(
        'themalisttable',
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
    showHideJDBC();
</script>
