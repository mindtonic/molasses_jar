= molasses_jar

A simple ActiveRecord extension for creating honeypot style captchas.

== How To Use

MolassesJar will add simple honeypot verification to any model you wish. It creates an attribute called :molasses_jar on the desired object and then checks to see if there is a value assigned to it. If there is, then the object does not validate. You will need to add an input to your objects form with the attribute :molasses_jar and then using your css, either display: none or move the form off the screen using absolute positioning.

	class ContactForm < ActiveRecord::Base  
		include MolassesJar::Extensions  
	end

MolassesJar will look for a boolean attribute called ```spam``` on your model.  If it finds it, it will update the attribute to be true if it thinks the record is being submitted by a robot. This method prevents losing legitimate content.

Coming Soon:

* Form Helper to create the form input
* Database flagging to prevent false positives
* Stylesheet generator to create the stylesheet
* Accessibility improvements for readers


== Interesting Reads on the Honeypot Approach

* http://haacked.com/archive/2007/09/11/honeypot-captcha.aspx/
* http://www.londonswebdesign.com/articles/Web-articles-Honeypot-CAPTCHA-vs-Spambots.html

== Contributing to molasses_jar
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

== Copyright

Copyright (c) 2012 mindtonic. See LICENSE.txt for
further details.

