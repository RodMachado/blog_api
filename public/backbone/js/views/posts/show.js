App.PostView = Marionette.ItemView.extend({
    className: '',
    template: '#post-detail-template',
    events: {
        'click button.js-back': 'back'
    },
    back: function(ev) {
        ev.preventDefault();
        App.trigger('post:index');
    }
});