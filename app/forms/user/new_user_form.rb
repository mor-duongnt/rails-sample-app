class User::NewUserForm
  include ActiveModel::Model

  attr_reader :email, :first_name, :last_name, :user, :profile, :address,

  def initialize(user:, profile:, address:)
    @user = user
    @profile = profile
    @address = address
  end

  def major
    @profile.present? ? @profile.major : ""
  end

  def skill
    @profile.present? ? @profile.skill : ""
  end

  def address_name
    @address.present? ? @address.name : ""
  end

  def note
    @address.present? ? @address.note : ""
  end

  def save(params = {})
    user = User.new email: params[:email], first_name: params[:first_name], last_name: params[:last_name]
    profile = user.profiles.new major: params[:major], skill: params[:skill]
    address = user.addresses.new name: params[:address_name], note: params[:note]

    UserService.call(user, profile, address)
  end

end
