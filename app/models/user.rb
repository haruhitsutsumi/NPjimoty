class User < ActiveRecord::Base
  validates:email,{uniqueness:true}
  validates:email,{presence:true}
  validates:name,{presence:true}
  validates:password,{presence: true}
end
