class Admin::FootPrintsController < ApplicationController
  def index
  end

  def show
  end

  def destroy
    @foot_print = FootPrint.find(params[:id])
    if @foot_print.destroy
      flash[:success]="Test deleted"
      redirect_to admin_root_path
    end
  end
end
