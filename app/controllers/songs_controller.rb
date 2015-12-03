class SongsController<ApplicationController

  def index
  end

  def show

    @songs = Song.all
  end

  def load
    if current_user
    Song.create(
    name: params[:song][:name],
    artist: params[:song][:artist],
    album: params[:song][:album],
    songfile: params[:song][:songfile].original_filename,
    user_id: params[:song][:user_id]
    )
    redirect_to :back, notice: "Song loaded"
    MusicWorker.perform_async("https://s3.amazonaws.com/pantonely/uploads/song/songfile/#{Song.last.id}/#{Song.last.songfile.tr(" ", "_")}", Song.last.songfile.tr(" ", "_"))

  else
    redirect_to new_user_session_path notice: "Please login"
  end
end
  def tagged
    if params[:tag].present?
      @songs = Song.tagged_with(params[:tag])
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
