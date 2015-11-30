class MusicWorker
  include Sidekiq::Worker
  def perform(name)
    fail
  end

end
