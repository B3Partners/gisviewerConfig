/*
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
*/

dwr.engine.setErrorHandler(handler);

function handler(msg) {
    var message = msg;

    if (message != '')
    {
        alert(message);
    }
}

function createLeaf(container, item) {
    container.appendChild(createFolderIcon());
    container.appendChild(document.createTextNode(' '));
    container.appendChild(createEditLink(item));
    //container.appendChild(document.createTextNode(' '));
    //container.appendChild(createLinkToObjectData(item));

    return false;
}

function createEditLink(item){
    var lnk = document.createElement('a');
    
    var label = item.title + ' (' + item.volgorde + ')';

    lnk.innerHTML = item.title ? label : item.id;
    lnk.className='gbEditLink';
    if(pageGegevensbronId != '' && item.id == pageGegevensbronId) lnk.className='gbEditLinkActive';
    lnk.href = 'configGegevensbron.do?edit=submit&gegevensbronID='+item.id;

    return lnk;
}

function createFolderIcon() {
    var folderIcon = document.createElement("img");

    folderIcon.src = "images/icons/gegevensbron.png";
    folderIcon.style.border = '0px none White';
    folderIcon.alt = "edit";
    folderIcon.title = "edit";
    folderIcon.className = 'folderIcon';

    return folderIcon;
}

function createLinkToObjectData(item){
    var lnk = document.createElement('a');
    lnk.innerHTML = '<img src="images/treeview/icon_info.png" border="0" alt="Objectdata bewerken" title="Objectdata bewerken" />';
    lnk.className='tdEditLink';
    lnk.href = 'configThemaData.do?gegevensbronID='+item.id;
    return lnk;
}

function refreshFeatureList(element){    
    if (connectionTypes){
        if (connectionTypes[element.value]){
            currentConnectionType=connectionTypes[element.value];
        }
    }
    var value=element.value;

    JConfigListsUtil.getPossibleFeaturesById(value,handleFeatureList);
}

function handleFeatureList(list){
    if (list != null && list[0] === "SERVICE_ERROR") {
        var append = "request=GetCapabilities&service=WFS&version=1.0.0";
        var serviceUrl = "<a href='" + list[1] + append + "'>Bekijk het verzoek</a>";

        $j("#textBox").html("<p class='textBox'>Fout tijdens ophalen features. " + serviceUrl + "</p>");
    } else {
        $j("#textBox").html("");
    }
    
    dwr.util.removeAllOptions('admin_tabel_select');
    dwr.util.removeAllOptions('admin_pk_select');
    
    dwr.util.addOptions("admin_tabel_select",[""]);
    dwr.util.addOptions("admin_tabel_select",list,"0","1");

    var data = [ {value:"",label:"-Selecteer eerst een tabel-"} ];
    
    dwr.util.addOptions("admin_pk_select", data, "value", "label");
    
    // Handle selected brontype for editable gegevensbron
    updateEditables();
    return true;
}

function refreshAdminAttributeList(element){
    var connid=document.getElementById('connectie_select').value;
    JConfigListsUtil.getPossibleAttributesById(connid,element.value,handleAdminAttributeList);
}

function handleAdminAttributeList(list){
    dwr.util.removeAllOptions('admin_pk_select');
    dwr.util.addOptions("admin_pk_select",[""]);
    dwr.util.addOptions("admin_pk_select",list,"0","1");

    dwr.util.removeAllOptions('admin_fk_select');
    dwr.util.addOptions("admin_fk_select",[""]);
    dwr.util.addOptions("admin_fk_select",list,"0","1");
}

function refreshTheLists(){
    document.forms[0].refreshLists.value="do";
    document.forms[0].submit();
}

function editableChanged(input){
    if(!input.checked){
        $j(':input[name=geometryeditable]')[0].checked = false;
    }
}

function updateEditables (){
    var bronId =  $j("#connectie_select")[0].value;
    JConfigListsUtil.isBronJDBC(bronId,handleBronEditable);
}

function handleBronEditable(isJDBC){
    if(isJDBC){
        $j(':input[name=editable]')[0].disabled = false;
        $j(':input[name=geometryeditable]')[0].disabled = false;
    }else{
        $j(':input[name=editable]')[0].checked = false;
        $j(':input[name=editable]')[0].disabled = true;
        $j(':input[name=geometryeditable]')[0].checked = false;
        $j(':input[name=geometryeditable]')[0].disabled = true;
    }
}

$j(document).ready(function(){
    updateEditables();
});