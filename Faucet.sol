pragma solidity  ^0.5.0;

contract Faucet {
    
    address public owner;
    mapping (address => bool) didRecieve;
    
    constructor () public {
        owner = msg.sender;
    }
    
    function () payable external {
    }
    
    function getBalance() public view returns(uint){
        return address(this).balance;
    }
    
    function getCoin(uint256 amount) public {
        require( address(this).balance >=  amount, "not enought tokens");
        if (msg.sender != owner) {
            require(amount <= 0.1 ether, "big ammout of money");
            require(didRecieve[msg.sender] == false, "you already get coins");
        
            msg.sender.transfer(amount);
            didRecieve[msg.sender] = true;
        }
        else {
            msg.sender.transfer(amount);   
        }
    }
}
