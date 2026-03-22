.PHONY: proto proto-generate proto-lint proto-format proto-format-check proto-check-generated test ci

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

proto-format-check:
	buf format --diff --exit-code

proto-check-generated:
	buf generate
	git diff --exit-code -- gen/go

test:
	go test ./...

ci: proto-format-check proto-lint test proto-check-generated
