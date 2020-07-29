# ルート
crumb :root do
  link "フリマ", root_path
end

# マイページ
crumb :mypage do
  link "マイページ", users_path
end

# マイページ→ログアウトの画面
crumb :logout do
  link "ログアウト", logout_users_path
  parent :mypage
end

# マイページ→支払い方法の画面
crumb :card do
  link "支払い方法", users_cards_path
  parent :mypage
end

# マイページ→支払い方法の画面→クレジットカード情報入力
crumb :cardadd do
  link "クレジットカード情報入力", new_users_card_path
  parent :card
end



# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).