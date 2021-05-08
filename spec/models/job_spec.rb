require 'rails_helper'

RSpec.describe Job, type: :model do
  before do
    @job = FactoryBot.build(:job)
  end

  describe '求人の保存' do
    context '求人が投稿できる' do

      it '全ての必須項目があれば求人を投稿できる' do
        expect(@job).to be_valid
      end

    end
  
    context '求人が投稿できない' do
      it 'naemが空では投稿できない' do
        @job.name = ''
        @job.valid?
        expect(@job.errors.full_messages).to include("Name can't be blank")
      end

      it '給料が空では投稿できない' do
        @job.salary_id = ''
        @job.valid?
        expect(@job.errors.full_messages).to include("Salary can't be blank", "Salary is not a number")
      end

      it '給料情報がなければ投稿できない' do
        @job.salary_id = 1
        @job.valid?
        expect(@job.errors.full_messages).to include("Salary must be other than 1")
      end

      it '地域が空では投稿できない' do
        @job.area_id = ''
        @job.valid?
        expect(@job.errors.full_messages).to include("Area can't be blank", "Area is not a number")
      end

      it '地域情報がなければ投稿できない' do
        @job.area_id = 1
        @job.valid?
        expect(@job.errors.full_messages).to include("Area must be other than 1")
      end

      it 'work1が空では投稿できない' do
        @job.work1_id = ''
        @job.valid?
        expect(@job.errors.full_messages).to include("Work1 can't be blank", "Work1 is not a number")
      end

      it 'work1情報がなければ投稿できない' do
        @job.work1_id = 1
        @job.valid?
        expect(@job.errors.full_messages).to include("Work1 must be other than 1")
      end

      it '試験月が空では投稿できない' do
        @job.test_month_id = ''
        @job.valid?
        expect(@job.errors.full_messages).to include("Test month can't be blank", "Test month is not a number")
      end

      it '試験月情報がなければ投稿できない' do
        @job.test_month_id = 1
        @job.valid?
        expect(@job.errors.full_messages).to include("Test month must be other than 1")
      end

      it '試験内容が空では投稿できない' do
        @job.test_id = ''
        @job.valid?
        expect(@job.errors.full_messages).to include("Test can't be blank", "Test is not a number")
      end

      it '試験情報がなければ投稿できない' do
        @job.test_id = 1
        @job.valid?
        expect(@job.errors.full_messages).to include("Test must be other than 1")
      end

      it '画像がなければ投稿できない' do
        @job.image = nil
        @job.valid?
        expect(@job.errors.full_messages).to include("Image can't be blank")
      end

      it 'ユーザー紐づいていないと投稿できない' do
        @job.user = nil
        @job.valid?
        expect(@job.errors.full_messages).to include("User must exist")
      end

    end

  end

end
