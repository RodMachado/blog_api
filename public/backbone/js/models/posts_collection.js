App.PostsCollection = Backbone.Collection.extend({
    url: function() {
        return App.BaseUrl + 'posts'
    },
    model: App.PostModel
});