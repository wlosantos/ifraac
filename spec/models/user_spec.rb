require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'database' do
    context 'must be present' do
      it { is_expected.to have_db_column(:name).of_type(:string) }
      it { is_expected.to have_db_column(:unit_dg).of_type(:integer) }
      it { is_expected.to have_db_column(:status).of_type(:integer) }
      it { is_expected.to have_db_column(:token_dg).of_type(:string) }
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:unit).with_foreign_key(:unit_dg).with_primary_key(:unit_dg) }
    it { is_expected.to have_many(:talk_channels).inverse_of(:created_by).with_foreign_key(:created_by_id) }
    it { is_expected.to have_many(:user_talks).inverse_of(:participant).with_foreign_key(:participant_id) }
  end

  describe 'validations' do
    context 'must be present' do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:unit_dg) }
    end

    context 'must be unique' do
      subject { create(:user) }
      it { is_expected.to validate_uniqueness_of(:token_dg) }
    end
  end
end
