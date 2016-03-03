App.PostsRouter = Backbone.Router.extend({
    routes: {
        "": 'postsIndex'
    },
    postsIndex: function() {
        App.PostsController.postsIndex();
    }
});