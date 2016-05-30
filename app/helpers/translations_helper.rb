module TranslationsHelper
  def t_enum(model, field, value = nil)
    value ||= model.send(field)
    return if value.nil?
    t *build_t_key(model, field, value)
  end

  def enums_as_options(model, enum_field, use_value = false)
    model.send(enum_field.to_s.pluralize).map do |enum_symbol, enum_value|
      [t_enum(model, enum_field, enum_symbol), use_value ? enum_value : enum_symbol]
    end
  end

  private
  def build_t_key(model, field, value)
    model = model.class unless model.is_a? Class
    [value, scope: [:enum, model.model_name.i18n_key, field], default: value.humanize]
  end

end
