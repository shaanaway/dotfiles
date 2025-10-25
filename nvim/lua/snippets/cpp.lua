local ls = require("luasnip")
local snip = ls.snippet
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node

-- Helper functions
local function filename()
    return vim.fn.expand("%:t") or "FileName.cpp"
end

local function today()
    return os.date("%B %d, %Y") -- e.g. "October 25, 2025"
end

return {
    snip("template", {
        text({ "/*", " * Program Name: " }),
        func(filename, {}),
        text({ "", " * Author:       Gurshaan Sandhu", " * Date:         " }),
        func(today, {}),
        text({
            "",
            " * Course:       COMP 150 -- ON1",
            " * Instructor:   Leon Pan",
            "*/",
            "",
            "#include <iostream>",
            "",
            "// Purpose: ",
        }),
        insert(1, "A template for programs"),
        text({ "", "", "using namespace std;", "", "int main() {", "    " }),
        text({
            "",
            "#ifdef _WIN32",
            '    system("PAUSE");',
            "#endif",
            "    return EXIT_SUCCESS;",
            "}",
        }),
    }),
}
