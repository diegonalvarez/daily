# Load all of our models
model_root = File.dirname(__FILE__)
Dir["#{model_root}/*.rb"].each {|file| require file }