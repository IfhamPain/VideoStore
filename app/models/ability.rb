# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    if user.valid?
      case user
      when Superuser
        can :manage, [User, Actor, Movie, Order]
      when User
        if user.admin?
          can :manage, [User, Movie, Actor, Order, Genre]
          cannot :edit, User, role: User.roles[:admin]
          can :edit, User, id: user.id # Able to edit your own record
          cannot :destroy, User, id: user.id
          cannot :destroy, User, role: User.roles[:admin]
        else
          can :manage, User, id: user.id
        end
      end
      end
  end
end
