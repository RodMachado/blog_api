App.addInitializer(function() {
    App.on('post:index', function() {
        App.PostsController.postsIndex();
    });
    App.on('post:create', function(view) {
	App.PostsController.postCreate(view);
    });
    App.on('post:show', function(view) {
        App.PostsController.postShow(view);
    });
    App.on('post:edit', function(view) {
        App.PostsController.postEdit(view);
    });
    App.on('post:delete', function(view) {
        App.PostsController.postDelete(view);
    });
    App.on('details:close', function(view) {
        App.PostsController.detailsClose(view);
    });
});

App.addInitializer(function() {
    App.addRegions({
        mainRegion: '#main'
    });
    router = new App.PostsRouter();
    Backbone.history.start();
});

App.start();
