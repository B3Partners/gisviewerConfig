<%@include file="/WEB-INF/jsp/taglibs.jsp" %>

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

    <%--
    <c:set var="stijlklasse" value="menulink" />
    <c:if test="${requestJSP eq 'configCluster.do'}">
        <c:set var="stijlklasse" value="activemenulink" />
    </c:if>
    <html:link page="/configCluster.do" styleClass="${stijlklasse}" module=""><fmt:message key="commons.configmenu.cluster"/></html:link>
    --%>

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