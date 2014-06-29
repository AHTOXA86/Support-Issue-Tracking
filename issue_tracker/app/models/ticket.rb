class Ticket < ActiveRecord::Base

  # WAITING_FOR_STAFF_RESPONSE = 0
  # WAITING_FOR_CUSTOMER = 1
  # ON_HOLD = 2
  # CANCELLED = 3
  # COMPLETED = 4
  before_create do
    self.status = 1
    self.unique = random_string+random_number+random_string+random_number+random_string
  end
  def random_string
    o = [('A'..'Z')].map { |i| i.to_a }.flatten
    ((0...3).map { o[rand(o.length)] }.join)
  end
  def random_number
    '-'+(rand(899)+100).to_s+'-'
  end
end
