App.PostModel = Backbone.Model.extend({
	defaults: {
		title: '',
		body: ''
	},
    urlRoot: function() {
        return App.BaseUrl + 'posts'
    }
});
