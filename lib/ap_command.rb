# encoding:utf-8

require 'json'

require 'awesome_print'
require_relative "ap_command/version"

# Awesome Print Command Line Tool.
# @author sugamasao
module ApCommand

  # ap_command main class.
  class Application

    # execute application.
    #
    # @param [Array] argv ARGV object.
    # @return [void]
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

    # call awesome_print.
    #
    # @param [Hash] data awesome print object.
    # @return [void]
    def awesome(data)
      ap(data, indent: 2)
    end

    # show usage.
    #
    # @return [void]
    def usage
      puts "usage:"
      puts "% #{File.basename($0)} /path/to/file.json"
      puts "json file awsome print for command line tool."
      exit 
    end

    # show version.
    #
    # @return [void]
    def version
      puts "#{File.basename($0)} #{VERSION}"
      exit
    end


    # execute application shortcut.
    #
    # @param [Array] argv ARGV object.
    # @return [void]
    def self.invoke(argv)
      self.new.run(argv)
    end
  end
end

