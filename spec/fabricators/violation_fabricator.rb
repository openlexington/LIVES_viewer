Fabricator(:violations) do
  business
  date Time.now.strftime("%F")
  code Forgery(:basic).number(:at_least => 1, :at_most => 20)
  description Foregery(:basic).text
end
