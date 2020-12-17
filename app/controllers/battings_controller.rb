class BattingsController < ApplicationController
  def new
    @batting = Batting.new
  end

  def create
    @batting = Batting.new(battings_params)
    if @batting.valid?
      @batting.save
      redirect_to root_path
    else
      render new
    end
  end

  def search
    member = Member.where('uniform_number LIKE(?)', "%#{params[:keyword]}%")
    
    render json:{ member: member }
  end


  private
  def battings_params
    params.require(:batting).permit(:member_id, :batting_number, :position_id)
  end
end
