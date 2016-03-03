App.PostUpdateView = Marionette.ItemView.extend({
    template: '#post-form-template',
    events: {
        'submit': 'savePost',
        'click button.js-back': 'goBack'
    },
    savePost: function(ev) {
        ev.preventDefault();
        var model = this.model;
        var data = Backbone.Syphon.serialize(this)
        model.save(data, {
            success: function(model, response, opts) {
                console.log('Success Response: ' + response);
                App.trigger('post:index');
            },
            error: function(model, response, opts) {
                $.each(response, function(resp) {
                    console.log(resp);
                });
                console.log('Error Response: ' + response);
            }
        });
    },
    goBack: function(ev) {
        ev.preventDefault();
        App.trigger('post:index');
    }
});
