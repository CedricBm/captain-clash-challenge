class FightsController < ApplicationController
  def new
    @rank = params[:rank]
    @heroes = Hero.get_rank(@rank)
    @weapons = Weapon.all
    @shields = Shield.all
  end

  def create
    if params[:one][:hero_id] == params[:two][:hero_id]
      flash[:alert] = "Impossible de faire combattre un héro avec lui-même..."
      redirect_to new_fight_path(Hero.find(params[:one][:hero_id]).rank)
    else
      fighter_one = Fighter.create(fighter_params(:one))
      fighter_two = Fighter.create(fighter_params(:two))

      @fight = Fight.fight_between(fighter_one, fighter_two)
      redirect_to fight_path(@fight)
    end
  end

  def show
    @fight = Fight.includes(winner: [:hero, :weapon, :shield], loser: [:hero, :weapon, :shield]).find(params[:id])
    @events = @fight.fight_events.order(created_at: :asc)
  end

  private

    def fighter_params(key)
      params.require(key).permit(:hero_id, :weapon_id, :shield_id)
    end

end
