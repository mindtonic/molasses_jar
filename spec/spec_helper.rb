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
end

class ContactForm < ActiveRecord::Base
	include MolassesJar::Extensions
end


#
# Molasses Jar Example Group
#
# Usage Example:
# In your model spec, it_should_behave_like "a molasses_jar", :singular_model_name
#

shared_examples "a molasses_jar" do |model|

	describe "a Molasses Jar" do
		before(:each) do
			eval "@model = #{model.to_s.camelize}.new"
		end
	
		context "molasses_jar attributes" do
			it "should have a molasses_jar attribute" do
				lambda{ @model.molasses_jar }.should_not raise_error
			end
			
			it "should initialize as nil" do
				@model.molasses_jar.nil?.should be true
			end
		end

		context "scopes" do
			it "should respond to spammy" do
				eval "#{model.to_s.camelize}.respond_to?(:spammy).should be true"
			end

			it "should respond to not_spammy" do
				eval "#{model.to_s.camelize}.respond_to?(:not_spammy).should be true"
			end
		end

		context "with a molasses_jar value" do
			before(:each) do 
				@model.update_attributes(:molasses_jar => "I am a robot")
			end

			it "should be valid" do
				@model.should be_valid
			end

			it "should be marked as spam" do
				@model.spam.should be true
			end

			it "should return true for spam?" do
				@model.spam?.should be true
			end
		end

		context "without a molasses_jar value" do
			before(:each) do 
				@model.update_attributes(:molasses_jar => "")
			end

			it "should be valid" do
				@model.should be_valid
			end

			it "should not be marked as spam" do
				@model.spam.should be (false || nil)
			end

			it "should return false for spam?" do
				@model.spam?.should be (false || nil)
			end
		end
	end

end