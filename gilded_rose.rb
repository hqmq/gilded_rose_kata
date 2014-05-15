def update_quality(items)
  items.each do |item|
    case item.name
    when "Sulfuras, Hand of Ragnaros"
    when "Aged Brie"
      item.quality += 1
      item.quality += 1 if item.sell_in <= 0
      item.quality = 50 if item.quality > 50
      item.sell_in -= 1
    when "Backstage passes to a TAFKAL80ETC concert"
      item.quality += 1
      item.quality += 1  if item.sell_in <= 10
      item.quality += 1  if item.sell_in <= 5
      item.quality  = 50 if item.quality > 50
      item.quality  = 0  if item.sell_in <= 0
      item.sell_in -= 1
    when "Conjured Mana Cake"
      item.quality -= 2
      item.quality -= 2 if item.sell_in <= 0
      item.sell_in -= 1
      item.quality  = 0 if item.quality < 0
    else
      item.sell_in -= 1
      item.quality -= 1
      item.quality -= 1 if item.sell_in <= 0
      item.quality  = 0 if item.quality < 0
    end
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

