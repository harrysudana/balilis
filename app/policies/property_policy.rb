# app/policies/property_policy.rb
class PropertyPolicy < ApplicationPolicy

  # User is a owner and created this property
  def created_by_owner?
    user.owner? && record.owner_id == user.id 
  end

  # Only admin users or owners can create properties
  def create?
    user.admin? || user.owner?
  end

  # Only admin users or properties that created current property can update it
  def update?
    user.admin? || created_by_owner? 
  end

  # Only admin users or properties that created current property can delete it
  def destroy?
    user.admin? || created_by_owner? 
  end

end