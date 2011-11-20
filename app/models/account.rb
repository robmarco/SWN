class Account < ActiveRecord::Base
  validates_presence_of :name, :secname
end
