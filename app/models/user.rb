class User < ApplicationRecord
  has_many :articles, foreign_key: :author_id
  has_many :revisions, foreign_key: :editor_id
  has_many :edited_articles, through: :revisions, source: :article
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # def is_moderator
  #   if current_user == 
  # end
end


# enum role: [:admin, :moderator]
# in user migration: define as an attribute 
# t.integer :role
# in view: if current_user.role == admin
