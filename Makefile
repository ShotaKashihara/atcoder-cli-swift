PREFIX?=/usr/local

build:
	swift build -c release --disable-sandbox

test:
	swift test --enable-test-discovery

install: build
	mkdir -p "$(PREFIX)/bin"
	cp -f ".build/release/accs" "$(PREFIX)/bin/accs"

docker-run-it:
	docker run --rm -it \
		--volume "$(pwd):/src" \
		--workdir "/src" \
		swift:5.3

.PHONY: build test install docker-run-it
