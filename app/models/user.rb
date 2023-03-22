# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include GraphqlDevise::Authenticatable

  has_many :posts, dependent: :destroy

  validates :email, presence: true, uniqueness: true
end
