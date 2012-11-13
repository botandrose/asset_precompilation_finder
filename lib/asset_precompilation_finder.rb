require "asset_precompilation_finder/version"

module AssetPrecompilationFinder
  class Finder
    def initialize app
      @app = app
    end

    def list
      paths = @app.assets.each_logical_path
      paths = paths.reject { |p| File.basename(p).starts_with?("_") } # don't compile partials
      paths = paths.sort { |a,b| a.ends_with?(".css") ? 1 : -1 } # compile css last, as it may depend on other assets, like images
    end
  end

  class Railtie < ::Rails::Railtie
    config.after_initialize do |app|
      app.config.assets.precompile = Finder.new(app).list
    end
  end
end
