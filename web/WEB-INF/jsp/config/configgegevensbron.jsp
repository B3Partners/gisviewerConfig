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

<div id="treedivContainer">
    <div id="treediv"></div>
</div>

<html:form action="/configGegevensbron" focus="${focus}">
    <div style="display: none;">
        <html:hidden property="action"/>
        <html:hidden property="alt_action"/>
        <html:hidden property="gegevensbronID"/>
    </div>

    <div id="content_style" style="float: left; width: 400px;">
        <div class="berichtenbalk" style="margin-top: 5px;">
            <tiles:insert definition="actionMessages"/>
        </div>

        <div class="maintable" style="margin-top: 5px;">
            <table cellpadding="2" cellspacing="2" border="0">

                <tr>
                    <td>
                        <fmt:message key="configgb_naam.label"/> <a href="#" onclick="return showHelpDialog('help_configgb_naam');">(?)</a><div id="help_configgb_naam" style="display: none;" title="<fmt:message key="configgb_naam.label"/>"><p><fmt:message key="configgb_naam.uitleg"/></p></div>
                    </td>
                    <td colspan="3">
                        <html:text property="naam" size="80"/>
                    </td>
                </tr>

                <tr>
                    <td>
                        <fmt:message key="configgb_bron.label"/> <a href="#" onclick="return showHelpDialog('help_configgb_bron');">(?)</a><div id="help_configgb_bron" style="display: none;" title="<fmt:message key="configgb_bron.label"/>"><p><fmt:message key="configgb_bron.uitleg"/></p></div>
                    </td>
                    <td colspan="3">
                        <html:select property="bron" onchange="refreshFeatureList(this);" styleId='connectie_select' styleClass="configBronSelect">
                            <html:option value="0">Kaartenbalie Wfs</html:option>
                            <c:forEach var="cuItem" items="${listBronnen}">
                                <html:option value="${cuItem.id}">
                                    <c:out value="${cuItem.naam}"/>
                                </html:option>
                            </c:forEach>
                        </html:select>&nbsp;
                    </td>
                </tr>

                <c:set var="connectieType" value="wfs"/>
                <c:if test="${form.map.bron != null}">
                    <c:forEach var="i" items="${listBronnen}">
                        <c:if test="${i.id==form.map.bron && i.type=='jdbc'}">
                            <c:set var="connectieType" value="jdbc"/>
                        </c:if>
                    </c:forEach>
                </c:if>

                <tr>
                    <td><fmt:message key="configgb_${connectieType}_admintabel.label"/> <a href="#" onclick="return showHelpDialog('help_configgb_${connectieType}_admintabel');">(?)</a><div id="help_configgb_${connectieType}_admintabel" style="display: none;" title="<fmt:message key="configgb_${connectieType}_admintabel.label"/>"><fmt:message key="configgb_${connectieType}_admintabel.uitleg"/></div></td>
                    <td colspan="3">
                        <html:select property="admin_tabel" onchange="refreshAdminAttributeList(this);" styleId="admin_tabel_select" styleClass="configBronSelect">
                            <html:option value=""/>
                            <c:forEach var="cuItem" items="${listTables}">
                                <html:option value="${cuItem[0]}">${cuItem[1]}</html:option>
                            </c:forEach>
                        </html:select>&nbsp;
                    </td>
                </tr>
                <tr>
                    <td><fmt:message key="configgb_${connectieType}_adminpk.label"/> <a href="#" onclick="return showHelpDialog('help_configgb_${connectieType}_adminpk');">(?)</a><div id="help_configgb_${connectieType}_adminpk" style="display: none;" title="<fmt:message key="configgb_${connectieType}_adminpk.label"/>"><fmt:message key="configgb_${connectieType}_adminpk.uitleg"/></div></td>
                    <td colspan="3">
                        <html:select property="admin_pk" styleId="admin_pk_select" styleClass="configBronSelect">
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
                        </html:select>&nbsp;
                    </td>
                </tr>
               
                <tr>
                    <td>
                        <fmt:message key="configgb_parent.label"/>&nbsp;
                        <a href="#" onclick="return showHelpDialog('help_configgb_parent');">(?)</a>
                        <div id="help_configgb_parent" style="display: none;" title="<fmt:message key="configgb_parent.label"/>">
                            <p><fmt:message key="configgb_parent.uitleg"/></p>
                        </div>
                    </td>
                    <td colspan="3">
                        <html:select property="parentID" styleClass="configBronSelect">
                            <html:option value=""/>
                            <c:forEach var="cuItem" items="${alleGegevensbronnen}">
                                <c:if test="${mainid != cuItem.id}">
                                    <html:option value="${cuItem.id}">
                                        <c:out value="${cuItem.naam}"/>
                                    </html:option>
                                </c:if>
                            </c:forEach>
                        </html:select>
                    </td>
                </tr>

                <tr>
                    <td><fmt:message key="configgb_${connectieType}_adminfk.label"/> <a href="#" onclick="return showHelpDialog('help_configgb_${connectieType}_adminfk');">(?)</a><div id="help_configgb_${connectieType}_adminfk" style="display: none;" title="<fmt:message key="configgb_${connectieType}_adminfk.label"/>"><fmt:message key="configgb_${connectieType}_adminfk.uitleg"/></div></td>
                    <td colspan="3">
                        <html:select property="admin_fk" styleId="admin_fk_select" styleClass="configBronSelect">
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
                        </html:select>&nbsp;
                    </td>
                </tr>

                <tr>
                    <td>
                        <span id="adminqueryrow">
                            <fmt:message key="configgb_${connectieType}_adminquery.label"/> <a href="#" onclick="return showHelpDialog('help_configgb_${connectieType}_adminquery');">(?)</a>
                        </span>
                            <div id="help_configgb_${connectieType}_adminquery" style="display: none;" title="<fmt:message key="configgb_${connectieType}_adminquery.label"/>"><fmt:message key="configgb_${connectieType}_adminquery.uitleg"/>
                            </div>
                    </td>
                    <td colspan="3">
                        <html:text property="admin_query" size="80" styleId="admin_query_text"/>
                    </td>
                </tr>
                
                <tr>
                    <td><fmt:message key="configgb_opmerking.label"/> <a href="#" onclick="return showHelpDialog('help_configgb_opmerking');">(?)</a><div id="help_configgb_opmerking" style="display: none;" title="<fmt:message key="configgb_opmerking.label"/>"><fmt:message key="configgb_opmerking.uitleg"/></div></td><td colspan="3"><html:text property="admin_tabel_opmerkingen" size="80"/></td>
                </tr>
            </table>
        </div>

        <div class="knoppenbalk">
            <!-- Indien nieuw item maken dan alleen Opslaan en Annuleren knoppen tonen -->
            <c:if test="${empty form.map.gegevensbronID}">
                <div class="knoppen">
                    <html:submit property="save" accesskey="s" styleClass="knop" onmouseover="this.className='knopover';" onmouseout="this.className='knop';" onclick="return confirm('Weet u zeker dat u de gegevensbron wilt opslaan?');">
                        <fmt:message key="button.save"/>
                    </html:submit>
                </div>
                <div class="knoppen">
                    <input type="button" onclick="window.location='<html:rewrite page='/configGegevensbron.do' />'" value="<fmt:message key='button.cancel'/>" />
                </div>
            </c:if>
            <!-- Indien item aan het bewerken dan Nieuw, Wissen en Opslaan knoppen tonen -->
            <c:if test="${!empty form.map.gegevensbronID}">
                <div class="knoppen">
                    <html:submit property="create" accesskey="n" styleClass="knop" onmouseover="this.className='knopover';" onmouseout="this.className='knop';">
                        <fmt:message key="button.new"/>
                    </html:submit>
                </div>
                <div class="knoppen">
                    <html:submit property="delete" accesskey="d" styleClass="knop" onclick="return confirm('Weet u zeker dat u de gegevensbron wilt verwijderen?');" onmouseover="this.className='knopover';" onmouseout="this.className='knop';">
                        <fmt:message key="button.remove"/>
                    </html:submit>
                </div>
                <div class="knoppen">
                    <html:submit property="save" accesskey="s" styleClass="knop" onmouseover="this.className='knopover';" onmouseout="this.className='knop';" onclick="return confirm('Weet u zeker dat u de gegevensbron wilt opslaan?');">
                        <fmt:message key="button.save"/>
                    </html:submit>
                </div>
            </c:if>
        </div>

    </div>
</html:form>

<script type="text/javascript" src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'></script>
<script type="text/javascript" src='dwr/interface/JConfigListsUtil.js'></script>
<script type="text/javascript" src="<html:rewrite page="/scripts/gegevensbron.js"/>"></script>
<script type="text/javascript" src="<html:rewrite page="/scripts/simple_treeview.js"/>"></script>

<script type="text/javascript">
    refreshFeatureList(document.getElementById("connectie_select"));
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

    var connectionTypes=new Array();
    connectionTypes["-1"]="";
    connectionTypes["0"]="wfs";
    <c:forEach var="cuItem" items="${listConnecties}">
        connectionTypes["${cuItem.id}"]="${cuItem.type}";
    </c:forEach>
</script>