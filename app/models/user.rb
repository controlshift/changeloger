class User < ApplicationRecord
  devise :invitable, :database_authenticatable, :rememberable, :validatable
end
