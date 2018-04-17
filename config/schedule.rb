
every 1.minute do
  runner "unactivated = User.where('activated = ?', false)"
  runner "unactivated_expired = unactivated.where('date(created_at) <= ?', 3.days.ago)"
  runner "unactivated_expired.find_each(&:destroy)"
end