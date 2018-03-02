// Parse the filename to match it to the game shorthand.

let fileName = null;

if (document.location.href.match(/[^\/]+$/) != null) {
  fileName = document.location.href.match(/[^\/]+$/)[0].split(`.html`);

  fileName.pop();

  fileName = fileName[0].toString();

  console.log(fileName);
}

// Assign empty variables to hold the entire database outside of Tabletop.

let fgcDB = null;

const characterList = [];

const gameNotes = [];


// Access Google Sheet;

const publicSpreadsheetUrl = 'https://docs.google.com/spreadsheets/d/19HR6knMWzdqtdhWucRAa3uXQfLsOO3SuUQE_MPL-LFE/pubhtml';

  function init() {
    Tabletop.init( { key: publicSpreadsheetUrl,
                     callback: showInfo,
                     simpleSheet: false} )
  }

  function showInfo(data, tabletop) {
    console.log(data);

    // Return database outside of Tabletop.
    fgcDB = data;

    // Iterate through the character data array and find the characters in the selected game.
    for (let i = 0; i < fgcDB.characterData.elements.length; i = i + 1) {
      if (fgcDB.characterData.elements[i].gameShorthand === fileName) {
        // Return the character objects to their own array. This makes it easier to create the character list.
        characterList.push(fgcDB.characterData.elements[i]);
      }
    }

    // Iterate through the game notes to find all notes that are relevant to the selected game.
    for (let i = 0; i < fgcDB.gameNotes.elements.length; i = i + 1) {
      if (fgcDB.gameNotes.elements[i].gameShorthand === fileName) {
        // Return the notes to their own array.
        gameNotes.push(fgcDB.gameNotes.elements[i]);
      }
    }

    // Sorting the character select drop downs by the array
    $(document).ready(function(){
      for (let i = 0; i < characterList.length; i = i + 1) {
        $(`select.your-character`).append(`<option value="${characterList[i].characterShorthand}">${characterList[i].characterName}</option>`);
        $(`select.opp-character`).append(`<option value="${characterList[i].characterShorthand}">${characterList[i].characterName}</option>`);
      }
    });
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

// Show notes pertaining to character matchups

$(document).ready(function() {

  $('.show-notes').click(function(e) {
    e.preventDefault();
    $('.show').removeClass('show');

    // Remove all the list items before changing characters, else they will start stacking. If you click the same character matcup more than once, it would create redundant list items otherwise.
    $(`ul`).empty();

    // Grab the characters selected from the drop downs.
    const yourChar = $("select[name='your-character'] option:selected").val();
    const oppChar = $("select[name='opp-character'] option:selected").val();

    // Parse the notes for the selected matchup.
    for (let i = 0; i < gameNotes.length; i = i + 1) {
      if (yourChar === gameNotes[i].yourCharacter && oppChar === gameNotes[i].opponentCharacter) {
        // Create the list of notes.
        $(`.notes ul`).append(`<li class="${yourChar}-v-${oppChar} ${gameNotes[i].noteType}">${gameNotes[i].note}</li>`);
        $(`li.${yourChar}-v-${oppChar}`).addClass(`show`);
      }
    }
    $('.char-notes .wrapper').addClass('show');

    // Force visible list items to top of list
    $('ul').each(function() {
      $(this).children('.show').prependTo(this);
    });

    // Filter notes by type of note
    $('.filter').click(function(e) {
      e.preventDefault();
      $('li.show').removeClass('show');
      var filter = $("select[name='note-filter'] option:selected").val();
      var filterNote = $("." + filter);
      $(filterNote).addClass('show');

      // Force filtered items to top of list
      $('ul').each(function(){
        $(this).children('.show').prependTo(this);
      });

      // Reset the filter
      $('.show-all').click(function(e) {
        e.preventDefault();
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


//GUILE'S THEME GOES WITH EVERYTHING!
var kkeys = [], konami = "38,38,40,40,37,39,37,39,66,65";

$(document).keydown(function(e) {

  kkeys.push( e.keyCode );

  if ( kkeys.toString().indexOf( konami ) >= 0 ) {

    $(document).unbind('keydown',arguments.callee);

    var snd = new Audio("../../media/guilestheme.mp3");
    snd.play();
    $('body').addClass('konami');
    $('body').trigger('konami.codeFired');
  }
});

// Move list items that are shown to top of the page
