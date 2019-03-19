class Admin::FootPrintsController < ApplicationController
  def index
    @foot_print = FootPrint.all
  end

  def show
    @foot_print = FootPrint.find(params[:id])
  end


  def destroy
    @foot_print = FootPrint.find(params[:id])
    if @foot_print.destroy
        flash[:success]="Test deleted"
        redirect_back(fallback_location: admin_foot_print_path)
    end
  end

end
