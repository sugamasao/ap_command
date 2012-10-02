# encoding:utf-8

require 'json'

require 'awesome_print'
require_relative "ap_command/version"

module ApCommand
  class Application
    def run(argv)
      path = argv.first.to_s
      version if(path == '--version' or path == '-v')
      usage if(path == '--help' or path == '-h')
      usage unless(File.exists?(path))
      
      begin
        awesome(JSON.parse(File.read(path)))
      rescue JSON::ParserError => e 
        puts "Error: #{e.class} message => #{e.message}"
        puts
        usage
      end

    end

    def awesome(data)
      ap(data, indent: 2)
    end

    def usage
      puts "usage:"
      puts "%#{File.basename($0)} /path/to/jsonfile"
      puts "json file awsome print for command line tool."
      exit 
    end

    def version
      puts "#{File.basename($0)} #{VERSION}"
      exit
    end


    def self.invoke(argv)
      self.new.run(argv)
    end
  end
end

