class BaseContract < Dry::Validation::Contract
  config.messages.default_locale = :en
  config.messages.load_paths << 'config/locales/errors.en.yml'
end
