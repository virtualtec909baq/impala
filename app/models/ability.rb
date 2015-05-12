class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
      if user.kind == admin
        can :manage, :all
      else
        can :read, :all
      end
  end
end
