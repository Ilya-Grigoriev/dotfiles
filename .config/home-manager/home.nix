{ config, pkgs, ... }:

{
  home.username = "ilya";
  home.homeDirectory = "/home/ilya";

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

  programs.bash = {
	  enable = true;
	  shellAliases = {
		rebuild = "sudo nixos-rebuild switch";
		home-rebuild = "home-manager switch";
		home-config = "vim ~/.config/home-manager/home.nix";
	  };
  };

  xdg.configFile.vim.source = /home/ilya/.vim; 
  programs.vim = {
	  enable = true;
	  plugins = with pkgs.vimPlugins; [ jellybeans-vim  vimtex vim-snippets fzfWrapper ultisnips YouCompleteMe];
	  settings = { ignorecase = true; };
	  extraConfig = ''
		  set mouse=a

		  nnoremap <C-t> :terminal ++close
		  vnoremap <C-y> :w !xclip -i -sel c<CR><CR>
		  imap jk <Esc>
		  nnoremap 's :%s/
		  nnoremap <C-n> :Ntree<CR>
		  nnoremap 't :tabnew<CR>
		  nnoremap <C-Bslash> :tab :terminal ++close<CR>
		  nnoremap ,gg :terminal ++close lazygit<CR>

		  " Appearence
		  set number
		  set colorcolumn=79
		  set cursorline
		  set wildmenu
		  set ignorecase

		  set laststatus=2

		  filetype on
		  filetype plugin on
		  filetype indent on

		  syntax on

		  " Set up plugins
		  let g:tex_flavor = "latex"
                  let g:vimtex_view_method = 'zathura'
                  nnoremap ,to :VimtexView<CR>
                  nnoremap ,tc :VimtexCompile<CR>

		  nnoremap ,f :FZF<CR>
		  '';
  };
}
