class HerosController < ApplicationController
  def new
    @hero = Hero.new
  end

  def create
    @hero = Hero.new(hero_params)

    if @hero.save
      redirect_to hero_path(@hero)
    else
      flash[:alert] = "Héro non valide ! Vérifie tes attributs."
      render :new
    end
  end

  def show
    @hero = Hero.includes(wins: [loser: :hero], losses: [winner: :hero]).find(params[:id])
  end

  private

    def hero_params
      params.require(:hero).permit(:name, :health, :attack, :speed, :dodge_rate, :critical_rate, :avatar)
    end
end
