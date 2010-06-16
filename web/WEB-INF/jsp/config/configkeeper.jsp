<%@include file="/WEB-INF/jsp/taglibs.jsp" %>
<%@ page isELIgnored="false"%>

<div class="infobalk">
    <div class="infobalk_description">CONFIG KEEPER</div>
    <div class="infobalk_actions"><tiles:insert name="loginblock"/></div>
</div>

<html:form action="/configKeeper">
    <html:hidden property="action" value="save" />
    <html:hidden property="alt_action" value="" />

    <table>
        <tr>
            <td>cfg_useCookies</td>
            <td><html:checkbox property="cfg_useCookies"/></td>
        </tr>
        <tr>
            <td>cfg_multipleActiveThemas</td>
            <td><html:checkbox property="cfg_multipleActiveThemas"/></td>
        </tr>
        <tr>
            <td>cfg_usePopup</td>
            <td><html:checkbox property="cfg_usePopup"/></td>
        </tr>
        <tr>
            <td>cfg_useDivPopup</td>
            <td><html:checkbox property="cfg_useDivPopup"/></td>
        </tr>
        <tr>
            <td>cfg_dataframepopupHandle</td>
            <td><html:checkbox property="cfg_dataframepopupHandle"/></td>
        </tr>
        <tr>
            <td>cfg_usePanelControls</td>
            <td><html:checkbox property="cfg_usePanelControls"/></td>
        </tr>
        <tr>
            <td>cfg_showLeftPanel</td>
            <td><html:checkbox property="cfg_showLeftPanel"/></td>
        </tr>
        <tr>
            <td>cfg_autoRedirect</td>
            <td><html:text property="cfg_autoRedirect" size="5"/></td>
        </tr>
        <tr>
            <td>cfg_tolerance</td>
            <td><html:text property="cfg_tolerance" size="5"/></td>
        </tr>
        <tr>
            <td>cfg_useSortableFunction</td>
            <td><html:checkbox property="cfg_tolerance"/></td>
        </tr>
        <tr>
            <td>cfg_layerDelay</td>
            <td><html:text property="cfg_layerDelay" size="10"/></td>
        </tr>
        <tr>
            <td>cfg_refreshDelay</td>
            <td><html:text property="cfg_refreshDelay" size="10"/></td>
        </tr>
        <tr>
            <td>cfg_zoekConfigIds</td>
            <td><html:text property="cfg_zoekConfigIds" size="50"/></td>
        </tr>
        <tr>
            <td>cfg_minBboxZoeken</td>
            <td><html:text property="cfg_minBboxZoeken" size="10"/></td>
        </tr>
        <tr>
            <td>cfg_maxResults</td>
            <td><html:text property="cfg_maxResults" size="5"/></td>
        </tr>
        <tr>
            <td>cfg_expandAll</td>
            <td><html:checkbox property="cfg_maxResults"/></td>
        </tr>
        <tr>
            <td>cfg_tabbladenBeheerder</td>
            <td><html:text property="cfg_tabbladenBeheerder" size="50"/></td>
        </tr>
        <tr>
            <td>cfg_tabbladenGebruiker</td>
            <td><html:text property="cfg_tabbladenGebruiker" size="50"/></td>
        </tr>
        <tr>
            <td>cfg_tabbladenDemoGebruiker</td>
            <td><html:text property="cfg_tabbladenDemoGebruiker" size="50"/></td>
        </tr>
        <tr>
            <td>cfg_tabbladenAnoniem</td>
            <td><html:text property="cfg_tabbladenAnoniem" size="50"/></td>
        </tr>
    </table>
    
    <p>
    <html:submit property="save" accesskey="s" styleClass="knop" onmouseover="this.className='knopover';" onmouseout="this.className='knop';" onclick="return confirm('Weet u zeker dat u dit wilt opslaan?');">
        Opslaan
    </html:submit>
    </p>
</html:form>