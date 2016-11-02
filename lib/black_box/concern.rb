# Include this concern to make your class a black box!
module BlackBox::Concern
  extend ActiveSupport::Concern

  BOX_ATTRIBUTES = %i(box_attributes box_methods box_class).freeze

  included do
    include Singleton

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
      box_attributes.push(*attributes)
      box_attributes.uniq!
      cattr_accessor(*attributes)
    end

    def expose(*methods)
      box_methods.push(*methods)
      box_methods.uniq!
      singleton_class.class_eval { delegate(*methods, to: :instance) }
      delegate(*methods, to: :subject)
    end

    def configure
      yield self if block_given?
    end
  end

  private

  def initialize
    initialize_subject
  end

  def initialize_params
    box_attributes.map do |key|
      [key, send(key)]
    end.to_h
  end

  def initialize_subject
    self.subject = box_class.new initialize_params
  end
end
