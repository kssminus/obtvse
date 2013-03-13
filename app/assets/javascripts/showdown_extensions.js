(function() {

  window.Showdown.extensions.video = function(converter) {
    return [
      {
        type: 'lang',
        regex: '\\^\\^([\\S]+)',
        replace: function(match, url) {
          var m, video_id, youtube;
          youtube = /^.*((youtu.be\/)|(v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))\??v?=?([^#\&\?]*).*/;
          if (youtube.test(url)) {
            m = url.match(youtube);
            if (m && m[7].length === 11) {
              video_id = m[7];
              return "<iframe  src=\"http://www.youtube.com/embed/" + video_id + "?rel=0\"\nframeborder=\"0\" allowfullscreen></iframe>";
            } else {
              return match;
            }
          } else {
            return match;
          }
        }
      }
    ];
  };

}).call(this);
