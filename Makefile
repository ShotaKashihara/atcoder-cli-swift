build:
	swift build

test:
	swift test --enable-test-discovery

install:
	swift build -c release
	cp -f .build/release/accs /usr/local/bin/.

docker-run-it:
	docker run --rm -it \
		--volume "$(pwd):/src" \
		--workdir "/src" \
		swift:5.3

.PHONY: build test install docker-run-it
