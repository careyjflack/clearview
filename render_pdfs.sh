#!/bin/bash
# ============================================================
# render_pdfs.sh — Clearview Historical Mapping Project
# 
# Run this from inside the site/ folder AFTER placing all
# downloaded PDF files into sources/.
#
# Install poppler first:
#   macOS:  brew install poppler
#   Linux:  sudo apt install poppler-utils
#
# Usage:
#   cd site
#   bash render_pdfs.sh
# ============================================================

cd "$(dirname "$0")"
MISSING=0

render() {
  local pdf="sources/$1"
  local base="${1%.pdf}"
  local out="sources/${base}-1.png"
  if [ -f "$pdf" ]; then
    if [ ! -f "$out" ]; then
      echo "  Rendering: $1"
      pdftoppm -r 150 "$pdf" "sources/${base}" -png -f 1 -l 1
    else
      echo "  OK (exists): $(basename $out)"
    fi
  else
    echo "  ⚠ MISSING PDF: $1"
    MISSING=$((MISSING+1))
  fi
}

rename_file() {
  local src="sources/$1"
  local dst="sources/$2"
  if [ -f "$src" ] && [ ! -f "$dst" ]; then
    cp "$src" "$dst"
    echo "  Renamed → $2"
  fi
}

echo ""
echo "=== Sign 11 — Ed Castlow's Tavern ==="
render "Okemah_News_Leader_1951_07_31_1.pdf"
render "The_Okfuskee_County_News_1936_10_15_3.pdf"
render "The_Okfuskee_County_News_1961_09_21_5.pdf"
render "Weleetka_American_1957_08_22_1.pdf"
render "Weleetka_American_1957_11_07_1.pdf"

echo ""
echo "=== Sign 12 — Section Foreman's Shop ==="
rename_file "Ollie Walker Ft Smith & Western Railroad workers.jpeg" "sign12_ollie_walker.jpg"
rename_file "Pages from Clearview-5.pdf" "sign12_clearview_p5.pdf"
render "sign12_clearview_p5.pdf"
# clearview_012.jpg — use as-is, no rename needed

echo ""
echo "=== Sign 13 — J.C. Cossey ==="
# Handle the "(1)" variant filename
if [ -f "sources/The_Okemah_Ledger_1915_04_08_1 (1).pdf" ]; then
  cp "sources/The_Okemah_Ledger_1915_04_08_1 (1).pdf" "sources/The_Okemah_Ledger_1915_04_08_1_v2.pdf"
  echo "  Copied April 8 1915 variant → _v2"
fi
render "The_Patriarch_1911_10_12_1.pdf"
render "The_Patriarch_1911_11_02_1.pdf"
render "The_Patriarch_1912_06_27_8.pdf"
render "The_Patriarch_1912_07_11_1.pdf"
render "The_Patriarch_1912_07_18_1.pdf"
render "The_Patriarch_1913_08_09_1.pdf"
render "The_Patriarch_1913_08_23_3.pdf"
render "The_Patriarch_1913_09_06_3.pdf"
render "The_Patriarch_1913_10_25_1.pdf"
render "The_Patriarch_1913_11_15_1.pdf"
render "The_Okemah_Ledger_1912_03_07_8.pdf"
render "The_Okemah_Ledger_1913_12_04_7.pdf"
render "The_Okemah_Ledger_1914_01_15_2.pdf"
render "The_Okemah_Ledger_1915_04_08_1.pdf"
render "The_Okemah_Ledger_1915_04_08_1_v2.pdf"
render "The_Okemah_Ledger_1915_06_24_2.pdf"
render "The_Okemah_Ledger_1917_11_08_5.pdf"
render "The_Okemah_Ledger_1920_03_25_3.pdf"
render "The_Okemah_Ledger_1920_04_01_3.pdf"
render "The_Okemah_Ledger_1920_09_30_2.pdf"
render "The_Okemah_Ledger_1921_02_10_2.pdf"
render "The_Okemah_Ledger_1924_05_01_8.pdf"
render "Okemah_News_Leader_1946_05_02_2.pdf"
render "The_Okfuskee_County_News_1946_05_02_2.pdf"
render "Weleetka_American_1922_03_23_1.pdf"
# The_Patriarch_1912_06_06_4.jpg — JPEG, no render needed

echo ""
echo "=== Sign 10 — Clearview Public School ==="
rename_file "back of high schoo.jpg"           "sign10_back_school.jpg"
rename_file "Clearview Gymnasium.jpg"           "sign10_gymnasium.jpg"
rename_file "1983_rodeo_image_11.jpg"           "sign10_rodeo_1983_e.jpg"
rename_file "1983_rodeo_image_12.jpg"           "sign10_rodeo_1983_f.jpg"
rename_file "1983_rodeo_image_13.jpg"           "sign10_rodeo_1983_g.jpg"
rename_file "1983_rodeo_image_14.jpg"           "sign10_rodeo_1983_h.jpg"
rename_file "1983_rodeo_image_15.jpg"           "sign10_rodeo_1983_i.jpg"
rename_file "1983_rodeo_image_36.jpg"           "sign10_rodeo_1983_j.jpg"
render "clearview_001.pdf"
# All clearview_NNN.jpg files are used with their original names — no rename needed

