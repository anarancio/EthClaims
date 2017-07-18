pragma solidity ^0.4.2;

contract Claims {

  struct ClaimRecord {
    address reporter;
    bool isValue;
  }

  mapping (bytes32 => ClaimRecord) claims;

  function Claims() {
  }

  function register(bytes32 claimFingerprint) returns(bool reported) {
    if(claims[claimFingerprint].isValue) return false;
    claims[claimFingerprint] =  ClaimRecord({reporter: tx.origin, isValue: true});
    return true;
  }

  function checkClaim(bytes32 claimFingerprint) returns(address reported) {
    return claims[claimFingerprint].reporter;
  }

}
