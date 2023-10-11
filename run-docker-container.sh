#!/bin/sh
delete() {
    docker rm -f serv1
    docker rm -f serv2
    docker rm -f serv3
}

build() {
    docker build -t demo/serv1 ./demo1
    docker build -t demo/serv2 ./demo2
    docker build -t demo/serv3 ./demo3
}

run() {
    docker run -d -p 8081:8081 --name serv1 demo/serv1
    docker run -d -p 8082:8082 --name serv2 demo/serv2
    docker run -d -p 8083:8083 --name serv3 demo/serv3
}

case "$1" in
    delete)
        delete
        ;;
    build)
        build
        ;;
    run)
        run
        ;;
    *)
        echo "Usage: $0 {delete|build|run}"
esac