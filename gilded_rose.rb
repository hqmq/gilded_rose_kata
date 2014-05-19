def update_quality(items)
  items.each do |item|
    update = Update.for(item)
    item.sell_in = update.next_sell_in
    item.quality = update.next_quality
  end
end

require 'delegate'
class Update < SimpleDelegator
  def self.for(item)
    case item.name
    when "Aged Brie"
      CheeseUpdater.new(item)
    else
      new(item)
    end
  end

  def next_sell_in
    sell_in - 1
  end

  def next_quality
    n = quality - 1
    n -= 1 if sell_in <= 0
    [n, 0].max
  end
end

class CheeseUpdater < Update
  def next_quality
    n = quality + 1
    n += 1 if sell_in <= 0
    [n,50].min
  end
end

# DO NOT CHANGE THINGS BELOW -----------------------------------------

Item = Struct.new(:name, :sell_in, :quality)

# We use the setup in the spec rather than the following for testing.
#
# Items = [
#   Item.new("+5 Dexterity Vest", 10, 20),
#   Item.new("Aged Brie", 2, 0),
#   Item.new("Elixir of the Mongoose", 5, 7),
#   Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
#   Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
#   Item.new("Conjured Mana Cake", 3, 6),
# ]

