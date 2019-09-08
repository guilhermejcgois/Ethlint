pragma solidity ^0.4.4;

contract Counter {

    function Counter() {
        assembly {
            let x := 0

            switch calldataload(4)
            case 0 { x := calldataload(0x24) }
            default {
                x := calldataload(0x44)
            }

            if eq(x, 0) { return(0) }

            function mult3(val) -> result {
              result := mul(val, 0x03)
            }
            for { let i := x } gt(i, 0x0) { i := sub(i, 0x02) } {
                mult3(i)
            }
        }
    }
}
