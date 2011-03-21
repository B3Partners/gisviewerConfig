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

    lnk.innerHTML = item.title ? item.title : item.id;
    lnk.className='gbEditLink';
    lnk.href = 'configGegevensbron.do?edit=submit&gegevensbronID='+item.id;

    return lnk;
}

function createFolderIcon() {
    var folderIcon = document.createElement("img");

    folderIcon.src = "images/treeview/folder.png";
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
    dwr.util.removeAllOptions('admin_tabel_select');
    dwr.util.removeAllOptions('admin_pk_select');
    
    dwr.util.addOptions("admin_tabel_select",[""]);
    dwr.util.addOptions("admin_tabel_select",list,"0","1");

    var data = [ { value:"", label:"Kies eerst tabel of feature...." } ];
    
    dwr.util.addOptions("admin_pk_select", data, "value", "label");
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