class TagsController < ApplicationController
helper_method :sort_column, :sort_direction
  def index
    @tags = ActsAsTaggableOn::Tag.all
    @songs = Song.where(user_id: current_user.id)
  end

  def show
    @tag =  ActsAsTaggableOn::Tag.find(params[:id])
    @songs = Song.where(user_id:current_user.id).tagged_with(@tag.name)
    @tabled_songs = @songs.order(sort_column + " " + sort_direction)
  end

  def sort_column
    Song.column_names.include?(params[:sort])? params[:sort]: "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction]: "asc"
  end
end
