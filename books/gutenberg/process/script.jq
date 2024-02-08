def extract: capture("(?<prefix>.+?\\*{3} START OF THE PROJECT GUTENBERG EBOOK .*? \\*{3}\\s++)(?<text>.*\\S)(?<suffix>\\s*\\*\\*\\* END OF THE PROJECT GUTENBERG EBOOK.*+$)"; "m");

