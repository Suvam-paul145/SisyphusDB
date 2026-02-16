# KV-Store Makefile

.PHONY: build-server build-cli build-all install-cli all help


APP_NAME      = sicli
SERVER_NAME   = kv-server

OS := $(shell go env GOOS)
# Default target
all: build-all


build-cli:
	@echo "Building CLI"
	go build -o $(APP_NAME) ./cmd/cli

build-server:
	@echo "Building KV-Store server"
	go build -o $(SERVER_NAME) ./cmd/server

# Build both server and CLI
build-all: build-server build-cli
	@echo "Build complete!"

# Install CLI to system PATH
install-cli: build-cli
	@echo "Installing sicli to system PATH..."
ifeq ($(OS),windows)
	@echo "Windows detected. Unavailable."
else
	@if [ "$$(uname)" = "Darwin" ]; then \
		echo "Installing to /usr/local/bin (macOS)..."; \
		sudo cp sicli /usr/local/bin/sicli; \
		sudo chmod +x /usr/local/bin/sicli; \
	else \
		echo "Installing to /usr/local/bin (Linux)..."; \
		sudo cp sicli /usr/local/bin/sicli; \
		sudo chmod +x /usr/local/bin/sicli; \
	fi
	@echo "sicli installed successfully!"
	@echo "use 'sicli' "
endif

#Help
help:
	@echo "Targets:"
	@echo "  make build-cli       Build CLI"
	@echo "  make build-server    Build server"
	@echo "  make install-cli         Install sicli into PATH"
