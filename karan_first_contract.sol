pragma solidity ^0.4.0;


interface Regulator {
    function checkValue(uint amount) returns (bool);
    function loan() returns (bool);
}

contract Bank is Regulator {
    uint private value;
    address private owner;
    
    modifier ownerFunc {
        require(owner == msg.sender);
        _;
    }
    
    function testThrow() {
        throw;
    }
    
    function Bank( uint amount) {
        value = amount;
        owner = msg.sender;
    }
     
    function deposit(uint amount) ownerFunc {
        value += amount;
    }
    
    function withdraw(uint amount) ownerFunc {
        if(checkValue(amount)){
             value -= amount;
        }
    }
    
    function balance() returns(uint) {
        return value;
    }
    
      
    function checkValue(uint amount) returns(bool) {
        return value >= amount;
    }
    
    function loan() returns(bool) {
        return true;
    }
    
    
}

contract MyFirstContract is Bank {
    string private name;
    uint private age;
    
    function setName(string newName) {
        name = newName;
    }
    
    function getName() returns (string) {
        return name;
    } 
    
    function setAge(uint newAge) {
        age = newAge;
    }
    
    function getAge() returns (uint) {
        return age;
    }
    
  
}


contract testThrows {
     function testAssert() {
         assert(false);
     }   
     
     function testRequire() {
         require(2==1);
     }
     
     
     function testRevert() {
         revert();
     }
     
     function testThrow() {
         throw;
     }
}
