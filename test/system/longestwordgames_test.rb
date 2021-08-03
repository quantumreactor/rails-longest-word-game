require "application_system_test_case"

class LongestwordgamesTest < ApplicationSystemTestCase
  # test 1.
  test "Going to /new gives us a new random grid to play with" do
    visit new_path
    assert test: "New game"
    assert_selector ".letter", count: 10
  end

  # test 2. Que puedas llenar el formulario con una palabra aleatoria, hacer clic en el 
  # botón “play” y obtener un mensaje diciendo que la palabra no está en la 
  # cuadrícula (grid)
  test 'Puede llenar el formulario con una palabra aleatoria y notifica que la palabra no esta en las letras' do
    visit new_path
    fill_in 'userword', with: ('a'..'z').to_a.shuffle[0,8].join
    click_on 'Score my answer!'
    assert_text 'can not be built'
  end

  # test 3. Que puedas llenar el formulario con una palabra de una letra consonante, hacer clic en el botón “play” y obtener un mensaje diciendo que la palabra no es una palabra en inglés válida
 
  # test 4. Que puedas llenar el formulario con una palabra en inglés válida (esto es difícil porque hay aleatoriedad!), hacer clic en “play” y obtener el mensaje “Congratulations”.
  # pucha este esta complicado, porque hay que elaborar una palabra valida a partir del grid de letras generado in situ por el chrome driver headless capybara, habria que extraer ese grid y apartir de esas letras formar la minima palabra valida del diccionario y ahi validar con esa palabra. easier said than done.

end
