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
// Trim polyfill
if (typeof String.prototype.trim !== 'function') {
    String.prototype.trim = function() {
        return this.replace(/^\s+|\s+$/g, '');
    };
}

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

(function(B3PConfig) {
    B3PConfig.cookie = {
        createCookie: function(name,value,days) {
            var expires;
            if (days) {
                var date = new Date();
                date.setTime(date.getTime()+(days*24*60*60*1000));
                expires = "; expires="+date.toGMTString();
            }
            else expires = "";
            document.cookie = name+"="+value+expires+"; path=/";
        },
        readCookie: function(name) {
            var nameEQ = name + "=";
            var ca = document.cookie.split(';');
            for(var i=0;i < ca.length;i++) {
                var c = ca[i];
                while (c.charAt(0)==' ') c = c.substring(1,c.length);
                if (c.indexOf(nameEQ) === 0) return c.substring(nameEQ.length,c.length);
            }
            return null;

        },
        eraseCookie: function(name) {
            this.createCookie(name,"",-1);
        }
    };
})(window.B3PConfig || (window.B3PConfig = {}));

(function(B3PConfig, $) {
    B3PConfig.advancedToggle = {
        config: {
            advancedclass: '.configadvanced',
            advancedtoggle: '#advancedToggle',
            cookiename: 'advancedtoggle'
        },
        advancedToggle: null,
        advancedItems: [],
        init: function() {
            var me = this, useAdvancedToggle = false;
            me.advancedToggle = $(me.config.advancedtoggle);
            me.advancedItems = $(me.config.advancedclass);
            me.advancedItems.each(function() { 
                if($(this).html().trim() !== '') useAdvancedToggle = true;
            });
            if(B3PConfig.cookie.readCookie(me.getCookiename()) !== null) {
                me.advancedToggle[0].checked = B3PConfig.cookie.readCookie(me.getCookiename()) === 'on';
            }
            if(useAdvancedToggle) {
                me.advancedToggle.click(function(){
                    me.showHideAdvanced();
                });
                me.showHideAdvanced();
            } else {
                me.advancedToggle.parent().hide();
            }
        },
        showHideAdvanced: function () {
            var showAdvancedOptions = this.advancedToggle.is(':checked');
            B3PConfig.cookie.createCookie(this.getCookiename(), showAdvancedOptions ? 'on' : 'off', 7);
            showAdvancedOptions ? this.advancedItems.show() : this.advancedItems.hide();
        },
        getCookiename: function() {
            return this.config.cookiename + (this.advancedToggle.data('cookie-key') ? '-' + this.advancedToggle.data('cookie-key') : '');
        }
    };
})(window.B3PConfig || (window.B3PConfig = {}), jQuery);

var prevTab = null;
var fbLbl;
function labelClick($lbl) {
    if(prevTab != null) prevTab.hide();
    prevTab = $j(".content_"+$lbl.attr("id").replace("label_", ""));
    prevTab.show();
    $j(".tablabel").removeClass("active");
    $lbl.addClass("active");
}

