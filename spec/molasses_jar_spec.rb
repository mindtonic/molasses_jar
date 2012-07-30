require 'spec_helper'

describe MolassesJar do

	context "molasses_jar attributes" do
		before(:each) { @contact_form = ContactForm.new }

		it "should have a molasses_jar attribute" do
			lambda{ @contact_form.molasses_jar }.should_not raise_error
		end
		
		it "should be nil by default" do
			@contact_form.molasses_jar.nil?.should be true
		end
	end

	context "with a molasses_jar value" do
		before(:each) { @contact_form = ContactForm.new }

		it "should not be valid with a string" do
			@contact_form.molasses_jar = "I am a robot"
			@contact_form.should_not be_valid
		end
	end

	context "without a molasses_jar value" do
		before(:each) { @contact_form = ContactForm.new }

		it "should be valid" do
			@contact_form.molasses_jar = ""
			@contact_form.should be_valid
		end
	end

end
