App.PostListItemView = Marionette.ItemView.extend({
    initialize: function() {
        this.$el.prop("id", "post_" + this.model.get("id"));
    },
    template: '#post-item-template',
    tagName: 'tr',
    events: {
        'click': 'showPost',
        'click button.js-edit': 'editPost',
        'click button.js-delete': 'deletePost'
    },
    showPost: function(ev) {
        ev.stopPropagation();
        App.trigger('post:show', this);
    },
    editPost: function(ev) {
        ev.stopPropagation();
        App.trigger('post:edit', this);
    },
    deletePost: function(ev) {
        ev.stopPropagation();
        App.trigger('post:delete', this);
    }
});

App.PostsListView = Marionette.CompositeView.extend({
    tagName: 'table',
    className: 'table table-striped',
    childViewContainer: 'tbody',
    template: '#posts-list-template',
    childView: App.PostListItemView
});

App.PanelRegionView = Marionette.ItemView.extend({
    template: '#panel-region-template',
    events: {
        'click button.js-new': 'newPost'
    },
    newPost: function(eve) {
        App.trigger('post:create', this);
    }

});

App.PostsIndexView = Marionette.LayoutView.extend({
    template: '#posts-index-template',
    regions: {
        postsListRegion: '#posts-list-region',
        panelRegion: '#panel-region'
    }
});