var showAdvancedOptions = false;
var contentMinHeight = 300;
$j(document).ready(function() {
    contentMinHeight = $j(".tablabels").outerHeight(true)+20;
    if($j("#treedivContainer").length > 0) contentMinHeight = $j("#treedivContainer").outerHeight(true)+20;
    $j(".tabcontent").each(function (){
        var counter = 0;
        $j(this).find(".configrow").each(function() {
            var $this = $j(this);
            if(counter%2==1) $this.addClass("odd");
            counter++;

            $this.find(".helpLink").each(function (){
                if($j(this).attr("id") && $j(this).attr("id") != 'undefined')
                {
                    var $helpContentDiv = $j("#" + $j(this).attr("id").replace("helpLink_", ""));
                    var helpContent = $helpContentDiv.html();
                    var helpTitle = $helpContentDiv.attr("title");
                    $j(this).qtip({
                        content: {
                            text: helpContent,
                            title: helpTitle
                        },
                        hide: {
                            event: 'mouseout'
                        },
                        show: {
                            event: 'click mouseenter'
                        },
                        position: {
                            my: 'right top',
                            at: 'left middle',
                            target: $j(this),
                            viewport: $j(window),
                            adjust: {
                                x: -10
                            }
                        }
                    });
                }
            });
        });
        if(!$j(this).hasClass("defaulttab")) $j(this).hide();
    });
    
    $j(".tablabel").each(function() {
        $j(this).click(function() {
            labelClick($j(this));
        });
    });

    B3PConfig.advancedToggle.init();
    
    $j(".tabcontent").css("min-height", contentMinHeight);
    if($j(".tablabel").length != 0) labelClick($j(".tablabel").first());
    
    // Datatables
    var tables = [];
    jQuery('.dataTable').each(function() {
        tables.push(new B3PDataTable(this));
    });
    
    jQuery('.postCheckboxTable').click(function() {
        for(var x in tables) {
            tables[x].showAllRows();
        }
    });
});

/**
 * B3P wrapper for the jQuery DataTables plugin
 * @requires jQuery
 * @requires jQuery.dataTables
 * @param {HTMLElement} table
 * @returns {B3PDataTable}
 */
