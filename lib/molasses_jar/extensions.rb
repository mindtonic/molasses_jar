module MolassesJar
	module Extensions
	  extend ActiveSupport::Concern

	  included do
	    attr_accessor :molasses_jar

			validate :is_spam?

			def is_spam?
				errors.add(:molasses_jar, "Those bees sure like molasses!") if self.molasses_jar.present?
			end
	  end
	end
end