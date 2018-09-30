[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /root/tms/packages/tms-externals/node_modules/tabtab/.completions/serverless.bash ] && . /root/tms/packages/tms-externals/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /root/tms/packages/tms-externals/node_modules/tabtab/.completions/sls.bash ] && . /root/tms/packages/tms-externals/node_modules/tabtab/.completions/sls.bash
