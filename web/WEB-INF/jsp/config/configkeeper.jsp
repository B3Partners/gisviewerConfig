<%@include file="/WEB-INF/jsp/taglibs.jsp" %>
<%@ page isELIgnored="false"%>

<script type="text/javascript" src="<html:rewrite page="/scripts/config-tab.js"/>"></script>

<div class="infobalk">
    <div class="infobalk_description"><fmt:message key="configkeeper.infobalk"/></div>
    <div class="infobalk_actions"><tiles:insert name="loginblock"/></div>
</div>

<div class="berichtenbalk" style="margin-top: 5px;">
    <tiles:insert definition="actionMessages"/>
</div>

<span class="rolnaamHeader">Rolinstellingen voor  ${header_Rolnaam}</span>
    
<html:form action="/configKeeper">
    <html:hidden property="action" />
    <html:hidden property="alt_action" />
    <html:hidden property="rolnaam" />

    <div class="fieldset_block">
        <fieldset class="fieldset1">
        <legend class="fieldLegend">Kaartlagen</legend>

        <div class="content_body">
        <table>
        <tr>
            <td>
                <fmt:message key="cfg_useCookies.label"/>
                <a href="#" onclick="return showHelpDialog('help_cfg_useCookies');">(?)</a>
                <div id="help_cfg_useCookies" style="display: none;" title="<fmt:message key="cfg_useCookies.label"/>">
                    <p><fmt:message key="cfg_useCookies.uitleg"/></p>
                </div>
            </td>
            <td><html:checkbox property="cfg_useCookies"/></td>
        </tr>
        <tr>
            <td>
                <fmt:message key="cfg_expandAll.label"/>
                <a href="#" onclick="return showHelpDialog('help_cfg_expandAll');">(?)</a>
                <div id="help_cfg_expandAll" style="display: none;" title="<fmt:message key="cfg_expandAll.label"/>">
                    <p><fmt:message key="cfg_expandAll.uitleg"/></p>
                </div>
            </td>
            <td><html:checkbox property="cfg_expandAll"/></td>
        </tr>
        <tr>
            <td>
                <fmt:message key="cfg_refreshDelay.label"/>
                <a href="#" onclick="return showHelpDialog('help_cfg_refreshDelay');">(?)</a>
                <div id="help_cfg_refreshDelay" style="display: none;" title="<fmt:message key="cfg_refreshDelay.label"/>">
                    <p><fmt:message key="cfg_refreshDelay.uitleg"/></p>
                </div>
            </td>
            <td><html:text property="cfg_refreshDelay" size="10"/></td>
        </tr>

        <tr>
            <td>
                <fmt:message key="cfg_useInheritCheckbox.label"/>
                <a href="#" onclick="return showHelpDialog('help_cfg_useInheritCheckbox');">(?)</a>
                <div id="help_cfg_useInheritCheckbox" style="display: none;" title="<fmt:message key="cfg_useInheritCheckbox.label"/>">
                    <p><fmt:message key="cfg_useInheritCheckbox.uitleg"/></p>
                </div>
            </td>
            <td><html:checkbox property="cfg_useInheritCheckbox"/></td>
        </tr>

        <tr>
            <td>
                <fmt:message key="cfg_showLegendInTree.label"/>
                <a href="#" onclick="return showHelpDialog('help_cfg_showLegendInTree');">(?)</a>
                <div id="help_cfg_showLegendInTree" style="display: none;" title="<fmt:message key="cfg_showLegendInTree.label"/>">
                    <p><fmt:message key="cfg_showLegendInTree.uitleg"/></p>
                </div>
            </td>
            <td><html:checkbox property="cfg_showLegendInTree"/></td>
        </tr>
        <tr>
            <td>
                <fmt:message key="cfg_minBboxZoeken.label"/>
                <a href="#" onclick="return showHelpDialog('help_cfg_minBboxZoeken');">(?)</a>
                <div id="help_cfg_minBboxZoeken" style="display: none;" title="<fmt:message key="cfg_minBboxZoeken.label"/>">
                    <p><fmt:message key="cfg_minBboxZoeken.uitleg"/></p>
                </div>
            </td>
            <td><html:text property="cfg_minBboxZoeken" size="10"/></td>
        </tr>
        <tr>
            <td>
                <fmt:message key="cfg_maxResults.label"/>
                <a href="#" onclick="return showHelpDialog('help_cfg_maxResults');">(?)</a>
                <div id="help_cfg_maxResults" style="display: none;" title="<fmt:message key="cfg_maxResults.label"/>">
                    <p><fmt:message key="cfg_maxResults.uitleg"/></p>
                </div>
            </td>
            <td><html:text property="cfg_maxResults" size="5"/></td>
        </tr>

        <%--
        <tr>
            <td>
                <fmt:message key="cfg_multipleActiveThemas.label"/>
                <a href="#" onclick="return showHelpDialog('help_cfg_multipleActiveThemas');">(?)</a>
                <div id="help_cfg_multipleActiveThemas" style="display: none;" title="<fmt:message key="cfg_multipleActiveThemas.label"/>">
                    <p><fmt:message key="cfg_multipleActiveThemas.uitleg"/></p>
                </div>
            </td>
            <td><html:checkbox property="cfg_multipleActiveThemas"/></td>
        </tr>
        --%>

        <tr>
            <td>
                <fmt:message key="cfg_layerGrouping.label"/>
                <a href="#" onclick="return showHelpDialog('help_cfg_layerGrouping');">(?)</a>
                <div id="help_cfg_layerGrouping" style="display: none;" title="<fmt:message key="cfg_layerGrouping.label"/>">
                    <p><fmt:message key="cfg_layerGrouping.uitleg"/></p>
                </div>
            </td>
            <td>
                <html:select property="cfg_layerGrouping">
                    <html:option value="lg_forebackground"><fmt:message key="cfg_layerGrouping.forebackground"/></html:option>
                    <html:option value="lg_layer"><fmt:message key="cfg_layerGrouping.layer"/></html:option>
                    <html:option value="lg_cluster"><fmt:message key="cfg_layerGrouping.cluster"/></html:option>
                    <html:option value="lg_all"><fmt:message key="cfg_layerGrouping.all"/></html:option>
                </html:select>
            </td>
        </tr>

        </table>
        </div>
        </fieldset>
    </div>

    <div class="fieldset_block">
        <fieldset class="fieldset1">
        <legend class="fieldLegend">Layout</legend>
        
        <div class="content_body">
        <table>
            <tr>
            <td>
                <fmt:message key="cfg_viewerType.label"/>
                <a href="#" onclick="return showHelpDialog('help_cfg_viewerType');">(?)</a>
                <div id="help_cfg_viewerType" style="display: none;" title="<fmt:message key="cfg_viewerType.label"/>">
                    <p><fmt:message key="cfg_viewerType.uitleg"/></p>
                </div>
            </td>

            <td>
                <html:select property="cfg_viewerType">
                    <html:option value="flamingo"><fmt:message key="cfg_viewerType.1"/></html:option>
                    <html:option value="openlayers"><fmt:message key="cfg_viewerType.2"/></html:option>
                </html:select>
            </td>
            </tr>

            <tr>
            <td>
                <fmt:message key="cfg_viewerTemplate.label"/>
                <a href="#" onclick="return showHelpDialog('help_cfg_viewerTemplate');">(?)</a>
                <div id="help_cfg_viewerTemplate" style="display: none;" title="<fmt:message key="cfg_viewerTemplate.label"/>">
                    <p><fmt:message key="cfg_viewerTemplate.uitleg"/></p>
                </div>
            </td>

            <td>
                <html:select property="cfg_viewerTemplate">
                    <html:option value="standalone"><fmt:message key="cfg_viewerTemplate.1"/></html:option>
                    <html:option value="embedded"><fmt:message key="cfg_viewerTemplate.2"/></html:option>
                </html:select>
            </td>
            </tr>
            
            <tr>
            <td>
                <fmt:message key="cfg_layoutAdminData.label"/>
                <a href="#" onclick="return showHelpDialog('help_cfg_layoutAdminData');">(?)</a>
                <div id="help_cfg_layoutAdminData" style="display: none;" title="<fmt:message key="cfg_layoutAdminData.label"/>">
                    <p><fmt:message key="cfg_layoutAdminData.uitleg"/></p>
                </div>
            </td>
            <td>
                <html:select property="cfg_layoutAdminData">
                    <html:option value="admindata1"><fmt:message key="cfg_layoutAdminData.1"/></html:option>
                    <html:option value="admindata2"><fmt:message key="cfg_layoutAdminData.2"/></html:option>
                    <html:option value="admindata3"><fmt:message key="cfg_layoutAdminData.3"/></html:option>
                    <html:option value="multi_admindata"><fmt:message key="cfg_layoutAdminData.multi"/></html:option>
                </html:select>
            </td>
        </tr>
        <tr>
            <td>
                <fmt:message key="cfg_defaultdataframehoogte.label"/>
                <a href="#" onclick="return showHelpDialog('help_cfg_defaultdataframehoogte');">(?)</a>
                <div id="help_cfg_defaultdataframehoogte" style="display: none;" title="<fmt:message key="cfg_defaultdataframehoogte.label"/>">
                    <p><fmt:message key="cfg_defaultdataframehoogte.uitleg"/></p>
                </div>
            </td>
            <td><html:text property="cfg_defaultdataframehoogte" size="5"/></td>
        </tr>
        <tr>
            <td>
                <fmt:message key="cfg_popupWidth.label"/>
                <a href="#" onclick="return showHelpDialog('help_cfg_popupWidth');">(?)</a>
                <div id="help_cfg_popupWidth" style="display: none;" title="<fmt:message key="cfg_popupWidth.label"/>">
                    <p><fmt:message key="cfg_popupWidth.uitleg"/></p>
                </div>
            </td>
            <td><html:text property="cfg_popupWidth" size="5"/></td>
        </tr>
        <tr>
            <td>
                <fmt:message key="cfg_popupHeight.label"/>
                <a href="#" onclick="return showHelpDialog('help_cfg_popupHeight');">(?)</a>
                <div id="help_cfg_popupHeight" style="display: none;" title="<fmt:message key="cfg_popupHeight.label"/>">
                    <p><fmt:message key="cfg_popupHeight.uitleg"/></p>
                </div>
            </td>
            <td><html:text property="cfg_popupHeight" size="5"/></td>
        </tr>       
        <tr>
            <td>
                <fmt:message key="cfg_popupLeft.label"/>
                <a href="#" onclick="return showHelpDialog('help_cfg_popupLeft');">(?)</a>
                <div id="help_cfg_popupLeft" style="display: none;" title="<fmt:message key="cfg_popupLeft.label"/>">
                    <p><fmt:message key="cfg_popupLeft.uitleg"/></p>
                </div>
            </td>
            <td><html:text property="cfg_popupLeft" size="5"/></td>
        </tr>    
        <tr>
            <td>
                <fmt:message key="cfg_popupTop.label"/>
                <a href="#" onclick="return showHelpDialog('help_cfg_popupTop');">(?)</a>
                <div id="help_cfg_popupTop" style="display: none;" title="<fmt:message key="cfg_popupTop.label"/>">
                    <p><fmt:message key="cfg_popupTop.uitleg"/></p>
                </div>
            </td>
            <td><html:text property="cfg_popupTop" size="5"/></td>
        </tr>
        </table>
        </div>
        </fieldset>
    </div>

    <div class="fieldset_block">
        <fieldset class="fieldset1">
        <legend class="fieldLegend">Tools</legend>

        <div class="content_body">
        <table>
        <tr>
            <td>
                <fmt:message key="cfg_objectInfo.label"/>
                <a href="#" onclick="return showHelpDialog('help_cfg_objectInfo');">(?)</a>
                <div id="help_cfg_objectInfo" style="display: none;" title="<fmt:message key="cfg_objectInfo.label"/>">
                    <p><fmt:message key="cfg_objectInfo.uitleg"/></p>
                </div>
            </td>
            <td>
                <html:select property="cfg_objectInfoType">
                    <html:option value="geen"><fmt:message key="cfg_objectInfo.geen"/></html:option>
                    <html:option value="paneel"><fmt:message key="cfg_objectInfo.paneel"/></html:option>
                    <html:option value="popup"><fmt:message key="cfg_objectInfo.popup"/></html:option>
                </html:select>
            </td>
        </tr>

        <%--
        <tr>
            <td>
                <fmt:message key="cfg_autoRedirect.label"/>
                <a href="#" onclick="return showHelpDialog('help_cfg_autoRedirect');">(?)</a>
                <div id="help_cfg_autoRedirect" style="display: none;" title="<fmt:message key="cfg_autoRedirect.label"/>">
                    <p><fmt:message key="cfg_autoRedirect.uitleg"/></p>
                </div>
            </td>
            <td><html:text property="cfg_autoRedirect" size="5"/></td>
        </tr>
        --%>

        <tr>
            <td>
                <fmt:message key="cfg_tolerance.label"/>
                <a href="#" onclick="return showHelpDialog('help_cfg_tolerance');">(?)</a>
                <div id="help_cfg_tolerance" style="display: none;" title="<fmt:message key="cfg_tolerance.label"/>">
                    <p><fmt:message key="cfg_tolerance.uitleg"/></p>
                </div>
            </td>
            <td><html:text property="cfg_tolerance" size="5"/></td>
        </tr>
        <tr>
            <td>
                <fmt:message key="cfg_showRedliningTools.label"/>
                <a href="#" onclick="return showHelpDialog('help_cfg_showRedliningTools');">(?)</a>
                <div id="help_cfg_showRedliningTools" style="display: none;" title="<fmt:message key="cfg_showRedliningTools.label"/>">
                    <p><fmt:message key="cfg_showRedliningTools.uitleg"/></p>
                </div>
            </td>
            <td><html:checkbox property="cfg_showRedliningTools"/></td>
        </tr>
        <tr>
            <td>
                <fmt:message key="cfg_showBufferTool.label"/>
                <a href="#" onclick="return showHelpDialog('help_cfg_showBufferTool');">(?)</a>
                <div id="help_cfg_showBufferTool" style="display: none;" title="<fmt:message key="cfg_showBufferTool.label"/>">
                    <p><fmt:message key="cfg_showBufferTool.uitleg"/></p>
                </div>
            </td>
            <td><html:checkbox property="cfg_showBufferTool"/></td>
        </tr>
        <tr>
            <td>
                <fmt:message key="cfg_showSelectBulkTool.label"/>
                <a href="#" onclick="return showHelpDialog('help_cfg_showSelectBulkTool');">(?)</a>
                <div id="help_cfg_showSelectBulkTool" style="display: none;" title="<fmt:message key="cfg_showSelectBulkTool.label"/>">
                    <p><fmt:message key="cfg_showSelectBulkTool.uitleg"/></p>
                </div>
            </td>
            <td><html:checkbox property="cfg_showSelectBulkTool"/></td>
        </tr>
        <tr>
            <td>
                <fmt:message key="cfg_showNeedleTool.label"/>
                <a href="#" onclick="return showHelpDialog('help_cfg_showNeedleTool');">(?)</a>
                <div id="help_cfg_showNeedleTool" style="display: none;" title="<fmt:message key="cfg_showNeedleTool.label"/>">
                    <p><fmt:message key="cfg_showNeedleTool.uitleg"/></p>
                </div>
            </td>
            <td><html:checkbox property="cfg_showNeedleTool"/></td>
        </tr>
        </table>
        </div>
        </fieldset>
    </div>

    <div class="fieldset_block">
        <fieldset class="fieldset1">
        <legend class="fieldLegend">Tabbladen</legend>

        <div class="content_body">

        <fmt:message key="cfg_useMouseOverTabs.label"/>
        <a href="#" onclick="return showHelpDialog('help_cfg_useMouseOverTabs');">(?)</a>
        <div id="help_cfg_useMouseOverTabs" style="display: none;" title="<fmt:message key="cfg_useMouseOverTabs.label"/>">
            <p><fmt:message key="cfg_useMouseOverTabs.uitleg"/></p>
        </div>

        <html:checkbox property="cfg_useMouseOverTabs"/>
        <br/>

        <p><fmt:message key="config.tabbladen.label"/></p>

        <table>
        <tr>
            <td>Tab 1</td>
            <td>
                <html:select property="cfg_tab1">
                    <c:forEach items="${tabLabels}" var="item" varStatus="status">
                        <html:option value="${tabValues[status.count-1]}">${item}</html:option>
                    </c:forEach>
                </html:select>
            </td>
        </tr>
        <tr>
            <td>Tab 2</td>
            <td>
                <html:select property="cfg_tab2">
                    <c:forEach items="${tabLabels}" var="item" varStatus="status">
                        <html:option value="${tabValues[status.count-1]}">${item}</html:option>
                    </c:forEach>
                </html:select>
            </td>
        </tr>
        <tr>
            <td>Tab 3</td>
            <td>
                <html:select property="cfg_tab3">
                    <c:forEach items="${tabLabels}" var="item" varStatus="status">
                        <html:option value="${tabValues[status.count-1]}">${item}</html:option>
                    </c:forEach>
                </html:select>
            </td>
        </tr>
        <tr>
            <td>Tab 4</td>
            <td>
                <html:select property="cfg_tab4">
                    <c:forEach items="${tabLabels}" var="item" varStatus="status">
                        <html:option value="${tabValues[status.count-1]}">${item}</html:option>
                    </c:forEach>
                </html:select>
            </td>
        </tr>
        <tr>
            <td>Tab 5</td>
            <td>
                <html:select property="cfg_tab5">
                <c:forEach items="${tabLabels}" var="item" varStatus="status">
                    <html:option value="${tabValues[status.count-1]}">${item}</html:option>
                </c:forEach>
                </html:select>
            </td>
        </tr>
        </table>
        
        </div>
        </fieldset>
    </div>

    <div class="fieldset_block_modules">
        <fieldset class="fieldset_small">
        <legend class="fieldLegend">Modules</legend>

        <div id="configkeeper_style">
            
            <div id="configkeeper_tab_header_container">
                <div class="configkeeper_tab_header" id="tab-zoeken-header">Zoeken</div>
                <div class="configkeeper_tab_header" id="tab-planselectie-header">Planselectie</div>
                <div class="configkeeper_tab_header" id="tab-vergunning-header">Vergunning</div>
                <div class="configkeeper_tab_header" id="tab-voorziening-header">Voorziening</div>
                <div class="configkeeper_tab_header" id="tab-melding-header">Melding</div>
            </div>

            <div class="maintable">

                <div class="configkeeper_tab" id="tab-zoeken-content">

                    <p><fmt:message key="tab-zoeken-content.header"/></p>

                    <table cellpadding="2" cellspacing="2" border="0">
                    <tr>
                        <td><fmt:message key="cfg_zoekenid1.label"/></td>
                        <td>
                            <html:select property="cfg_zoekenid1">
                                <html:option value="leeg">-Kies een zoekingang-</html:option>
                                <c:forEach items="${zoekConfigs}" var="item">
                                    <html:option value="${item.id}">${item.naam}</html:option>
                                </c:forEach>
                            </html:select>
                        </td>
                    </tr>
                    <tr>
                        <td><fmt:message key="cfg_zoekenid2.label"/></td>
                        <td>
                            <html:select property="cfg_zoekenid2">
                                <html:option value="leeg">-Kies een zoekingang-</html:option>
                                <c:forEach items="${zoekConfigs}" var="item">
                                    <html:option value="${item.id}">${item.naam}</html:option>
                                </c:forEach>
                            </html:select>
                        </td>
                    </tr>
                    <tr>
                        <td><fmt:message key="cfg_zoekenid3.label"/></td>
                        <td>
                            <html:select property="cfg_zoekenid3">
                                <html:option value="leeg">-Kies een zoekingang-</html:option>
                                <c:forEach items="${zoekConfigs}" var="item">
                                    <html:option value="${item.id}">${item.naam}</html:option>
                                </c:forEach>
                            </html:select>
                        </td>
                    </tr>
                    <tr>
                        <td><fmt:message key="cfg_zoekenid4.label"/></td>
                        <td>
                            <html:select property="cfg_zoekenid4">
                                <html:option value="leeg">-Kies een zoekingang-</html:option>
                                <c:forEach items="${zoekConfigs}" var="item">
                                    <html:option value="${item.id}">${item.naam}</html:option>
                                </c:forEach>
                            </html:select>
                        </td>
                    </tr>
                    </table>
                </div> <!-- Einde zoeken tabje -->

                <div class="configkeeper_tab" id="tab-planselectie-content">

                    <p><fmt:message key="tab-planselectie-content.header"/></p>

                    <table cellpadding="2" cellspacing="2" border="0">
                    <tr>
                        <td><fmt:message key="cfg_planselectieid1.label"/></td>
                        <td>
                            <html:select property="cfg_planselectieid1">
                                <html:option value="leeg">-Kies een zoekingang-</html:option>
                                <c:forEach items="${zoekConfigs}" var="item">
                                    <html:option value="${item.id}">${item.naam}</html:option>
                                </c:forEach>
                            </html:select>
                        </td>
                    </tr>
                    <tr>
                        <td><fmt:message key="cfg_planselectieid2.label"/></td>
                        <td>
                            <html:select property="cfg_planselectieid2">
                                <html:option value="leeg">-Kies een zoekingang-</html:option>
                                <c:forEach items="${zoekConfigs}" var="item">
                                    <html:option value="${item.id}">${item.naam}</html:option>
                                </c:forEach>
                            </html:select>
                        </td>
                    </tr>
                    </table>
                </div>

                <div class="configkeeper_tab" id="tab-vergunning-content">
                    <table border="0" cellspacing="10">
                        <tr>
                            <td valign="top">
                                <table cellpadding="2" cellspacing="2" border="0" style="width: 220px;">
                                <tr>
                                    <td><fmt:message key="cfg_vergunningid1.label"/></td>
                                    <td>
                                        <html:select property="cfg_vergunningid1">
                                            <html:option value="leeg">-Kies een zoekingang-</html:option>
                                            <c:forEach items="${zoekConfigs}" var="item">
                                                <html:option value="${item.id}">${item.naam}</html:option>
                                            </c:forEach>
                                        </html:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td><fmt:message key="cfg_vergunningid2.label"/></td>
                                    <td>
                                        <html:select property="cfg_vergunningid2">
                                            <html:option value="leeg">-Kies een zoekingang-</html:option>
                                            <c:forEach items="${zoekConfigs}" var="item">
                                                <html:option value="${item.id}">${item.naam}</html:option>
                                            </c:forEach>
                                        </html:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td><fmt:message key="cfg_vergunningid3.label"/></td>
                                    <td>
                                        <html:select property="cfg_vergunningid3">
                                            <html:option value="leeg">-Kies een zoekingang-</html:option>
                                            <c:forEach items="${zoekConfigs}" var="item">
                                                <html:option value="${item.id}">${item.naam}</html:option>
                                            </c:forEach>
                                        </html:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td><fmt:message key="cfg_vergunningid4.label"/></td>
                                    <td>
                                        <html:select property="cfg_vergunningid4">
                                            <html:option value="leeg">-Kies een zoekingang-</html:option>
                                            <c:forEach items="${zoekConfigs}" var="item">
                                                <html:option value="${item.id}">${item.naam}</html:option>
                                            </c:forEach>
                                        </html:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td><fmt:message key="cfg_vergunningid5.label"/></td>
                                    <td>
                                        <html:select property="cfg_vergunningid5">
                                            <html:option value="leeg">-Kies een zoekingang-</html:option>
                                            <c:forEach items="${zoekConfigs}" var="item">
                                                <html:option value="${item.id}">${item.naam}</html:option>
                                            </c:forEach>
                                        </html:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td><fmt:message key="cfg_vergunningid6.label"/></td>
                                    <td>
                                        <html:select property="cfg_vergunningid6">
                                            <html:option value="leeg">-Kies een zoekingang-</html:option>
                                            <c:forEach items="${zoekConfigs}" var="item">
                                                <html:option value="${item.id}">${item.naam}</html:option>
                                            </c:forEach>
                                        </html:select>
                                    </td>
                                </tr>
                                </table>
                            </td>
                            <td valign="top">
                                <table>
                                    <tr>
                                        <td><fmt:message key="cfg_vergunningstraal.label"/></td>
                                        <td><html:text property="cfg_vergunningstraal"/></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><fmt:message key="cfg_straal.label"/></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="configkeeper_tab" id="tab-voorziening-content">
                    <table border="0" cellspacing="10">
                        <tr>
                            <td valign="top">
                                <table cellpadding="2" cellspacing="2" border="0">
                                <tr>
                                    <td><fmt:message key="cfg_voorzieningid1.label"/></td>
                                    <td>
                                        <html:select property="cfg_voorzieningid1">
                                            <html:option value="leeg">-Kies een zoekingang-</html:option>
                                            <c:forEach items="${zoekConfigs}" var="item">
                                                <html:option value="${item.id}">${item.naam}</html:option>
                                            </c:forEach>
                                        </html:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td><fmt:message key="cfg_voorzieningid2.label"/></td>
                                    <td>
                                        <html:select property="cfg_voorzieningid2">
                                            <html:option value="leeg">-Kies een zoekingang-</html:option>
                                            <c:forEach items="${zoekConfigs}" var="item">
                                                <html:option value="${item.id}">${item.naam}</html:option>
                                            </c:forEach>
                                        </html:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td><fmt:message key="cfg_voorzieningid3.label"/></td>
                                    <td>
                                        <html:select property="cfg_voorzieningid3">
                                            <html:option value="leeg">-Kies een zoekingang-</html:option>
                                            <c:forEach items="${zoekConfigs}" var="item">
                                                <html:option value="${item.id}">${item.naam}</html:option>
                                            </c:forEach>
                                        </html:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td><fmt:message key="cfg_voorzieningstraal.label"/></td>
                                    <td><html:text property="cfg_voorzieningstraal"/></td>
                                </tr>
                                <tr>
                                    <td colspan="2"><fmt:message key="cfg_straal.label"/></td>
                                </tr>
                                </table>
                            </td>
                            <td>
                                <table cellpadding="2" cellspacing="2" border="0">
                                <tr>
                                    <td><fmt:message key="cfg_voorzieningtype1.label"/></td>
                                    <td>
                                        <html:select property="cfg_voorzieningtype1">
                                            <html:option value="leeg">-Kies een zoekingang-</html:option>
                                            <c:forEach items="${zoekConfigs}" var="item">
                                                <html:option value="${item.id}">${item.naam}</html:option>
                                            </c:forEach>
                                        </html:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td><fmt:message key="cfg_voorzieningtype2.label"/></td>
                                    <td>
                                        <html:select property="cfg_voorzieningtype2">
                                            <html:option value="leeg">-Kies een zoekingang-</html:option>
                                            <c:forEach items="${zoekConfigs}" var="item">
                                                <html:option value="${item.id}">${item.naam}</html:option>
                                            </c:forEach>
                                        </html:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td><fmt:message key="cfg_voorzieningtype3.label"/></td>
                                    <td>
                                        <html:select property="cfg_voorzieningtype3">
                                            <html:option value="leeg">-Kies een zoekingang-</html:option>
                                            <c:forEach items="${zoekConfigs}" var="item">
                                                <html:option value="${item.id}">${item.naam}</html:option>
                                            </c:forEach>
                                        </html:select>
                                    </td>
                                </tr>
                                 <tr>
                                    <td><fmt:message key="cfg_voorzieningtype4.label"/></td>
                                    <td>
                                        <html:select property="cfg_voorzieningtype4">
                                            <html:option value="leeg">-Kies een zoekingang-</html:option>
                                            <c:forEach items="${zoekConfigs}" var="item">
                                                <html:option value="${item.id}">${item.naam}</html:option>
                                            </c:forEach>
                                        </html:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td><fmt:message key="cfg_voorzieningtype5.label"/></td>
                                    <td>
                                        <html:select property="cfg_voorzieningtype5">
                                            <html:option value="leeg">-Kies een zoekingang-</html:option>
                                            <c:forEach items="${zoekConfigs}" var="item">
                                                <html:option value="${item.id}">${item.naam}</html:option>
                                            </c:forEach>
                                        </html:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td><fmt:message key="cfg_voorzieningtype6.label"/></td>
                                    <td>
                                        <html:select property="cfg_voorzieningtype6">
                                            <html:option value="leeg">-Kies een zoekingang-</html:option>
                                            <c:forEach items="${zoekConfigs}" var="item">
                                                <html:option value="${item.id}">${item.naam}</html:option>
                                            </c:forEach>
                                        </html:select>
                                    </td>
                                </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    
                </div>

                <div class="configkeeper_tab" id="tab-melding-content">
                    <table border="0" cellspacing="10">
                        <tr>
                            <td valign="top">
                                <table cellpadding="2" cellspacing="2" border="0">
                                    <tr>
                                        <td><fmt:message key="cfg_meldingwelkomtekst.label"/></td>
                                        <td><html:text property="cfg_meldingwelkomtekst"/></td>
                                    </tr>
                                    <tr>
                                        <td><fmt:message key="cfg_meldingprefix.label"/></td>
                                        <td><html:text property="cfg_meldingprefix"/></td>
                                    </tr>
                                    <tr>
                                        <td><fmt:message key="cfg_meldingtype.label"/></td>
                                        <td><html:text property="cfg_meldingtype"/></td>
                                    </tr>
                                    <tr>
                                        <td><fmt:message key="cfg_meldingstatus.label"/></td>
                                        <td><html:text property="cfg_meldingstatus"/></td>
                                    </tr>
                                    <tr>
                                        <td><fmt:message key="cfg_meldingemailmelder.label"/></td>
                                        <td><html:checkbox property="cfg_meldingemailmelder"/></td>
                                    </tr>
                                    <tr>
                                        <td><fmt:message key="cfg_meldinglayoutemailmelder.label"/></td>
                                        <td><html:text property="cfg_meldinglayoutemailmelder"/></td>
                                    </tr>
                                </table>
                            </td>
                            <td valign="top">
                                <table cellpadding="2" cellspacing="2" border="0">
                                    <tr>
                                        <td><fmt:message key="cfg_meldingnaam.label"/></td>
                                        <td><html:text property="cfg_meldingnaam"/></td>
                                    </tr>
                                    <tr>
                                        <td><fmt:message key="cfg_meldingemail.label"/></td>
                                        <td><html:text property="cfg_meldingemail"/></td>
                                    </tr>
                                    <tr>
                                        <td><fmt:message key="cfg_meldingemailbehandelaar.label"/></td>
                                        <td><html:checkbox property="cfg_meldingemailbehandelaar"/></td>
                                    </tr>
                                    <tr>
                                        <td><fmt:message key="cfg_meldinglayoutemailbehandelaar.label"/></td>
                                        <td><html:text property="cfg_meldinglayoutemailbehandelaar"/></td>
                                    </tr>
                                    <tr>
                                        <td><fmt:message key="cfg_meldinggegevensbron.label"/></td>
                                        <td>
                                            <html:select property="cfg_meldinggegevensbron">
                                                <html:option value="0">-Kies een gegevensbron-</html:option>
                                                <c:forEach items="${meldingGegevensbronnen}" var="item">
                                                    <html:option value="${item.id}">${item.naam}</html:option>
                                                </c:forEach>
                                            </html:select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><fmt:message key="cfg_meldingobjectsoort.label"/></td>
                                        <td><html:text property="cfg_meldingobjectsoort"/></td>
                                    </tr>
                                    <tr>
                                        <td><fmt:message key="cfg_meldingtekentoolicoon.label"/></td>
                                        <td><html:text property="cfg_meldingtekentoolicoon"/></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>

            </div> <!-- einde main table -->

        </div> <!-- einde configkeeper_style -->

        </fieldset>
        </div>

        <script type="text/javascript">
            // Maak de tabjes
            createTabs('configkeeper_tab_header_container');
            firstTab('tab-zoeken-header');
        </script>
    
        <div class="clearBoth">
            <html:submit property="save" accesskey="s" styleClass="knop" onclick="return confirm('Weet u zeker dat u dit wilt opslaan?');">
                Opslaan
            </html:submit>
        </div>
</html:form>