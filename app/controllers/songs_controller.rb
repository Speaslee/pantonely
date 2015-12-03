class SongsController<ApplicationController

  def index
  end

  def show
    @songs = Song.all
  end

  def load
    Song.create(
    name: params[:song][:name],
    artist: params[:song][:artist],
    album: params[:song][:album],
    songfile: params[:song][:songfile]
    )
    MusicWorker.perform_async( params[:song][:songfile],params[:song][:name])
    redirect_to :back, notice: "Song loaded"
  end

  # def updated
  #   Song.where(songfile: params[:song][:songfile]).update(
  #   movie: movie_path,
  #   taglist: key.split(_)
  #   )
end
