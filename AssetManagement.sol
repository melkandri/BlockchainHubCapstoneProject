pragma solidity 0.4.17;

contract AssetManagement{
    
    bytes32 public issuer;
    address public owner;
    bytes32 public ownername;
    bytes32 public assetid;
    
    struct ownerInfo{
        bytes32 issuer;
        address owner;
        bytes32 assetid;
        bytes32 ownername;
    }
    
    mapping(address => ownerInfo) ownernames;
    
    
    function AssetManagement(bytes32 _issuer,address _owner,bytes32 _ownername,bytes32 _data){
        issuer = _issuer;
        owner = _owner;
        assetid = _data;
        ownername = _ownername;
    }
    
    function Addasset(address _owner, bytes32 _data,bytes32 _ownername,bytes32 _issuer){
        ownernames[_owner].assetid = _data;
        ownernames[_owner].owner = _owner;
        ownernames[_owner].issuer = _issuer;
        ownernames[_owner].ownername = _ownername;
    }
    function Transferasset(address _to){
        bytes32 assetToTransfer = ownernames[msg.sender].assetid;
        ownernames[msg.sender].assetid = 0;
        ownernames[_to].assetid = assetToTransfer; 
        
    }
}
