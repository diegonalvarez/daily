# Load all of our modules files
modules_root = File.dirname(__FILE__)
Dir["#{modules_root}/*.rb"].each {|file| require file }