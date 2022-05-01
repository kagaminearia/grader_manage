class PagesController < ApplicationController
  # To access users from the home page
  def home
    @users = User.all
  end

  # Approves users by changing reviewed to true
  def toggle_reviewed
    user = User.find(params[:id])
    user.reviewed = true
    user.save!
    user.reload
    flash[:notice] = "User approved."
    redirect_back_or_to 'pages/home'
  end
end
