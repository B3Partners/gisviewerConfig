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

<div class="infobalk">
    <div class="infobalk_description"><fmt:message key="algemeen.login.infobalk"/></div>
    <div class="infobalk_actions"><tiles:insert name="loginblock"/></div>
</div>

<tiles:insert definition="actionMessages"/>

<div class="content_body">

<div class="content_title">Inloggen</div>

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
</div>

<script type="text/javascript">
    <!--
    document.forms.loginForm.j_username.focus();
    // -->
</script>
