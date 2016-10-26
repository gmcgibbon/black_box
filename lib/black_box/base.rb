class BlackBox::Base
  include BlackBox::Concern

  private

  def initialize
    check_abstract
    initialize_subject
  end

  def check_abstract
    raise abstract_error if self.class.eql? BlackBox::Base
  end

  def abstract_error
    NotImplementedError.new """
    #{self.class} is an abstract class and cannot be instantiated.
    """.strip.chomp
  end
end
