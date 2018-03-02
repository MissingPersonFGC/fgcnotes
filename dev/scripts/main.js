// Parse the filename to match it to the game shorthand.

let fileName = null;

if (document.location.href.match(/[^\/]+$/) != null) {
  fileName = document.location.href.match(/[^\/]+$/)[0].split(`.html`);

  fileName.pop();

  fileName = fileName[0].toString();
}

// Assign empty variables to hold the entire database outside of Tabletop.

let fgcDB = null;

let characterList = [];

let gameNotes = [];

let gameList = [];


// Access Google Sheet;

const publicSpreadsheetUrl = 'https://docs.google.com/spreadsheets/d/19HR6knMWzdqtdhWucRAa3uXQfLsOO3SuUQE_MPL-LFE/pubhtml';

  function init() {
    Tabletop.init( { key: publicSpreadsheetUrl,
                     callback: showInfo,
                     simpleSheet: false} )
  }

  function showInfo(data, tabletop) {
    // Return database outside of Tabletop.
    fgcDB = data;

    // Pull the game list into its own array.
    for (let i = 0; i < fgcDB.gameData.elements.length; i = i + 1) {
      gameList.push(fgcDB.gameData.elements[i]);
    }

    // Sorting the character select drop downs by the array
    $(document).ready(function(){

      // Append game list into drop down box on index.
      for (let i = 0; i < gameList.length; i = i + 1) {
        $(`select.your-game`).append(`<option value=${gameList[i].gameShorthand}>${gameList[i].gameName}</option>`);
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

  // Change the fileName to match the selected option in the game list.

  $(`select.your-game`).change(function() {
    fileName = $(`select.your-game option:selected`).val();

    $(`h1`).text($(`select.your-game option:selected`).text());
    $(`.main-page-head`).css(
      `background`, `linear-gradient(to bottom, rgba(0,0,0,0.6), rgba(0,0,0,0.6)), url('../../img/${fileName}-bg.jpg') bottom/cover no-repeat fixed`
    );

    // Clear the arrays just in case the game changed.
    characterList = [];
    gameNotes = [];

    // Clear the character select lists.

    $(`select.your-character`).empty();
    $(`select.opp-character`).empty();

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

    // Append the character list to the drop downs.

    for (let i = 0; i < characterList.length; i = i + 1) {
      $(`select.your-character`).append(`<option value="${characterList[i].characterShorthand}">${characterList[i].characterName}</option>`);
      $(`select.opp-character`).append(`<option value="${characterList[i].characterShorthand}">${characterList[i].characterName}</option>`);
    }
  });

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
