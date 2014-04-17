module MicrosoftHelper

  def msft_app_name_meta_tag(name, options = {})
    tag(:meta, {
      name:    'application-name',
      content: name
    }.merge!(options.symbolize_keys))
  end

  def msft_app_config_meta_tag(path, options = {})
    tag(:meta, {
      name:    'msapplication-config',
      content: path
    }.merge!(options.symbolize_keys))
  end

end
