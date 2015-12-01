// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var search_post = function() {
  console.log("hello");
  // Je stocke la chaine de recherche entrée par l'utilisateur.
  var search_string = $("#post-url").val();
  console.log($("#post-url").val());

  // Cas 1 : la chaine est vide : on efface le HTML
  if (search_string.length == 0) {
    $('#results').html('');
    return;
  }

  // Cas 2, chaine non vide, on lance une recherche en Ajax.

 create_post_result
}

//--------------------------------------------------------------------------

var create_post_result = function(data) {
  console.log("entering create_post_result");
// what we want : scrap meta : is there og:fb? = take them, if not : is there og:twitter? etc.

// Premièrement : effacement du HTML
  $('#results').html('');
// On récupère toutes les infos et on en fait un beau hash
var search_string = $("#post-url").val();
var MetaInspector = require('node-metainspector');
var client = new MetaInspector(search_string, { timeout: 5000 });

// check the status of the page :
// page.response.status  # 200

    var postInfo = {
      title:        page.best_title,
      description:  page.description,
      image:        page.images.best,
      url:          search_string,
    }


    // On prend notre beau hash et on échappe les caractères spéciaux (""), on le transforme en string et on
    // le met dans notre HTML dans un attribut "data-post"
    // Pour chaque résultat on crée le HTML et on le place sans l'élément #results
    $('#results').append(
      '<div class="card-container">' +
        '<hr>' +
        '<div class="row">' +
          '<div class ="col-xs-offset-1 col-xs-2">' +
          '<img src="' + page.images.best + '" alt="book-cover" class="result-img img-responsive">' +
        '</div>' +
        '<div class ="col-xs-9 result-infos">' +
          '<h3>' +
            page.best_title +
          '</h3>' +
          '<h4>' +
            page.description +
          '</h4>' +
        '</div>' +
      '</div>'
    )
  }

//-------------------------------------------------------------------------

//filling the post category on click

  $("#charity-cat").on('click', function() {
    $('#post_category').val("Charity");
  });

  $("#music-cat").on('click', function() {
    $('#post_category').val("Music");
  });

  $("#news-cat").on('click', function() {
    $('#post_category').val("News");
  });

  $("#photos-cat").on('click', function() {
    $('#post_category').val("Photos");
  });

  $("#videos-cat").on('click', function() {
    $('#post_category').val("Videos");
  });




