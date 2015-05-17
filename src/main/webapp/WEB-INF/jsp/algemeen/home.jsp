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

<script type="text/javascript">
    function reloadOpener() {
        window.opener.document.forms[0].submit();
    }

    function reloadAndClose() {
        //reloadOpener();
        window.close();
    }
</script>

<tiles:insert definition="actionMessages"/>

<c:if test="${not empty tekstBlokken}">
    <!-- Loop door tekstblokken heen -->
    <div class="tegels">
        <c:forEach var="tb" varStatus="status" items="${tekstBlokken}">
            <div class="blockwrapper" title="${tb.titel}">
                <c:set var="style" value="" />
                <c:if test="${!empty tb.kleur}">
                    <c:set var="style" value="${style}background-color:${tb.kleur};" />
                </c:if>

                <c:if test="${!empty tb.hoogte && tb.hoogte != 0}">
                    <c:set var="style" value="${style}height:${tb.hoogte}px;" />
                </c:if>

                <c:if test="${!empty style}">
                    <c:set var="style" value=" style=\"${style}\"" />
                </c:if>
                <div class="tegel"${style}>
                    <c:choose>
                        <c:when test="${tb.toonUrl}">
                            <iframe class="iframe_tekstblok" id="iframe_${tb.titel}" name="iframe_${tb.titel}" frameborder="0" src="${tb.url}"></iframe>
                        </c:when>
                        <c:otherwise>
                            ${tb.tekst}
                            <c:if test="${!empty tb.url}">
                                <a href="${tb.url}" target="_new">${tb.url}</a>
                            </c:if>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </c:forEach>
    </div>
</c:if>

<!-- Gewone help pagina tonen als er geen tekstblokken zijn -->
<c:if test="${empty tekstBlokken}">
    <div class="content_block">
        <h1 class="content_title">B3P Gisviewer configuratie</h1>

        <div class="inleiding_body">
            <p>
            Via de gisviewerconfig webapplicatie kunt u bepalen hoe de
            kaartlagen getoond worden aan de gisviewer gebruiker. Deze gebruiker
            ziet alleen de kaarten waar hij/zij rechten op heeft gekregen via
            kaartenbalie.
            <p/>
        </div>
    </div>
</c:if>

<div class="content_block">
    <h1 class="content_title">Laatste nieuwsberichten</h1>
    <div class="content_body">
        <div class="tweet">
            <a class="twitter-timeline" href="https://twitter.com/B3Partners/b3partners" data-widget-id="349847499529400320" width="420" height="300" data-link-color="#005A9C">Tweets from @B3Partners</a>
            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
        </div>
    </div>
</div>

<div style="clear: both; height: 20px;"></div>
    
<c:if test="${pageContext.request.remoteUser != null}">
    <div class="uitloggen">
        <hr>
        <p><tiles:insert name="loginblock"/></p>
    </div>
</c:if>

<c:if test="${pageContext.request.remoteUser == null}">

<div class="content_block">
    <h1 class="content_title">Inloggen</h1>

    <div class="content_body">
        <form id="loginForm" action="j_security_check" method="POST">
        <table>
            <tr>
                <td><fmt:message key="algemeen.login.gebruikersnaam"/></td>
                <td><input class="inputfield" type="text" name="j_username" size="36"></td>
            </tr>
            <tr>
                <td><fmt:message key="algemeen.login.wachtwoord"/></td>
                <td><input class="inputfield" type="password" name="j_password" size="36"></td>
            </tr>
            <tr>
                <td colspan="2"><fmt:message key="algemeen.login.of"/></td>
            </tr>
            <tr>
                <td><fmt:message key="algemeen.login.code"/></td>
                <td><input class="inputfield" type="text" name="j_code" size="36"></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td><input class="inlogbutton" type="Submit" value="<fmt:message key="algemeen.login.login"/>"></td>
            </tr>
        </table>
        </form>
        <script type="text/javascript">
            <!--
            document.forms.loginForm.j_username.focus();
            // -->
        </script>
    </div>
</div>
</c:if>

<div style="clear: both; padding-bottom: 25px;"></div>