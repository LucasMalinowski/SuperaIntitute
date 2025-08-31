class ApplicationPresenter
  attr_reader :object

  def initialize(object)
    @object = object
  end

  def self.wrap(collection_or_object)
    if collection_or_object.respond_to?(:map)
      collection_or_object.map { |item| new(item) }
    else
      new(collection_or_object)
    end
  end

  private

  def method_missing(method_name, *args, &block)
    if object.respond_to?(method_name)
      object.public_send(method_name, *args, &block)
    else
      super
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    object.respond_to?(method_name, include_private) || super
  end
end