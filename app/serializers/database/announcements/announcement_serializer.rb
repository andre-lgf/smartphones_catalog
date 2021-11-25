class Database::Announcements::AnnouncementSerializer < ActiveModel::Serializer
  attributes :id, :price, :amount

  attribute :device do
    object.device_colors.device
  end

  attribute :color do
    object.device_colors.color
  end

  attribute :brand do
    object.device_colors.device.brand
  end

  attribute :plan do
    object.plan
  end
end
