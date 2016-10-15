CATARSE.Project = Backbone.Model.extend({
  urlRoot: '/projects',
	initialize: function() {
		this.backers = new CATARSE.Backers();
		this.backers.url = '/projects/' + this.id + '/backers';
	}
});
