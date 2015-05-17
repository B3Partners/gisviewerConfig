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

    return false;
}

function createEditLink(item){
    var lnk = document.createElement('a');
    
    var label = item.title + ' (' + item.volgorde + ')';
    
    lnk.innerHTML = item.title ? label : item.id;
    lnk.className='clusterEditLink';
    if(pageClusterId != '' && item.id == pageClusterId) lnk.className='clusterEditLinkActive';
    lnk.href = 'configKaartGroep.do?edit=submit&clusterID='+item.id;
    return lnk;
}

function createFolderIcon() {
    var folderIcon = document.createElement("img");
    folderIcon.src = "images/icons/kaartgroep.png";
    folderIcon.style.border = '0px none White';
    folderIcon.alt = "edit";
    folderIcon.title = "edit";
    folderIcon.className = 'folderIcon';
    return folderIcon;
}