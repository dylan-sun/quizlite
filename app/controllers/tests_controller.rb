class TestsController < ApplicationController
  before_action :set_deck, only: [:forward, :backward]

  def forward
    @shuffled = @deck
    @shuffled.cards.shuffle
  end

  def backward
    @shuffled = @deck
    @shuffled.cards.shuffle
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deck
      @deck = Deck.find(params[:id])
    end
end
