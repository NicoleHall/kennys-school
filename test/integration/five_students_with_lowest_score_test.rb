require 'test_helper'

class FiveStudentsWithLowestScoreTest < ActionDispatch::IntegrationTest

  test 'five students with lowest scores are displayed on students index page' do

    mike = Teacher.create(first_name: "mike", last_name: "dao")
    rachel = Teacher.create(first_name: "rachel", last_name: "w")
    nicole = mike.students.create(name: "nicole", current_score: "5")
    shannon = rachel.students.create(name: "shannon", current_score: "10")
    torie = mike.students.create(name: "torie", current_score: "15")
    pat = mike.students.create(name: "pat", current_score: "20")
    matt = mike.students.create(name: "matt", current_score: "25")
    charissa = mike.students.create(name: "charissa", current_score: "100")

    visit '/students'
save_and_open_page
    assert page.has_content?("nicole : mike")

    assert page.has_content?("shannon : rachel")
    assert page.has_content?("torie : mike")
    assert page.has_content?("pat : mike")
    assert page.has_content?("matt : mike")
    refute page.has_content?("charissa : mike")
  end

end
