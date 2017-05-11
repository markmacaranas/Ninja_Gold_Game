class NinjasController < ApplicationController
  def index
      if !session[:gold]
          session[:gold] = 0
          session[:activities] = []
      end

      @gold = session[:gold]
      @activities = session[:activities]
  end

  def farm
    amount = rand(10..20)
    session[:gold] += amount

    obj = {won: true, sentence: "You won #{amount} gold from farm!"}
    session[:activities].push(obj)

    redirect_to '/'
  end

  def cave
    amount = rand(5..10)
    session[:gold] += amount

    obj = {won: true, sentence: "You won #{amount} gold from cave!"}
    session[:activities].push(obj)

    redirect_to '/'
  end

  def house
    amount = rand(2..5)
    session[:gold] += amount

    obj = {won: true, sentence: "You won #{amount} gold from house!"}
    session[:activities].push(obj)

    redirect_to '/'
  end

  def casino
    cachecreek = rand(1..2)
    amount = rand(0..50)
        if cachecreek == 1
            session[:gold] += amount

            obj = {won: true, sentence: "You won #{amount} gold from casino!"}
            session[:activities].push(obj)
        else
            session[:gold] -= amount

            obj = {won: false, sentence: "You lost #{amount} gold from casino!"}
            session[:activities].push(obj)
        end

    redirect_to '/'
  end
end
