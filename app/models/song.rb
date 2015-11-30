class Song < ActiveRecord::Base
mount_uploader :songfile, DjUploader

  def show
    @songs = Song.all
  end

  def load
    Song.new(
    name: params[:name],
    artist: params[:artist],
    album: params[:album],
    songfile: params[:songfile]
    )
    redirect_to :back, notice: "Song loaded"
  end
end
