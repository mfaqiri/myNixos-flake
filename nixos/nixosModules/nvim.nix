{ config, lib,...}: {
    programs.nvf = {
        enable = true;

        settings = {
            vim.viAlias = false;
            vim.vimAlias = true;
            vim.lsp = {
                enable = true;
            };

            vim.languages = {
                nix.enable = true;
            };
        };
    };
}
