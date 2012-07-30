module MolassesJar
	module Extensions
	  extend ActiveSupport::Concern

	  included do
	    attr_accessor :sticky

			validate :is_spam?

			def is_spam?
				errors.add(:sticky, "Those bees sure like honey!") if self.sticky.present?
			end
	  end
	end
end