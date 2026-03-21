.PHONY: proto proto-generate proto-lint proto-format test

proto:
	mkdir -p gen/go
	buf generate

proto-generate:
	mkdir -p gen/go
	buf generate

proto-lint:
	buf lint

proto-format:
	buf format -w

test:
	go test ./...
