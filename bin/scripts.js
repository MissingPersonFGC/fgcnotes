// Access Google Sheet;

const publicSpreadsheetUrl = 'https://docs.google.com/spreadsheets/d/19HR6knMWzdqtdhWucRAa3uXQfLsOO3SuUQE_MPL-LFE/pubhtml';

  function init() {
    Tabletop.init( { key: publicSpreadsheetUrl,
                     callback: showInfo,
                     simpleSheet: false,
                      debug: true} )
  }

  function showInfo(data, tabletop) {
    console.log(data);
  }

  window.addEventListener('DOMContentLoaded', init);

$(document).ready(function(){
  // Add smooth scrolling to all links
  $("a").on('click', function(event) {

    // Make sure this.hash has a value before overriding default behavior
    if (this.hash !== "") {
      // Prevent default anchor click behavior
      event.preventDefault();

      // Store hash
      var hash = this.hash;

      // Using jQuery's animate() method to add smooth page scroll
      // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 800, function(){

        // Add hash (#) to URL when done scrolling (default click behavior)
        window.location.hash = hash;
      });
    } // End if
  });
});

// Page Transitions
$(document).ready(function() {
  $("body").css("display", "none");
  $("body").fadeIn(1000);
});

$("main a.external").click(function(event){
  event.preventDefault();
  linkLocation = this.href;
  $("body").fadeOut(500, redirectPage);
});

function redirectPage() {
  window.location = linkLocation;
}

// Show notes pertaining to character matchups

$(document).ready(function() {
  $('.show-notes').click(function() {
    $('.show').removeClass('show');
    const yourChar = $("select[name='your-character'] option:selected").val();
    const oppChar = $("select[name='opp-character'] option:selected").val();
    const charNote = $('.' + yourChar + '-v-' + oppChar);
    $('.char-notes .wrapper').addClass('show');
    $(charNote).addClass('show');

    // Force visible list items to top of list
    $('ul').each(function() {
      $(this).children('.show').prependTo(this);
    });

    // Filter notes by type of note
    $('.filter').click(function() {
      $('li.show').removeClass('show');
      var filter = $("select[name='note-filter'] option:selected").val();
      var filterNote = $("." + filter);
      $(filterNote).addClass('show');

      // Force filtered items to top of list
      $('ul').each(function(){
        $(this).children('.show').prependTo(this);
      });

      // Reset the filter
      $('.show-all').click(function() {
        var yourChar = $("select[name='your-character'] option:selected").val();
        var oppChar = $("select[name='opp-character'] option:selected").val();
        var charNote = $('.' + yourChar + '-v-' + oppChar);
        $(charNote).addClass('show');

        //Just ensuring nothing breaks on prepending
        $('ul').each(function() {
          $(this).children('.show').prependTo(this);
        });
      });
    });
  });
});

// List box sorting

$(document).ready(function(){
  $(".your-character option").sort(dec_sort).appendTo(".your-character");
  $(".opp-character option").sort(dec_sort).appendTo(".opp-character");
  $(".game option").sort(dec_sort).appendTo(".game");
  $(".opponent option").sort(dec_sort).appendTo(".opponent");
  $(".note-filter option").sort(dec_sort).appendTo(".note-filter");

  function asc_sort(a, b){
    return ($(b).text()) < ($(a).text()) ? 1 : -1;
  }

  function dec_sort(a, b){
    return ($(b).text()) > ($(a).text()) ? 1 : -1;
  }
});


//GUILE'S THEME GOES WITH EVERYTHING!
var kkeys = [], konami = "38,38,40,40,37,39,37,39,66,65";

$(document).keydown(function(e) {

  kkeys.push( e.keyCode );

  if ( kkeys.toString().indexOf( konami ) >= 0 ) {

    $(document).unbind('keydown',arguments.callee);

    var snd = new Audio("media/guilestheme.mp3");
    snd.play();
    $('body').addClass('konami');
    $('body').trigger('konami.codeFired');
  }
});

// Move list items that are shown to top of the page
