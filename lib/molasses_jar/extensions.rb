module MolassesJar
	module Extensions
	  extend ActiveSupport::Concern

	  included do
	    attr_accessor :molasses_jar, :spam

	    scope :spammy, where(:spam => true)	    
	    scope :not_spammy, where(:spam => false)

			validate :mark_as_spam?

			def mark_as_spam?
				self.spam = true if self.molasses_jar.present?
			end
			
			def spam?
				self.spam
			end
	  end
	end
end