<%@include file="/WEB-INF/jsp/taglibs.jsp" %>

<c:set var="requestURI" value="${fn:split(requestScope['javax.servlet.forward.request_uri'], '/')}" />
<c:set var="requestJSP" value="${requestURI[fn:length(requestURI) - 1]}" />

<c:set var="links">
	<a class="*" href="configKeeper.do">Config Keeper</a>%<a class="*" href="configZoekConfiguratie.do"><fmt:message key="commons.configmenu.zoeker"/></a>%<a class="*" href="configConnectie.do"><fmt:message key="commons.configmenu.connectie"/></a>%<a class="*" href="configThemaData.do"><fmt:message key="commons.configmenu.themadata"/></a>%<a class="*" href="configCluster.do"><fmt:message key="commons.configmenu.cluster"/></a>%<a class="*" href="configThema.do"><fmt:message key="commons.configmenu.thema"/></a>%<a class="*" href="index.do"><fmt:message key="commons.configmenu.home"/></a>
</c:set>

<div id="topmenu">
    <c:set var="lnkArray" value="${fn:split(links, '%')}" />


    <c:if test="${requestJSP eq 'index.do'}">
        <c:set var="activelink" value="6" />
    </c:if>
    <c:if test="${requestJSP eq 'configThema.do'}">
        <c:set var="activelink" value="5" />
    </c:if>
    <c:if test="${requestJSP eq 'configCluster.do'}">
        <c:set var="activelink" value="4" />
    </c:if>
    <c:if test="${requestJSP eq 'configThemaData.do'}">
        <c:set var="activelink" value="3" />
    </c:if>
    <c:if test="${requestJSP eq 'configConnectie.do'}">
        <c:set var="activelink" value="2" />
    </c:if>
    <c:if test="${requestJSP eq 'configZoekConfiguratie.do'}">
        <c:set var="activelink" value="1" />
    </c:if>

    <c:forEach items="${lnkArray}" var="link" varStatus="counter">
        <c:choose>
            <c:when test="${counter.count == activelink}">
                <c:out value="${fn:replace(link, '*', 'activemenulink')}" escapeXml="false" />
            </c:when>
            <c:otherwise>
                <c:out value="${fn:replace(link, '*', 'menulink')}" escapeXml="false" />
            </c:otherwise>
        </c:choose>
    </c:forEach>
</div>