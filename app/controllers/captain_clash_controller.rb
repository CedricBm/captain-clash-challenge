class CaptainClashController < ApplicationController
  def index
    @limit = 100
    @heroes_by_rank = Hero.order(rank: :desc, created_at: :desc).limit(@limit).group_by(&:rank)
  end
end
