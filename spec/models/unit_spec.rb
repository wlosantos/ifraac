require 'rails_helper'

RSpec.describe Unit, type: :model do
  describe 'database' do
    context 'must be present' do
      it { is_expected.to have_db_column(:name).of_type(:string) }
      it { is_expected.to have_db_column(:unit_dg).of_type(:integer) }
      it { is_expected.to have_db_column(:status).of_type(:integer) }
    end

    context 'indexes' do
      it { is_expected.to have_db_index(:name).unique }
      it { is_expected.to have_db_index(:unit_dg).unique }
    end
  end

  describe 'associations' do
    it { is_expected.to have_many(:users).with_foreign_key(:unit_dg).with_primary_key(:unit_dg) }
  end
end
