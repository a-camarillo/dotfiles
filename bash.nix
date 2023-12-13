{...}: {
	programs.bash = {
		enable = true;
		initExtra = ''
	PS1="\[\033[36m\]\u \[\033[31m\]\W\[\033[00m\] on \[\033[35m\]\$(git symbolic-ref --short HEAD 2>/dev/null) \[\033[00m\] \[\033[32m\]\[\033[00m\] "
	'';
	};
}

