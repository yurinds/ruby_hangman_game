# Игра Виселица

Ruby - версия известной игры Виселица. 

Правила игры на странице в [Википедии](https://ru.wikipedia.org/wiki/%D0%92%D0%B8%D1%81%D0%B5%D0%BB%D0%B8%D1%86%D0%B0_(%D0%B8%D0%B3%D1%80%D0%B0))

Для запуска выполните в терминале:
```
git clone https://github.com/yurinds/ruby_hangman_game.git

cd ruby_hangman_game
bundle install             
bundle exec ruby hangman.rb 
```

Для добавления новых слов в игру необходимо:
1. Найти в папке ```data``` файл ```words.txt```
2. Добавить в файл ```words.txt``` новые слова.
3. ВАЖНО! Каждое слово должно начинатья с новой строчки!
