class CaptainClashController < ApplicationController
  def index
    @heroes = Hero.order(created_at: :desc).limit(15)
  end
end
