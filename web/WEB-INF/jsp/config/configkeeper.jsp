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

<script type="text/javascript" src="<html:rewrite page='/scripts/kaartselectie.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page="/scripts/simple_treeview.js"/>"></script>

<div class="infobalk">
    <div class="infobalk_description"><fmt:message key="configkeeper.infobalk"/></div>
    <div class="infobalk_actions"><tiles:insert name="loginblock"/></div>
</div>

<div class="berichtenbalk" style="margin-top: 5px;">
    <tiles:insert definition="actionMessages"/>
</div>

<span class="rolnaamHeader">
    Instellingen voor <strong>'${header_appnaam}'</strong>.
</span>

<html:form action="/configKeeper" >
    <html:hidden property="action" />
    <html:hidden property="alt_action" />
    <html:hidden property="rolnaam" />
    <html:hidden property="appcode" />

    <html:hidden property="cfg_multipleActiveThemas" />
    <html:hidden property="cfg_autoRedirect" />

    <div class="ie7clear"></div>
    <div style="float: left; clear: both; width: 920px; margin-left: 15px; margin-bottom: 5px; margin-top: 25px;">
        <div style="float: left; margin-left: 155px;">
            <input type="checkbox" id="advancedToggle" data-cookie-key="configkeeper" /> Toon geavanceerde opties
        </div>
        <div style="float: right;">
            <input type="button" class="knop backButton" onclick="window.location = '<html:rewrite page='/configApplicatie.do' />'" value="<fmt:message key='button.back'/>" />

            <html:submit property="save" accesskey="s" styleClass="knop saveButton" onclick="return confirm('Weet u zeker dat u dit wilt opslaan?');">
                Opslaan
            </html:submit>

            <html:submit property="resetInstellingen" styleClass="knop refreshButton" accesskey="r" onclick="return confirm('Weet u zeker dat u de instellingen wilt herstellen naar de standaard waarden?');">
                Herstel naar standaard instellingen
            </html:submit>
        </div>
    </div>
    <div class="ie7clear"></div>

    <div class="tablabels">
        <div class="tablabel" id="label_kaartselectie">
            Basisboom
        </div>
        <div class="tablabel" id="label_kaartlagen">
            Algemeen
        </div>
        <div class="tablabel" id="label_layout">
            Layout
        </div>
        <div class="tablabel" id="label_tools">
            Tools
        </div>
        <div class="tablabel" id="label_tabbladen">
            Modules
        </div>
        <div class="tablabel sublabel" id="label_zoeken">
            Zoeken
        </div>
        <div class="tablabel sublabel" id="label_planselectie">
            Planselectie
        </div>
        <div class="tablabel sublabel" id="label_meldingen">
            Melding
        </div>
        <div class="tablabel sublabel" id="label_redlining">
            Redlining
        </div>
        <div class="tablabel sublabel" id="label_bag">
            BAG
        </div>
        <div class="tablabel sublabel" id="label_tekenen">
            Teken
        </div>
        <div class="tablabel sublabel" id="label_layerinfo">
            Laag informatie
        </div>
    </div>

    <div class="tabcontents">

        <div class="tabcontent content_kaartselectie">

            <div style="position: relative;">

                <div class="kaartselectieKoppen">
                    <h3>Vaste kaartlagen</h3>
                    <h4>Laag tonen</h4>
                    <h4 class="col2">Laag aan bij opstarten</h4>
                    <h4 class="col3">Style</h4>
                </div>
                <div style="clear: both;"></div>

                <div class="kaartselectie" id="mainTreeDiv"></div>

                <script type="text/javascript">
                    treeview_create({
                        "id": "mainTreeDiv",
                        "root": ${tree},
                        "rootChildrenAsRoots": true,
                        "itemLabelCreatorFunction": createLeaf,
                        "toggleImages": {
                            "collapsed": "<html:rewrite page="/images/treeview/plus.gif"/>",
                            "expanded": "<html:rewrite page="/images/treeview/minus.gif"/>", "leaf": "<html:rewrite page="/images/treeview/leaft.gif"/>"
                        },
                        "saveExpandedState": false,
                        "saveScrollState": false,
                        "expandAll": true,
                        "childrenPadding": '20px',
                        "zebraEffect": false
                    });
                </script>

                <c:if test="${!empty servicesTrees}">
                    <div class="kaartselectieKoppen">
                        <h3>Eigen kaartlagen</h3>
                        <h4>Laag tonen</h4>
                        <h4 class="col2">Laag aan bij opstarten</h4>
                        <h4 class="col3">Style</h4>
                    </div>
                    <div style="clear: both;"></div>

                    <c:forEach var="serviceTree" items="${servicesTrees}" varStatus="status">
                        <div id="layerTreeDiv${status.count}" class="kaartselectie"></div>

                        <script type="text/javascript">
                            treeview_create({
                                "id": 'layerTreeDiv${status.count}',
                                "root": ${serviceTree},
                                "rootChildrenAsRoots": false,
                                "itemLabelCreatorFunction": createServiceLeaf,
                                "toggleImages": {
                                    "collapsed": "<html:rewrite page="/images/treeview/plus.gif"/>",
                                    "expanded": "<html:rewrite page="/images/treeview/minus.gif"/>",
                                    "leaf": "<html:rewrite page="/images/treeview/leaft.gif"/>"
                                },
                                "saveExpandedState": true,
                                "saveScrollState": true,
                                "expandAll": true,
                                "childrenPadding": '20px',
                                "zebraEffect": true
                            });
                        </script>
                    </c:forEach>

                    <div class="kaartselectieBody">
                        <html:submit property="deleteWMSServices" styleClass="submitbutton deletebutton">Services wissen</html:submit>
                        </div>
                </c:if>

                <a href="#" id="kaartselectieAddServiceLink">Nieuwe WMS Service toevoegen</a>
                <div style="clear: both;"></div>
                <div id="kaartselectieAddService">
                    <h4>Nieuwe WMS Service toevoegen</h4>
                    <label for="groupName">Groep</label>
                    <html:text property="groupName" size="20" />
                    <label for="serviceUrl">Url</label>
                    <html:text property="serviceUrl" size="40" />

                    <%--
                    <label for="sldUrl">Sld url</label>
                    <html:text property="sldUrl" size="40" />
                    --%>

                    <div class="kaartselectieBody">
                        <html:submit property="saveWMSService" styleClass="rightButton submitbutton">Service toevoegen</html:submit>
                        </div>
                    </div>

                </div>

            </div>

            <div class="tabcontent content_kaartlagen">

                <div class="configbasic">
                    <div class="configrow">
                        <label><fmt:message key="cfg_expandAll.label"/></label>
                    <html:checkbox property="cfg_expandAll"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_expandAll">(?)</a>
                    <div id="help_cfg_expandAll" style="display: none;" title="<fmt:message key="cfg_expandAll.label"/>">
                        <fmt:message key="cfg_expandAll.uitleg"/>
                    </div>
                </div>

                <div class="configrow">
                    <label><fmt:message key="cfg_showLegendInTree.label"/></label>
                    <html:checkbox property="cfg_showLegendInTree"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_showLegendInTree">(?)</a>
                    <div id="help_cfg_showLegendInTree" style="display: none;" title="<fmt:message key="cfg_showLegendInTree.label"/>">
                        <fmt:message key="cfg_showLegendInTree.uitleg"/>
                    </div>
                </div>

                <!-- Setting for Viewer top menu -->
                <div class="configrow">
                    <label><fmt:message key="cfg_helpUrl.label"/></label>
                    <html:text property="cfg_helpUrl" size="30"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_helpUrl">(?)</a>
                    <div id="help_cfg_helpUrl" style="display: none;" title="<fmt:message key="cfg_helpUrl.label"/>">
                        <fmt:message key="cfg_helpUrl.uitleg"/>
                    </div>
                </div>

                <div class="configrow">
                    <label><fmt:message key="cfg_showGoogleMapsIcon.label"/></label>
                    <html:checkbox property="cfg_showGoogleMapsIcon"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_showGoogleMapsIcon">(?)</a>
                    <div id="help_cfg_showGoogleMapsIcon" style="display: none;" title="<fmt:message key="cfg_showGoogleMapsIcon.label"/>">
                        <fmt:message key="cfg_showGoogleMapsIcon.uitleg"/>
                    </div>
                </div>

                <div class="configrow">
                    <label><fmt:message key="cfg_showBookmarkIcon.label"/></label>
                    <html:checkbox property="cfg_showBookmarkIcon"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_showBookmarkIcon">(?)</a>
                    <div id="help_cfg_showBookmarkIcon" style="display: none;" title="<fmt:message key="cfg_showBookmarkIcon.label"/>">
                        <fmt:message key="cfg_showBookmarkIcon.uitleg"/>
                    </div>
                </div>

                <div class="configrow">
                    <label><fmt:message key="cfg_contactUrl.label"/></label>
                    <html:text property="cfg_contactUrl" size="30"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_contactUrl">(?)</a>
                    <div id="help_cfg_contactUrl" style="display: none;" title="<fmt:message key="cfg_contactUrl.label"/>">
                        <fmt:message key="cfg_contactUrl.uitleg"/>
                    </div>
                </div>

                <div class="configrow">
                    <label><fmt:message key="cfg_logoutUrl.label"/></label>
                    <html:text property="cfg_logoutUrl" size="30"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_logoutUrl">(?)</a>
                    <div id="help_cfg_logoutUrl" style="display: none;" title="<fmt:message key="cfg_logoutUrl.label"/>">
                        <fmt:message key="cfg_logoutUrl.uitleg"/>
                    </div>
                </div>

            </div>

            <div class="configadvanced">
                <div class="configrow">
                    <label><fmt:message key="cfg_useCookies.label"/></label>
                    <html:checkbox property="cfg_useCookies"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_useCookies">(?)</a>
                    <div id="help_cfg_useCookies" style="display: none;" title="<fmt:message key="cfg_useCookies.label"/>">
                        <fmt:message key="cfg_useCookies.uitleg"/>
                    </div>
                </div>

                <div class="configrow">
                    <label><fmt:message key="cfg_refreshDelay.label"/></label>
                    <html:text property="cfg_refreshDelay" size="10"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_refreshDelay">(?)</a>
                    <div id="help_cfg_refreshDelay" style="display: none;" title="<fmt:message key="cfg_refreshDelay.label"/>">
                        <fmt:message key="cfg_refreshDelay.uitleg"/>
                    </div>
                </div>

                <div class="configrow">
                    <label><fmt:message key="cfg_useInheritCheckbox.label"/></label>
                    <html:checkbox property="cfg_useInheritCheckbox"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_useInheritCheckbox">(?)</a>
                    <div id="help_cfg_useInheritCheckbox" style="display: none;" title="<fmt:message key="cfg_useInheritCheckbox.label"/>">
                        <fmt:message key="cfg_useInheritCheckbox.uitleg"/>
                    </div>
                </div>

                <div class="configrow">
                    <label><fmt:message key="cfg_layerGrouping.label"/></label>
                    <html:select property="cfg_layerGrouping">
                        <html:option value="lg_forebackground"><fmt:message key="cfg_layerGrouping.forebackground"/></html:option>
                        <html:option value="lg_layer"><fmt:message key="cfg_layerGrouping.layer"/></html:option>
                        <html:option value="lg_cluster"><fmt:message key="cfg_layerGrouping.cluster"/></html:option>
                        <html:option value="lg_all"><fmt:message key="cfg_layerGrouping.all"/></html:option>
                    </html:select>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_layerGrouping">(?)</a>
                    <div id="help_cfg_layerGrouping" style="display: none;" title="<fmt:message key="cfg_layerGrouping.label"/>">
                        <fmt:message key="cfg_layerGrouping.uitleg"/>
                    </div>
                </div>

                <div class="configrow">
                    <label><fmt:message key="cfg_treeOrder.label"/></label>
                    <html:select property="cfg_treeOrder">
                        <html:option value="volgorde"><fmt:message key="cfg_treeOrder.volgorde"/></html:option>
                        <html:option value="alphabet"><fmt:message key="cfg_treeOrder.alphabet"/></html:option>
                    </html:select>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_treeOrder">(?)</a>
                    <div id="help_cfg_treeOrder" style="display: none;" title="<fmt:message key="cfg_treeOrder.label"/>">
                        <fmt:message key="cfg_treeOrder.uitleg"/>
                    </div>
                </div>

                <div class="configrow">
                    <label><fmt:message key="cfg_minBboxZoeken.label"/></label>
                    <html:text property="cfg_minBboxZoeken" size="10"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_minBboxZoeken">(?)</a>
                    <div id="help_cfg_minBboxZoeken" style="display: none;" title="<fmt:message key="cfg_minBboxZoeken.label"/>">
                        <fmt:message key="cfg_minBboxZoeken.uitleg"/>
                    </div>
                </div>
                <div class="configrow">
                    <label><fmt:message key="cfg_maxResults.label"/></label>
                    <html:text property="cfg_maxResults" size="5"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_maxResults">(?)</a>
                    <div id="help_cfg_maxResults" style="display: none;" title="<fmt:message key="cfg_maxResults.label"/>">
                        <fmt:message key="cfg_maxResults.uitleg"/>
                    </div>
                </div>

                <div class="configrow">
                    <label><fmt:message key="cfg_defaultSearchRadius.label"/></label>
                    <html:text property="cfg_defaultSearchRadius" size="5"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_defaultSearchRadius">(?)</a>
                    <div id="help_cfg_defaultSearchRadius" style="display: none;" title="<fmt:message key="cfg_defaultSearchRadius.label"/>">
                        <fmt:message key="cfg_defaultSearchRadius.uitleg"/>
                    </div>
                </div>

                <div class="configrow">
                    <label><fmt:message key="cfg_extent.label"/></label>
                    <html:text property="cfg_extent" size="40"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_extent">(?)</a>
                    <div id="help_cfg_extent" style="display: none;" title="<fmt:message key="cfg_extent.label"/>">
                        <fmt:message key="cfg_extent.uitleg"/>
                    </div>
                </div>

                <div class="configrow">
                    <label><fmt:message key="cfg_fullextent.label"/></label>
                    <html:text property="cfg_fullextent" size="40"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_fullextent">(?)</a>
                    <div id="help_cfg_fullextent" style="display: none;" title="<fmt:message key="cfg_fullextent.label"/>">
                        <fmt:message key="cfg_fullextent.uitleg"/>
                    </div>
                </div>  

                <div class="configrow">
                    <label><fmt:message key="cfg_tilingResolutions.label"/></label>
                    <html:text property="cfg_tilingResolutions" size="80"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_tilingResolutions">(?)</a>
                    <div id="help_cfg_tilingResolutions" style="display: none;" title="<fmt:message key="cfg_tilingResolutions.label"/>">
                        <fmt:message key="cfg_tilingResolutions.uitleg"/>
                    </div>
                </div>
                <div class="configrow">
                    <label><fmt:message key="cfg_useUserWmsDropdown.label"/></label>
                    <html:checkbox property="cfg_useUserWmsDropdown"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_useUserWmsDropdown">(?)</a>
                    <div id="help_cfg_useUserWmsDropdown" style="display: none;" title="<fmt:message key="cfg_useUserWmsDropdown.label"/>">
                        <fmt:message key="cfg_useUserWmsDropdown.uitleg"/>
                    </div>
                </div>

                <div class="configrow">
                    <label><fmt:message key="cfg_datasetDownload.label"/></label>
                    <html:checkbox property="cfg_datasetDownload"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_datasetDownload">(?)</a>
                    <div id="help_cfg_datasetDownload" style="display: none;" title="<fmt:message key="cfg_datasetDownload.label"/>">
                        <fmt:message key="cfg_datasetDownload.uitleg"/>
                    </div>
                </div>

                <div class="configrow">
                    <label><fmt:message key="cfg_showServiceUrl.label"/></label>
                    <html:checkbox property="cfg_showServiceUrl"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_showServiceUrl">(?)</a>
                    <div id="help_cfg_showServiceUrl" style="display: none;" title="<fmt:message key="cfg_showServiceUrl.label"/>">
                        <fmt:message key="cfg_showServiceUrl.uitleg"/>
                    </div>
                </div>
                <div class="configrow">
                    <label><fmt:message key="cfg_edit.label"/></label>
                    <html:checkbox property="cfg_showEditTool"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_edit">(?)</a>
                    <div id="help_cfg_edit" style="display: none;" title="<fmt:message key="cfg_edit.label"/>">
                        <fmt:message key="cfg_edit.uitleg"/>
                    </div>
                </div>
            </div>

        </div>

        <div class="tabcontent content_layout">

            <div class="configbasic">
                <div class="configrow">
                    <label><fmt:message key="cfg_viewerType.label"/></label>
                    <html:select property="cfg_viewerType">
                        <html:option value="flamingo"><fmt:message key="cfg_viewerType.1"/></html:option>
                        <html:option value="openlayers"><fmt:message key="cfg_viewerType.2"/></html:option>
                    </html:select>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_viewerType">(?)</a>
                    <div id="help_cfg_viewerType" style="display: none;" title="<fmt:message key="cfg_viewerType.label"/>">
                        <fmt:message key="cfg_viewerType.uitleg"/>
                    </div>
                </div>

                <div class="configrow">
                    <label><fmt:message key="cfg_viewerTemplate.label"/></label>
                    <html:select property="cfg_viewerTemplate">
                        <html:option value="standalone"><fmt:message key="cfg_viewerTemplate.1"/></html:option>
                        <html:option value="embedded"><fmt:message key="cfg_viewerTemplate.2"/></html:option>
                    </html:select>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_viewerTemplate">(?)</a>
                    <div id="help_cfg_viewerTemplate" style="display: none;" title="<fmt:message key="cfg_viewerTemplate.label"/>">
                        <fmt:message key="cfg_viewerTemplate.uitleg"/>
                    </div>
                </div>

                <div class="configrow">
                    <label><fmt:message key="cfg_objectInfo.label"/></label>
                    <html:select property="cfg_objectInfoType">
                        <html:option value="geen"><fmt:message key="cfg_objectInfo.geen"/></html:option>
                        <html:option value="paneel"><fmt:message key="cfg_objectInfo.paneel"/></html:option>
                        <html:option value="popup"><fmt:message key="cfg_objectInfo.popup"/></html:option>
                        <html:option value="balloon"><fmt:message key="cfg_objectInfo.balloon"/></html:option>
                    </html:select>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_objectInfo">(?)</a>
                    <div id="help_cfg_objectInfo" style="display: none;" title="<fmt:message key="cfg_objectInfo.label"/>">
                        <fmt:message key="cfg_objectInfo.uitleg"/>
                    </div>
                </div>
            </div>

            <div class="configadvanced">
                <div class="configrow">
                    <label><fmt:message key="cfg_layoutAdminData.label"/></label>
                    <html:select property="cfg_layoutAdminData">
                        <html:option value="admindata1"><fmt:message key="cfg_layoutAdminData.1"/></html:option>
                        <html:option value="admindata1a"><fmt:message key="cfg_layoutAdminData.1a"/></html:option>
                        <html:option value="admindata2"><fmt:message key="cfg_layoutAdminData.2"/></html:option>
                        <html:option value="admindata3"><fmt:message key="cfg_layoutAdminData.3"/></html:option>
                        <html:option value="all_vertical_tab1"><fmt:message key="cfg_layoutAdminData.all_vertical_tab1"/></html:option>
                        <html:option value="all_vertical_tab2"><fmt:message key="cfg_layoutAdminData.all_vertical_tab2"/></html:option>
                        <html:option value="all_vertical_tab3"><fmt:message key="cfg_layoutAdminData.all_vertical_tab3"/></html:option>
                        <html:option value="all_vertical_tab4"><fmt:message key="cfg_layoutAdminData.all_vertical_tab4"/></html:option>
                        <html:option value="all_vertical_tab5"><fmt:message key="cfg_layoutAdminData.all_vertical_tab5"/></html:option>
                    </html:select>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_layoutAdminData">(?)</a>
                    <div id="help_cfg_layoutAdminData" style="display: none;" title="<fmt:message key="cfg_layoutAdminData.label"/>">
                        <fmt:message key="cfg_layoutAdminData.uitleg"/>
                    </div>
                </div>

                <div class="configrow">
                    <label><fmt:message key="cfg_defaultdataframehoogte.label"/></label>
                    <html:text property="cfg_defaultdataframehoogte" size="5"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_defaultdataframehoogte">(?)</a>
                    <div id="help_cfg_defaultdataframehoogte" style="display: none;" title="<fmt:message key="cfg_defaultdataframehoogte.label"/>">
                        <fmt:message key="cfg_defaultdataframehoogte.uitleg"/>
                    </div>
                </div>

                <div class="configrow">
                    <label><fmt:message key="cfg_popupWidth.label"/></label>
                    <html:text property="cfg_popupWidth" size="5"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_popupWidth">(?)</a>
                    <div id="help_cfg_popupWidth" style="display: none;" title="<fmt:message key="cfg_popupWidth.label"/>">
                        <fmt:message key="cfg_popupWidth.uitleg"/>
                    </div>
                </div>



                <div class="configrow">
                    <label><fmt:message key="cfg_popupHeight.label"/></label>
                    <html:text property="cfg_popupHeight" size="5"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_popupHeight">(?)</a>
                    <div id="help_cfg_popupHeight" style="display: none;" title="<fmt:message key="cfg_popupHeight.label"/>">
                        <fmt:message key="cfg_popupHeight.uitleg"/>
                    </div>
                </div>



                <div class="configrow">
                    <label><fmt:message key="cfg_popupLeft.label"/></label>
                    <html:text property="cfg_popupLeft" size="5"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_popupLeft">(?)</a>
                    <div id="help_cfg_popupLeft" style="display: none;" title="<fmt:message key="cfg_popupLeft.label"/>">
                        <fmt:message key="cfg_popupLeft.uitleg"/>
                    </div>
                </div>


                <div class="configrow">
                    <label><fmt:message key="cfg_popupTop.label"/></label>
                    <html:text property="cfg_popupTop" size="5"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_popupTop">(?)</a>
                    <div id="help_cfg_popupTop" style="display: none;" title="<fmt:message key="cfg_popupTop.label"/>">
                        <fmt:message key="cfg_popupTop.uitleg"/>
                    </div>
                </div>
            </div>

        </div>
        <div class="tabcontent content_tools">
            <div class="configbasic">

                <div class="configrow">
                    <label><fmt:message key="cfg_showRedliningTools.label"/></label>
                    <html:checkbox property="cfg_showRedliningTools"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_showRedliningTools">(?)</a>
                    <div id="help_cfg_showRedliningTools" style="display: none;" title="<fmt:message key="cfg_showRedliningTools.label"/>">
                        <fmt:message key="cfg_showRedliningTools.uitleg"/>
                    </div>
                </div>
                <div class="configrow">
                    <label><fmt:message key="cfg_showBufferTool.label"/></label>
                    <html:checkbox property="cfg_showBufferTool"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_showBufferTool">(?)</a>
                    <div id="help_cfg_showBufferTool" style="display: none;" title="<fmt:message key="cfg_showBufferTool.label"/>">
                        <fmt:message key="cfg_showBufferTool.uitleg"/>
                    </div>
                </div>
                <div class="configrow">
                    <label><fmt:message key="cfg_showSelectBulkTool.label"/></label>
                    <html:checkbox property="cfg_showSelectBulkTool"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_showSelectBulkTool">(?)</a>
                    <div id="help_cfg_showSelectBulkTool" style="display: none;" title="<fmt:message key="cfg_showSelectBulkTool.label"/>">
                        <fmt:message key="cfg_showSelectBulkTool.uitleg"/>
                    </div>
                </div>
                <div class="configrow">
                    <label><fmt:message key="cfg_showNeedleTool.label"/></label>
                    <html:checkbox property="cfg_showNeedleTool"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_showNeedleTool">(?)</a>
                    <div id="help_cfg_showNeedleTool" style="display: none;" title="<fmt:message key="cfg_showNeedleTool.label"/>">
                        <fmt:message key="cfg_showNeedleTool.uitleg"/>
                    </div>
                </div>
                <div class="configrow">
                    <label><fmt:message key="cfg_showPrintTool.label"/></label>
                    <html:checkbox property="cfg_showPrintTool"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_showPrintTool">(?)</a>
                    <div id="help_cfg_showPrintTool" style="display: none;" title="<fmt:message key="cfg_showPrintTool.label"/>">
                        <fmt:message key="cfg_showPrintTool.uitleg"/>
                    </div>
                </div>
                <div class="configrow">
                    <label><fmt:message key="cfg_showLayerSelectionTool.label"/></label>
                    <html:checkbox property="cfg_showLayerSelectionTool"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_showLayerSelectionTool">(?)</a>
                    <div id="help_cfg_showLayerSelectionTool" style="display: none;" title="<fmt:message key="cfg_showLayerSelectionTool.label"/>">
                        <fmt:message key="cfg_showLayerSelectionTool.uitleg"/>
                    </div>
                </div>
                <div class="configrow">
                    <label><fmt:message key="cfg_showGPSTool.label"/></label>
                    <html:checkbox property="cfg_showGPSTool" onchange="gpsBufferVisible(this);"/>
                    <div id="gpsbuffer" style="display:none;">
                        <fmt:message key="cfg_GPSBuffer.label"/>
                        <html:text property="cfg_GPSBuffer" size="5"/>
                        <div id="help_cfg_GPSBuffer" style="display: none;" title="<fmt:message key="cfg_GPSBuffer.label"/>">
                            <fmt:message key="cfg_GPSBuffer.uitleg"/>
                        </div>
                    </div>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_showGPSTool">(?)</a>
                    <div id="help_cfg_showGPSTool" style="display: none;" title="<fmt:message key="cfg_showGPSTool.label"/>">
                        <fmt:message key="cfg_showGPSTool.uitleg"/>
                    </div>
                </div>                
            </div>
            <div class="configadvanced">
                <div class="configrow">
                    <label><fmt:message key="cfg_tolerance.label"/></label>
                    <html:text property="cfg_tolerance" size="5"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_tolerance">(?)</a>
                    <div id="help_cfg_tolerance" style="display: none;" title="<fmt:message key="cfg_tolerance.label"/>">
                        <fmt:message key="cfg_tolerance.uitleg"/>
                    </div>
                </div>
            </div>

        </div>   

        <div class="tabcontent content_tabbladen">
            <p>
                U kunt hier tot maximaal 10 modules selecteren die worden
                getoond. Deze modules worden op volgorde getoond aan de
                linker- of rechterkant van de viewer in tabbladen.

                Voor sommige modules zijn extra instellingen beschikbaar
                in de kleinere tabs.
            </p>

            <p>
                <a href="#" onclick="resetModuleElements();">Modules opnieuw instellen</a>
            </p>

            <div class="configbasic">
                <p><b>Linkerkant</b></p>

                <!-- config voor modules in linker tab -->
                <div class="configrow">
                    <label>Module 1</label>
                    <html:select styleId="cfg_tab1_left" property="cfg_tab1_left" styleClass="tabblad_select" onchange="checkModuleAvailable(this);">
                        <c:forEach items="${tabLabels}" var="item" varStatus="status">
                            <html:option value="${tabValues[status.count-1]}">${item}</html:option>
                        </c:forEach>
                    </html:select>
                </div>
                <div class="configrow">
                    <label>Module 2</label>
                    <html:select styleId="cfg_tab2_left" property="cfg_tab2_left" styleClass="tabblad_select" onchange="checkModuleAvailable(this);">
                        <c:forEach items="${tabLabels}" var="item" varStatus="status">
                            <html:option value="${tabValues[status.count-1]}">${item}</html:option>
                        </c:forEach>
                    </html:select>
                </div>
                <div class="configrow">
                    <label>Module 3</label>
                    <html:select styleId="cfg_tab3_left" property="cfg_tab3_left" styleClass="tabblad_select" onchange="checkModuleAvailable(this);">
                        <c:forEach items="${tabLabels}" var="item" varStatus="status">
                            <html:option value="${tabValues[status.count-1]}">${item}</html:option>
                        </c:forEach>
                    </html:select>
                </div>
                <div class="configrow">
                    <label>Module 4</label>
                    <html:select styleId="cfg_tab4_left" property="cfg_tab4_left" styleClass="tabblad_select" onchange="checkModuleAvailable(this);">
                        <c:forEach items="${tabLabels}" var="item" varStatus="status">
                            <html:option value="${tabValues[status.count-1]}">${item}</html:option>
                        </c:forEach>
                    </html:select>
                </div>
                <div class="configrow">
                    <label>Module 5</label>
                    <html:select styleId="cfg_tab5_left" property="cfg_tab5_left" styleClass="tabblad_select" onchange="checkModuleAvailable(this);">
                        <c:forEach items="${tabLabels}" var="item" varStatus="status">
                            <html:option value="${tabValues[status.count-1]}">${item}</html:option>
                        </c:forEach>
                    </html:select>
                </div>

                <p><b>Rechterkant</b></p>           

                <!-- config voor modules in rechter tab -->
                <div class="configrow">
                    <label>Module 6</label>
                    <html:select styleId="cfg_tab1" property="cfg_tab1" styleClass="tabblad_select" onchange="checkModuleAvailable(this);">
                        <c:forEach items="${tabLabels}" var="item" varStatus="status">
                            <html:option value="${tabValues[status.count-1]}">${item}</html:option>
                        </c:forEach>
                    </html:select>
                </div>
                <div class="configrow">
                    <label>Module 7</label>
                    <html:select styleId="cfg_tab2" property="cfg_tab2" styleClass="tabblad_select" onchange="checkModuleAvailable(this);">
                        <c:forEach items="${tabLabels}" var="item" varStatus="status">
                            <html:option value="${tabValues[status.count-1]}">${item}</html:option>
                        </c:forEach>
                    </html:select>
                </div>
                <div class="configrow">
                    <label>Module 8</label>
                    <html:select styleId="cfg_tab3" property="cfg_tab3" styleClass="tabblad_select" onchange="checkModuleAvailable(this);">
                        <c:forEach items="${tabLabels}" var="item" varStatus="status">
                            <html:option value="${tabValues[status.count-1]}">${item}</html:option>
                        </c:forEach>
                    </html:select>
                </div>
                <div class="configrow">
                    <label>Module 9</label>
                    <html:select styleId="cfg_tab4" property="cfg_tab4" styleClass="tabblad_select" onchange="checkModuleAvailable(this);">
                        <c:forEach items="${tabLabels}" var="item" varStatus="status">
                            <html:option value="${tabValues[status.count-1]}">${item}</html:option>
                        </c:forEach>
                    </html:select>
                </div>
                <div class="configrow">
                    <label>Module 10</label>
                    <html:select styleId="cfg_tab5" property="cfg_tab5" styleClass="tabblad_select" onchange="checkModuleAvailable(this);">
                        <c:forEach items="${tabLabels}" var="item" varStatus="status">
                            <html:option value="${tabValues[status.count-1]}">${item}</html:option>
                        </c:forEach>
                    </html:select>
                </div>
            </div>

            <div class="configadvanced">
                <div class="configrow">
                    <label><fmt:message key="cfg_useMouseOverTabs.label"/></label>
                    <html:checkbox property="cfg_useMouseOverTabs"/>
                    <a class="helpLink "href="#" id="helpLink_help_cfg_useMouseOverTabs">(?)</a>
                    <div id="help_cfg_useMouseOverTabs" style="display: none;" title="<fmt:message key="cfg_useMouseOverTabs.label"/>">
                        <fmt:message key="cfg_useMouseOverTabs.uitleg"/>
                    </div>
                </div>

                <div class="configrow">
                    <label><fmt:message key="cfg_tabWidth.label"/></label>
                    <html:text property="cfg_tabWidth" size="5"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_tabWidth">(?)</a>
                    <div id="help_cfg_tabWidth" style="display: none;" title="<fmt:message key="cfg_tabWidth.label"/>">
                        <fmt:message key="cfg_tabWidth.uitleg"/>
                    </div>
                </div>

                <div class="configrow">
                    <label><fmt:message key="cfg_tabWidthLeft.label"/></label>
                    <html:text property="cfg_tabWidthLeft" size="5"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_tabWidthLeft">(?)</a>
                    <div id="help_cfg_tabWidthLeft" style="display: none;" title="<fmt:message key="cfg_tabWidthLeft.label"/>">
                        <fmt:message key="cfg_tabWidthLeft.uitleg"/>
                    </div>
                </div>

                <div class="configrow">
                    <label><fmt:message key="cfg_activeTab.label"/></label>
                    <html:select property="cfg_activeTab" styleClass="tabblad_select">
                        <c:forEach items="${tabLabels}" var="item" varStatus="status">
                            <html:option value="${tabValues[status.count-1]}">${item}</html:option>
                        </c:forEach>
                    </html:select>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_activeTab">(?)</a>
                    <div id="help_cfg_activeTab" style="display: none;" title="<fmt:message key="cfg_activeTab.label"/>">
                        <fmt:message key="cfg_activeTab.uitleg"/>
                    </div>
                </div>

                <!-- Transparantie slider tabblad -->
                <div class="configrow">
                    <label><fmt:message key="cfg_transSliderTab.label"/></label>
                    <html:select property="cfg_transSliderTab" styleClass="tabblad_select">
                        <c:forEach items="${tabSliderLabels}" var="item" varStatus="status">
                            <html:option value="${tabSliderValues[status.count-1]}">${item}</html:option>
                        </c:forEach>
                    </html:select>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_transSliderTab">(?)</a>
                    <div id="help_cfg_transSliderTab" style="display: none;" title="<fmt:message key="cfg_transSliderTab.label"/>">
                        <fmt:message key="cfg_transSliderTab.uitleg"/>
                    </div>
                </div>

            </div>
        </div>

        <div class="tabcontent content_zoeken">

            <div class="configbasic">

                <div class="configrow" style="margin-bottom: 15px;">
                    <fmt:message key="tab-zoeken-content.header"/>
                </div>
                <div class="configrow">
                    <label><fmt:message key="cfg_zoekenid1.label"/></label>

                    <html:select property="cfg_zoekenid1">
                        <html:option value="leeg">-Kies een zoekingang-</html:option>
                        <c:forEach items="${zoekConfigs}" var="item">
                            <html:option value="${item.id}">${item.naam}</html:option>
                        </c:forEach>
                    </html:select>
                </div>
                <div class="configrow">
                    <label><fmt:message key="cfg_zoekenid2.label"/></label>

                    <html:select property="cfg_zoekenid2">
                        <html:option value="leeg">-Kies een zoekingang-</html:option>
                        <c:forEach items="${zoekConfigs}" var="item">
                            <html:option value="${item.id}">${item.naam}</html:option>
                        </c:forEach>
                    </html:select>
                </div>
                <div class="configrow">
                    <label><fmt:message key="cfg_zoekenid3.label"/></label>

                    <html:select property="cfg_zoekenid3">
                        <html:option value="leeg">-Kies een zoekingang-</html:option>
                        <c:forEach items="${zoekConfigs}" var="item">
                            <html:option value="${item.id}">${item.naam}</html:option>
                        </c:forEach>
                    </html:select>
                </div>
                <div class="configrow">
                    <label><fmt:message key="cfg_zoekenid4.label"/></label>

                    <html:select property="cfg_zoekenid4">
                        <html:option value="leeg">-Kies een zoekingang-</html:option>
                        <c:forEach items="${zoekConfigs}" var="item">
                            <html:option value="${item.id}">${item.naam}</html:option>
                        </c:forEach>
                    </html:select>
                </div>                    
                <div class="configrow">
                    <label><fmt:message key="cfg_zoekenid5.label"/></label>

                    <html:select property="cfg_zoekenid5">
                        <html:option value="leeg">-Kies een zoekingang-</html:option>
                        <c:forEach items="${zoekConfigs}" var="item">
                            <html:option value="${item.id}">${item.naam}</html:option>
                        </c:forEach>
                    </html:select>
                </div>                    
                <div class="configrow">
                    <label><fmt:message key="cfg_zoekenid6.label"/></label>

                    <html:select property="cfg_zoekenid6">
                        <html:option value="leeg">-Kies een zoekingang-</html:option>
                        <c:forEach items="${zoekConfigs}" var="item">
                            <html:option value="${item.id}">${item.naam}</html:option>
                        </c:forEach>
                    </html:select>
                </div>                    
                <div class="configrow">
                    <label><fmt:message key="cfg_zoekenid7.label"/></label>

                    <html:select property="cfg_zoekenid7">
                        <html:option value="leeg">-Kies een zoekingang-</html:option>
                        <c:forEach items="${zoekConfigs}" var="item">
                            <html:option value="${item.id}">${item.naam}</html:option>
                        </c:forEach>
                    </html:select>
                </div>                    
                <div class="configrow">
                    <label><fmt:message key="cfg_zoekenid8.label"/></label>

                    <html:select property="cfg_zoekenid8">
                        <html:option value="leeg">-Kies een zoekingang-</html:option>
                        <c:forEach items="${zoekConfigs}" var="item">
                            <html:option value="${item.id}">${item.naam}</html:option>
                        </c:forEach>
                    </html:select>
                </div>                    
                <div class="configrow">
                    <label><fmt:message key="cfg_zoekenid9.label"/></label>

                    <html:select property="cfg_zoekenid9">
                        <html:option value="leeg">-Kies een zoekingang-</html:option>
                        <c:forEach items="${zoekConfigs}" var="item">
                            <html:option value="${item.id}">${item.naam}</html:option>
                        </c:forEach>
                    </html:select>
                </div>                   
                <div class="configrow">
                    <label><fmt:message key="cfg_zoekenid10.label"/></label>

                    <html:select property="cfg_zoekenid10">
                        <html:option value="leeg">-Kies een zoekingang-</html:option>
                        <c:forEach items="${zoekConfigs}" var="item">
                            <html:option value="${item.id}">${item.naam}</html:option>
                        </c:forEach>
                    </html:select>
                </div>

            </div>

            <div class="configadvanced">
                <div class="configrow">
                    <label><fmt:message key="cfg_zoeken_autoidentify.label"/></label>
                    <html:checkbox property="cfg_zoeken_autoidentify"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_zoeken_autoidentify">(?)</a>
                    <div id="help_cfg_zoeken_autoidentify" style="display: none;" title="<fmt:message key="cfg_zoeken_autoidentify.label"/>">
                        <fmt:message key="cfg_zoeken_autoidentify.uitleg"/>
                    </div>
                </div>
            </div>
        </div> <!-- Einde zoeken tabje -->

        <div class="tabcontent content_planselectie">

            <div class="configbasic">
                <div class="configrow" style="margin-bottom: 15px;">
                    <fmt:message key="tab-planselectie-content.header"/>
                </div>

                <div class="configrow">
                    <label><fmt:message key="cfg_planselectieid1.label"/></label>
                    <html:select property="cfg_planselectieid1">
                        <html:option value="leeg">-Kies een zoekingang-</html:option>
                        <c:forEach items="${zoekConfigs}" var="item">
                            <html:option value="${item.id}">${item.naam}</html:option>
                        </c:forEach>
                    </html:select>
                </div>
                <div class="configrow">  
                    <label><fmt:message key="cfg_planselectieid2.label"/></label>
                    <html:select property="cfg_planselectieid2">
                        <html:option value="leeg">-Kies een zoekingang-</html:option>
                        <c:forEach items="${zoekConfigs}" var="item">
                            <html:option value="${item.id}">${item.naam}</html:option>
                        </c:forEach>
                    </html:select>
                </div>
            </div>
        </div>        

        <div class="tabcontent content_meldingen">

            <div class="configbasic">

                <div class="configrow">
                    <label><fmt:message key="cfg_meldingwelkomtekst.label"/></label>
                    <html:textarea property="cfg_meldingwelkomtekst" cols="40" rows="5" />
                    <a class="helpLink" href="#" id="helpLink_help_cfg_meldingwelkomtekst">(?)</a>
                    <div id="help_cfg_meldingwelkomtekst" style="display: none;" title="<fmt:message key="cfg_meldingwelkomtekst.label"/>">
                        <fmt:message key="cfg_meldingwelkomtekst.uitleg"/>
                    </div>
                </div>

                <div class="configrow">
                    <label><fmt:message key="cfg_meldingtype.label"/></label>
                    <html:text property="cfg_meldingtype" size="50" />
                    <a class="helpLink" href="#" id="helpLink_help_cfg_meldingtype">(?)</a>
                    <div id="help_cfg_meldingtype" style="display: none;" title="<fmt:message key="cfg_meldingtype.label"/>">
                        <fmt:message key="cfg_meldingtype.uitleg"/>
                    </div>
                </div>

                <div class="configrow">
                    <label><fmt:message key="cfg_meldinggegevensbron.label"/></label>
                    <html:select property="cfg_meldinggegevensbron">
                        <html:option value="0">-Kies een gegevensbron-</html:option>
                        <c:forEach items="${meldingGegevensbronnen}" var="item">
                            <html:option value="${item.id}">${item.naam}</html:option>
                        </c:forEach>
                    </html:select>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_meldinggegevensbron">(?)</a>
                    <div id="help_cfg_meldinggegevensbron" style="display: none;" title="<fmt:message key="cfg_meldinggegevensbron.label"/>">
                        <fmt:message key="cfg_meldinggegevensbron.uitleg"/>
                    </div>
                </div>
            </div>

            <div class="configadvanced">

                <div class="configrow">
                    <label><fmt:message key="cfg_meldingprefix.label"/></label>
                    <html:text property="cfg_meldingprefix" size="50" />
                    <a class="helpLink" href="#" id="helpLink_help_cfg_meldingprefix">(?)</a>
                    <div id="help_cfg_meldingprefix" style="display: none;" title="<fmt:message key="cfg_meldingprefix.label"/>">
                        <fmt:message key="cfg_meldingprefix.uitleg"/>
                    </div>
                </div>

                <!--
                <div class="configrow">
                    <label><fmt:message key="cfg_meldingstatus.label"/></label>
                <html:text property="cfg_meldingstatus" size="50" />
                <a class="helpLink" href="#" id="helpLink_help_cfg_meldingstatus">(?)</a>
                <div id="help_cfg_meldingstatus" style="display: none;" title="<fmt:message key="cfg_meldingstatus.label"/>">
                <fmt:message key="cfg_meldingstatus.uitleg"/>
            </div>
        </div>
                -->

                <div class="configrow">
                    <label><fmt:message key="cfg_meldingemailmelder.label"/></label>
                    <html:checkbox property="cfg_meldingemailmelder"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_meldingemailmelder">(?)</a>
                    <div id="help_cfg_meldingemailmelder" style="display: none;" title="<fmt:message key="cfg_meldingemailmelder.label"/>">
                        <fmt:message key="cfg_meldingemailmelder.uitleg"/>
                    </div>
                </div>

                <div class="configrow">
                    <label><fmt:message key="cfg_meldingemailbehandelaar.label"/></label>
                    <html:checkbox property="cfg_meldingemailbehandelaar"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_meldingemailbehandelaar">(?)</a>
                    <div id="help_cfg_meldingemailbehandelaar" style="display: none;" title="<fmt:message key="cfg_meldingemailbehandelaar.label"/>">
                        <fmt:message key="cfg_meldingemailbehandelaar.uitleg"/>
                    </div>
                </div>

                <!--
                <div class="configrow">
                    <label><fmt:message key="cfg_meldinglayoutemailmelder.label"/></label>
                <html:text property="cfg_meldinglayoutemailmelder" size="50" />
                <a class="helpLink" href="#" id="helpLink_help_cfg_meldinglayoutemailmelder">(?)</a>
                <div id="help_cfg_meldinglayoutemailmelder" style="display: none;" title="<fmt:message key="cfg_meldinglayoutemailmelder.label"/>">
                <fmt:message key="cfg_meldinglayoutemailmelder.uitleg"/>
            </div>
        </div>
                -->

                <div class="configrow">
                    <label><fmt:message key="cfg_meldingnaam.label"/></label>
                    <html:text property="cfg_meldingnaam" size="50"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_meldingnaam">(?)</a>
                    <div id="help_cfg_meldingnaam" style="display: none;" title="<fmt:message key="cfg_meldingnaam.label"/>">
                        <fmt:message key="cfg_meldingnaam.uitleg"/>
                    </div>
                </div>

                <div class="configrow">
                    <label><fmt:message key="cfg_meldingemail.label"/></label>
                    <html:text property="cfg_meldingemail" size="50"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_meldingemail">(?)</a>
                    <div id="help_cfg_meldingemail" style="display: none;" title="<fmt:message key="cfg_meldingemail.label"/>">
                        <fmt:message key="cfg_meldingemail.uitleg"/>
                    </div>
                </div>

                <!--
                <div class="configrow">
                    <label><fmt:message key="cfg_meldinglayoutemailbehandelaar.label"/></label>
                <html:text property="cfg_meldinglayoutemailbehandelaar" size="50"/>
                <a class="helpLink" href="#" id="helpLink_help_cfg_meldinglayoutemailbehandelaar">(?)</a>
                <div id="help_cfg_meldinglayoutemailbehandelaar" style="display: none;" title="<fmt:message key="cfg_meldinglayoutemailbehandelaar.label"/>">
                <fmt:message key="cfg_meldinglayoutemailbehandelaar.uitleg"/>
            </div>
        </div>
                -->

                <!--
                <div class="configrow">
                    <label><fmt:message key="cfg_meldingtekentoolicoon.label"/></label>
                <html:text property="cfg_meldingtekentoolicoon" size="50"/>
                <a class="helpLink" href="#" id="helpLink_help_cfg_meldingtekentoolicoon">(?)</a>
                <div id="help_cfg_meldingtekentoolicoon" style="display: none;" title="<fmt:message key="cfg_meldingtekentoolicoon.label"/>">
                <fmt:message key="cfg_meldingtekentoolicoon.uitleg"/>
            </div>
        </div>
                -->

                <div class="configrow">
                    <label><fmt:message key="cfg_smtpHost.label"/></label>
                    <html:text property="cfg_smtpHost" size="50"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_smtpHost">(?)</a>
                    <div id="help_cfg_smtpHost" style="display: none;" title="<fmt:message key="cfg_smtpHost.label"/>">
                        <fmt:message key="cfg_smtpHost.uitleg"/>
                    </div>
                </div>

                <div class="configrow">
                    <label><fmt:message key="cfg_fromMailAddress.label"/></label>
                    <html:text property="cfg_fromMailAddress" size="50"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_fromMailAddress">(?)</a>
                    <div id="help_cfg_fromMailAddress" style="display: none;" title="<fmt:message key="cfg_fromMailAddress.label"/>">
                        <fmt:message key="cfg_fromMailAddress.uitleg"/>
                    </div>
                </div>

                <div class="configrow">
                    <label><fmt:message key="cfg_mailSubject.label"/></label>
                    <html:text property="cfg_mailSubject" size="50"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_mailSubject">(?)</a>
                    <div id="help_cfg_mailSubject" style="display: none;" title="<fmt:message key="cfg_mailSubject.label"/>">
                        <fmt:message key="cfg_mailSubject.uitleg"/>
                    </div>
                </div>

                <html:hidden property="cfg_meldingobjectsoort" value="Point"/>
            </div>

        </div>

        <div class="tabcontent content_redlining">
            <div class="configbasic">
                <div class="configrow">
                    <label><fmt:message key="cfg_redliningkaartlaagid.label"/></label>

                    <html:select property="cfg_redliningkaartlaagid">
                        <html:option value="0">-Kies een kaartlaag-</html:option>
                        <c:forEach items="${redliningKaartlagen}" var="item">
                            <html:option value="${item.id}">${item.naam}</html:option>
                        </c:forEach>
                    </html:select>

                </div>

                <div class="configrow">
                    <label><fmt:message key="cfg_meldinggegevensbron.label"/></label>

                    <html:select property="cfg_redlininggegevensbron">
                        <html:option value="0">-Kies een gegevensbron-</html:option>
                        <c:forEach items="${meldingGegevensbronnen}" var="item">
                            <html:option value="${item.id}">${item.naam}</html:option>
                        </c:forEach>
                    </html:select>

                </div>
            </div>
            <div class="configadvanced"></div>
        </div>

        <div class="tabcontent content_layerinfo">

            <div class="configbasic">
                <div class="configrow" style="margin-bottom: 15px;">
                    <fmt:message key="tab-layerinfo-content.header"/>
                </div>

                <!-- new setting for info tab on left side of viewer -->
                <div class="configrow">
                    <label><fmt:message key="cfg_showInfoTab.label"/></label>
                    <html:select property="cfg_showInfoTab">
                        <html:option value="off">Niet tonen</html:option>
                        <html:option value="click">Na klikken op info icoon</html:option>
                        <html:option value="auto">Na aanvinken kaartlaag</html:option>
                    </html:select>
                    <a class="helpLink "href="#" id="helpLink_help_cfg_showInfoTab">(?)</a>
                    <div id="help_cfg_showInfoTab" style="display: none;" title="<fmt:message key="cfg_showInfoTab.label"/>">
                        <fmt:message key="cfg_showInfoTab.uitleg"/>
                    </div>
                </div>
            </div>
            <div class="configadvanced"></div>
        </div>

        <div class="tabcontent content_tekenen">
            <div class="configbasic">
                <div class="configrow">
                    <label><fmt:message key="cfg_tekenTitel.label"/></label>
                    <html:text property="cfg_tekenTitel" size="50"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_tekenTitel">(?)</a>
                    <div id="help_cfg_tekenTitel" style="display: none;" title="<fmt:message key="cfg_tekenTitel.label"/>">
                        <fmt:message key="cfg_tekenTitel.uitleg"/>
                    </div>
                </div>
                <div class="configrow">
                    <label><fmt:message key="cfg_tekenTekstBoven.label"/></label>
                    <html:text property="cfg_tekenTekstBoven" size="50"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_tekenTekstBoven">(?)</a>
                    <div id="help_cfg_tekenTekstBoven" style="display: none;" title="<fmt:message key="cfg_tekenTekstBoven.label"/>">
                        <fmt:message key="cfg_tekenTekstBoven.uitleg"/>
                    </div>
                </div>
                <div class="configrow">
                    <label><fmt:message key="cfg_tekenPlaatje.label"/></label>
                    <html:text property="cfg_tekenPlaatje" size="50"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_tekenPlaatje">(?)</a>
                    <div id="help_cfg_tekenPlaatje" style="display: none;" title="<fmt:message key="cfg_tekenPlaatjebel"/>">
                        <fmt:message key="cfg_tekenPlaatje.uitleg"/>
                    </div>
                </div>
                <div class="configrow">
                    <label><fmt:message key="cfg_tekenTekstOnder.label"/></label>
                    <html:text property="cfg_tekenTekstOnder" size="50"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_tekenTekstOnder">(?)</a>
                    <div id="help_cfg_tekenTekstOnder" style="display: none;" title="<fmt:message key="cfg_tekenTekstOnder.label"/>">
                        <fmt:message key="cfg_tekenTekstOnder.uitleg"/>
                    </div>
                </div>
                <div class="configrow">
                    <label><fmt:message key="cfg_tekenGegevensbron.label"/></label>

                    <html:select property="cfg_tekenGegevensbron">
                        <html:option value="0">-Kies een gegevensbron-</html:option>
                        <c:forEach items="${tekenGegevensbronnen}" var="item">
                            <html:option value="${item.id}">${item.naam}</html:option>
                        </c:forEach>
                    </html:select>

                </div>
            </div>

            <div class="configadvanced">

                <div class="configrow">
                    <label><fmt:message key="cfg_tekenKaartlaagId.label"/></label>

                    <html:select property="cfg_tekenKaartlaagId">
                        <html:option value="0">-Kies een kaartlaag-</html:option>
                        <c:forEach items="${tekenKaartlagen}" var="item">
                            <html:option value="${item.id}">${item.naam}</html:option>
                        </c:forEach>
                    </html:select>

                    <a class="helpLink" href="#" id="helpLink_help_cfg_tekenKaartlaagId">(?)</a>
                    <div id="help_cfg_tekenKaartlaagId" style="display: none;" title="<fmt:message key="cfg_tekenKaartlaagId.label"/>">
                        <fmt:message key="cfg_tekenKaartlaagId.uitleg"/>
                    </div>
                </div>

                <div class="configrow">
                    <label><fmt:message key="cfg_tekenFilterColumn.label"/></label>
                    <html:text property="cfg_tekenFilterColumn" size="30"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_tekenFilterColumn">(?)</a>
                    <div id="help_cfg_tekenFilterColumn" style="display: none;" title="<fmt:message key="cfg_tekenFilterColumn.label"/>">
                        <fmt:message key="cfg_tekenFilterColumn.uitleg"/>
                    </div>
                </div>

                <div class="configrow">
                    <label><fmt:message key="cfg_tekenFilterSld.label"/></label>
                    <html:textarea property="cfg_tekenFilterSld" cols="60" rows="12" />
                    <a class="helpLink" href="#" id="helpLink_help_cfg_tekenFilterSld">(?)</a>
                    <div id="help_cfg_tekenFilterSld" style="display: none;" title="<fmt:message key="cfg_tekenFilterSld.label"/>">
                        <fmt:message key="cfg_tekenFilterSld.uitleg"/>
                    </div>
                </div>

            </div> <!-- einde config advanced teken module -->

        </div>
        <div class="tabcontent content_bag">
            <div class="configbasic">
                <div class="configrow">
                    <label><fmt:message key="cfg_bagkaartlaagid.label"/></label>
                    <html:select property="cfg_bagkaartlaagid">
                        <html:option value="0">-Kies een gegevensbron-</html:option>
                        <c:forEach items="${redliningKaartlagen}" var="item">
                            <html:option value="${item.id}">${item.naam}</html:option>
                        </c:forEach>
                    </html:select>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_bagkaartlaagid">(?)</a>
                    <div id="help_cfg_bagkaartlaagid" style="display: none;" title="<fmt:message key="cfg_bagkaartlaagid.label"/>">
                        <fmt:message key="cfg_bagkaartlaagid.uitleg"/>
                    </div>
                </div>
                <div class="configrow">
                    <label><fmt:message key="cfg_bagBouwjaarAttr.label"/></label>
                    <html:text property="cfg_bagBouwjaarAttr" size="30" />
                    <a class="helpLink" href="#" id="helpLink_help_cfg_bagBouwjaarAttr">(?)</a>
                    <div id="help_cfg_bagBouwjaarAttr" style="display: none;" title="<fmt:message key="cfg_bagBouwjaarAttr.label"/>">
                        <fmt:message key="cfg_bagBouwjaarAttr.uitleg"/>
                    </div>
                </div>
                <div class="configrow">
                    <label><fmt:message key="cfg_bagOppAttr.label"/></label>
                    <html:text property="cfg_bagOppAttr" size="30" />
                    <a class="helpLink" href="#" id="helpLink_help_cfg_bagOppAttr">(?)</a>
                    <div id="help_cfg_bagOppAttr" style="display: none;" title="<fmt:message key="cfg_bagOppAttr.label"/>">
                        <fmt:message key="cfg_bagOppAttr.uitleg"/>
                    </div>
                </div>
                <div class="configrow">
                    <label><fmt:message key="cfg_bagGebruiksfunctieAttr.label"/></label>
                    <html:text property="cfg_bagGebruiksfunctieAttr" size="30" />
                    <a class="helpLink" href="#" id="helpLink_help_cfg_bagGebruiksfunctieAttr">(?)</a>
                    <div id="help_cfg_bagGebruiksfunctieAttr" style="display: none;" title="<fmt:message key="cfg_bagGebruiksfunctieAttr.label"/>">
                        <fmt:message key="cfg_bagGebruiksfunctieAttr.uitleg"/>
                    </div>
                </div>
                <div class="configrow">
                    <label><fmt:message key="cfg_bagGeomAttr.label"/></label>
                    <html:text property="cfg_bagGeomAttr" size="30" />
                    <a class="helpLink" href="#" id="helpLink_help_cfg_bagGeomAttr">(?)</a>
                    <div id="help_cfg_bagGeomAttr" style="display: none;" title="<fmt:message key="cfg_bagGeomAttr.label"/>">
                        <fmt:message key="cfg_bagGeomAttr.uitleg"/>
                    </div>
                </div>
                <div class="configrow">
                    <label><fmt:message key="cfg_bagmaxbouwjaar.label"/></label>
                    <html:text property="cfg_bagmaxbouwjaar" size="10" />
                    <a class="helpLink" href="#" id="helpLink_help_cfg_bagmaxbouwjaar">(?)</a>
                    <div id="help_cfg_bagmaxbouwjaar" style="display: none;" title="<fmt:message key="cfg_bagmaxbouwjaar.label"/>">
                        <fmt:message key="cfg_bagmaxbouwjaar.uitleg"/>
                    </div>
                </div>
                <div class="configrow">
                    <label><fmt:message key="cfg_bagminbouwjaar.label"/></label>
                    <html:text property="cfg_bagminbouwjaar" size="10" />
                    <a class="helpLink" href="#" id="helpLink_help_cfg_bagminbouwjaar">(?)</a>
                    <div id="help_cfg_bagminbouwjaar" style="display: none;" title="<fmt:message key="cfg_bagminbouwjaar.label"/>">
                        <fmt:message key="cfg_bagminbouwjaar.uitleg"/>
                    </div>
                </div>
                <div class="configrow">
                    <label><fmt:message key="cfg_bagmaxopp.label"/></label>
                    <html:text property="cfg_bagmaxopp" size="10" />
                    <a class="helpLink" href="#" id="helpLink_help_cfg_bagmaxopp">(?)</a>
                    <div id="help_cfg_bagmaxopp" style="display: none;" title="<fmt:message key="cfg_bagmaxopp.label"/>">
                        <fmt:message key="cfg_bagmaxopp.uitleg"/>
                    </div>
                </div>
                <div class="configrow">
                    <label><fmt:message key="cfg_bagminopp.label"/></label>
                    <html:text property="cfg_bagminopp" size="10" />
                    <a class="helpLink" href="#" id="helpLink_help_cfg_bagminopp">(?)</a>
                    <div id="help_cfg_bagminopp" style="display: none;" title="<fmt:message key="cfg_bagminopp.label"/>">
                        <fmt:message key="cfg_bagminopp.uitleg"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="clearBoth"></div>
