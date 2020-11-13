// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require jquery
//= require select2
//= require_tree .
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('./nested-forms/addFields')
require('./nested-forms/removeFields')

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

//AutoComplete JS using Select2
document.addEventListener("turbolinks:load", function() {
    // $('#select_two').select2({
    //     allowClear: true,
    //     width: 200
    //     // If you are using Bootstrap, please add　`theme: "bootstrap"` too.
    // });
        function formatExample(actor) {
            var originalOption = $(actor.element);
            return "   " + actor.text;
        }
        $('select.template-example').select2({
            width: 'resolve',
            formatResult: formatExample,
            formatSelection: formatExample,
            escapeMarkup: function(m) { return m; }
        });
})

document.addEventListener("turbolinks:load", function() {
    tinymce.remove();
    tinymce.init({
        selector:'textarea',
        plugins: 'image',
        menubar: 'insert',
        toolbar: 'styleselect | bold italic | undo redo | image | link',
    });
})
//
// $(document).addEventListener('turbolinks:load', function() {
//     // Turn on js-selectable class so that it becomes SELCT 2 tag
//     $('.select2-use').select2({
//         placeholder: "Select",
//         allowClear: true
//     });
//     $('#select_two').select2({
//         allowClear: true,
//         width: 200
//         // If you are using Bootstrap, please add　`theme: "bootstrap"` too.
//     });
// });
