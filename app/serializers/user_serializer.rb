class UserSerializer
  include JSONAPI::Serializer
  attributes :first_name, :last_name, :email

  def self.format_users(users)
    {
      data: users.map do |user|
        {
          type: "user",
            attributes: {
              first_name: user.first_name,
              last_name: user.last_name,
              email: user.email
          }
        }
      end
    }
  end
end