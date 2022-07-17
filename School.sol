pragma solidity >= 0.7.0<0.8.0;
  
contract School
{
    struct Student
    {   
        int rollNumber;
        int regnumber;
        string fName;
        string lName;
        int dob;
        int marks;
	 
    }
  
    address owner;
    int public stdCount = 0;
    mapping(int => Student) public stdRecords;
  
    modifier onlyOwner
    {
        require(owner == msg.sender);
        _;
    }

    constructor()
    {
        owner=msg.sender;
    }
  
    
    function addNewRecords(int _rollNumber,
						  int _regnumber,
                          string memory _fName,
                          string memory _lName,
						  int _dob, 
                          int _marks) public onlyOwner
    {
        
        stdCount = stdCount + 1;  // to fetch details of students, I have used count since i didnt understand how to do it using regnumber)
        
        stdRecords[stdCount] = Student(_rollNumber, _regnumber, _fName, _lName, _dob, _marks);
    }
  
}
