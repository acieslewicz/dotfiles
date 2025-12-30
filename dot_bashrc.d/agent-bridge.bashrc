export SSH_AUTH_SOCK=$HOME/.ssh/agent.sock
if [ ! -S "$SSH_AUTH_SOCK" ]; then
    pkill -f "socat.*$SSH_AUTH_SOCK" 2>/dev/null
    rm -f $SSH_AUTH_SOCK
    ( setsid socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork EXEC:"npiperelay.exe -ei -s //./pipe/openssh-ssh-agent",nofork & ) >/dev/null 2>&1
fi
