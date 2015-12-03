//filling the post category on click
  $(".post-category").on('click', function() {
    $('#post_category, #preview_category').val($(this).text());
    $('.post-category').removeClass('btn-primary');
    $(this).addClass('btn-primary');
    $("#submit_url").prop('disabled', false);
  });

//----------------------------------------------------------------------------
