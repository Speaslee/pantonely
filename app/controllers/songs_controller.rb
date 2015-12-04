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
    songfile: params[:song][:songfile],
    user_id: params[:song][:user_id]
    )
    s = params[:song][:songfile].original_filename
    c = params[:song][:songfile].original_filename.tr(" ", "_")
    
    MusicWorker.perform_async("https://s3.amazonaws.com/pantonely/uploads/song/songfile/#{Song.last.id}/#{c}","#{s}")
    redirect_to :back, notice: "Song loaded"

  end

  def tagged
    if params[:tag].present?
      @songs = Song.tagged_with(params[:song][:tag])
    else
      @songs = Song.postall
    end
  end

  # def updated
  #   Song.where(songfile: params[:song][:songfile]).update(
  #   movie: movie_path,
  #   taglist: key.split(_)
  #   )
end
