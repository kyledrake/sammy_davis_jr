class EmailWorker
  include Sidekiq::Worker

  def perform(options={})
    Pony.mail options.symbolize_keys
  end
end
