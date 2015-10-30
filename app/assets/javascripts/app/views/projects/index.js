CATARSE.projects.index = Backbone.View.extend({
  el: 'body',


  // The right-way to bind events using backbone ;)
  events: {
    'mouseover  #press_img': 'doSomething',
    'mouseleave #press_img': 'doSomethingAgain'
  },

  initialize: function() {
    _.bindAll(this);

    // This div (#twitter) has an data attribute called 'data-username'
    // And we get the user from this
    this.twitter          = $('#twitter');
    this.twitter_username = this.twitter.data('username');
    this.twitter_widget_id = this.twitter.data('widget-id')

    // Getting the 2 latest tweets
    this.twitter_url      = "https://api.twitter.com/1/statuses/user_timeline.json?callback=?&count=2";
    this.twitter_widget_url = "http://cdn.syndication.twimg.com/widgets/timelines/"+this.twitter_widget_id+"?&lang=en&callback=?&suppress_response_codes=true&rnd="+Math.random();

    // Fetching the latest tweets
    this.fetchLatestTweets();
  },

  populateTwitterBlock: function(string) {
    var string = string;
    var data = data;
    var pattern = /e-entry-title">(.*?)(?=<\/p>)/g 
    var name = $('<h3/>', { class: 'name'});
    var link = $('<a/>', {
      href: 'http://twitter.com/' + this.twitter_username,
      text: 'Follow ' + this.twitter_username,
      'class':            'twitter-follow-button',
      'data-show-count':  false,
      'data-button':      'blue',
      'data-width':       '224px'

    });

    // Append Profile name & Populate it
    this.twitter.append(name);
    this.twitter.children('.name').text(this.twitter_username);

    // Append the tweets' text
    var item;
    var count = 0;
    while((item = pattern.exec(string)) && count < 2){
      this.twitter.append('<p class="text">' +item[1]+ '</p>');
      count ++;
    }

    // Finally, append a "Follow" button/link
    this.twitter.append(link);

    // Reloading so twttr can change the buttons for us
    twttr.widgets.load();
  },


  fetchLatestTweets: function() {
    var self = this;
    console.log(this.twitter_widget_url);

    // Make a get request to twitter API
    $.getJSON(this.twitter_widget_url, function(data) {
      self.populateTwitterBlock(data.body);
    });
  },


  /**
   * These methods below are doin' something that I don't recognize, but I refactored them.
   * Probably aren't being used, but who knows.
   */
  doSomething: function(event) {
    var regex     = /\/(\w+)_pb.png\?*\d*$/;
    var extension = '.png'
    this.testAndChangeSrcAttribute($(event.target), regex, extension);
  },

  doSomethingAgain: function(event) {
    var regex     =  /\/(\w+).png\?*\d*$/;
    var extension =  '_pb.png';
    this.testAndChangeSrcAttribute($(event.target), regex, extension);

  },

  testAndChangeSrcAttribute: function(object, regex, extension){
    var src = regex.exec(object.attr('src'));
    if (src) {
      src  = src[1];
      object.attr('src', '/assets/press/' + src + extension);
    } else {
      return
    }
  },


});
