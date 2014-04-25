# See http://brunch.readthedocs.org/en/latest/config.html for documentation.

exports.config =
  files:
    javascripts:
      joinTo:
        "js/app.js": /^app/
        "js/vendor.js": /^vendor/
        "test/js/test.js": /^test(\/|\\)(?!vendor)/
        "test/js/test-vendor.js": /^test(\/|\\)(?=vendor)/
      order:
        before: [
          'vendor/scripts/jquery/jquery-1.9.1.js'
          "vendor/js/futures.js"
          "vendor/js/lodash.underscore-1.1.1.min.js"
          "vendor/js/backbone-1.0.0.js"

        ]

    stylesheets:
      defaultExtension: 'less'
      
      joinTo: 'css/app.css'
      before: [
          '/app/less/all.less'
      ]
         
              
    templates:
      defaultExtension: "jade"
      joinTo: "js/app.js"

  framework: "backbone"
