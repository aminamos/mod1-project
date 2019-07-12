class User < ActiveRecord::Base
  has_many :checks
  has_many :restaurants, through: :checks

  def total_amount_spent
    amount = 0
    checks.each do |check|
      amount += check.price
    end
    amount / 100.to_f
  end

  def visited_restaurant
    checks.collect do |check|
      check.restaurant.name
    end.uniq.join(',')
  end

  def favorite
    hash = {}
    checks.each do |check|
      if !hash[check.restaurant]
        hash[check.restaurant] = 1
      else
        hash[check.restaurant] += 1
      end
    end
    hash.key(hash.values.max).name
  end
end
