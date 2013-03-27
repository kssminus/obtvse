$(document).ready(function() {

  $(function() {
    $('.post').fitVids();

    var printGist = function(gist) {
        console.log(gist.repo, ' (' + gist.description + ') :');
        console.log(gist.div);
    };

    var displayGist = function(selector, gistResponse) {
      $(selector).html(gistResponse.div);
    };

    // TODO: bad, don't add functions to jQuery
    $.getGist = function(id, success) {
      $.ajax({
            url: 'https://gist.github.com/' + id + '.json',
            dataType: 'jsonp',
            success: function(gist) {
              success("#" + id, gist);
            }
        });
    };

    // fetch the gists
    $('.gist').each(function() {
      $.getGist(this.id, displayGist);
    });

  });

  // category auto complete
  $(function() {
    $.ajax({
      url: '/categories/index.json',
      dataType: 'json',
      method: 'get',
      success: function(cat) {
        $("#category").autocomplete({
          source: cat
        });
      }
    });
  });
  $('pre code').each(function(i, e) {hljs.highlightBlock(e)});

  $('#toc').toc({
      'selectors': 'h1, h2,h3', //elements to use as headings
      'container': 'section', //element to find all selectors in
      'smoothScrolling': true, //enable or disable smooth scrolling on click
      'prefix': 'toc', //prefix for anchor tags and class names
      'onHighlight': function(el) {}, //called when a new section is highlighted 
      'highlightOnScroll': false, //add class to heading that is currently in focus
      'highlightOffset': 220, //offset to trigger the next headline
      'anchorName': function(i, heading, prefix) { //custom function for anchor name
          return prefix+i;
      },
      'headerText': function(i, heading, $heading) { //custom function building the header-item text
          return $heading.text();
      },
    'itemClass': function(i, heading, $heading, prefix) { // custom function for item class
      return $heading[0].tagName.toLowerCase();
    }
  });
});
