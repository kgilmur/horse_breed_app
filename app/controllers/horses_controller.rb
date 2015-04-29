class HorsesController < ApplicationController

  def index
   @horses = Horse.all.order('breed ASC')
 end

 def new
  @horse = Horse.new
 end

 def create
  Horse.create(horse_params)
    #render :json => params
    redirect_to horses_path
  end

  def show
    @horse = Horse.find(params[:id])
  end

  def destroy
    @horse = Horse.find(params[:id])
    @horse.destroy
    redirect_to horses_path
  end

  def edit
    @horse = Horse.find(params[:id])
  end

  def update
    @horse = Horse.find(params[:id])
    Horse.update(@horse, horse_params)
    redirect_to @horse
  end

  private

  def horse_params
    horse_params = params.require(:horse).permit(:breed, :origin, :bloodtype)
  end

end