# frozen_string_literal: true

class Notification < ApplicationRecord
  ALLOWED_TYPES = %w[AddAssigneeNotification AddCommentNotification
                     DestroyCardNotification MoveCardNotification].freeze

  belongs_to :notificationable, polymorphic: true
  belongs_to :user

  validates :user, presence: true
  validates :notificationable, presence: true
  validates_inclusion_of :type, in: ALLOWED_TYPES

  self.per_page = 10
end
