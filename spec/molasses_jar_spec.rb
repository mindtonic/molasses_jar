require 'spec_helper'

describe MolassesJar do

	describe "a Molasses Jar without a Spam attribute" do
		before(:each) do
			@model = ContactForm.new
		end

		context "molasses_jar attributes" do
			it "should have a molasses_jar attribute" do
				lambda{ @model.molasses_jar }.should_not raise_error
			end

			it "should initialize as nil" do
				@model.molasses_jar.nil?.should be true
			end
			
			it "should not have a spam attribute" do
				@model.has_spam_attribute?.should be false
			end
		end

		context "scopes" do
			it "should respond to spammy" do
				ContactForm.respond_to?(:spammy).should be true
			end

			it "should respond to not_spammy" do
				ContactForm.respond_to?(:not_spammy).should be true
			end
		end

		context "with a molasses_jar value" do
			before(:each) do
				@model.update_attributes(:molasses_jar => "I am a robot")
			end

			it "should be valid" do
				@model.should_not be_valid
			end

			it "should return true for spam?" do
				@model.spam?.should be true
			end
			
			it "should have caught_something?" do
				@model.caught_something?.should be true
			end
		end

		context "without a molasses_jar value" do
			before(:each) do
				@model.update_attributes(:molasses_jar => "")
			end

			it "should be valid" do
				@model.should be_valid
			end

			it "should return false for spam?" do
				@model.spam?.should be false
			end
			
			it "should not have caught_something?" do
				@model.caught_something?.should be false
			end
		end
	end

	describe "a Molasses Jar with a Spam attribute" do
		before(:each) do
			@model = Feedback.new
		end

		context "molasses_jar attributes" do
			it "should have a molasses_jar attribute" do
				lambda{ @model.molasses_jar }.should_not raise_error
			end

			it "should initialize as nil" do
				@model.molasses_jar.nil?.should be true
			end
			
			it "should have a spam attribute" do
				@model.has_spam_attribute?.should be true
			end

			it "should initialize as nil" do
				@model.spam.nil?.should be true
			end
		end

		context "scopes" do
			it "should respond to spammy" do
				Feedback.respond_to?(:spammy).should be true
			end

			it "should respond to not_spammy" do
				Feedback.respond_to?(:not_spammy).should be true
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
			
			it "should have caught_something?" do
				@model.caught_something?.should be true
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
			
			it "should not have caught_something?" do
				@model.caught_something?.should be false
			end
		end
	end

end
