project-version := `git describe --tags`

#publish-maven-auth-options := "--user env:OSSRH_USERNAME --password env:OSSRH_PASSWORD --gpg-key $PGP_KEY_ID --gpg-option --pinentry-mode --gpg-option loopback --gpg-option --passphrase --gpg-option $PGP_PASSWORD"
publish-maven-auth-options := "--user env:OSSRH_USERNAME --password env:OSSRH_PASSWORD --gpg-key $PGP_KEY_ID --gpg-option --pinentry-mode --gpg-option loopback"

setup-ide:
	@scala-cli --power setup-ide .

show-version:
	@echo {{project-version}}

publish-maven:
	scala-cli --power publish . --project-version {{project-version}} {{publish-maven-auth-options}}

publish-local:
	@scala-cli --power publish local . --project-version {{project-version}} --suppress-experimental-feature-warning

test:
	#!/usr/bin/env bash
	set -euo pipefail
	tests_dir="{{justfile_directory()}}/tests"
	# normal run
	output=$(scala-cli run . -- "$tests_dir" 2>&1)
	echo "$output"
	echo "$output" | grep -q "All snippets run succesfully!" || { echo "FAIL: expected all snippets to succeed"; exit 1; }
	echo "$output" | grep -q "6 succeed, 2 ignored" || { echo "FAIL: basic suite counts mismatch"; exit 1; }
	echo "$output" | grep -q "2 succeed, 0 ignored" || { echo "FAIL: cross-compilation suite counts mismatch"; exit 1; }
	echo "$output" | grep -q "3 succeed, 0 ignored" || { echo "FAIL: multi-file suite counts mismatch"; exit 1; }
	# compile-only run
	output=$(scala-cli run . -- --compile-only "$tests_dir" 2>&1)
	echo "$output"
	echo "$output" | grep -q "All snippets run succesfully!" || { echo "FAIL: expected all snippets to succeed in compile-only mode"; exit 1; }
	echo "All tests passed!"
