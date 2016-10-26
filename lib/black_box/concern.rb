module BlackBox::Concern
  extend ActiveSupport::Concern

  included do
    include Singleton

    BOX_ATTRIBUTES = %i(box_class)

    BOX_ATTRIBUTES.each do |attribute|
      cattr_accessor(attribute) do
        [] if attribute.to_s.end_with?('s')
      end
    end

    attr_accessor :subject
  end

  class_methods do

    def subject(klass)
      self.box_class = klass
    end
  end

  private

  def initialize; initialize_subject; end

  def initialize_subject
    self.subject = box_class.new
  end
end
