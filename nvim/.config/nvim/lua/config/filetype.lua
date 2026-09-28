vim.filetype.add({
  pattern = {
    -- helm
    [".*/helmfile%.d/.*%.ya?ml"] = "helm",
    [".*/templates/.*%.tpl"] = "helm",
    [".*/templates/.*%.ya?ml"] = "helm",
    [".*/values.*%.ya?ml"] = "helm",

    -- j2
    [".*%.ya?ml%.j2"] = "yaml",

    -- tftpl
    [".*%.json%.tftpl"] = { "json", { priority = 10 } },
    [".*%.sh%.tftpl"] = { "sh", { priority = 10 } },
    [".*%.ya?ml%.tftpl"] = { "yaml", { priority = 10 } },
    [".*%.tftpl"] = { "hcl", { priority = 0 } },
  },
})
