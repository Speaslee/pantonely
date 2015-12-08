class SongsController<ApplicationController

  def index
  end

  def show
    @songs = Song.where(:user_id==current_user.id)
  end

  def movie_update
    Song.last.update(
    movie: params[:movie],
    tag_list: params[:tag_list]
    )
    redirect_to :back, notice: "Movie Loaded"
  end

  def load
    Song.create(
    name: params[:song][:name],
    artist: params[:song][:artist],
    album: params[:song][:album],
    songfile: params[:song][:songfile],
    user_id: params[:song][:user_id]
    )
    c = Song.last.songfile.path
    s = params[:song][:songfile].original_filename.gsub(" ","_").gsub("'","_")
    MusicWorker.perform_async("https://s3.amazonaws.com/pantonely/#{c}", "#{s}")
    redirect_to :back, notice: "Song loaded"

  end

  def tagged
    if params[:tag].present?
      @songs = Song.tagged_with(params[:song][:tag])
    else
      @songs = Song.postall
    end
  end

end
