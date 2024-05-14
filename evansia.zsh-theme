PROMPT='%{$fg_bold[magenta]%}%n%{$reset_color%} %{$fg_bold[yellow]%}›%{$reset_color%} %{$fg_bold[cyan]%}%~%{$reset_color%} $(git_prompt_info)
%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$reset_color%} '
RPROMPT='%{$fg_bold[grey]%}[%D{%a %b %d, %H:%M}]%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}\u00AB%{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[yellow]%}*%{$fg_bold[blue]%}\u00BB "
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[blue]%}\u00BB "
