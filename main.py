import lxml.etree as ET

xml_file_name = "myanimelist.xml"  # Change the file name as required.
html_file_name = f"styled_{xml_file_name[:-4]}.html"

# Load the XML data and XSLT stylesheet as bytes
with open(xml_file_name, "rb") as f:
    xml_data = f.read()

with open("myanimelist.xslt", "r", encoding="utf-8") as f:
    xslt_stylesheet = f.read()

# Parse the XML and XSLT
xml_parser = ET.XMLParser(remove_blank_text=True)
xml_tree = ET.fromstring(xml_data, parser=xml_parser)

# Convert the XSLT stylesheet to bytes
xslt_bytes = xslt_stylesheet.encode("utf-8")

# Parse the XSLT as bytes and create the XSLT transformer
xslt_transform = ET.XSLT(ET.XML(xslt_bytes))

# Apply the XSLT transformation
result_tree = xslt_transform(xml_tree)

# Serialize the result tree to a nicely formatted string
output_html = ET.tostring(result_tree, pretty_print=True, encoding="unicode")

# Save the result to a file
with open(html_file_name, "w", encoding="utf-8") as f:
    f.write(output_html)

# Read the contents of "app.js"
with open("app.js", "r", encoding="utf-8") as f:
    app_js_contents = f.read()

# Create a script tag with the contents of "app.js"
script_tag = f"<script>\n{app_js_contents}\n</script>\n"

# Insert the script tag at the fourth-from-last line
with open(html_file_name, "r+", encoding="utf-8") as f:
    lines = f.readlines()
    lines.insert(-3, script_tag)
    f.seek(0)
    f.writelines(lines)

print(f"XSLT transformation and script insertion completed. The output \
        has been saved to \"{html_file_name}\".")
