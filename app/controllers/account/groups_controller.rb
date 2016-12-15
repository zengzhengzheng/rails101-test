class Account::GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = current_user.paticipated_groups
  end
end
