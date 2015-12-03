class SongsController<ApplicationController

  def index
  end

  def show
    @songs = Song.all
  end

  def load
    binding.pry
    Song.create(
    name: params[:song][:name],
    artist: params[:song][:artist],
    album: params[:song][:album],
    songfile: params[:song][:songfile]
    )
    c = params[:song][:songfile].original_filename
    binding.pry
    MusicWorker.perform_async("https://s3.amazonaws.com/pantonely/uploads/song/songfile/#{Song.last.id}/#{c.(" ","_")}",params[:song][:name])
    redirect_to :back, notice: "Song loaded"
  end

  # def updated
  #   Song.where(songfile: params[:song][:songfile]).update(
  #   movie: movie_path,
  #   taglist: key.split(_)
  #   )
end
