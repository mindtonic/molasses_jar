module MolassesJar
  module Extensions
    extend ActiveSupport::Concern

    included do
      attr_accessor :molasses_jar

      scope :spammy, where(:spam => true)
      scope :not_spammy, where(:spam => false)

      validate :mark_as_spam?

      def mark_as_spam?
        if has_spam_attribute? and caught_something?
          self.spam = true
        elsif !has_spam_attribute? and caught_something?
          errors.add(:molasses_jar, "")
        end
      end

      def spam?
        if has_spam_attribute?
          self.spam
        else
          caught_something?
        end
      end

      def caught_something?
        self.molasses_jar.present?
      end

      def has_spam_attribute?
        self.attributes.include?("spam")
      end

    end
  end
end