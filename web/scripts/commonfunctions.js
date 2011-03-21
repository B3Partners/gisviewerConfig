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
/*Hulp functions*/
//contains on array function
function arrayContains(array,element) {
    for (var i = 0; i < array.length; i++) {
        if (array[i] == element) {
            return true;
        }
    }
    return false;
}
// jQuery gives problems with DWR - util.js, so noConflict mode. Usage for jQuery selecter becomes $j() instead of $()
$j = jQuery.noConflict();

attachOnload = function(onloadfunction) {
    if(typeof(onloadfunction) == 'function') {
        var oldonload=window.onload;
        if(typeof(oldonload) == 'function') {
            window.onload = function() {
                oldonload();
                onloadfunction();
            }
        } else {
            window.onload = function() {
                onloadfunction();
            }
        }
    }
}

var resizeFunctions = new Array();
resizeFunction = function() {
    for(i in resizeFunctions) {
        resizeFunctions[i]();
    }
}
window.onresize = resizeFunction;

attachOnresize = function(onresizefunction) {
    if(typeof(onresizefunction) == 'function') {
        resizeFunctions[resizeFunctions.length] = onresizefunction;
    }
}

checkLocation = function() {
    if (top.location != self.location)
        top.location = self.location;
}

checkLocationPopup = function() {
   if(!usePopup) {
        if (top.location == self.location) {
            top.location = '/gisviewerconfig/index.do';
        }
    }
}

getIEVersionNumber = function() {
    var ua = navigator.userAgent;
    var MSIEOffset = ua.indexOf("MSIE ");
    if (MSIEOffset == -1) {
        return -1;
    } else {
        return parseFloat(ua.substring(MSIEOffset + 5, ua.indexOf(";", MSIEOffset)));
    }
}
var ieVersion = getIEVersionNumber();

function findPos(obj) {
    var curleft = curtop = 0;
    if (obj.offsetParent) {
        do {
            curleft += obj.offsetLeft;
            curtop += obj.offsetTop;
        } while (obj = obj.offsetParent);
    }
    return [curleft,curtop];
}

function showHelpDialog(divid) {
    $j("#" + divid).dialog({
        resizable: true,
        draggable: true,
        show: 'slide',
        hide: 'slide',
        autoOpen: false
    });
    $j("#" + divid).dialog('open');
    return false;
}