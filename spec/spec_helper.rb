require 'rubygems'
require 'bundler'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'rspec'
require 'shoulda'


$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'molasses_jar'
require 'logger'


#ActiveRecord::Base.logger = Logger.new(STDERR)

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database  => ":memory:"
)

ActiveRecord::Schema.define do
  create_table :contact_forms do |table|
    table.column :email, :string
    table.column :message, :text
  end
  
  create_table :feedbacks do |table|
    table.column :email, :string
    table.column :message, :text
    table.column :spam, :boolean
  end
end

class ContactForm < ActiveRecord::Base
	include MolassesJar::Extensions
end

class Feedback < ActiveRecord::Base
	include MolassesJar::Extensions
end
