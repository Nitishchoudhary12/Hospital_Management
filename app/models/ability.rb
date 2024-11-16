# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(hospital_staff)

    if hospital_staff.doctor?
      can :read, :all # Doctor can read all resources

    else hospital_staff.receptionist?
      can :read, :all # Nurse can read all resources
    end

  end
end
