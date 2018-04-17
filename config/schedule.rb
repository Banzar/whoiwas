
every :minute do
  command "unactivated = User.where('activated = ?', false)"
  command "unactivated_expired = unactivated.where('date(created_at) <= ?', 3.days.ago)"
  command "unactivated_expired.find_each(&:destroy)"
end