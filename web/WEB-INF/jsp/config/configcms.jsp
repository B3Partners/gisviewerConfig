<%@include file="/WEB-INF/jsp/taglibs.jsp" %>
<%@ page isELIgnored="false"%>

<script type="text/javascript" src="<html:rewrite page="/scripts/ckeditor/ckeditor.js"/>"></script>

<c:set var="form" value="${cmsForm}"/>
<c:set var="action" value="${form.map.action}"/>
<c:set var="mainid" value="${form.map.tekstBlokID}"/>

<c:set var="save" value="${action == 'save'}"/>
<c:set var="delete" value="${action == 'delete'}"/>

<c:set var="focus" value="titel"/>

<div class="infobalk">
    <div class="infobalk_description">CMS CONFIGURATIE</div>
    <div class="infobalk_actions"><tiles:insert name="loginblock"/></div>
</div>

<html:javascript formName="connectieForm" staticJavascript="false"/>
<html:form action="/configCMS" onsubmit="return validateCMSForm(this)" focus="${focus}">
    <div style="display: none;">
        <html:hidden property="action"/>
        <html:hidden property="alt_action"/>
        <html:hidden property="tekstBlokID"/>
        <input type="hidden" name="refreshLists">
    </div>
    <c:if test="${!empty tekstBlokken}">
        <div class="tablesortercontainer">
            <table id="connectietable" class="tablesorter">
                <thead>
                    <tr>
                        <th style="width: 10%;" class="{sorter:'digit'}">Volgorde</th>
                        <th style="width: 25%;">Titel</th>
                        <th style="width: 25%;">Url</th>
                        <th style="width: 10%;">Toon url</th>
                        <th style="width: 15%;">Pagina</th>
                        <th style="width: 15%;">Datum</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="ci" varStatus="status" items="${tekstBlokken}">
                        <c:set var="id_selected" value="" />
                        <c:if test="${ci.id == mainid}"><c:set var="id_selected" value='selected' /></c:if>
                        <c:url var="link" value="/configCMS.do?edit=submit&tekstBlokID=${ci.id}"/>
                        <tr>
                            <td><c:out value="${ci.volgordeNr}"/></td>
                            <td><c:out value="${ci.titel}"/><input type="hidden" name="link" value="${link}" /><input type="hidden" name="selected" value="${id_selected}" /></td>
                            <td><c:out value="${ci.url}"/></td>
                            <td>
                                <c:if test="${ci.toonUrl}">
                                    <c:out value="Ja"/>
                                </c:if>
                                <c:if test="${!ci.toonUrl}">
                                    <c:out value="Nee"/>
                                </c:if>
                            </td>
                            <td><c:out value="${ci.pagina}"/></td>
                            <td><c:out value="${ci.cdate}"/></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </c:if>

    <div id="content_style" style="float: left; clear: left;">
        <div class="berichtenbalk" style="margin-top: 5px;">
            <tiles:insert definition="actionMessages"/>
       </div>

        <div class="maintable" style="margin-top: 5px;">
            
            <table cellpadding="2" cellspacing="2" border="0">
                <tr>
                    <td>Titel</td>
                    <td colspan="3">
                        <html:text property="titel" size="40"/>
                    </td>
                </tr>
                <tr>
                    <td>Tekst</td>
                    <td colspan="3">
                        <html:textarea styleClass="ckeditor" property="tekst" rows="8" cols="100"/>
                    </td>
                </tr>
                <tr>
                    <td>Url</td>
                    <td colspan="3">
                        <html:text property="url" size="40"/>
                    </td>
                </tr>
                <tr>
                    <td>Toon url</td>
                    <td colspan="3">
                        <html:checkbox property="toonUrl" />
                    </td>
                </tr>
                <tr>
                    <td>Pagina</td>
                    <td colspan="3">
                        <html:select property="pagina">
                            <html:option value="gisviewer_home">Gisviewer home</html:option>
                            <html:option value="gisviewer_help">Gisviewer help</html:option>
                            <html:option value="gisviewer_login">Gisviewer login</html:option>
                            <html:option value="gisviewer_tab">Gisviewer tabblad</html:option>
                            <html:option value="config_home">Gisviewerconfig home</html:option>
                            <html:option value="config_help">Gisviewerconfig help</html:option>
                        </html:select>
                    </td>
                </tr>
                <tr>
                    <td>Volgorde</td>
                    <td colspan="3">
                        <html:text property="volgordeNr" size="10"/>
                    </td>
                </tr>
            </table>
        </div>

        <div class="knoppenbalk">
            <!-- Bij nieuw alleen opslaan en annuleren tonen -->
            <c:if test="${empty form.map.tekstBlokID}">
                <div class="knoppen">
                    <html:submit property="save" accesskey="s" styleClass="knop" onmouseover="this.className='knopover';" onmouseout="this.className='knop';" onclick="return confirm('Weet u zeker dat u dit tekstblok wilt opslaan?');">
                        <fmt:message key="button.save"/>
                    </html:submit>
                </div>
                <div class="knoppen">
                    <input type="button" onclick="window.location='<html:rewrite page='/configCMS.do' />'" value="<fmt:message key='button.cancel'/>" />
                </div>
            </c:if>

            <!-- Bij bewerken nieuw, wissen en opslaan tonen -->
            <c:if test="${!empty form.map.tekstBlokID}">
                <div class="knoppen">
                    <html:submit property="create" accesskey="n" styleClass="knop" onmouseover="this.className='knopover';" onmouseout="this.className='knop';">
                        <fmt:message key="button.new"/>
                    </html:submit>
                </div>
                <div class="knoppen">
                    <html:submit property="delete" accesskey="d" styleClass="knop" onclick="return confirm('Weet u zeker dat u dit tekstblok wilt verwijderen?');" onmouseover="this.className='knopover';" onmouseout="this.className='knop';">
                        <fmt:message key="button.remove"/>
                    </html:submit>
                </div>
                <div class="knoppen">
                    <html:submit property="save" accesskey="s" styleClass="knop" onmouseover="this.className='knopover';" onmouseout="this.className='knop';" onclick="return confirm('Weet u zeker dat u dit tekstblok wilt opslaan?');">
                        <fmt:message key="button.save"/>
                    </html:submit>
                </div>
            </c:if>
        </div>
    </div>
</html:form>
<script type="text/javascript">
    var globalrows;
    tablepager(
        'connectietable',
        '900',
        '14',
        false // display numberOfPages dropdown
    );
</script>