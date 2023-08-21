import lxml.etree as ET

# Load the XML data and XSLT stylesheet as bytes
with open('animelist.xml', 'rb') as f:
    xml_data = f.read()

with open('myanimelist.xslt', 'r', encoding='utf-8') as f:
    xslt_stylesheet = f.read()

# Parse the XML and XSLT
xml_parser = ET.XMLParser(remove_blank_text=True)
xml_tree = ET.fromstring(xml_data, parser=xml_parser)

# Convert the XSLT stylesheet to bytes
xslt_bytes = xslt_stylesheet.encode('utf-8')

# Parse the XSLT as bytes and create the XSLT transformer
xslt_transform = ET.XSLT(ET.XML(xslt_bytes))

# Apply the XSLT transformation
result_tree = xslt_transform(xml_tree)

# Serialize the result tree to a nicely formatted string
output_html = ET.tostring(result_tree, pretty_print=True, encoding='unicode')

# Save the result to a file
with open('styled_myanimelist.html', 'w', encoding='utf-8') as f:
    f.write(output_html)

with open("styled_myanimelist.html", "r") as file:
    lines = file.readlines()
    lines.insert(5, "<script src='app.js'></script>\n")

print("XSLT transformation completed. The output has been saved to 'styled_myanimelist.html'.")
