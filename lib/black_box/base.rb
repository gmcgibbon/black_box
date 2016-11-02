# Includes BlackBox::Concern, cannot be instantiated.
class BlackBox::Base

  def initialize
    raise abstract_error
  end

  class << self

    private

    def inherited(subclass)
      subclass.include BlackBox::Concern
    end
  end

  def abstract_error
    NotImplementedError.new <<-ERROR.strip.chomp
    #{self.class} is an abstract class and cannot be instantiated.
    ERROR
  end
end
