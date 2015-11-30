class MusicWorker
  include Sidekiq::Worker
  def perform(name)
    Sidekiq.redis do |conn|
      conn
    end
  end

end
