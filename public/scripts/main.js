'use strict';

// Parse the filename to match it to the game shorthand.

var fileName = null;

if (document.location.href.match(/[^\/]+$/) != null) {
  fileName = document.location.href.match(/[^\/]+$/)[0].split('.html');

  fileName.pop();

  fileName = fileName[0].toString();
}

// Assign empty variables to hold the entire database outside of Tabletop.

var fgcDB = null;

var characterList = [];

var gameNotes = [];

var gameList = [];

// Access Google Sheet;

var publicSpreadsheetUrl = 'https://docs.google.com/spreadsheets/d/19HR6knMWzdqtdhWucRAa3uXQfLsOO3SuUQE_MPL-LFE/pubhtml';

function init() {
  Tabletop.init({ key: publicSpreadsheetUrl,
    callback: showInfo,
    simpleSheet: false });
}

function showInfo(data, tabletop) {
  // Return database outside of Tabletop.
  fgcDB = data;

  // Iterate through the character data array and find the characters in the selected game.
  for (var i = 0; i < fgcDB.characterData.elements.length; i = i + 1) {
    if (fgcDB.characterData.elements[i].gameShorthand === fileName) {
      // Return the character objects to their own array. This makes it easier to create the character list.
      characterList.push(fgcDB.characterData.elements[i]);
    }
  }

  // Iterate through the game notes to find all notes that are relevant to the selected game.
  for (var _i = 0; _i < fgcDB.gameNotes.elements.length; _i = _i + 1) {
    if (fgcDB.gameNotes.elements[_i].gameShorthand === fileName) {
      // Return the notes to their own array.
      gameNotes.push(fgcDB.gameNotes.elements[_i]);
    }
  }

  // Pull the game list into its own array.
  for (var _i2 = 0; _i2 < fgcDB.gameData.elements.length; _i2 = _i2 + 1) {
    gameList.push(fgcDB.gameData.elements[_i2]);
  }

  // Sorting the character select drop downs by the array
  $(document).ready(function () {
    for (var _i3 = 0; _i3 < characterList.length; _i3 = _i3 + 1) {
      $('select.your-character').append('<option value="' + characterList[_i3].characterShorthand + '">' + characterList[_i3].characterName + '</option>');
      $('select.opp-character').append('<option value="' + characterList[_i3].characterShorthand + '">' + characterList[_i3].characterName + '</option>');
    }

    // Append game list into drop down box on index.
    for (var _i4 = 0; _i4 < gameList.length; _i4 = _i4 + 1) {
      $('select.your-game').append('<option value=' + gameList[_i4].gameShorthand + '>' + gameList[_i4].gameName + '</option>');
    }
  });
}

window.addEventListener('DOMContentLoaded', init);

$(document).ready(function () {
  // Add smooth scrolling to all links
  $("a").on('click', function (event) {

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
      }, 800, function () {

        // Add hash (#) to URL when done scrolling (default click behavior)
        window.location.hash = hash;
      });
    } // End if
  });
});

// Show notes pertaining to character matchups

$(document).ready(function () {

  $('.show-notes').click(function (e) {
    e.preventDefault();
    $('.show').removeClass('show');

    // Remove all the list items before changing characters, else they will start stacking. If you click the same character matcup more than once, it would create redundant list items otherwise.
    $('ul').empty();

    // Grab the characters selected from the drop downs.
    var yourChar = $("select[name='your-character'] option:selected").val();
    var oppChar = $("select[name='opp-character'] option:selected").val();

    // Parse the notes for the selected matchup.
    for (var i = 0; i < gameNotes.length; i = i + 1) {
      if (yourChar === gameNotes[i].yourCharacter && oppChar === gameNotes[i].opponentCharacter) {
        // Create the list of notes.
        $('.notes ul').append('<li class="' + yourChar + '-v-' + oppChar + ' ' + gameNotes[i].noteType + '">' + gameNotes[i].note + '</li>');
        $('li.' + yourChar + '-v-' + oppChar).addClass('show');
      }
    }
    $('.char-notes .wrapper').addClass('show');

    // Force visible list items to top of list
    $('ul').each(function () {
      $(this).children('.show').prependTo(this);
    });

    // Filter notes by type of note
    $('.filter').click(function (e) {
      e.preventDefault();
      $('li.show').removeClass('show');
      var filter = $("select[name='note-filter'] option:selected").val();
      var filterNote = $("." + filter);
      $(filterNote).addClass('show');

      // Force filtered items to top of list
      $('ul').each(function () {
        $(this).children('.show').prependTo(this);
      });

      // Reset the filter
      $('.show-all').click(function (e) {
        e.preventDefault();
        var yourChar = $("select[name='your-character'] option:selected").val();
        var oppChar = $("select[name='opp-character'] option:selected").val();
        var charNote = $('.' + yourChar + '-v-' + oppChar);
        $(charNote).addClass('show');

        //Just ensuring nothing breaks on prepending
        $('ul').each(function () {
          $(this).children('.show').prependTo(this);
        });
      });
    });
  });
});