echo ""
echo "=== Sign 8 — James P. Owens ==="
echo "  ⚠ Download the JP Owens photo from Drive, save as: sources/sign08_jp_owens.jpg"

echo ""
if [ "$MISSING" -gt 0 ]; then
  echo "⚠  $MISSING PDF(s) still missing. Download from Drive and re-run this script."
else
  echo "✓  All PDFs found and rendered."
fi
echo "Open site/index.html in your browser."

echo ""
echo "=== Sign 14 — Hicks Holmes ==="
rename_file "Hattie (Duby) Holmes.jpg"        "sign14_hattie_holmes.jpg"
rename_file "1986_rodeo_program_005.jpg"       "sign14_rodeo_1986.jpg"
rename_file "1989_rodeo_program_002.jpg"       "sign14_rodeo_1989.jpg"
render "The_Patriarch_1911_11_09_4.pdf"

echo ""
echo "=== Sign 16 — Diddy Oliver Grocery Store ==="
rename_file "1983_rodeo_image_10.jpg"                    "sign16_rodeo_1983.jpg"
rename_file "The_Okemah_Ledger_1918_06_27_1 (1).pdf"    "The_Okemah_Ledger_1918_06_27_1_v2.pdf"
rename_file "The_Patriarch_1911_04_20_1 (2).pdf"         "The_Patriarch_1911_04_20_1_v2.pdf"
rename_file "The_Patriarch_1916_07_07_2 (1).pdf"         "The_Patriarch_1916_07_07_2_v2.pdf"
rename_file "The_Patriarch_1916_08_04_3 (1).pdf"         "The_Patriarch_1916_08_04_3_v2.pdf"
rename_file "The_Patriarch_1916_08_04_3 (2).pdf"         "The_Patriarch_1916_08_04_3_v3.pdf"
render "The_Okemah_Ledger_1918_06_27_1.pdf"
render "The_Okemah_Ledger_1918_06_27_1_v2.pdf"
render "The_Okfuskee_County_News_1915_07_01_8.pdf"
render "The_Patriarch_1911_04_20_1.pdf"
render "The_Patriarch_1911_04_20_1_v2.pdf"
render "The_Patriarch_1911_05_18_1.pdf"
render "The_Patriarch_1911_09_28_2.pdf"
render "The_Patriarch_1911_12_21_4.pdf"
render "The_Patriarch_1916_07_07_2.pdf"
render "The_Patriarch_1916_07_07_2_v2.pdf"
render "The_Patriarch_1916_08_04_3.pdf"
render "The_Patriarch_1916_08_04_3_v2.pdf"
render "The_Patriarch_1916_08_04_3_v3.pdf"
render "The_Weekly_Progress_1911_09_07_8.pdf"
render "The_Weekly_Progress_1915_10_16_3.pdf"
render "The_Weekly_Progress_1926_04_22_3.pdf"
render "The_Weekly_Progress_1926_04_29_4.pdf"
render "The_Weekly_Progress_1926_05_20_1.pdf"
# The_Patriarch_1911_08_17_3.jpg — JPEG, no render needed

echo ""
echo "=== Sign 17 — First Baptist Church ==="
rename_file "1985_rodeo_program_004.jpg"    "sign17_rodeo_1985.jpg"
rename_file "Pages from Clearview.pdf"      "sign17_clearview_booklet.pdf"
render "sign17_clearview_booklet.pdf"
# clearview_009.jpg — use as-is

echo ""
echo "=== Sign 18 — M.J. Blanks ==="
rename_file "The_Patriarch_1911_08_17_2 (2).jpg"  "sign18_patriarch_1911_08_17.jpg"
render "The_Patriarch_1914_05_30_6.pdf"
# The_Patriarch_1914_05_30_6.jpg and The_Patriarch_1914_05_02_5.jpg — JPEGs, no render needed

echo ""
echo "=== Sign 27 — Abe Lincoln Trading Company ==="
rename_file "Abe Lincoln Trading Company Storefront.pdf"  "sign27_storefront.pdf"
rename_file "clearview_002.pdf"                           "sign27_clearview_002.pdf"
render "sign27_storefront.pdf"
render "sign27_clearview_002.pdf"
render "The_Lincoln_Tribune_1904_09_24_1.pdf"
render "The_Oklahoma_State_Capital_1904_09_24_5.pdf"
