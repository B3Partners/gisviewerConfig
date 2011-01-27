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

<div id="treedivContainer">
    <div id="treediv"></div>
</div>
    
<html:form action="/configKaartGroep" focus="${focus}">
    <div style="display: none;">
        <html:hidden property="action"/>
        <html:hidden property="alt_action"/>
        <html:hidden property="clusterID"/>
    </div>

    <div id="content_style" style="float: left; width: 670px;">
        <div class="berichtenbalk" style="width: 670px; margin-top: 5px;">
            <tiles:insert definition="actionMessages"/>
        </div>

        <div style="clear: both; width: 670px; margin-top: 5px;">
            <table cellpadding="2" cellspacing="2" border="0">

                <c:if test="${!empty form.map.clusterID}">
                    <tr>
                        <td>
                        <fmt:message key="config.label.copypastelink"/>
                        <a href="#" onclick="return showHelpDialog('help_copypastelink');">(?)</a>
                        <div id="help_copypastelink" style="display: none;" title="<fmt:message key="config.label.copypastelink"/>">
                            <p><fmt:message key="config.copypastelink.uitleg"/></p>
                        </div>
                        </td>
                        <td>
                            <a href="${absoluteURIPrefix}/gisviewer/viewer.do?clusterId=${form.map.clusterID}" target="_new"><fmt:message key="config.linknaam.copypastelink"/></a>
                        </td>
                    </tr>
                </c:if>

                <tr>
                    <td>
                        <fmt:message key="configcluster.naam"/>:
                    </td>
                    <td colspan="3">
                        <html:text property="naam" size="60"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <fmt:message key="configcluster.metadatalink"/>:

                        <a href="#" onclick="return showHelpDialog('help_cluster_meta');">(?)</a>
                        <div id="help_cluster_meta" style="display: none;" title="<fmt:message key="configcluster.metadatalink"/>">
                            <p><fmt:message key="configcluster.metadatalink.uitleg"/></p>
                        </div>
                    </td>
                    <td colspan="3">
                        <html:text property="metadatalink"  size="60"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <fmt:message key="configcluster.volgorde"/>:

                        <a href="#" onclick="return showHelpDialog('help_cluster_volgorde');">(?)</a>
                        <div id="help_cluster_volgorde" style="display: none;" title="<fmt:message key="configcluster.volgorde"/>">
                            <p><fmt:message key="configcluster.volgorde.uitleg"/></p>
                        </div>
                    </td>
                    <td colspan="3">
                        <html:text property="belangnr" size="10"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <fmt:message key="configcluster.omschrijving"/>:

                        <a href="#" onclick="return showHelpDialog('help_cluster_omschr');">(?)</a>
                        <div id="help_cluster_omschr" style="display: none;" title="<fmt:message key="configcluster.omschrijving"/>">
                            <p><fmt:message key="configcluster.omschrijving.uitleg"/></p>
                        </div>

                    </td>
                    <td colspan="3">
                        <html:text property="omschrijving"  size="60"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <html:checkbox property="default_cluster"/>
                    </td>
                    <td colspan="3">
                        <fmt:message key="configcluster.geenconfiglagen"/>

                        <a href="#" onclick="return showHelpDialog('help_cluster_noconfig');">(?)</a>
                        <div id="help_cluster_noconfig" style="display: none;" title="<fmt:message key="configcluster.geenconfiglagen"/>">
                            <p><fmt:message key="configcluster.geenconfiglagen.uitleg"/></p>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <html:checkbox property="hide_legend"/>
                    </td>
                    <td colspan="3">
                        <fmt:message key="configcluster.onzichtbaarinlegenda"/>

                        <a href="#" onclick="return showHelpDialog('help_cluster_onzichtbaar');">(?)</a>
                        <div id="help_cluster_onzichtbaar" style="display: none;" title="<fmt:message key="configcluster.onzichtbaarinlegenda"/>">
                            <p><fmt:message key="configcluster.onzichtbaarinlegenda.uitleg"/></p>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <html:checkbox property="hide_tree"/>
                    </td>
                    <td colspan="3">
                        <fmt:message key="configcluster.onzichtbaarinboom"/>

                        <a href="#" onclick="return showHelpDialog('help_cluster_onzichtbaarinboom');">(?)</a>
                        <div id="help_cluster_onzichtbaarinboom" style="display: none;" title="<fmt:message key="configcluster.onzichtbaarinboom"/>">
                            <p><fmt:message key="configcluster.onzichtbaarinboom.uitleg"/></p>
                        </div>

                        &nbsp;

                        <a href="#" onclick="return showHelpDialog('help_cluster_combi');">(info over gebruik samen met aan/uit optie ?)</a>
                        <div id="help_cluster_combi" style="display: none;" title="<fmt:message key="configcluster.onzichtbaar.combinatie"/>">
                            <p><fmt:message key="configcluster.onzichtbaar.combinatie.uitleg"/></p>
                        </div>

                    </td>
                </tr>
                <tr>
                    <td>
                        <html:checkbox property="background_cluster"/>
                    </td>
                    <td colspan="3">
                        <fmt:message key="configcluster.achtergrondlagen"/>

                        <a href="#" onclick="return showHelpDialog('help_cluster_achtergrond');">(?)</a>
                        <div id="help_cluster_achtergrond" style="display: none;" title="<fmt:message key="configcluster.achtergrondlagen"/>">
                            <p><fmt:message key="configcluster.achtergrondlagen.uitleg"/></p>
                        </div>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <html:checkbox property="callable"/>
                    </td>
                    <td colspan="3">
                        <fmt:message key="configcluster.aanuitvink"/>

                        <a href="#" onclick="return showHelpDialog('help_cluster_aanuitvink');">(?)</a>
                        <div id="help_cluster_aanuitvink" style="display: none;" title="<fmt:message key="configcluster.aanuitvink"/>">
                            <p><fmt:message key="configcluster.aanuitvink.uitleg"/></p>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <html:checkbox property="default_visible"/>
                    </td>
                    <td colspan="3">
                        <fmt:message key="configcluster.defaultaangevinkt"/>

                        <a href="#" onclick="return showHelpDialog('help_cluster_defaultaan');">(?)</a>
                        <div id="help_cluster_defaultaan" style="display: none;" title="<fmt:message key="configcluster.defaultaangevinkt"/>">
                            <p><fmt:message key="configcluster.defaultaangevinkt.uitleg"/></p>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <html:checkbox property="exclusive_childs"/>
                    </td>
                    <td colspan="3">
                        <fmt:message key="configcluster.exclusive_childs"/>

                        <a href="#" onclick="return showHelpDialog('help_cluster_exclusive_childs');">(?)</a>
                        <div id="help_cluster_exclusive_childs" style="display: none;" title="<fmt:message key="configcluster.exclusive_childs"/>">
                            <p><fmt:message key="configcluster.exclusive_childs.uitleg"/></p>
                        </div>
                    </td>
                </tr>
              <tr>
                    <td>
                        <fmt:message key="configcluster.oudercluster"/>:
                    </td>
                    <td colspan="3">
                        <html:select property="parentID">
                            <html:option value=""/>
                            <c:forEach var="cuItem" items="${allClusters}">
                                <c:if test="${mainid != cuItem.id}">
                                    <html:option value="${cuItem.id}">
                                        <c:out value="${cuItem.naam}"/>
                                    </html:option>
                                </c:if>
                            </c:forEach>
                        </html:select>&nbsp;

                        <a href="#" onclick="return showHelpDialog('help_cluster_parent');">(?)</a>
                        <div id="help_cluster_parent" style="display: none;" title="<fmt:message key="configcluster.oudercluster"/>">
                            <p><fmt:message key="configcluster.oudercluster.uitleg"/></p>
                        </div>
                    </td>
                </tr>
            </table>
        </div>

        <div class="knoppenbalk" style="width: 670px;">
            <!-- Indien nieuw item maken dan alleen Opslaan en Annuleren knoppen tonen -->
            <c:if test="${empty form.map.clusterID}">
                <div class="knoppen">
                    <html:submit property="save" accesskey="s" styleClass="knop" onmouseover="this.className='knopover';" onmouseout="this.className='knop';" onclick="return confirm('Weet u zeker dat u deze kaartgroep wilt opslaan?');">
                        <fmt:message key="button.save"/>
                    </html:submit>
                </div>
                <div class="knoppen">
                    <input type="button" onclick="window.location='<html:rewrite page='/configKaartGroep.do' />'" value="<fmt:message key='button.cancel'/>" />
                </div>
            </c:if>
            <!-- Indien item aan het bewerken dan Nieuw, Wissen en Opslaan knoppen tonen -->
            <c:if test="${!empty form.map.clusterID}">
                <div class="knoppen">
                    <html:submit property="create" accesskey="n" styleClass="knop" onmouseover="this.className='knopover';" onmouseout="this.className='knop';">
                        <fmt:message key="button.new"/>
                    </html:submit>
                </div>
                <div class="knoppen">
                    <html:submit property="delete" accesskey="d" styleClass="knop" onclick="return confirm('Weet u zeker dat u deze kaartgroep wilt verwijderen?');" onmouseover="this.className='knopover';" onmouseout="this.className='knop';">
                        <fmt:message key="button.remove"/>
                    </html:submit>
                </div>
                <div class="knoppen">
                    <html:submit property="save" accesskey="s" styleClass="knop" onmouseover="this.className='knopover';" onmouseout="this.className='knop';" onclick="return confirm('Weet u zeker dat u deze kaartgroep wilt opslaan?');">
                        <fmt:message key="button.save"/>
                    </html:submit>
                </div>
            </c:if>
        </div>
        
    </div>
    <div style="clear: left;"></div>
</html:form>

<script type="text/javascript" src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'></script>
<script type="text/javascript" src="<html:rewrite page="/scripts/kaartgroep.js"/>"></script>
<script type="text/javascript" src="<html:rewrite page="/scripts/simple_treeview.js"/>"></script>

<script type="text/javascript">
    function catchEmpty(defval){
        return defval
    }
        
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