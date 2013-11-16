#include "SFML/Graphics.hpp"

int main(int argc, char*argv[]) {
  sf::RenderWindow window(sf::VideoMode(800, 600), "My First SFML Program");

  sf::Font font;
  sf::Text text;
  font.loadFromFile("./res/FreeMono.ttf");
  text.setFont(font);
  text.setString("Hello World!");
  text.setCharacterSize(32);
  text.setColor(sf::Color::Red);
  text.setStyle(sf::Text::Bold | sf::Text::Underlined);

  while(window.isOpen()) {
    sf::Event event;
    while(window.pollEvent(event)) {
      if(event.type == sf::Event::Closed) {
        window.close();
      }
    }
    window.clear(sf::Color::Black);

    window.draw(text);

    window.display();
  }

  return 0;
}
