# convert images to ps before running (convert image.png image.ps)
#!/bin/bash
groff -ms report.ms -Tps > report.ps
ps2pdf report.ps
