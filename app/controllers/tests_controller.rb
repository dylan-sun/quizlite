class TestsController < ApplicationController
  before_action :set_deck, only: [:forward, :backward, :fvalidate, :bvalidate]

  def forward
  end

  def backward
  end

  def fvalidate
    @results = Hash.new
    @answers = params
    @score = 0
    @deck.cards.each do |card|
      @results[card.question] = false
      if params[card.question] == card.answer
        @results[card.question] = true
        @score += 1
      end
    end
  end

  def bvalidate
    @results = Hash.new
    @answers = params
    @score = 0
    @deck.cards.each do |card|
      @results[card.answer] = false
      if params[card.answer] == card.question
        @results[card.answer] = true
        @score += 1
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deck
      @deck = Deck.find(params[:id])
    end
end
