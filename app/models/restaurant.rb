class Restaurant < ActiveRecord::Base
  has_many :checks
  has_many :users, through: :checks

  def total_amount_earned
    amount = 0
    checks.each do |check|
      amount += check.price
    end
    amount / 100.to_f
  end

  def customers
    checks.collect do |check|
      check.user.name
    end.uniq.join(',')
  end

  def vip_customers
    hash = {}
    array = Check.all.select do |check|
      check.restaurant_id == self.id
    end
    array.each do |check|
      if !hash[check.user_id]
        hash[check.user_id] = 1
      else
        hash[check.user_id] += 1
      end
    end
    new_hash = hash.select { |k, v| v >= 3 }
    new_hash.keys.each do |k2|
      puts "#{User.find(k2).name.titleize}"
    end
  end
end
