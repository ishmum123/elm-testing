This is a simple implementation of Elm Testing

TODO: Include elm-html-test & elm-testable

to run the tests:

1) install elm ->

    wget "https://github.com/elm/compiler/releases/download/0.19.0/binaries-for-linux.tar.gz"  </br>
    tar xzf binaries-for-linux.tar.gz </br>
    mv elm /usr/local/bin/

2) install elm-test ->

    npm i -g elm-test@beta </br>
    sudo ln -s ~/node-packages/bin/elm-test /usr/local/bin/elm-test

3) go to project folder

4) start watching test ->

    elm-test --watch
