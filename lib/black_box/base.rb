class BlackBox::Base

  def initialize
    raise abstract_error
  end

  private

  def self.inherited(subclass)
    subclass.include BlackBox::Concern
  end

  def abstract_error
    NotImplementedError.new """
    #{self.class} is an abstract class and cannot be instantiated.
    """.strip.chomp
  end
end
