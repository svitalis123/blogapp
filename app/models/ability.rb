class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, :all
    # Define User abilities

    if user.admin? :admin
      can :manage, :all
    else
      can :manage, Comment, user_id: user.id
      can :manage, Post, user_id: user.id
      can :read, :all
    end
  end
end
