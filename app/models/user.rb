class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :groups
  has_many :posts
  has_many :group_relationships
  has_many :participated_groups, :through => :group_relationships, :source => :group

  def is_member_of?(group) #(group)是先传一个值给它，然后判断它是否是该成员。
    participated_groups.include?(group)
  end

  def join!(group)
    participated_groups << group # << 可以理解为[1, 2]<< [3] 得出 [1, 2, 3]
  end

  def quit!(group)
    participated_groups.delete(group)
  end
end
