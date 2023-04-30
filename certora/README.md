# Running an ERC20 generic spec on LQTY token.

## Execution

run `sh certora/verifyLQTY.sh` from the project's root directory

## Result

[https://vaas-stg.certora.com/output/67509/9f46417ea38d4b328356fbbc461f87d5?anonymousKey=37a8392072a7eae3a646752b4555660db34111ae](https://vaas-stg.certora.com/output/67509/9f46417ea38d4b328356fbbc461f87d5?anonymousKey=37a8392072a7eae3a646752b4555660db34111ae)

### Explanation for rule violations

Since we run the prover with a generic ERC20 spec, it detects non-standard token behavior. With LQTY this includes transfer protection, built-in team token vesting and `sendToLQTYStaking()`

- transferFromReverts rule shows the counterexample, where a transfer from the team wallet reverts
- OtherBalanceOnlyGoesUp shows the counterexample where sendToLQTYStaking decreases the balance of an arbitrary user
- transferCorrect shows the counterexample where tokens are sent to the communityIssuanceAddress