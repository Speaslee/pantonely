class MusicWorker
  include Sidekiq::Worker
  def perform(path, name)
    fail
  end

  def on_complete
    
  end
end
