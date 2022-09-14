require "application_system_test_case"

class ProposalsTest < ApplicationSystemTestCase
  test "create a proposal" do
    visit '/proposals/new'

    fill_in "Title", with: "Creating an Article"
    fill_in "Description", with: "Created this article successfully!"
    fill_in "Contact", with: "Bob Barker"

    click_on "Create"

    self.assert_current_path root_path
    #AN IDEA FOR LATER !!!!!!
    #table_data = suck_up_table_data
    #[
    #  {title: 'foo'}

    #]

    assert_selector "h2", text: "1 proposal"
    assert_selector "h3", text: "Creating an Article"
    assert_selector "p", text: "Created this article successfully!"
    assert_selector "cite", text: "Bob Barker"
  end

  test "title can't be blank" do
    visit '/proposals/new'

    fill_in "Description", with: "Created this article successfully!"
    fill_in "Contact", with: "Bob Barker"

    click_on "Create"

    assert_text "Title can't be blank"

    self.assert_current_path '/proposals/new'
  end

  test "neither title nor contact can be blank" do
    visit '/proposals/new'

    click_on "Create"

    assert_text "Title can't be blank"
    assert_text "Contact can't be blank"

    self.assert_current_path '/proposals/new'
  end

  test "description is repopulated after the user effs up" do
    visit '/proposals/new'

    description_text = "blah blah blah"
    fill_in "Description", with: description_text
    click_on "Create"

    assert_text description_text
  end
end
