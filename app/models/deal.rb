class Deal < ActiveRecord::Base
  validates :category,{presence:true}
  validates :category, inclusion: { in: %w(欲しい あげる) }
  validates :title,{presence:true,length:{maximum:30}}
  validates :deal_detail,{presence:true,length:{maximum:500}}
  validates :user_id,{presence:true}
#  validates :genre,{presence:true}


  def user
    return User.find_by(id: self.user_id)
  end

end
