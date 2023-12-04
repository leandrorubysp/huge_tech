require 'sidekiq'
require 'sidekiq-scheduler'
require 'sidekiq/web'

Sidekiq.configure_server do |config|
  config.redis = {
    url: 'redis://localhost:6379/1'
  }

  # config.on(:startup) do
  #   Sidekiq.schedule = YAML.load_file(File.expand_path('../../sidekiq_scheduler.yml', __FILE__))
  #   SidekiqScheduler::Scheduler.instance.reload_schedule!
  # end

  Rails.logger = ActiveSupport::BroadcastLogger.new(Rails.logger, config.logger)
end

Sidekiq.configure_client do |config|
  config.redis = {
    url: 'redis://localhost:6379/1'
  }

  Rails.logger = ActiveSupport::BroadcastLogger.new(Rails.logger, config.logger)
end