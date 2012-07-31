# molasses_jar

A simple ActiveRecord extension for creating honeypot style captchas.

## Nuts and Bolts

MolassesJar will add simple honeypot verification to any model you wish. It creates an attribute called :molasses_jar on the desired object and then checks to see if there is a value assigned to it. 

MolassesJar will look for a boolean attribute called ```spam``` on your model.  If it finds it, it will update the attribute to be true if it thinks the record is being submitted by a robot, thus preventing the loss of legitimate content.

If it does not find a ```spam``` attribute on your model, it will add an error to the molasses_jar attribute, thus preventing the model from validating and saving.

## How To Use

### Install the gem through Bundler

	gem "molasses_jar"

### If flagging is desired, add a spam attribute to your Model

Generate a migration to add the spam attribute to your model. It is recommended that you index the attribute sice it will appear in a where clause through the included scope

	def change
		add_column :contact_forms, :spam, :boolean, :default #> false
		add_index :contact_forms, :spam
		ContactForm.update_all(:spam #> false)
	end

### Add the Extensions to your Model

	class ContactForm < ActiveRecord::Base  
		include MolassesJar::Extensions  
	end

### Add the input to your forms

You will need to add an input to your object's form with the attribute :molasses_jar. Then use css, to either ```display: none;``` or move the form off the screen using absolute positioning.  Best practices suggests you include a label with your input field and include some sort of message that says "If you're a human, please leave this field blank" to insure accessability.

HTML/HAML

	= form.label :molasses_jar, "If you are a human, please leave this field blank", :class => "agglutinative"
	= form.text_field :molasses_jar, :class #> "agglutinative"

CSS

	.agglutinative {
		display: none;
	}

## Testing

Specs are current. Please refer to spec/molasses_jar_spec.rb for testing examples. More to come soon.


## Coming Soon

* Form Helper to create the form input
* Migration generator for the spam attribute
* Stylesheet generator to create the stylesheet

## Interesting Reads on the Honeypot Approach

* http://haacked.com/archive/2007/09/11/honeypot-captcha.aspx/
* http://www.londonswebdesign.com/articles/Web-articles-Honeypot-CAPTCHA-vs-Spambots.html

## Contributing to molasses_jar
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2012 mindtonic. See LICENSE.txt for
further details.

