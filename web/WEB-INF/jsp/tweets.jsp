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
<script type="text/javascript" src="<html:rewrite page='/scripts/jquery.tweet/jquery.tweet.js' module=''/>"></script>
<script type="text/javascript" src="<html:rewrite page='/scripts/jcarousellite_1.0.1.min.js' module=''/>"></script>
<script type="text/javascript" src="<html:rewrite page='/scripts/jquery.mousewheel.min.js' module=''/>"></script>
<script type="text/javascript">
     var showtweets = true; // Laat de twitterfeed zien
     var showticker = false; // Laat de twitterfeed automatisch langsscrollen
     var showtimes = true; // Laat de tijden zien, wanneer het bericht geplaatst is

     if(showtweets) {
         $j(document).ready(function(){
             $j(".tweet").tweet({
                 avatar_size: "48px",
                 count: 10,
                 loading_text: "Bezig met laden van nieuwsberichten ...",
                 username: "B3Partners",
                 query: "#B3pGisSuite",
                 seconds_text: " seconden geleden",
                 minute_text: " een minuut geleden",
                 minutes_text: " minuten geleden",
                 hour_text: " een uur geleden",
                 hours_text: " uren geleden",
                 day_text: " een dag geleden",
                 days_text: " dagen geleden",
                 about_text: " ongeveer "
             }).bind("empty", function() {
                 $j(".tweet").html("<p>Geen nieuwsberichten gevonden</p>")
             }).bind("full", function() {
                 if(showticker) {
                     // set fixed height for li's
                     var maxheight = 0;
                     $j(".tweet li").each(function() {
                         if($j(this).height() > maxheight) maxheight = $j(this).height();
                     });
                     $j(".tweet li").height(maxheight);
                     $j(".tweet").jCarouselLite({
                        vertical: true,
                        visible: 5,
                        auto: 4000,
                        speed: 1000,
                        mouseWheel: true
                    });
                    $j(".configprio_right").css("overflow", "hidden");
                 }
                 if(!showtimes) {
                     $j(".tweet .tweet_list .tweet_time").hide();
                 }
             });
         });
     } else {
        $j(".configprio_right").hide();
     }

</script>