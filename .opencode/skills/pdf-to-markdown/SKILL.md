---
name: pdf-to-markdown
description: Convert PDF files to Markdown using marker. Uses uvx to run marker without installation.
---

# Convert PDF to Markdown

Use this skill when the user wants to convert PDF documents to Markdown format.

## Your Task

1. **Get the PDF file path** - Ask the user for the PDF file(s) to convert
2. **Run marker via uvx** - Convert PDF to Markdown using marker
3. **Save the output** - Markdown files are saved alongside the original PDFs

## Step 1: Get the PDF File

Ask the user: "Please provide the path to the PDF file(s) you want to convert to Markdown."

## Step 2: Convert PDF to Markdown

Use marker via uvx to convert the PDF:

```bash
uvx --from marker-pdf marker_single <pdf_file> <output_directory>
```

Example:
```bash
uvx --from marker-pdf marker_single document.pdf ./output
```

This will:
- Convert the PDF to Markdown
- Save the output to the specified directory
- Create an `images` folder in the output directory for extracted images

### Converting Multiple PDFs

Run marker for each file with different output directories:

```bash
uvx --from marker-pdf marker_single doc1.pdf ./doc1_output
uvx --from marker-pdf marker_single doc2.pdf ./doc2_output
```

### Common Options

- `--disable-ocr` - Disable OCR processing
- `--force-ocr` - Force OCR for all pages

## Step 3: Verify Output

Check that:
1. The `.md` file was created
2. Images are saved in the `_marker_assets` folder
3. The markdown content is accurate

## Key Guidelines

1. **Use uvx** - Always run via `uvx marker` to avoid local installation
2. **Keep original location** - Default behavior saves markdown alongside source PDF
3. **Check for images** - Marker extracts images; verify they're captured correctly
4. **Large PDFs** - Use `--parallel` for faster processing of multi-page documents
5. **Scanned PDFs** - Use `--force_ocr` if the PDF contains scanned images

## Example Commands

```bash
# Convert a PDF to markdown
uvx --from marker-pdf marker_single report.pdf ./output

# Convert to current directory
uvx --from marker-pdf marker_single resume.pdf .

# Force OCR for scanned documents
uvx --from marker-pdf marker_single scanned_doc.pdf ./output --force-ocr
```

## Output Structure

For a PDF converted to `./output`:
- `./output/document.md` - The converted markdown
- `./output/images/` - Folder containing extracted images
