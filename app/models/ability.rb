class Ability
  include CanCan::Ability
  def initialize(user)
    if user.role == 'admin'
      can :manage, [User, Category, Transaction]
    else
      can :manage, [User, Category, Transaction], author_id: user.id
    end
  end
end
