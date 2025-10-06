class GroupsController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update] # 編集と更新の前に権限チェック
  before_action :set_group, only: [:edit, :update] # editとupdateに限定（必要に応じて:showなども追加）
  before_action :ensure_correct_user, only: [:edit, :update]

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    if @group.save
      redirect_to group_path(@group), notice: "You have created group successfully."
    else
      render 'index'
    end
  end

  def destroy
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to group_path(@group), notice: "You have updated group successfully."
    else
      render "edit"
    end
  end

  def index
    @groups = Group.all
    @book  = Book.new 
  end

  def show
    @group = Group.find(params[:id])
    @book  = Book.new 
  end

  def edit
  end


  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :introduction, :group_image)
  end

  # --- ここが権限チェックのメソッド ---
  def ensure_correct_user
  # @groupはset_groupで取得済み
  # @groupのオーナーと現在のユーザーが一致しない場合は、グループ一覧ページにリダイレクトさせる
    unless @group.owner_id == current_user.id
      redirect_to groups_path
    end
  end

end
