require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'database' do
    context 'must be present' do
      it { is_expected.to have_db_column(:content).of_type(:text) }
      it { is_expected.to have_db_column(:moderation_status).of_type(:integer) }
      it { is_expected.to have_db_column(:moderated_at).of_type(:datetime) }
      it { is_expected.to have_db_column(:refused_at).of_type(:datetime) }
      it { is_expected.to have_db_column(:response_id).of_type(:integer) }
      it { is_expected.to have_db_column(:talk_type).of_type(:string) }
      it { is_expected.to have_db_column(:talk_id).of_type(:integer) }
      it { is_expected.to have_db_column(:talk_channel_id).of_type(:integer) }
      it { is_expected.to have_db_column(:moderator_id).of_type(:integer) }
    end

    context 'must be indexed' do
      it { is_expected.to have_db_index(:response_id) }
      it { is_expected.to have_db_index(:talk_channel_id) }
      it { is_expected.to have_db_index(:moderator_id) }
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:moderator).class_name('User').optional }
    it { is_expected.to belong_to(:response).class_name('Message').optional }
    it { is_expected.to belong_to(:talk_channel) }
    it { is_expected.to belong_to(:talk) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:content) }
  end
end
