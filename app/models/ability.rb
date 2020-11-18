# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    if user.valid?
      case user
      when Superuser
        can :manage, all
      when User
        if user.admin?
          can :manage, User
          cannot :edit, User, role: User.roles[:admin]
          can :edit, User, id: user.id # Able to edit your own record
          cannot :destroy, User, id: user.id
          cannot :destroy, User, role: User.roles[:admin]
        else
          can :read, User
          can :edit, User, id: user.id # only able to edit your own record on the table
        end
      end
    else
      can :read, User
    end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
