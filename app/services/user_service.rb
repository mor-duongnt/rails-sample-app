# User同期バッチを実行する
#
# Usage:
#   UserService.call({options})
#
#   option:
#     user : object
#     profile : object
#     address : object
#
# Execution example:
#   When running from batch:
#     UserService.call(user, profile, address)
#

class UserService < ApplicationService
  def initialize(user, profile, address)
    @user = user
    @profile = profile
    @address = address
  end

  def call
    @user.password = auto_generate_password
    return @user unless @user.present? && @user.valid?
    return @profile unless @profile.present? && @profile.valid?
    return @address unless @address.present? && @address.valid?
    User.transaction do
      begin
        @user.save!
        @profile.save!
        @address.save!
      rescue ActiveRecord::StatementInvalid
        return false
      end
    end
  end

  private
  def auto_generate_password
    rand_password=('0'..'z').to_a.shuffle.first(8).join
  end
end
