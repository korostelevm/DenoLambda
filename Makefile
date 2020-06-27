build-ServiceApiFunction:
	# Compile the handler (and cache dependencies and compile artifacts into DENO_DIR).
	echo .deno_dir
	DENO_DIR=.deno_dir deno cache src/handler.ts
	# DENO_DIR=.deno_dir deno cache src/handler.ts

	# This is the "remapping" step:
	cp -R .deno_dir/gen/file/$PWD/ .deno_dir/LAMBDA_TASK_ROOT
	# Note: We do the inverse of this operation in bootstrap.

	zip lambda.zip -x '.deno_dir/gen/file/*' -r .deno_dir handler.ts  # other source files
	# cargo build --release --target x86_64-unknown-linux-musl
	# cp ./target/x86_64-unknown-linux-musl/release/bootstrap $(ARTIFACTS_DIR)

deploy:
	sam deploy --no-fail-on-empty-changeset