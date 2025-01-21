class Api::V1::ShowsController < ApplicationController
  
  def destroy
    show = Show.find(params[:id])
    show.destroy
  end
  
end