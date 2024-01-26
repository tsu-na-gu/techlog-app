# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin "comments", to: "comments.js"
pin "remove_flash_message", to: "removals_controller.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
