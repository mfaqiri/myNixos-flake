{ pkgs }: {
  programs.nvf = {
    enable = true;

    settings = {

      vim  = {

        keymaps = [
          {
            key = "<leader>pv";
            mode = "n";
            action = ":Ex<CR>";
          }

          {
            key = "J";
            mode = "v";
            action = ":m '>+1<CR>gv=gv";
          }

          {
            key = "K";
            mode = "v";
            action = ":m '<-2<CR>gv=gv";
          }
          
          {
            key = "J";
            mode = "n";
            action = "mzJ`z";
          }
          
          {
            key = "<C-d>";
            mode = "n";
            action = "<C-d>zz";
          }

          {
            key = "<C-u>";
            mode = "n";
            action = "<C-u>zz";
          }

          {
            key = "n";
            mode = "n";
            action = "nzzzv";
          }
          
          {
            key = "n";
            mode = "n";
            action = "Nzzzv";
          }

          {
            key = "<leader>p";
            mode = "x";
            action = "\"_dP";
          }
          
          {
            key = "<leader>y";
            mode = "n";
            action = "+y";
          }

          {
            key = "<leader>Y";
            mode = "n";
            action = "+Y";
          }

          {
            key = "Q";
            mode = "n";
            action = "<nop>";
          }
          
          {
            key = "<C-k>";
            mode = "n";
            action = "<cmd>cnext<CR>zz";
          }
          
          {
            key = "<C-j>";
            mode = "n";
            action = "<cmd>cprev<CR>zz";
          }

          {
            key = "<leader>k";
            mode = "n";
            action = "<cmd>lnext<CR>zz";
          }
          
          {
            key = "<leader>j";
            mode = "n";
            action = "<cmd>lprev<CR>zz";
          }

          {
            key = "<leader>s";
            mode = "n";
            action = ":%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>";
          }

          {
            key = "<leader>x";
            mode = "n";
            silent = true;
            action = "<cmd>!chmod +x %<CR>";
          }

          {
            key = "<leader>ee";
            mode = "n";
            silent = true;
            action = "oif err != nil {<CR>}<Esc>Oreturn err<Esc>";
          }

          {
            key = "<leader><leader>";
            mode = "n";
            silent = true;
            action = ":%so";
          }

        ];

        options = {
          
guicursor = "";

          nu = true;
          relativenumber = true;

          tabstop = 4;
          softtabstop = 4;
          shiftwidth = 4;
          expandtab = true;

          smartindent = true;

          wrap = false;

          swapfile = false;
          backup = false;

          undodir = "~/.vim/undodir";
          undofile = true;

          hlsearch = false;
          incsearch = true;

          termguicolors = true;

          scrolloff = 8;
          signcolumn = "yes";

          updatetime = 50;

          colorcolumn = "80";

        };




        theme = {
          enable = true;
        };
        
        viAlias = false;
        vimAlias = true;


        languages = {

          enableLSP = true;
          enableTreesitter = true;

          nix = {
            enable = true;

            format.enable = true;

          };
        };

        autocomplete.nvim-cmp.enable = true;

        comments.comment-nvim.enable = true;

        debugger.nvim-dap.enable = true;

        statusline.lualine.enable = true;

        telescope.enable = true;

        extraPlugins = with pkgs.vimPlugins; {

          aerial = {
            package = aerial-nvim;
            setup = "require('aerial').setup {}";
          };
          
          harpoon = {
            package = harpoon;
            setup = "require('harpoon').setup {}";
            after = ["aerial"]; # place harpoon configuration after aerial
          };

        };
      };
    };
  };

}

