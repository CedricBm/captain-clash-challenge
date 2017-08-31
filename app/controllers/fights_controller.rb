class FightsController < ApplicationController
  def new
    @rank = params[:rank]
    @heroes = Hero.get_rank(@rank)
  end

  def create
    if params[:hero_one] == params[:hero_two]
      flash[:alert] = "Impossible de faire combattre un héro avec lui-même..."
      redirect_to new_fight_path(hero_one.rank)
    else
      fighter_one = Fighter.create(hero_id: params[:hero_one])
      fighter_two = Fighter.create(hero_id: params[:hero_two])

      @fight = Fight.fight_between(fighter_one, fighter_two)
      redirect_to fight_path(@fight)
    end
  end

  def show
    @fight = Fight.includes(:winner, :loser).find(params[:id])
    @events = @fight.fight_events.order(created_at: :asc)
  end

end
