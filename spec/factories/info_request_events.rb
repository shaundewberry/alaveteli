# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: info_request_events
#
#  id                  :integer          not null, primary key
#  info_request_id     :integer          not null
#  event_type          :text             not null
#  params_yaml         :text             not null
#  created_at          :datetime         not null
#  described_state     :string
#  calculated_state    :string
#  last_described_at   :datetime
#  incoming_message_id :integer
#  outgoing_message_id :integer
#  comment_id          :integer
#  updated_at          :datetime
#

FactoryGirl.define do

  factory :info_request_event do
    info_request
    event_type 'edit'
    params_yaml ''

    factory :sent_event do
      event_type 'sent'
      association :outgoing_message, :factory => :initial_request
      info_request { outgoing_message.info_request }
    end

    factory :response_event do
      event_type 'response'
      incoming_message
      info_request { incoming_message.info_request }
    end

    factory :followup_sent_event do
      event_type 'followup_sent'
      association :outgoing_message, :factory => :new_information_followup
      info_request { outgoing_message.info_request }
    end

    factory :followup_resent_event do
      event_type 'followup_resent'
      association :outgoing_message, :factory => :new_information_followup
      info_request { outgoing_message.info_request }
    end

    factory :comment_event do
      event_type 'comment'
      association :comment
      info_request { comment.info_request }
    end

    factory :edit_event do
      event_type 'edit'
    end

    factory :hide_event do
      event_type 'hide'
    end

    factory :resent_event do
      event_type 'resent'
      association :outgoing_message, :factory => :initial_request
      info_request { outgoing_message.info_request }
    end

    factory :overdue_event do
      event_type 'overdue'
    end

    factory :very_overdue_event do
      event_type 'very_overdue'
    end

    factory :expire_embargo_event do
      event_type 'expire_embargo'
    end

    factory :embargo_expiring_event do
      event_type 'embargo_expiring'
    end

  end

end