function B3PDataTable(table) {
    
    /**
     * Setting to preserve table height even when there are less items
     * @type boolean
     */
    this.preserveHeight = true;
    
    /**
     * The jQuery object of the table
     * @type jQuery
     */
    this.table = jQuery(table);

    /**
     * Container for the creation of the DataTable object
     * @type DataTable
     */
    this.dataTableObj = null;

    /**
     * Container for the column settings
     * @type Array
     */
    this.columnSettings = [];
    
    /**
     * Widths for each column
     * @type Array
     */
    this.columnWidths = [];

    /**
     * Header row to hold the filters
     * @type jQuery
     */
    this.filters = jQuery('<tr class="filter"></tr>');

    /**
     * The selected row object
     * @type jQuery
     */
    this.selectedRow = this.table.find('.row_selected');

    /**
     * Container for the DataTable settings
     * @type Object
     */
    this.tableSettings = null;
    
    /**
     * Initializes a B3PDataTable object to create a sortable, filterable DataTable
     * @returns {Boolean}
     */
    this.init = function() {
        // We compute the column widths as soon as possible
        this.columnWidths = this.getColumnWidths();
        var filterCount = this.initHeaders();
        if(this.preserveHeight) var tableHeight = this.calculatePageHeight(filterCount);
        var tableSettings = this.initDataTable();
        // If there is no saved state (first time view) go to selected row
        if(tableSettings.oLoadedState === null) {
            this.showSelectedRow();
        }
        this.appendSelectedRowButton();
        if(filterCount !== 0) {
            this.appendFilters();
        }
        this.initRowClick();
        if(this.preserveHeight) this.setWrapperHeight(tableHeight);
        this.showTable();
        return true;
    };
    
    /**
     * Calculate the height of the table header and first 10 rows (first page)
     * @param {int} number of filters
     * @returns {int}
     */
    this.calculatePageHeight = function(filterCount) {
        // Border margin of table
        var borderMargin = 2;
        // Calc header height
        var headerHeight = this.table.find('thead').outerHeight(true) + borderMargin;
        // If there are filters, multiply headerheight by 2
        if(filterCount !== 0) headerHeight = headerHeight * 2;
        // Calc content height
        var contentHeight = 0;
        // Use first 10 rows
        var count = 1;
        this.table.find('tbody').children().slice(0, 10).each(function() {
            contentHeight += jQuery(this).outerHeight(true) + borderMargin;
        });
        var tableHeight = headerHeight + contentHeight + 16; // margin;
        return tableHeight;
    };
    
    /**
     * Sets the minimum height of the wrapper, causing the table to preserve height
     * @param {int} tableHeight
     * @returns {Boolean}
     */
    this.setWrapperHeight = function(tableHeight) {
        var wrapper = this.table.parent();
        // Calculate height of search box and pagination
        var childHeight = 0;
        wrapper.find('.dataTables_filter, .dataTables_paginate').each(function() {
            childHeight += jQuery(this).outerHeight(true);
        });
        // Move info and pagination to the bottom
        jQuery('.dataTables_info, .dataTables_paginate').each(function() {
            var obj = jQuery(this);
            obj.css({
                'position': 'absolute',
                'bottom': '0px'
            });
            if(obj.hasClass('dataTables_paginate')) obj.css('right', '15px');
        });
        // Set wrapper min-height
        wrapper.css({
            'min-height': (childHeight + tableHeight - 19 + 'px') // Subtract 19 pixels for wrapper margin
        });
        return true;
    };
    
    /**
     * Initializes the headers: create column settings and append a filter.
     * Returns the amount of filters created.
     * @returns {int}
     */
    this.initHeaders = function() {
        var me = this, filterCount = 0;
        this.table.find('thead tr').first().find('th').each(function(index) {
            me.columnSettings.push(me.getColumnSettings(this));
            var hasFilter = me.createFilter(this, index);
            if(hasFilter) filterCount++;
        });
        return filterCount;
    };
    
    /**
     * Creates a DataTables column settings object based on some options
     * @param {type} the table header object
     * @returns {Object}
     */
    this.getColumnSettings = function(column) {
        var colSetting = {};
        var sortType = "string";
        if(column.className.match(/sorter\:[ ]?[']?digit[']?/)) {
            sortType = "numeric";
        }
        if(column.className.match(/sorter\:[ ]?[']?dutchdates[']?/)) {
            sortType = "dutchdates";
        }
        if(column.className.match(/sorter\:[ ]?[']?false[']?/)) {
            colSetting.bSortable = false;
        }
        colSetting.sType = sortType;
        colSetting.mRender = function(content, type) {
            if(type === 'filter') {
                // Remove all HTML tags from content to improve filtering
                return content.replace(/<\/?[^>]+>/g, '').trim();
            }
            return content;
        };
        return colSetting;
    };
    
    /**
     * Compute the default width of all columns in the table
     * @returns {Object}
     */
    this.getColumnWidths = function() {
        var i = 0, me = this, columnWidths = [];
        // Wrap all td's in the body in a .tablespan class (taking care of text-overflow and set width to 1px)
        // So we can use the percentages set for the columns as widths
        this.table.find('tbody td').wrapInner(jQuery('<span class="tablespan" style="width: 1px;"></span>'));
        // Set the table to the maximum width (wrapper - 30px padding)
        this.table.css('width', this.table.parent().width() - 30);
        // Loop over first row and add width of each td to array
        this.table.find('tbody tr:first-child td').each(function() {
            columnWidths[i++] = jQuery(this).width();
        });
        // Reset width of table
        this.table.css('width', 'auto');
        // Return array with column widths
        return columnWidths;
    };
    
    /**
     * Sets width on each column to prevent large texts from pushing table off screen
     * @returns {Boolean}
     */
    this.setTablecellWidth = function() {
        var me = this;
        // Loop over all rows
        this.table.find('tbody tr').each(function() {
            // Set index var
            var i = 0;
            // Loop over all cells
            jQuery(this).find('td').each(function() {
                var td = jQuery(this);
                // Add tablespan container when td is empty so widths are consistant
                if(td.is(':empty')) {
                    td.append('<span class="tablespan"></span>');
                }
                // Set the max width
                td.find('.tablespan').css('width', me.columnWidths[i++]);
            });
        });
        return true;
    };
    
    /**
     * Creates a filter box for a column. Returns true if a filter is created
     * @param {type} the table header object
     * @param {type} the column index
     * @returns {Boolean}
     */
    this.createFilter = function(column, index) {
        var me = this, col = jQuery(column);
        if(col.hasClass('no-filter')) {
            // Column has no-filter class, so create empty header
            this.filters.append('<th>&nbsp;</th>');
            return false;
        } else {
            var filter = jQuery('<input type="text" name="filter" title="' + col.text() + '" value="" />').keyup(function(e) {
                me.filterColumn(this.value, index);
            });
            var header = jQuery('<th></th>').append(filter);
            this.filters.append(header);
        }
        return true;
    };
    
    /**
     * Initializes the DataTables plugin and returns the creation settings
     * @returns {Object}
     */
    this.initDataTable = function() {
        var me = this;
        this.dataTableObj = this.table.dataTable({
            "iDisplayLength": 10,
            "bSortClasses": false,
            "aoColumns": this.columnSettings,
            "bStateSave": true,
            "sPaginationType": "full_numbers",
            "oLanguage": {
                "sLengthMenu": "_MENU_ items per pagina",
                "sSearch": "Zoeken:",
                "oPaginate": {
                    "sFirst": "Begin",
                    "sNext": "Volgende",
                    "sPrevious": "Vorige",
                    "sLast": "Einde"
                },
                "sInfo": "Items _START_ tot _END_ van _TOTAL_ getoond",
                "sInfoEmpty": "Geen items gevonden",
                "sInfoFiltered": " - gefilterd (in totaal _MAX_ items)",
                "sEmptyTable": "Geen items gevonden",
                "sZeroRecords": "Geen items gevonden"
            },
            "fnDrawCallback": function() {
                me.setTablecellWidth();
            }
        });
        this.tableSettings = this.dataTableObj.fnSettings();
        return this.tableSettings;
    };
    
    /**
     * Append the button to go to the selected row to the paginiation
     * @returns {Boolean}
     */
    this.appendSelectedRowButton = function() {
        var me = this;
        me.table.parent().find('.dataTables_paginate').append(jQuery('<a>Geselecteerd</a>').addClass('paginate_button').click(function(e){
            e.preventDefault();
            me.showSelectedRow();
        }));
        return true;
    };
    
    /**
     * Append the filter boxes to the table header
     * @returns {Boolean}
     */
    this.appendFilters = function() {
        var me = this;
        // Get saved searches to repopulate field with search value
        me.filters.find('th').each(function(index) {
            var searchCol = me.tableSettings.aoPreSearchCols[index];
            if(searchCol.hasOwnProperty('sSearch') && searchCol.sSearch.length !== 0) {
                jQuery('input', this).val(searchCol.sSearch);
            }
        });
        // Add filters to table
        me.table.find('thead').append(me.filters);
        return true;
    };
    
    /**
     * Attach handlers for clicking a row in the table
     * @returns {Boolean}
     */
    this.initRowClick = function() {
        this.table.find('tbody').delegate("td", "click", function() {
            var row = jQuery(this);
            // Check if there is a link or input (button, checkbox, etc.) present
            if(row.find('a, input').length === 0) {
                // No link or input so navigate to the attached URL
                var link = row.parent().attr('data-link');
                if(link) window.location.href = link;
            }
        });
        return true;
    };
    
    /**
     * Search a single column for a string
     * @param {String} the string to search on
     * @param {int} the index of the columns that needs to be filtered
     * @returns {Boolean}
     */
    this.filterColumn = function(filter, colindex) {
        if(this.dataTableObj === null) return;
        this.dataTableObj.fnFilter( filter, colindex );
        return true;
    };
    
    /**
     * Shows the currently selected row
     * @returns {Boolean}
     */
    this.showSelectedRow = function() {
        if(this.dataTableObj === null) return false;
        this.dataTableObj.fnDisplayRow( this.selectedRow[0] );
        return true;
    };
    
    /**
     * Makes the table visible (table is hidden using CSS and positioning to prevent flicker)
     * @returns {Boolean}
     */
    this.showTable = function() {
        this.table.css({
            'position': 'static',
            'left': '0px'
        });
        return true;
    };
    
    /**
     * Function to show all rows (remove pagination).
     * This is mainly used to post all input fields in a tables
     * @returns {Boolean}
     */
    this.showAllRows = function() {
        var wrapper = this.table.parent(), wrapperHeight = wrapper.height();
        wrapper.css({
            'height': wrapperHeight + 'px',
            'overflow': 'hidden'
        });
        this.table.css({
            'position': 'absolute',
            'left': '-99999px'
        });
        jQuery('<div>Bezig met opslaan...</div>')
                .css({ 'clear': 'both', 'margin-top': '15px;' })
                .insertAfter(jQuery('.dataTables_filter', wrapper));
        jQuery('tbody', this.table).append( this.dataTableObj.fnGetHiddenNodes() );
    };

    /**
     * Install dataTable extensions, needed for some functionality
     */
    (function() {
        if(typeof jQuery.fn.dataTableExt.oSort['dutchdates-asc'] === "undefined") {
            /**
             * Extension to support sorting of dutch formatted dates (dd-mm-yyyy)
             */
            jQuery.fn.dataTableExt.oSort['dutchdates-asc']  = function(a,b) { 
                var x = parseDutchDate(jQuery(a)), y = parseDutchDate(jQuery(b));
                return ((x < y) ? -1 : ((x > y) ?  1 : 0)); 
            }; 
            jQuery.fn.dataTableExt.oSort['dutchdates-desc'] = function(a,b) { 
                var x = parseDutchDate(jQuery(a)), y = parseDutchDate(jQuery(b));
                return ((x < y) ? 1 : ((x > y) ?  -1 : 0)); 
            };
            var parseDutchDate = function(obj) {
                var s = obj.text();
                var hit = s.match(/(\d{2})-(\d{2})-(\d{4})/);
                if (hit && hit.length === 4) return new Date(hit[3], hit[2], hit[1]);
                return new Date(s); 
            };
        }
        if(typeof jQuery.fn.dataTableExt.oApi.fnDisplayRow === "undefined") {
            /**
             * Extension to go to the page containing a specific row
             * We use this extension to go to the selected row
             */
            jQuery.fn.dataTableExt.oApi.fnDisplayRow = function ( oSettings, nRow ) {
                // Account for the "display" all case - row is already displayed
                if ( oSettings._iDisplayLength === -1 ) return;
                // Find the node in the table
                var iPos = -1, iLen=oSettings.aiDisplay.length;
                for( var i=0; i < iLen; i++ ) {
                    if( oSettings.aoData[ oSettings.aiDisplay[i] ].nTr === nRow ) {
                        iPos = i;
                        break;
                    }
                }
                // Alter the start point of the paging display
                if( iPos >= 0 ) {
                    oSettings._iDisplayStart = ( Math.floor(i / oSettings._iDisplayLength) ) * oSettings._iDisplayLength;
                    this.oApi._fnCalculateEnd( oSettings );
                }
                this.oApi._fnDraw( oSettings );
            };
        }
        if(typeof jQuery.fn.dataTableExt.oApi.fnGetHiddenNodes === "undefined") {
            jQuery.fn.dataTableExt.oApi.fnGetHiddenNodes = function ( oSettings ) {
                /* Note the use of a DataTables 'private' function thought the 'oApi' object */
                var anNodes = this.oApi._fnGetTrNodes( oSettings );
                var anDisplay = jQuery('tbody tr', oSettings.nTable);

                /* Remove nodes which are being displayed */
                for ( var i=0 ; i<anDisplay.length ; i++ )
                {
                    var iIndex = jQuery.inArray( anDisplay[i], anNodes );
                    if ( iIndex != -1 )
                    {
                        anNodes.splice( iIndex, 1 );
                    }
                }

                /* Fire back the array to the caller */
                return anNodes;
            };
        }
    })();
    
    /**
     * Execute initialize function
     */
    this.init();
}