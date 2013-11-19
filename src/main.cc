#include "SFML/Graphics.hpp"

int main(int argc, char*argv[]) {
  sf::RenderWindow window(sf::VideoMode(800, 600), "My First SFML Program");

  sf::Font font;
  font.loadFromFile("./res/FreeMono.ttf");

  sf::Text text("Hello World!", font, 32);
  text.setColor(sf::Color::Red);
  text.setStyle(sf::Text::Bold | sf::Text::Underlined);
  text.move(400, 300);
  auto rect = text.getLocalBounds();
  text.setOrigin(rect.width / 2, rect.height / 2);

  while(window.isOpen()) {
    sf::Event event;
    while(window.pollEvent(event)) {
      if(event.type == sf::Event::Closed) {
        window.close();
      }
      if(event.type == sf::Event::KeyPressed) {
        if(event.key.code == sf::Keyboard::Escape) {
          window.close();
        }
      }
    }
    window.clear(sf::Color::Black);

    text.rotate(1);

    window.draw(text);

    window.display();
  }

  return 0;
}
