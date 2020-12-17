class MembersController < ApplicationController
  def new
      @members = Member.new
  end

  def create
    @members = Member.new(member_params)
    if @members.valid?
      @members.save
      return redirect_to root_path
    else
      render :new
    end
  end

  private
  def member_params
    params.require(:member).permit(:uniform_number, :grade, :first_name,:last_name)
  end
end
