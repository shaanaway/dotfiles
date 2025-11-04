local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    s("compsci", {
        t({
            "\\documentclass{article}",
            "\\usepackage{amsmath}",
            "\\author{Gurshaan Sandhu}",
            "\\date{\\today}",
            "\\title{",
        }),

        i(1, "Assignment Name"),
        t({
            "\\\\[1ex] \\large COMP 125 ON1}",
            "\\begin{document}",
            "\\maketitle",
            "",
            "\\section{",
        }),
        i(2, "Section Name"),
        t({ "}", "" }),
        i(0, "Start typing"),
        t({ "", "\\end{document}" }),
    }),
}
