ieFixes = function() {
    fixMenu();
    if(ieVersion <= 6 && ieVersion != -1) {
        fixAbsolutePositions();
        attachOnresize(fixAbsolutePositions);
    }
}
attachOnload(ieFixes);

fixMenu = function() {
    var topmenu = document.getElementById('topmenu');
    var menuitems = topmenu.getElementsByTagName('a');
    var totalmenuwidth = 0;
    var x = 0;
    for(x in menuitems) {
        if(menuitems[x].className == 'activemenulink' || menuitems[x].className == 'menulink') {
            totalmenuwidth += menuitems[x].offsetWidth;
        }
    }
    topmenu.style.width = (totalmenuwidth + 5) + 'px';
}

fixAbsolutePositions = function() {
    var footerheight = 0; var headerheight = 0;
    headerheight = document.getElementById('header').offsetHeight;
    var footer = document.getElementById('footer');
    if(footer) footerheight = footer.offsetHeight;

    var content_viewer = document.getElementById('content_viewer');
    if(content_viewer) {
        content_viewer.style.height = (content_viewer.offsetParent.offsetHeight - headerheight - footerheight) + 'px';
        content_viewer.style.width = (content_viewer.offsetParent.offsetWidth) + 'px';
    }

    var content_normal = document.getElementById('content_normal');
    if(content_normal) {
        content_normal.style.height = (content_normal.offsetParent.offsetHeight - headerheight - footerheight) + 'px';
        if(content_normal.scrollHeight > content_normal.offsetHeight) content_normal.style.marginLeft = '30px;';
    }
    var content = document.getElementById('content');
    if(content) {
        content.style.height = content.offsetParent.offsetHeight + 'px';
        content.style.overflow = 'auto';
    }
    var footer_normal = document.getElementById('footer_normal');
    if(footer_normal) footer_normal.style.bottom = '0px';
    if(footer) footer.style.bottom = '0px';
}