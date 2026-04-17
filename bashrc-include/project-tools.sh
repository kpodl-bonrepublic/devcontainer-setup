if [ -d ~/.proto ]; then
    export PROTO_HOME="$HOME/.proto";
    export PATH="$PROTO_HOME/shims:$PROTO_HOME/bin:$PATH";
fi