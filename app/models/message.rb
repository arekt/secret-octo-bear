class Message < ActiveRecord::Base
  attr_accessible :content, :date, :folder, :from, :subject, :to
end
