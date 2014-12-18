# encoding:utf-8

require 'optparse'
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
      opt = OptionParser.new
      opt.on('-v', '--version') {|v| version}
      opt.on('-h', '--help') {|v| usage}
      opt.parse!(argv)

      path = argv.first.to_s
      usage("File NotFound(path=#{path})") unless(File.exist?(path))
      
      begin
        awesome(JSON.parse(File.read(path)))
      rescue JSON::ParserError => e 
        usage("Error: #{e.class} message => #{e.message}")
      end
    end

    # execute application shortcut.
    #
    # @param [Array] argv ARGV object.
    # @return [void]
    def self.invoke(argv)
      self.new.run(argv)
    end

    private

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
    def usage(message = nil)
      puts message if message
      puts "" if message
      puts "usage: #{File.basename($0)} /path/to/file.json"
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

  end
end

