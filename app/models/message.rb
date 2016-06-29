class Message < ActiveRecord::Base
  validates_presence_of :user_id
  validates_presence_of :content
  validates_uniqueness_of :user_id
end
