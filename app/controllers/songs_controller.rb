class SongsController<ApplicationController
  helper_method :sort_coloumn, :sort_direction
skip_before_filter :verify_authenticity_token, only:[:movie_update]

  def index
  end

  def show
    @songs = Song.where(:user_id==current_user.id)
  end

  def edit
    Song.find(params[:id]).update(
    name: params[:name],
    artist: params[:artist],
    album: params[:album]
  )
   redirect_to "/songs/show", notice: "Song edited"
  end

  def movie_update

    Song.find(params[:song][:id]).update(
    movie: params[:song][:movie],
    tag_list: params[:song][:tag_list]
    )
    redirect_to "/songs/show", notice: "Movie loaded"
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
    ident = Song.last.id
    s = params[:song][:songfile].original_filename.gsub(" ","_").gsub("'","_")
    MusicWorker.perform_async("https://s3.amazonaws.com/pantonely/#{c}", "#{s}","#{ident}" )
    redirect_to :back, notice: "Song loaded"

  end

  def tagged
    if params[:tag].present?
      @songs = Song.tagged_with(params[:song][:tag])
    else
      @songs = Song.postall
    end
  end

  def sort_coloumn
    Song.column_names.include?(params[:sort])? params[:sort]: "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? paramss[:direction] : "asc"
  end

end
