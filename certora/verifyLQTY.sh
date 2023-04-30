if [[ "$1" ]]
then
    RULE="--rule $1"
fi


certoraRun packages/contracts/contracts/LQTY/LQTYToken.sol  \
    --verify LQTYToken:certora/erc20mintable.spec $RULE  \
    --staging \
    --solc solc6.11 \
    --optimistic_loop \
    --settings -enableEqualitySaturation=false,-solver=z3,-smt_usePz3=true,-smt_z3PreprocessorTimeout=2 \
    --solc_args '["--experimental-via-ir"]' \
    --msg "LQTY:erc20mintable.spec $1"
