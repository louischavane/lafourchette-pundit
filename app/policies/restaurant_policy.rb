class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # Restaurant
      scope.all
      # Restaurant.where(user: user)
      # scope.where(user: user)
    end
  end

  def update?

    # seul le createur du restaurant peut éditer
    # user => current_user
    # record => restaurant
    #if current_user == restaurant.user
    user_is_admin_or_owner?
  end

  def edit?
    update?
  end

  def create?
    # tous les user peuvent créer un resto
    true
  end

  def new?
    create?
  end

  def destroy?
    # seul el createur du restaurant peut supprimer
    # user (current_user)
    # record (restaurant)
    user_is_admin_or_owner?
  end

  private

  def user_is_admin_or_owner?
    (user == record.user) ||(user.admin?)
  end
end
