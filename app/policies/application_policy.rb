class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @article = article
  end

  def index?
    false
  end



  def show?
    scope.where(:id => record.id).exists?

  end
  def view?
    user_signed_in?
  end

  def create?
    false
  end

  def new?
    create?
  end


  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user: user)
      end
    end
  end

  def index?
    user_signed_in?
  end
end
