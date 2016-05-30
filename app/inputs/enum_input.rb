class EnumInput < SimpleForm::Inputs::CollectionSelectInput
  include TranslationsHelper

  def collection
    collection = enums_as_options(object.class, attribute_name)
    collection.sort_by! { |a, b| a.to_s } unless options[:sort] == false
    collection
  end

  def input_options
    super.merge selected: object.send(attribute_name)
  end
end
