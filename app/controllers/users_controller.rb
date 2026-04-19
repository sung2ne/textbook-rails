def create
  @user = User.new(user_params)
  if @user.save
    WelcomeEmailJob.perform_later(@user)  # 큐에 넣고 즉시 반환
    redirect_to @user, notice: "가입을 환영합니다."
  else
    render :new, status: :unprocessable_entity
  end
end