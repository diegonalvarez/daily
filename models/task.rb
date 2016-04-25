class Task
  include DataMapper::Resource
  property :id,           Serial
  property :text,         String, :required => true
  property :app_key,      String, :required => true
  property :published,    Boolean, :default  => false
  property :date,         Date, :default => Date.today
end