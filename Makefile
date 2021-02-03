.PHONY: build
build:
	swift build

.PHONY: test
test:
	swift test --enable-test-discovery

.PHONY: install
install:
	swift build -c release
	cp -f .build/release/accs /usr/local/bin/.

.PHONY: docker-run-it
docker-run-it:
	docker run --rm -it \
		--volume "$(pwd):/src" \
		--workdir "/src" \
		swift:5.3
