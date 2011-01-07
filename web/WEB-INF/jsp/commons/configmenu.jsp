<%@include file="/WEB-INF/jsp/taglibs.jsp" %>

<%--
<div id="topmenu">
    <c:set var="requestURI" value="${fn:split(requestScope['javax.servlet.forward.request_uri'], '/')}" />
    <c:set var="requestJSP" value="${requestURI[fn:length(requestURI) - 1]}" />

    <c:set var="stijlklasse" value="menulink" />
    <c:if test="${requestJSP eq 'help.do'}">
        <c:set var="stijlklasse" value="activemenulink" />
    </c:if>
    <html:link target="_blank" page="/help.do" styleClass="${stijlklasse}" module=""><fmt:message key="commons.configmenu.help"/></html:link>

    <c:set var="stijlklasse" value="menulink" />
    <c:if test="${requestJSP eq 'configCMS.do'}">
        <c:set var="stijlklasse" value="activemenulink" />
    </c:if>
    <html:link page="/configCMS.do" styleClass="${stijlklasse}" module=""><fmt:message key="commons.configmenu.cms"/></html:link>

    <c:set var="stijlklasse" value="menulink" />
    <c:if test="${requestJSP eq 'configConnectie.do'}">
        <c:set var="stijlklasse" value="activemenulink" />
    </c:if>
    <html:link page="/configConnectie.do" styleClass="${stijlklasse}" module=""><fmt:message key="commons.configmenu.connectie"/></html:link>

    <c:set var="stijlklasse" value="menulink" />
    <c:if test="${requestJSP eq 'configThemaData.do'}">
        <c:set var="stijlklasse" value="activemenulink" />
    </c:if>
    <html:link page="/configThemaData.do" styleClass="${stijlklasse}" module=""><fmt:message key="commons.configmenu.themadata"/></html:link>

    <c:set var="stijlklasse" value="menulink" />
    <c:if test="${requestJSP eq 'configThema.do'}">
        <c:set var="stijlklasse" value="activemenulink" />
    </c:if>
    <html:link page="/configThema.do" styleClass="${stijlklasse}" module=""><fmt:message key="commons.configmenu.thema"/></html:link>

    <c:set var="stijlklasse" value="menulink" />
    <c:if test="${requestJSP eq 'configGegevensbron.do'}">
        <c:set var="stijlklasse" value="activemenulink" />
    </c:if>
    <html:link page="/configGegevensbron.do" styleClass="${stijlklasse}" module=""><fmt:message key="commons.configmenu.gegevensbron"/></html:link>

    <c:set var="stijlklasse" value="menulink" />
    <c:if test="${requestJSP eq 'configKaartGroep.do'}">
        <c:set var="stijlklasse" value="activemenulink" />
    </c:if>
    <html:link page="/configKaartGroep.do" styleClass="${stijlklasse}" module=""><fmt:message key="commons.configmenu.cluster"/></html:link>

    <c:set var="stijlklasse" value="menulink" />
    <c:if test="${requestJSP eq 'configZoekConfiguratie.do'}">
        <c:set var="stijlklasse" value="activemenulink" />
    </c:if>
    <html:link page="/configZoekConfiguratie.do" styleClass="${stijlklasse}" module=""><fmt:message key="commons.configmenu.zoeker"/></html:link>

    <c:set var="stijlklasse" value="menulink" />
    <c:if test="${requestJSP eq 'configRolPrio.do'}">
        <c:set var="stijlklasse" value="activemenulink" />
    </c:if>
    <html:link page="/configRolPrio.do" styleClass="${stijlklasse}" module=""><fmt:message key="commons.configmenu.instellingen"/></html:link>

    <c:set var="stijlklasse" value="menulink" />
    <c:if test="${requestJSP eq 'index.do'}">
        <c:set var="stijlklasse" value="activemenulink" />
    </c:if>
    <html:link page="/index.do" styleClass="${stijlklasse}" module=""><fmt:message key="commons.configmenu.home"/></html:link>
</div>
--%>

<style type="text/css">
ul.topnav {
    list-style: none;
    padding: 0 20px;
    margin: 0;
    margin-top: 10px;
    float: right;
    width: 525px;
    font-size: 1.0em;
}

