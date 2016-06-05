require 'webrick'
require 'tmpdir'
require 'fileutils'
require 'launchy'
require 'nyaplot'


module Nyaplot
  module ExportToWeb
    @@server = nil
    @@web_root = nil

    def show_on_web(port=28288, filename=nil)
      filename ||= "plot.html"
      @@web_root ||= Dir.mktmpdir
      export_html(File.join(@@web_root, filename))

      if !@@server
        @@server = WEBrick::HTTPServer.new(DocumentRoot: @@web_root,
                                          Port: port,
                                          ServerType: Thread,
                                          Logger: WEBrick::Log.new(File.open(File::NULL, 'w')),
                                          AccessLog: [])

        %w(INT TERM).each do |sig|
          trap(sig) do
            shutdown_webserver
          end
        end
        @@server.start
        $stderr.puts "start server on port #{port}."
      end

      Launchy.open "http://localhost:#{port}/#{filename}"
    end

    def show
      if defined? IRuby
        super
      else
        show_on_web
      end
    end

    def shutdown_webserver
      if @@server
        @@server.shutdown
        @@server = nil
        $stderr.puts "shutdown server"
      end
      if @@web_root
        FileUtils.remove_entry_secure @@web_root
        @@web_root = nil
      end
    end
    module_function :shutdown_webserver
  end
end

Nyaplot::Plot.send(:prepend, Nyaplot::ExportToWeb)
