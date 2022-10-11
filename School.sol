// SPDX-License-Identifier: MIT
pragma solidity >=0.4.0 < 0.9.0;
  
contract School
{
    
    address public owner;
    uint public mostSent;
    address public richest;
    
   struct Student
    {   
        int256 rollNumber; // use int256 in place of int
        int256 regnumber;
        string fName;
        string lName;
        string dob; // dob is in string since we have to use the - symbol too which is not a int
        int256 marks;
    }
  
    int public stdCount = 0;
    //mapping(int => Student) public stdRecords;
    Student[] public stdRecords; // stdRecords must be an array as we have to push the details in it
  
    modifier onlyOwner
    {
        require(owner == msg.sender);
        _;
    }

    constructor() public
    {
        owner=msg.sender;
    }
   
    mapping (address => uint) pendingWithdraws;

    function addNewRecords(int256 _rollNumber,int256 _regnumber,string memory _fName,string memory _lName,string memory _dob, int256 _marks) public 
    {
        
        stdCount = stdCount + 1;  	// to fetch details of students, I have used count since i didnt understand how to do it using regnumber)
        //stdRecords[stdCount] = Student(_rollNumber, _regnumber, _fName, _lName, _dob, _marks);
        stdRecords.push(Student({rollNumber:_rollNumber, regnumber:_regnumber, fName:_fName, lName:_lName, dob:_dob, marks:_marks}));
    }
  
  	function() external payable {
        owner.transfer(msg.value); 			// to transfer funds to owner account
    }
    
      function School () payable {
        richest = msg.sender;
        mostSent = msg.value;
        owner = msg.sender;
    }
    

		  
    function becomeRichest() payable returns (bool){
        require(msg.value > mostSent);
        pendingWithdraws[richest] += msg.value;
        richest = msg.sender;
        mostSent = msg.value;
        return true;
    }

    function withdraw(uint amount) onlyOwner returns(bool) {
        // uint amount = pendingWithdraws[msg.sender];
        // pendingWithdraws[msg.sender] = 0;
        // msg.sender.transfer(amount);
        require(amount < this.balance);
        owner.transfer(amount);
        return true;
    }
}