</html:form>

<script type="text/javascript">
    function treeZebra() {
        var treecounter = 0;
        var zebracounter = 0;
        $j(".kaartselectie").each(function() {
            if (treecounter <= 1)
                zebracounter = 0;
            $j(".treeview_row", this).each(function() {
                // check if visible
                if ($j(this).parent().parent().parent().parent().is(":visible")) {
                    $j(this).removeClass("treeview_odd_row");
                    if (zebracounter % 2 == 0) {
                        $j(this).addClass("treeview_odd_row");
                    }
                    zebracounter++;
                }
            });
            treecounter++;
        });
    }

    $j(function() {
        $j("#kaartselectieAddServiceLink").click(function() {
            $j("#kaartselectieAddService").show();
            $j(this).hide();
            return false;
        });
        $j('.kaartselectieBody').click(function() {
            closeSldContainers();
        });
        $j('.helpbutton').hover(function() {
            $j(this).parent().parent().find('.help').show();
        }, function() {
            $j(this).parent().parent().find('.help').hide();
        });
        $j('.help').hover(function() {
            $j(this).show();
        }, function() {
            $j(this).hide();
        });

        treeZebra();
    });
</script>

<script type="text/javascript" src="<html:rewrite page="/scripts/configkeeper.js"/>"></script>