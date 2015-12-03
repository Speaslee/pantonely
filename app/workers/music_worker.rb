class MusicWorker
  include Sidekiq::Worker
  def perform(path, name)
    fail
  end

end
