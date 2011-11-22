require "asset_precompilation_finder/version"

module AssetPrecompilationFinder
  class Finder
    def initialize app
      @app = app
    end

    def each(&blk)
      # don't compile list until last possible moment, as the asset engine might not be initialized yet.
      list.each { |v| blk.call(v) }
    end

    private
    
    def list
      @list ||= begin
        paths = @app.assets.each_logical_path
        paths = paths.reject { |p| File.basename(p).starts_with?("_") } # don't compile partials
        paths = paths.sort { |a,b| a.ends_with?(".css") ? 1 : -1 } # compile css last, as it may depend on other assets, like images
      end
    end
  end

  class Railtie < ::Rails::Railtie
    initializer :set_assets_precompile_list do |app|
      app.config.assets.precompile = Finder.new app
    end
  end
end
