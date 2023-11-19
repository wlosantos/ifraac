require 'rails_helper'

RSpec.describe UserTalk, type: :model do
  describe 'database' do
    context 'columns' do
      it { is_expected.to have_db_column(:participant_id).of_type(:integer) }
      it { is_expected.to have_db_column(:conversation_id).of_type(:integer) }
      it { is_expected.to have_db_column(:conversation_type).of_type(:string) }
      it { is_expected.to have_db_column(:status).of_type(:integer) }
    end

    context 'indexes' do
      it { is_expected.to have_db_index(:participant_id) }
      it { is_expected.to have_db_index([:conversation_type, :conversation_id]) }
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:participant).class_name('User').with_foreign_key(:participant_id) }
    it { is_expected.to belong_to(:conversation) }
  end
end
