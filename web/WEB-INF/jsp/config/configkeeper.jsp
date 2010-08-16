<%@include file="/WEB-INF/jsp/taglibs.jsp" %>
<%@ page isELIgnored="false"%>

<script type="text/javascript" src="<html:rewrite page="/scripts/config-tab.js"/>"></script>

<div class="infobalk">
    <div class="infobalk_description"><fmt:message key="configkeeper.infobalk"/></div>
    <div class="infobalk_actions"><tiles:insert name="loginblock"/></div>
</div>

<div class="berichtenbalk" style="margin-top: 5px;">
    <html:messages id="error" message="true">
        <div class="messages"><c:out value="${error}" escapeXml="false"/></div>
    </html:messages>
</div>

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

        </table>
        </div>
        </fieldset>
    </div>

    <div class="fieldset_block">
        <fieldset class="fieldset1">
        <legend class="fieldLegend">Object informatie</legend>
        
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
                <html:select property="cfg_objectInfo">
                    <html:option value="geen"><fmt:message key="cfg_objectInfo.geen"/></html:option>
                    <html:option value="paneel"><fmt:message key="cfg_objectInfo.paneel"/></html:option>
                    <html:option value="popup"><fmt:message key="cfg_objectInfo.popup"/></html:option>
                </html:select>
            </td>
        </tr>
        
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
                <fmt:message key="cfg_autoRedirect.label"/>
                <a href="#" onclick="return showHelpDialog('help_cfg_autoRedirect');">(?)</a>
                <div id="help_cfg_autoRedirect" style="display: none;" title="<fmt:message key="cfg_autoRedirect.label"/>">
                    <p><fmt:message key="cfg_autoRedirect.uitleg"/></p>
                </div>
            </td>
            <td><html:text property="cfg_autoRedirect" size="5"/></td>
        </tr>

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
                </html:select>
            </td>
        </tr>

        </table>
        </div>
        </fieldset>
    </div>

    <div class="fieldset_block_small">
        <fieldset class="fieldset_small">
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