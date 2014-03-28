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
<%@ page isELIgnored="false"%>

<div class="infobalk">
    <div class="infobalk_description">CYCLOMEDIA INSTELLINGEN</div>
    <div class="infobalk_actions"><tiles:insert name="loginblock"/></div>
</div>

<div class="berichtenbalk" style="margin-top: 5px;">
    <tiles:insert definition="actionMessages"/>
</div>

<span class="rolnaamHeader">
    Instellingen voor <b>'${header_appnaam}'</b>.
</span>

<html:form action="/configCyclomedia" enctype="multipart/form-data">           
    <html:hidden property="action" />
    <html:hidden property="alt_action" />
    <html:hidden property="appcode" />

    <div class="ie7clear"></div>
    <div style="float: left; clear: both; width: 920px; margin-left: 15px; margin-bottom: 5px; margin-top: 25px;">
        <div style="float: left; margin-left: 155px;">
            <input type="checkbox" id="advancedToggle" data-cookie-key="cyclomedia" /> Toon geavanceerde opties
        </div>
        <div style="float: right;">
            <input type="button" class="knop backButton" onclick="window.location='<html:rewrite page='/configApplicatie.do' />'" value="<fmt:message key='button.back'/>" />
            
            <html:submit property="save" accesskey="s" styleClass="knop saveButton" onclick="return confirm('Weet u zeker dat u dit wilt opslaan?');">
                Opslaan
            </html:submit>
        </div>
    </div>
    <div class="ie7clear"></div>

    <div class="tablabels">        
        <div class="tablabel" id="label_cyclomedia">
            Cyclomedia
        </div>        
    </div>

    <div class="tabcontents">
                    
        <div class="tabcontent content_cyclomedia">
            <div class="configbasic">
                <div class="configrow">
                    <label><fmt:message key="cfg_cyclo_apikey.label"/></label>
                    <html:text property="cfg_cyclo_apikey" size="80"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_cyclo_apikey">(?)</a>
                    <div id="help_cfg_cyclo_apikey" style="display: none;" title="<fmt:message key="cfg_cyclo_apikey.label"/>">
                        <fmt:message key="cfg_cyclo_apikey.uitleg"/>
                    </div>
                </div>
                <div class="configrow">
                    <label><fmt:message key="cfg_cyclo_accountid.label"/></label>
                    <html:text property="cfg_cyclo_accountid" size="10"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_cyclo_accountid">(?)</a>
                    <div id="help_cfg_cyclo_accountid" style="display: none;" title="<fmt:message key="cfg_cyclo_accountid.label"/>">
                        <fmt:message key="cfg_cyclo_accountid.uitleg"/>
                    </div>
                </div>                
                <div class="configrow">
                    <label><fmt:message key="cfg_cyclo_wachtwoord.label"/></label>
                    <html:password property="cfg_cyclo_wachtwoord" size="10"/>
                    <a class="helpLink" href="#" id="helpLink_help_cfg_cyclo_wachtwoord">(?)</a>
                    <div id="help_cfg_cyclo_wachtwoord" style="display: none;" title="<fmt:message key="cfg_cyclo_wachtwoord.label"/>">
                        <fmt:message key="cfg_cyclo_wachtwoord.uitleg"/>
                    </div>
                </div>
                <div class="configrow">
                    <label><fmt:message key="cfg_cyclo_keybestand.label"/></label>
                    <html:file size="30" property="cfg_cyclo_keybestand" />
                    <a class="helpLink" href="#" id="helpLink_help_cfg_cyclo_keybestand">(?)</a>
                    <div id="help_cfg_cyclo_keybestand" style="display: none;" title="<fmt:message key="cfg_cyclo_keybestand.label"/>">
                        <fmt:message key="cfg_cyclo_keybestand.uitleg"/>
                    </div>
                </div>
            </div>

            <div class="configadvanced">
                <div class="configrow">
                    <label><fmt:message key="cfg_cyclo_privatebase64key.label"/></label>
                    <html:textarea property="cfg_cyclo_privatebase64key" rows="5" cols="80" />
                    <a class="helpLink" href="#" id="helpLink_help_cfg_cyclo_privatebase64key">(?)</a>
                    <div id="help_cfg_cyclo_privatebase64key" style="display: none;" title="<fmt:message key="cfg_cyclo_privatebase64key.label"/>">
                        <fmt:message key="cfg_cyclo_privatebase64key.uitleg"/>
                    </div>
                </div>
            </div>
        </div>
        
        </div>
    </div>
    <div class="clearBoth"></div>
</html:form>

<script type="text/javascript" src="<html:rewrite page="/scripts/configkeeper.js"/>"></script>