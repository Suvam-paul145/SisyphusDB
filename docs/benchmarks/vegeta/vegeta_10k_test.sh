# #!/bin/bash
# # Vegeta load test script for SisyphusDB write throughput benchmarks
# # Requires: vegeta (https://github.com/tsenart/vegeta)
# # Usage: ./vegeta_10k_test.sh [TARGET_URL]
# #
# # Prerequisite: Start the 3-node cluster first
# #   docker-compose up -d
# #
# # Default target: http://localhost:8001/put?key=load&val=test

# set -euo pipefail

# TARGET_URL="${1:-http://localhost:8001/put?key=load&val=test}"
# DURATION="5s"
# OUTPUT_DIR="$(dirname "$0")"

# echo "=== SisyphusDB Vegeta Write Throughput Benchmarks ==="
# echo "Target: $TARGET_URL"
# echo "Duration: $DURATION"
# echo ""

# for RATE in 5000 8000 10000; do
#     echo "--- Testing @ ${RATE} RPS ---"
#     echo "GET ${TARGET_URL}" | \
#         vegeta attack -duration="${DURATION}" -rate="${RATE}" | \
#         vegeta report
#     echo ""
# done

# echo "=== All tests complete ==="
# echo ""
# echo "To generate a plot:"
# echo "  echo 'GET ${TARGET_URL}' | vegeta attack -duration=5s -rate=10000 | vegeta plot > plot.html"
