App.PostsController = {
    postsIndex: function() {
        posts = new App.PostsCollection();
        postsListView = new App.PostsListView({
            collection: posts
        });
        panelRegionView = new App.PanelRegionView();
        indexView = new App.PostsIndexView();
        App.mainRegion.show(indexView);
        indexView.postsListRegion.show(postsListView);
        indexView.panelRegion.show(panelRegionView);
        postsListView.collection.fetch();
    },
    postCreate: function(view) {
        postCreate = new App.PostCreateView({
            model: new App.PostModel()
        });
        App.mainRegion.show(postCreate);
    },
    postShow: function(view) {
        postView = new App.PostView({
            model: view.model
        });
        App.mainRegion.show(postView);
    },
    postEdit: function(view) {
        postUpdate = new App.PostUpdateView({
            model: view.model
        });
        App.mainRegion.show(postUpdate);
    },
    postDelete: function(view) {
        view.$el.fadeOut(300, function() {
            view.model.destroy();
        });
    }
}