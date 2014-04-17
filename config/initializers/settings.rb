config = RecursiveOpenStruct.new(YAML.load_file(Rails.root.join('config', 'settings.yml')))

SETTINGS = config.send(Rails.env)
