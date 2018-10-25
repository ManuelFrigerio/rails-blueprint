if defined?(Raven) && (dsn = ENV['GETSENTRY_DSN']).present?
  Raven.configure do |config|
    config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
    config.dsn = dsn
    config.environments = ['production']
  end
end