class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.all
  end

  def show
    @tag =  ActsAsTaggableOn::Tag.find(params[:id])
    @songs = Song.where(user_id:current_user.id).tagged_with(@tag.name)
  end
end