ul.topnav li {
    float: left;
    margin: 0;  
    position: relative;
    border-left: #A0D9FF 1px solid;
    border-top: #A0D9FF 1px solid;
    border-right: #A0D9FF 1px solid;
    padding-left: 5px;
    padding-right: 5px;
}

ul.topnav li a{
    padding: 10px 5px;
    color: #A0D9FF;
    display: block;
    text-decoration: none;
    float: left;
}

ul.topnav li span { /*--Drop down trigger styles--*/
    width: 17px;
    height: 35px;
    float: left;
    background-image: url(../../../gisviewerconfig/images/menu/subnav_btn.gif);
    background-repeat: no-repeat;
    background-position: top center;
}

ul.topnav li span.subhover {
    background-position: bottom center;
    cursor: pointer;
}

ul.topnav li ul.subnav {
    z-index: 1; /* Anders valt submenu achter hoofdscherm */
    list-style: none;
    position: absolute; /* Important-Keeps subnav from affecting main navigation */
    left: 0; top: 35px;
    background: #333;
    margin: 0; padding: 0;
    display: none;
    float: left;
    width: 170px;
    border: 1px solid #111;
}

ul.topnav li ul.subnav li{
    margin: 0; padding: 0;
    border-top: 1px solid #252525; /*--Create bevel effect--*/
    border-bottom: 1px solid #444; /*--Create bevel effect--*/
    clear: both;
    width: 170px;
}

html ul.topnav li ul.subnav li a {
    float: left;
    width: 145px;
    background-color: #196299;
    background-image: url(../../../gisviewerconfig/images/menu/dropdown_linkbg.gif);
    background-repeat: no-repeat;
    background-position: 10px;
    padding-left: 20px;
}

html ul.topnav li ul.subnav li a:hover { /*--Hover effect for subnav links--*/
    background-color: #183C56; /* geel #FFD203 */
    background-image: url(../../../gisviewerconfig/images/menu/dropdown_linkbg.gif);
    background-repeat: no-repeat;
    background-position: 10px;
}
</style>

<ul class="topnav">
    <li><html:link page="/index.do" module=""><fmt:message key="commons.configmenu.home"/></html:link></li>
    <li><html:link page="/configRolPrio.do" module=""><fmt:message key="commons.configmenu.instellingen"/></html:link></li>
    <li>
        <a href="#">Kaarten</a>
        <ul class="subnav">
            <li><html:link page="/configThema.do" module=""><fmt:message key="commons.configmenu.thema"/></html:link></li>
            <li><html:link page="/configKaartGroep.do" module=""><fmt:message key="commons.configmenu.cluster"/></html:link></li>
            <li><html:link page="/configThemaData.do" module=""><fmt:message key="commons.configmenu.themadata"/></html:link></li>
        </ul>
    </li>
    <li>
        <a href="#">Bronnen</a>
        <ul class="subnav">
            <li><html:link page="/configConnectie.do" module=""><fmt:message key="commons.configmenu.connectie"/></html:link></li>
            <li><html:link page="/configGegevensbron.do" module=""><fmt:message key="commons.configmenu.gegevensbron"/></html:link></li>
        </ul>
    </li>
    <li>
        <a href="#">Zoeken</a>
        <ul class="subnav">
            <li><html:link page="/configZoekConfiguratie.do" module=""><fmt:message key="commons.configmenu.zoeker"/></html:link></li>
        </ul>
    </li>

    <li><html:link page="/configCMS.do" module=""><fmt:message key="commons.configmenu.cms"/></html:link></li>
    <li><html:link target="_blank" page="/help.do" module=""><fmt:message key="commons.configmenu.help"/></html:link></li>
</ul>

<script type="text/javascript">
$j(document).ready(function(){
	$j("ul.subnav").parent().append("<span></span>");

	$j("ul.topnav li span").click(function() {
            $j(this).parent().find("ul.subnav").slideDown('fast').show();
            $j(this).parent().hover(function() {
            }, function(){
		$j(this).parent().find("ul.subnav").slideUp('slow'); 
	});
	
	}).hover(function() {
		$j(this).addClass("subhover");
	}, function(){  //On Hover Out
		$j(this).removeClass("subhover");
	});
});
</script>