class ClickGameController < ApplicationController
  before_action :authenticate_user!

  def index
    # Hier laden wir das Spiel-View
  end

  def score
    # Reaktionszeit aus den Parametern nehmen
    reaction_time = params[:reaction_time].to_f

    points = case reaction_time
    when 0..1 then 20
    when 1..5 then 15
    when 5..10 then 10
    else 0
    end

    current_user.increment!(:points, points)

    render json: { points: points, total_points: current_user.points }
  end

  def leaderboard
    @users = User.order(points: :desc).limit(10)
  end

  def toggle_theme
    if current_user.points >= 500
      new_theme = current_user.theme == "dark" ? "light" : "dark"
      current_user.update(theme: new_theme)
    end
    redirect_back fallback_location: click_game_path
  end
end
