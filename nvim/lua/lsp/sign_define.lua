-- set sign
local fn = vim.fn

fn.sign_define(
    "LspDiagnosticsSignError",
    {
        texthl = "LspDiagnosticsSignError", 
        text = "", 
        numhl = "LspDiagnosticsSignError"
    }
)

fn.sign_define(
    "LspDiagnosticsSignWarning",
    {
        texthl = "LspDiagnosticsSignWarning", 
        text = "", 
        numhl = "LspDiagnosticsSignWarning"
    }
)

fn.sign_define(
    "LspDiagnosticsSignHint",
    {
        texthl = "LspDiagnosticsSignHint", 
        text = "", 
        numhl = "LspDiagnosticsSignHint"
    }
)

fn.sign_define(
    "LspDiagnosticsSignInformation",
    {
        texthl = "LspDiagnosticsSignInformation", 
        text = "", 
        numhl = "LspDiagnosticsSignInformation"
    }
)
