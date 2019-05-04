pragma solidity ^0.5.2;

//import "./verifier.sol";
import "./ERC721Mintable.sol";

// TODO define a contract call to the zokrates generated solidity contract <Verifier> or <renamedVerifier>



// Contract named SolnSquareVerifier that inherits from your ERC721Mintable class
contract SolnSquareVerifier is CustomERC721Token {
    // Solutions struct that can hold an index & an address
    struct Solution {
        uint256 tokenId;
        address owner;
    }

    // An array of the above struct
    Solution[] private solutions;

    // A mapping to store unique solutions submitted
    mapping(bytes32 => Solution) private uniqueSolutions;
    //An event to emit when a solution is added
    event SolutionAdded(address owner, uint256 index);

    //verifiercontract variable that holds the generated contract
    Verifier public verifierContract;
    //Constructor, contract call to verifier.sol contract
    constructor (address verContractAddress) public {
        verifierContract = Verifier(verContractAddress);
    }

// TODO Create a function to add the solutions to the array and emit the event

    function addSolution(uint256 index, address owner, bytes32 solutionHash) public
        {
            Solution memory solution = Solution(index, owner);
            //push the solution to the array
            solutions.push(solution);
            //using the solution hash, store it to mapping as well
            uniqueSolutions[solutionHash] = solution;

            emit SolutionAdded(owner, index);
        }

// TODO Create a function to mint new NFT only after the solution has been verified
//  - make sure the solution is unique (has not been used before)
//  - make sure you handle metadata as well as tokenSuplly
    function mintNewNFT
        (
            address toAddress,
            uint tokenId,
            uint[2] memory a,
            uint[2] memory a_p,
            uint[2][2] memory b,
            uint[2] memory b_p,
            uint[2] memory c,
            uint[2] memory c_p,
            uint[2] memory h,
            uint[2] memory k,
            uint[2] memory input
        )
        public
        returns (bool)
        {

            bool verified = verifierContract.verifyTx(a, a_p, b, b_p, c, c_p, h, k, input);
            //Check if it could be verified by calling verifyTx
            require(verified, "Solution not verified (zero Knowledge Proof check)");
            //hash the solution to generate the solutionHash
            bytes32 solutionHash = keccak256(abi.encodePacked(a, a_p, b, b_p, c, c_p, h, k, input));
            //Check if it has been used before
            require(uniqueSolutions[solutionHash].owner == address(0), "Solution has already been used before" );

            addSolution(tokenId, toAddress, solutionHash);
            return mint(toAddress, tokenId);
        }


} //End of contract SolnSquareVerifier

contract Verifier {

    function verifyTx(
        uint[2] memory a,
        uint[2] memory a_p,
        uint[2][2] memory b,
        uint[2] memory b_p,
        uint[2] memory c,
        uint[2] memory c_p,
        uint[2] memory h,
        uint[2] memory k,
        uint[2] memory input
    ) public returns (bool r);
}






//









  


























