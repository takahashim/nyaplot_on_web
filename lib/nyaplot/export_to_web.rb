require 'webrick'
require 'tmpdir'
require 'fileutils'
require 'launchy'
require 'nyaplot'


module Nyaplot
  module ExportToWeb
    def show_on_web(port=28288, filename=nil)
      filename ||= "plot.html"

      @web_root ||= Dir.mktmpdir
      export_html(File.join(@web_root, filename))

      if !@server
        @server = WEBrick::HTTPServer.new(DocumentRoot: @web_root,
                                          Port: port,
                                          ServerType: Thread,
                                          Logger: WEBrick::Log.new(File.open(File::NULL, 'w')),
                                          AccessLog: [])

        %w(INT TERM).each do |sig|
          trap(sig) do
            FileUtils.remove_entry_secure @web_root
            @server.shutdown
          end
        end
        @server.start
      end

      Launchy.open "http://localhost:#{port}/#{filename}"
    end

    alias_method :show, :show_on_web

    def close_web
      if @server
        @server.shutdown
        @server = nil
      end
      if @web_root
        FileUtils.remove_entry_secure @web_root
        @web_root = nil
      end
    end
  end
end

Nyaplot::Plot.send(:prepend, Nyaplot::ExportToWeb)
