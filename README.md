# Clearview Historical Mapping Project — Site README

## Why some gallery images are blank/broken

Gallery images for signs 11, 12, and 13 show broken because the source files
haven't been downloaded from Google Drive yet. The HTML is already wired up —
you just need to add the files and run one command.

---

## Step 1 — Download from Google Drive into `sources/`

Save each file into the `site/sources/` folder. **Use the exact filename shown.**

### Sign 8 — James P. Owens
| Save as |
|---|
| `sign08_jp_owens.jpg` ← rename whatever photo is in the JP Owens Drive folder |

### Sign 10 — Clearview Public School
These can keep their original Drive filenames (save exactly as named):
```
1983_rodeo_image_11.jpg   1983_rodeo_image_12.jpg   1983_rodeo_image_13.jpg
1983_rodeo_image_14.jpg   1983_rodeo_image_15.jpg   1983_rodeo_image_36.jpg
back of high schoo.jpg    clearview_001.jpg          clearview_001.pdf
clearview_002.jpg         clearview_003.jpg          clearview_010.jpg
clearview_014.jpg         clearview_015.jpg          clearview_021.jpg
clearview_023.jpg         clearview_024.jpg          clearview_025.jpg
clearview_027_cropped_01.jpg  clearview_033.jpg      clearview_035.jpg
Clearview Gymnasium.jpg   Clearview School Science Building.jpg
```

### Sign 11 — Ed Castlow's Tavern
Save with exact original names:
```
Okemah_News_Leader_1951_07_31_1.pdf
The_Okfuskee_County_News_1936_10_15_3.pdf
The_Okfuskee_County_News_1961_09_21_5.pdf
Weleetka_American_1957_08_22_1.pdf
Weleetka_American_1957_11_07_1.pdf
```

### Sign 12 — Section Foreman's Shop
Save with exact original names (the script renames them automatically):
```
clearview_012.jpg
Ollie Walker Ft Smith & Western Railroad workers.jpeg
Pages from Clearview-5.pdf
```

### Sign 13 — J.C. Cossey
Save with exact original names:
```
Okemah_News_Leader_1946_05_02_2.pdf
The_Okemah_Ledger_1912_03_07_8.pdf     The_Okemah_Ledger_1913_12_04_7.pdf
The_Okemah_Ledger_1914_01_15_2.pdf     The_Okemah_Ledger_1915_04_08_1.pdf
The_Okemah_Ledger_1915_04_08_1 (1).pdf The_Okemah_Ledger_1915_06_24_2.pdf
The_Okemah_Ledger_1917_11_08_5.pdf     The_Okemah_Ledger_1920_03_25_3.pdf
The_Okemah_Ledger_1920_04_01_3.pdf     The_Okemah_Ledger_1920_09_30_2.pdf
The_Okemah_Ledger_1921_02_10_2.pdf     The_Okemah_Ledger_1924_05_01_8.pdf
The_Okfuskee_County_News_1946_05_02_2.pdf
The_Patriarch_1911_10_12_1.pdf         The_Patriarch_1911_11_02_1.pdf
The_Patriarch_1912_06_06_4.jpg         ← JPEG, no render needed
The_Patriarch_1912_06_27_8.pdf         The_Patriarch_1912_07_11_1.pdf
The_Patriarch_1912_07_18_1.pdf         The_Patriarch_1913_08_09_1.pdf
The_Patriarch_1913_08_23_3.pdf         The_Patriarch_1913_09_06_3.pdf
The_Patriarch_1913_10_25_1.pdf         The_Patriarch_1913_11_15_1.pdf
Weleetka_American_1922_03_23_1.pdf
```

---

## Step 2 — Install poppler (one time)

PDFs can't display as images in browsers, so the script converts each PDF to a
PNG for the gallery. You need poppler installed:

**macOS:**
```bash
brew install poppler
```

**Windows:**  
Download from https://github.com/oschwartz10612/poppler-windows/releases
and add the `bin/` folder to your PATH.

---

## Step 3 — Run the render script (from inside `site/`)

```bash
cd site
bash render_pdfs.sh
```

The script will:
- Rename files with spaces/special characters automatically
- Render every PDF to a PNG gallery image
- Tell you if any files are still missing

---

## Step 4 — Open the site

Open `site/index.html` in your browser. All gallery images should now load.

---

## Signs already fully working (no action needed)

Signs 1, 2, 3, 4, 5, 6, 7, 8 (history booklet), 9, 10 (existing photos)
