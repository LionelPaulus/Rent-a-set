class PagesController < ApplicationController
  def home
    puts home_params
  end
  private
  def home_params
    params.require(:home).permit(:cat_ap)
  end
end
