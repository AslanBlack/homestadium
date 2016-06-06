class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
   #:confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  validates :first_name, presence: true
            
            
  validates :name, presence: true
   
  validates_length_of :name, minimum: 2, maximum: 25, if: -> { self.name.present? }
  validates_length_of :first_name, minimum: 2, maximum: 25, if: -> { self.first_name.present? } 
  
 
  def full_name
     return "#{first_name} #{name[0,1]}".strip  if first_name && name
      email
  end
  
end
