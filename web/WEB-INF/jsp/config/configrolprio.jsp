<%@include file="/WEB-INF/jsp/taglibs.jsp" %>
<%@ page isELIgnored="false"%>

<div class="infobalk">
    <div class="infobalk_description">INSTELLINGEN</div>
    <div class="infobalk_actions"><tiles:insert name="loginblock"/></div>
</div>

<div class="berichtenbalk" style="margin-top: 5px;">
    <tiles:insert definition="actionMessages"/>
</div>

<div class="content_body">

    <div class="configprio_left">
        <html:form action="/configRolPrio">

            <html:hidden property="action" />
            <html:hidden property="alt_action" />

            <h1>Rollen</h1>

            <span class="rolprio_intro">
                Klik op het configuratie icoon naast de rol om de instellingen voor een rol<br/>
                aan te passen of gebruik de pijltjes om de prioriteit van een rol te veranderen.<br/>
                Indien een gebruiker meerdere rollen  heeft wordt de configuratie van de<br/>
                bovenste rol geladen.
            </span>

            <table>
            <c:forEach items="${rollen}" var="item">
                <c:url var="link_up" value="/configRolPrio.do?moveAction=${item}@@UP" />
                <c:url var="link_down" value="/configRolPrio.do?moveAction=${item}@@DOWN" />
                <c:url var="link_delete" value="/configRolPrio.do?delete=${item}" />
                <c:url var="link_settings" value="/configKeeper.do?rolnaam=${item}" />

                <tr>
                    <td><h2>${item}</h2></td>
                    <td><a href="${link_up}"><img src="images/up_30h.png" border="0" alt="Omhoog" title="Omhoog" height="20"/></a></td>
                    <td><a href="${link_down}"><img src="images/down_30h.png" border="0" alt="Omlaag" title="Omlaag" height="20"/></a></td>
                    <td><a href="${link_delete}" onclick="return confirm('Weet u zeker dat u de rol wilt verwijderen?');"><img src="images/delete_30h.png" border="0" alt="Verwijderen" title="Verwijderen" height="20"/></a></td>
                    <td><a href="${link_settings}"><img src="images/settings.png" border="0" alt="Configureren" title="Configuratie" height="20"/></a></td>
                </tr>
            </c:forEach>
            </table>

            <br>
            <table>
                <tr>
                    <td>Nieuwe rol: </td>
                    <td><html:text property="nieuwe_rol" size="20"/></td>
                    <td>
                        <html:submit property="save" accesskey="s" styleClass="knop" onclick="return confirm('Weet u zeker dat u de rol wilt opslaan?');">
                            Opslaan
                        </html:submit>
                    </td>
                </tr>
            </table>
        </html:form>
    </div>
    <div class="configprio_right">
        <h1>Laatste nieuwsberichten</h1>
        <div class="tweet"></div>
    </div>

    <div id="rechten_block">
        <div class="content_title">Rechten</div>
        <p>
            <p>
                <html:link page="/index.do?resetCache=t&cachelifecycle=0">Rechten opnieuw ophalen voor configuratie</html:link>
                <a href="#" onclick="return showHelpDialog('help_rechtenconfig');">(?)</a>
                <div id="help_rechtenconfig" style="display: none;" title="<fmt:message key="rechtenconfig.label"/>">
                    <p><fmt:message key="rechtenconfig.uitleg"/></p>
                </div>
            </p>
            <c:set var="requestURI" value="${fn:split(requestScope['javax.servlet.forward.request_uri'], '/')}" />
            <p>
                <a href="${absoluteURIPrefix}/gisviewer/reset.do?cache=t&amp;cachelifecycle=0">Reset cache voor de gisviewer</a>
                <a href="#" onclick="return showHelpDialog('help_rechtenviewer');">(?)</a>
                <div id="help_rechtenviewer" style="display: none;" title="<fmt:message key="rechtenviewer.label"/>">
                    <p><fmt:message key="rechtenviewer.uitleg"/></p>
                </div>
            </p>          
            <p>
                <a href="${absoluteURIPrefix}/gisviewer/reset.do?opzoeklijst=t">Reset opzoeklijsten voor de gisviewer</a>
                <a href="#" onclick="return showHelpDialog('help_rechtenopzoeklijst');">(?)</a>
                <div id="help_rechtenopzoeklijst" style="display: none;" title="<fmt:message key="rechtenopzoeklijst.label"/>">
                    <p><fmt:message key="rechtenopzoeklijst.uitleg"/></p>
                </div>
            </p>
       <p/>
    </div>

    <!-- Live Tweets -->
    <%@include file="/WEB-INF/jsp/tweets.jsp" %>
</div>
