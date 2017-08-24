class CaptainClashController < ApplicationController
  def index
    @heroes_by_rank = Hero.order(rank: :desc, created_at: :desc).limit(100).group_by(&:rank)
  end
end
