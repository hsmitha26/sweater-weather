class UserApiSerializer
  def initialize(user)
    @uuid = user.uuid
  end

  def api_key
    {"api_key" => @uuid}
  end
end
