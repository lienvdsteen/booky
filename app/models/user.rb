class User < ActiveRecord::Base

  def self.find_or_create_by_auth_hash(auth_hash)
    self.find_by(uid: auth_hash.uid) || self.create_by_auth_hash(auth_hash)
  end

  def self.create_by_auth_hash(auth_hash)
    User.create!(
      uid: auth_hash.uid,
      email: auth_hash.extra.raw_info.email,
      username: auth_hash.extra.raw_info.username,
      city: auth_hash.extra.raw_info.city,
      created_on: auth_hash.extra.raw_info.created_on,
      gender: auth_hash.extra.raw_info.gender,
      lastLogin: auth_hash.extra.raw_info.lastLogin,
      status: auth_hash.extra.raw_info.status,
      birthdate: auth_hash.extra.raw_info.birthdate
      )
  end
end
