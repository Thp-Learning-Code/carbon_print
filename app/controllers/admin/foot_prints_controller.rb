class Admin::FootPrintsController < ApplicationController
  def index
    @foot_print = Footprint.all
  end

  def show
    @foot_print = Footprint.find(params[:id])
  end


  def destroy
    @foot_print = Footprint.find(params[:id])
    if @foot_print.destroy
        flash[:success]="Test deleted"
        redirect_back(fallback_location: admin_foot_print_path)
    end
  end

end
