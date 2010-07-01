<%@include file="/WEB-INF/jsp/taglibs.jsp" %>
<%@ page isELIgnored="false"%>

<div class="infobalk">
    <div class="infobalk_description">KIES EEN ROL</div>
    <div class="infobalk_actions"><tiles:insert name="loginblock"/></div>
</div>

<div class="berichtenbalk" style="margin-top: 5px;">
    <html:messages id="error" message="true">
        <div class="messages"><c:out value="${error}" escapeXml="false"/></div>
    </html:messages>
</div>

<div class="content_body">

    <p>
        Kies settings om de configuratie voor een rol aan te passen of gebruik de<br/>
        pijltjes om de prioriteit te veranderen. Indien een gebruiker meerdere rollen<br/>
        heeft wordt de configuratie van de bovenste rol geladen.
    </p>
    
    <html:form action="/configRolPrio">
        <html:hidden property="action" />
        <html:hidden property="alt_action" />

        <table>
        <c:forEach items="${rollen}" var="item">
            <c:url var="link_up" value="/configRolPrio.do?moveAction=${item}@@UP" />
            <c:url var="link_down" value="/configRolPrio.do?moveAction=${item}@@DOWN" />
            <c:url var="link_delete" value="/configRolPrio.do?delete=${item}" />

            <tr>
                <td>${item}</td>
                <td><a href="${link_up}"><img src="images/up_30h.png" border="0" alt="Omhoog" height="20"/></a></td>
                <td><a href="${link_down}"><img src="images/down_30h.png" border="0" alt="Omlaag" height="20"/></a></td>
                <td><a href="${link_delete}"><img src="images/delete_30h.png" border="0" alt="Verwijderen" height="20"/></a></td>
            </tr>
        </c:forEach>
        </table>

        <table>
            <tr>
                <td>Nieuwe rol: </td>
                <td><html:text property="nieuwe_rol" size="20"/></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <html:submit property="save" accesskey="s" styleClass="knop" onclick="return confirm('Weet u zeker dat u de rol wilt opslaan?');">
                        Opslaan
                    </html:submit>
                </td>
            </tr>
        </table>
    </html:form>
</div>
