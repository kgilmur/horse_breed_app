class TagsController < ApplicationController


  def index
    @tags = Tag.all.order('name ASC')
  end

  def create
    @tags = Tag.new(tag_params)
    @tags.save
    redirect_to tags_index_path
  end

  def new
    @tags = Tag.new
    @horse = Horse.all
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to tags_index_path
  end

private

  def tag_params
    params.require(:tag).permit(:name)
  end

end
