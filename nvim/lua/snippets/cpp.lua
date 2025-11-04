local ls = require("luasnip")
local lse = require("luasnip.extras")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node

local function filename()
    return vim.fn.expand("%:t") or "FileName.cpp"
end

local function today()
    return os.date("%B %d, %Y")
end

return {
    s("compsci", {
        t({ "/*", " * Program Name: " }),
        f(filename, {}),
        t({ "", " * Author:       Gurshaan Sandhu", " * Date:         " }),
        f(today, {}),
        t({
            "",
            " * Course:       COMP 150 -- ON1",
            " * Instructor:   Leon Pan",
            "*/",
            "",
            "#include <iostream>",
            "",
            "// Purpose: ",
        }),
        i(1, "A template for programs"),
        t({ "", "", "using namespace std;", "", "int main(int argc, char* argv[]) {", "    " }),
        i(0),
        t({
            "",
            "#ifdef _WIN32",
            '    system("PAUSE");',
            "#endif",
            "    return EXIT_SUCCESS;",
            "}",
        }),
    }),
    s("ternary", {
        i(1, "cond"),
        t({ " ? " }),
        i(2, "true"),
        t({ " : " }),
        i(3, "false"),
    }),
    s("arrsize", {
        t("sizeof("),
        i(1),
        t({ ") / sizeof(*" }),
        lse.rep(1),
        t(")"),
    }),
}
