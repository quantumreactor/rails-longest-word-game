require "application_system_test_case"

class LongestwordgamesTest < ApplicationSystemTestCase
  test "Going to /new gives us a new random grid to play with" do
    visit new_path
    assert test: "New game"
    assert_selector ".letter", count: 10
  end

  # Que puedas llenar el formulario con una palabra aleatoria, hacer clic en el 
  # botón “play” y obtener un mensaje diciendo que la palabra no está en la 
  # cuadrícula (grid)
  test 'Puede llenar el formulario con una palabra aleatoria y notifica que la palabra no esta en las letras' do
    visit new_path
    fill_in 'userword', with: ('a'..'z').to_a.shuffle[0,8].join
    click_on 'Score my answer!'
    assert_text 'can not be built'
  end
end
