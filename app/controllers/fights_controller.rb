class FightsController < ApplicationController
  def new
    @rank = params[:rank]
    @heroes = Hero.get_rank(@rank)
  end

  def create
    hero_one = Hero.find(params[:hero_one])
    hero_two = Hero.find(params[:hero_two])

    if hero_one == hero_two
      flash[:alert] = "Impossible de faire combattre un héro avec lui-même..."
      redirect_to new_fight_path(hero_one.rank)
    else
      @fight = Fight.fight_between(hero_one, hero_two)
      redirect_to fight_path(@fight)
    end
  end

  def show
    @fight = Fight.includes(:winner, :loser).find(params[:id])
    @events = @fight.fight_events.order(created_at: :asc)
  end

end
