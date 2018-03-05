// Create the variable that will handle the game names across the notes.

let fileName = null;

// Assign empty variables to hold the entire database outside of Tabletop.

let fgcDB = null;

let characterList = [];

let gameNotes = [];

let gameList = [];

let punishData = [];


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
  $(`.mobile-menu .icon`).click(function(e) {
    e.preventDefault();
    $(`.login`).addClass(`responsive`);
    $(`.exit-button`).addClass(`responsive`);
  });

  $(`.exit-button .icon`).click(function(e) {
    e.preventDefault();
    $(`.login`).removeClass(`responsive`);
    $(`.exit-button`).removeClass(`responsive`);
  });

  // Change the fileName to match the selected option in the game list.

  $(`main select.your-game`).change(function() {
    fileName = $(`main select.your-game option:selected`).val();

    $(`h1`).text($(`main select.your-game option:selected`).text());
    $(`header h3`).text($(`main select.your-game option:selected`).text());
    $(`.main-page-head`).css(
      `background`, `linear-gradient(to bottom, rgba(0,0,0,0.6), rgba(0,0,0,0.6)), url('../../img/${fileName}-bg.jpg') bottom/cover no-repeat fixed`
    );

    // Clear the arrays just in case the game changed.
    characterList = [];
    gameNotes = [];
    punishData = [];

    // Clear the character select lists.

    $(`main select.your-character`).empty();
    $(`main select.your-character`).append(`<option value="" disabled selected>--Your character--</option>`)
    $(`main select.opp-character`).empty();
    $(`main select.opp-character`).append(`<option value="" disabled selected>--Their character--</option>`)
    $(`main select.note-filter`).empty();
    $(`main select.note-filter`).append(`<option value="" disabled selected>--Filter by--</option>`)

    // Also clear the notes list when the game changes.

    $(`ul`).empty();

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

    // Iterate through the punish data to find the types pertinent to the game.

    for (let i = 0; i < fgcDB.punishData.elements.length; i = i + 1) {
      if (fgcDB.punishData.elements[i].gameShorthand === fileName || fgcDB.punishData.elements[i].gameShorthand === "global") {
        punishData.push(fgcDB.punishData.elements[i]);
      }
    }

    // Append the character list to the drop downs.

    for (let i = 0; i < characterList.length; i = i + 1) {
      $(`main select.your-character`).append(`<option value="${characterList[i].characterShorthand}">${characterList[i].characterName}</option>`);
      $(`main select.opp-character`).append(`<option value="${characterList[i].characterShorthand}">${characterList[i].characterName}</option>`);
    }

    // Append the punish filters to the drop down.
    for (let i = 0; i < punishData.length; i = i + 1) {
      $(`main select.note-filter`).append(`<option value="${punishData[i].noteShorthand}">${punishData[i].noteType}</option>`);
    }
  });

  $(`.add-notes-popup select.your-game`).change(function() {
    fileName = $(`.add-notes-popup select.your-game option:selected`).val();

    $(`h1`).text($(`.add-notes-popup select.your-game option:selected`).text());
    $(`header h3`).text($(`.add-notes-popup select.your-game option:selected`).text());
    $(`.main-page-head`).css(
      `background`, `linear-gradient(to bottom, rgba(0,0,0,0.6), rgba(0,0,0,0.6)), url('../../img/${fileName}-bg.jpg') bottom/cover no-repeat fixed`
    );

    // Clear the arrays just in case the game changed.
    characterList = [];

    // Clear the character select lists.

    $(`.add-notes-popup select.your-character`).empty();
    $(`.add-notes-popup select.your-character`).append(`<option value="">--Your character--</option>`)
    $(`.add-notes-popup select.opp-character`).empty();
    $(`.add-notes-popup select.opp-character`).append(`<option value="">--Their character--</option>`)

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
      $(`.add-notes-popup select.your-character`).append(`<option value="${characterList[i].characterShorthand}">${characterList[i].characterName}</option>`);
      $(`.add-notes-popup select.opp-character`).append(`<option value="${characterList[i].characterShorthand}">${characterList[i].characterName}</option>`);
    }
  });

  // Launch the notes add form.

  $(`.add-notes-button-launch`).click(function(e) {
    e.preventDefault();
    $(`.add-notes-popup`).addClass(`make-visible`);
  });

  // Close the notes add form when you click the exit button.

  $(`.add-exit-button a`).click(function(e) {
    e.preventDefault();
    $(`.add-notes-popup`).removeClass(`make-visible`);
  });


  // Define which form.
  var $form = $('.add-notes-form'),

    // Point to the handler of the google sheet.
    url = 'https://script.google.com/macros/s/AKfycbwxexORxSnjRTnYh0ZRWA8QxsTVuHE4BiDb-oc6VP1dZXtHHU6q/exec'

    // Creating necessary serialize function.

    $.fn.serializeObject = function() {
    	var o = {};
    	var a = this.serializeArray();
    	$.each(a, function() {
    		if (o[this.name]) {
    			if (!o[this.name].push) {
    				o[this.name] = [o[this.name]];
    			}
    			o[this.name].push(this.value || '');
    		} else {
    			o[this.name] = this.value || '';
    		}
    	});
    	return o;
    };

// Submit form to Google sheet.

$('.add-notes-submit').on('click', function(e) {

  e.preventDefault();

  // Post to the game notes array so that the user doesn't have to refresh to view the new notes.

  fgcDB.gameNotes.elements.push({
    gameShorthand: $(`select[name=gameShorthand]`).val(),
    note: $(`textarea[name=note]`).val(),
    noteType: $(`select[name=noteType]`).val(),
    opponentCharacter: $(`select[name=opponentCharacter]`).val(),
    yourCharacter: $(`select[name=yourCharacter]`).val(),
  });

  // Send form results to Google Sheet.

  var jqxhr = $.ajax({

    url: url,

    method: "POST",

    dataType: "jsonp",

    data: $form.serializeObject()

  }).success(

    console.log(`success!`),

  );

})

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
        $(`.notes ul`).append(`<li class="${yourChar}-v-${oppChar} ${gameNotes[i].noteType}"><span class="note-type">${gameNotes[i].noteLongform}:</span> ${gameNotes[i].note}</li>`);
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

        // Just ensuring nothing breaks on prepending
        $('ul').each(function() {
          $(this).children('.show').prependTo(this);
        });
      });
    });
  });
});
