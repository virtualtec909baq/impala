class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    self.per_page = 10

    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
    attr_accessor :login
    validates_presence_of :username
    validates_presence_of :email
    validates_presence_of :carrier
    validates_presence_of :username
    validates_presence_of :cell_phone
    validates_presence_of :landline
    validates_format_of :email, :with  => Devise.email_regexp
    validates :username, length: { in: 4..20 }
    # relationship
    has_many :offers, :through => :offer_users
    has_many :offer_users, :dependent => :destroy 

    filterrific(
        default_filter_params: { sorted_by: 'created_at_desc' },
        filter_names: [
            :search_query_name,
            :search_query_user_name
        ]
    )

    scope :search_query_name, lambda { |query|
        return nil  if query.blank? 
        query = query.to_s
        where("users.name LIKE ?", "%#{query}%")
    }

    scope :search_query_user_name, lambda { |query|
        return nil  if query.blank? 
        query = query.to_s
        where("users.username LIKE ?", "%#{query}%")
    }
    
    def self.find_first_by_auth_conditions(warden_conditions)
    	conditions = warden_conditions.dup
    	if login = conditions.delete(:login)
    		where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    	else
    		where(conditions).first
    	end
    end

    def self.current
    	Thread.current[:user]
    end
    def self.current=(user)
    	Thread.current[:user] = user
    end
end
