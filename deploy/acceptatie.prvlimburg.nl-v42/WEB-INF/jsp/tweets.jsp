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
                 username: "AtlasLimburg",
                 //query: "#B3pGisSuite",
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