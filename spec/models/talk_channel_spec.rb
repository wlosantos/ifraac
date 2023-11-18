require 'rails_helper'

RSpec.describe TalkChannel, type: :model do
  describe 'database' do
    context 'columns' do
      it { is_expected.to have_db_column(:name).of_type(:string) }
      it { is_expected.to have_db_column(:unit_dg).of_type(:integer) }
      it { is_expected.to have_db_column(:kinds).of_type(:integer) }
      it { is_expected.to have_db_column(:closed).of_type(:boolean) }
      it { is_expected.to have_db_column(:closed_at).of_type(:datetime) }
      it { is_expected.to have_db_column(:moderated).of_type(:boolean) }
      it { is_expected.to have_db_column(:created_by_id).of_type(:integer) }
    end

    context 'indexes' do
      it { is_expected.to have_db_index(:created_by_id) }
    end

    context 'associations' do
      it { is_expected.to belong_to(:created_by).class_name('User').with_foreign_key(:created_by_id) }
      it { is_expected.to belong_to(:unit).with_foreign_key(:unit_dg).with_primary_key(:unit_dg) }
    end
  end
end
