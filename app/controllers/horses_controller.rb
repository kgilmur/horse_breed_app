

FlickRaw.api_key=ENV["API_KEY"]
FlickRaw.shared_secret=ENV["API_SECRET"]

class HorsesController < ApplicationController

  def index
  @horses = Horse.all.order('breed ASC')

 end

 def new
  @horse = Horse.new
 end

 def create
  @horse = Horse.create(horse_params)
    # render :json => params
     params[:horse][:tags].each do |tag_id|
      @horse.tags << Tag.find(tag_id) unless tag_id.blank?
     end
    redirect_to horses_path
  end

  def show
    @horse = Horse.find(params[:id])
    @search = @horse.breed
    list = flickr.photos.search :text => @search + 'horse', :sort => 'relevance'

    # results = list.map do |photo|
    #    "https:/farm3.static.flickr.com/#{photo["server"]}/" "#{photo["id"]}_" "#{photo["secret"]}_n.jpg"
    # end
    # @result = results.sample

    @results = list.map do |photo|
      [FlickRaw.url_b(photo),
        FlickRaw.url_b(photo)]
    end


  end

  def destroy
    @horse = Horse.find(params[:id])
    @horse.destroy
    redirect_to horses_path
  end

  def edit
    @horse = Horse.find(params[:id])
  end

  def tag
    tag = Tag.find_by_name(params[:tag])
    @horses =  tag ? tag.horses : []
  end

  def update
    @tags = Tag.all
    @horse = Horse.find(params[:id])
    Horse.update(@horse, horse_params)
    @horse.tags.clear
    params[:horse][:tag_ids].each do |tag_ids|
    @horse.tags << Tag.find(tag_ids) unless tag_ids.blank?
  end

    redirect_to @horse

    # tags.each do |tags_id|
    #   @horse.tags << Tag.find_or_create_by({name:tag_id}) unless tag_id.blank?
    # end

  end


  private

  def horse_params
    horse_params = params.require(:horse).permit(:breed, :origin, :bloodtype)
  end

end