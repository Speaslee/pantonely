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
    redirect_to :back, notice: "Song loaded"
  end
end
