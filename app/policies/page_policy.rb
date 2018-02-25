#app/policies/article_policy.rb
 
class PagePolicy < ApplicationPolicy
  def index?
    true
  end
 
  def create?
    user.present?
  end
  def view?
    user_signed_in?
  end
 
  def update?
    return true if user.present? && user == article.user
  end
 
  def destroy?
    return true if user.present? && user == article.user
  end
 
  private
 
    def article
      record
    end
end