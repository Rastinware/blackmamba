class Personnel < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :periods

  def full_name
    name = ""
    name += (first_name + " ") if first_name != "" && first_name != nil
    name += (last_name + " ") if last_name != "" && last_name != nil
    name.strip!
    name += email if name == ""

    name
  end
end
