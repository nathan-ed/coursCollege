
import re
import qrcode
import os

# Define paths
output_dir = "docs/images"  # Directory to save QR code images
markdown_file = "docs/generated_page.md"  # Output Markdown file

# QR code naming prefix
qr_code_prefix = "1M-fonctions"  # Change this prefix as needed

# Ensure output directory exists
os.makedirs(output_dir, exist_ok=True)

# Input file name
input_file = "input.tex"  # Replace with your actual input file name

# Read the input file with explicit UTF-8 handling
with open(input_file, "r", encoding="utf-8") as f:
    content = f.read()

# Regex patterns
section_pattern = r"\\textLigne\{(.*?)\}"
qr_pattern = r"\\qrwithlabel\{(.*?)\}\{(.*?)\}"

# Parse sections and QR codes
sections = re.split(section_pattern, content)
markdown_output = []

# Process each section
for i in range(1, len(sections), 2):
    section_title = sections[i].strip()
    qr_entries = re.findall(qr_pattern, sections[i + 1])

    # Add section header
    markdown_output.append(f"## {section_title}\n")

    # Start responsive container for QR codes
    markdown_output.append('<div class="qr-grid">\n')

    for j, (label, url) in enumerate(qr_entries, start=1):
        # Remove escaped characters in the URL (e.g., \% -> %)
        url = url.replace(r"\%", "%").strip()

        # Ensure the label is clean and decoded
        label = label.strip()

        # Generate QR code with the specified prefix
        qr_filename = f"{qr_code_prefix}_{i}_{j}.png"
        qr_filepath = os.path.join(output_dir, qr_filename)
        qr = qrcode.make(url)  # Use the cleaned URL
        qr.save(qr_filepath)

        # Add QR code to Markdown
        markdown_output.append(
            f'<div class="qr-item">\n'
            f'<a href="{url}" target="_blank">\n'
            f'<img src="images/{qr_filename}" alt="{label}" />\n'
            f'</a>\n'
            f'<p>{label}</p>\n'
            f'</div>\n'
        )

    # End responsive container
    markdown_output.append('</div>\n')

# Write Markdown to file with UTF-8 encoding
with open(markdown_file, "w", encoding="utf-8") as f:
    f.write("\n".join(markdown_output))

print(f"Markdown file generated: {markdown_file}")

