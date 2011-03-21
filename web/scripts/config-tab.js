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

createTabs = function(containerid) {
    var container = document.getElementById(containerid);
    var tabheaders = container.childNodes;
    for(var i=0; i<tabheaders.length; i++) {
        if(tabheaders[i].nodeName.toUpperCase() == 'DIV') {
            tabheaders[i].onclick = function() { switchTab(this); }
        }
    }
}

var currenttab = null;
var currenttabheader = null;
switchTab = function(obj) {
    if(currenttab != null) {
        currenttab.style.display = 'none';
    }
    if(currenttabheader != null) {
        currenttabheader.className = currenttabheader.className.replace(/ active_tab/, '');
    }
    var contentid = obj.id.replace(/header/, 'content');
    var tab = document.getElementById(contentid);
    tab.style.display = 'block';
    obj.className = obj.className + ' active_tab';
    currenttab = tab;
    currenttabheader = obj;
}

firstTab = function(objid) {
    // Insert cookiefunctions here
    switchTab(document.getElementById(objid));
}