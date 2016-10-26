module BlackBox::Concern
  extend ActiveSupport::Concern

  included do
    include Singleton

    BOX_ATTRIBUTES = %i(box_attributes box_class)

    BOX_ATTRIBUTES.each do |attribute|
      cattr_accessor(attribute) do
        [] unless %i(box_class).include? attribute
      end
    end

    attr_accessor :subject
  end

  class_methods do

    def subject(klass)
      self.box_class = klass
    end

    def accept(*attributes)
      box_attributes.push *attributes
      box_attributes.uniq!
      cattr_accessor *attributes
    end
  end

  private

  def initialize; initialize_subject; end

  def initialize_params
    box_attributes.map do |key|
      [key, send(key)]
    end.to_h
  end

  def initialize_subject
    self.subject = box_class.new initialize_params
  end
end
