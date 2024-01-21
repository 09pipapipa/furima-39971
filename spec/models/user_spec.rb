require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができる場合' do
      it '全ての項目が入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end

      it 'emailは一意性であり、重複してはいけない' do
        another_user = FactoryBot.create(:user, email: 'test@test')
        @user.email = 'test@test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールはすでに存在します')
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end

      it 'passwordは5文字以下では登録できない' do
        @user.password = 'abc12'
        @user.password_confirmation = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end

      it 'passwordが英字だけだと登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).not_to include('パスワードは半角英数字の混合で設定してください')
      end

      it 'passwordは半角数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).not_to include('パスワードは半角英数字の混合で設定してください')
      end

      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'ａｂc１２3'
        @user.password_confirmation = 'ａｂc１２3'
        @user.valid?
        expect(@user.errors.full_messages).not_to include('パスワードは半角英字と数字の両方を含めて設定してください')
      end

      it 'passwordとpassword_confirmationが不一致だと登録できない' do
        @user.password = 'abc1234'
        @user.password_confirmation = 'aaa1111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Pパスワード（確認用）とパスワードの入力が一致しません")
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください")
      end

      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(カナ)を入力してください")
      end

      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字(カナ)を入力してください")
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end

      it 'last_nameに半角文字が含まれていると登録できない' do
        @user.last_name = 'Yamada1'
        @user.valid?
        expect(@user.errors.full_messages).not_to include('名前 は全角で入力してください')
      end

      it 'first_nameに半角文字が含まれていると登録できない' do
        @user.first_name = 'Taro2'
        @user.valid?
        expect(@user.errors.full_messages).not_to include('苗字 は全角で入力してください')
      end

      it 'last_name_kanaにカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.last_name_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).not_to include('名前(カナ) はカタカナで入力してください')
      end

      it 'first_name_kanaにカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.first_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).not_to include('苗字(カナ) はカタカナで入力してください')
      end
    end
  end
end
