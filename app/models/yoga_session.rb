class YogaSession < ActiveRecord::Base
  scope :today, where( day: Time.now.strftime("%A") ).order(:start_time)
  scope :remaining, where("start_time > ? ", Time.now)
  scope :on_day, lambda { |day| where(day: day.capitalize).order(:start_time) }
  scope :all, order(:start_time)
end
