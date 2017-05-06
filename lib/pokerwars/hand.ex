defmodule Pokerwars.Hand do
  alias Pokerwars.Card

  def score(cards) do
    evaluate(cards)
  end

  defp evaluate(cards) do
  	cond do
  		flush?(cards) -> :royal_flush
  		true -> :high_card
  	end 
  end

  defp flush?(cards) do
  	suits = Enum.map(cards, fn(%{rank: rank, suit: suit}) -> suit end)
  	length(Enum.dedup(suits)) == 1
  end

  defp sort_by_rank(cards) do
    Enum.sort(cards)
  end

  defp sort_by_suit(cards) do
    Enum.sort(cards, fn(x,y) -> x.suit < y.suit end)
  end
end
