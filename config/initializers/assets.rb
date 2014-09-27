# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( css/bootstrap.min.css )
Rails.application.config.assets.precompile += %w( css/plugins/metisMenu/metisMenu.min.css )
Rails.application.config.assets.precompile += %w( css/plugins/morris.css )
Rails.application.config.assets.precompile += %w( css/sb-admin-2.css )
Rails.application.config.assets.precompile += %w( font-awesome-4.1.0/css/font-awesome.min.css )
Rails.application.config.assets.precompile += %w( css/plugins/layout.css )

Rails.application.config.assets.precompile += %w( js/jquery-1.11.0.js )
Rails.application.config.assets.precompile += %w( js/bootstrap.min.js )
Rails.application.config.assets.precompile += %w( js/plugins/metisMenu/metisMenu.min.js )
Rails.application.config.assets.precompile += %w( js/plugins/morris/raphael.min.js )
Rails.application.config.assets.precompile += %w( js/plugins/morris/morris.min.js )
Rails.application.config.assets.precompile += %w( js/plugins/morris/morris-data.js )
# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
