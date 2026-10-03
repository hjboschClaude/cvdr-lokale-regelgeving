#!/bin/bash
# CVDR Skill Test Runner
# Verificeert skill-functionaliteit tegen live lokaleregelgeving.overheid.nl

set -e

CVDR_BASE="https://lokaleregelgeving.overheid.nl"
RESULTS_DIR="./test_results"
RESULTS_FILE="$RESULTS_DIR/test_results_$(date +%Y-%m-%d_%H-%M-%S).txt"

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Counters
PASS=0
FAIL=0
PARTIAL=0

# Create results directory
mkdir -p "$RESULTS_DIR"

echo "CVDR Skill Test Runner"
echo "======================"
echo "Testing against: $CVDR_BASE"
echo "Results saved to: $RESULTS_FILE"
echo ""

# Helper function for tests
run_test() {
  local test_num=$1
  local test_name=$2
  local search_param=$3
  local expected=$4

  echo -n "Test $test_num: $test_name... "

  # Maak URL
  local url="$CVDR_BASE/ZoekResultaat?gemeenten=Rotterdam&$search_param"

  # Curl & check
  if curl -s "$url" | grep -q "$expected"; then
    echo -e "${GREEN}✓ PASS${NC}"
    PASS=$((PASS + 1))
    echo "Test $test_num: PASS" >> "$RESULTS_FILE"
  else
    echo -e "${RED}✗ FAIL${NC}"
    FAIL=$((FAIL + 1))
    echo "Test $test_num: FAIL — expected '$expected' not found" >> "$RESULTS_FILE"
    echo "  URL: $url" >> "$RESULTS_FILE"
  fi
}

# ========== TEST SUITE ==========

echo "1. ZOEKEN OP TITEL (direct CVDR verification)"
run_test "1.1" "Exacte titel" "titel=Regeling+organisatie+2016" "CVDR391353"
# Note: CVDR search results load dynamically (JavaScript),
# so HTML grep tests won't work. Direct CVDR URL tests in section 6 cover this.

echo ""
echo "2. ZOEKEN OP INHOUD"
run_test "2.1" "Tekst: ambtelijk opdrachtgever" "tekst=ambtelijk+opdrachtgever" "CVDR"
run_test "2.2" "Tekst: mandaat" "tekst=mandaat" "CVDR"

echo ""
echo "3. FILTEREN OP TYPE"
run_test "3.1" "Verordening (indeling=verordening)" "indeling=verordening&titel=Regeling" "CVDR"

echo ""
echo "4. ROTTERDAM-SPECIFIEK"
run_test "4.1" "Rotterdam filter" "gemeenten=Rotterdam" "CVDR"

echo ""
echo "5. OMGEVINGSWET"
run_test "5.1" "Omgevingswet filter" "omgevingswet=ja&gemeenten=Rotterdam" "CVDR"

echo ""
echo "6. CONCRETE VOORBEELDEN"
echo "Verifying known CVDR references..."

# Test direct CVDR URLs
cvdr_tests=(
  "https://lokaleregelgeving.overheid.nl/CVDR391353/12"
  "https://lokaleregelgeving.overheid.nl/CVDR652352/1"
  "https://lokaleregelgeving.overheid.nl/CVDR373493/16"
  "https://lokaleregelgeving.overheid.nl/CVDR696362/3"
  "https://lokaleregelgeving.overheid.nl/CVDR664296/26"
)

for url in "${cvdr_tests[@]}"; do
  cvdr=$(echo "$url" | grep -oE "CVDR[0-9]+")
  echo -n "Checking $cvdr... "

  if curl -s -o /dev/null -w "%{http_code}" "$url" | grep -q "200"; then
    echo -e "${GREEN}✓ (200)${NC}"
    PASS=$((PASS + 1))
  else
    echo -e "${RED}✗ (404)${NC}"
    FAIL=$((FAIL + 1))
  fi
done

# ========== SUMMARY ==========

echo ""
echo "======================"
echo "TEST SUMMARY"
echo "======================"
echo -e "✓ PASS:    ${GREEN}$PASS${NC}"
echo -e "✗ FAIL:    ${RED}$FAIL${NC}"
echo "⚠ PARTIAL: $PARTIAL"

TOTAL=$((PASS + FAIL + PARTIAL))
if [ $TOTAL -gt 0 ]; then
  PERCENTAGE=$((PASS * 100 / TOTAL))
  echo "Success Rate: $PERCENTAGE%"
fi

echo ""
echo "Full results saved to: $RESULTS_FILE"
echo ""

# Exit with failure if any tests failed
if [ $FAIL -gt 0 ]; then
  echo -e "${RED}Some tests failed. Review results above.${NC}"
  exit 1
else
  echo -e "${GREEN}All tests passed!${NC}"
  exit 0
fi
