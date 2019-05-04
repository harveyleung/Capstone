# Udacity Blockchain Capstone

The capstone will build upon the knowledge you have gained in the course in order to build a decentralized housing product. 

## Install

To install, download or clone the repo, then:

Under your root directory, run:

`npm install`

Go to your own directory where the contracts exists, run:

`truffle.cmd compile` 

### Tests

Start Ganache CLI in a terminal using

`ganache-cli  -m <your own pass phase> -a 50  `

To run truffle tests:

Open another terminal window, run the following commands

`truffle.cmd test ./test/TestSquareVerifier.js`

`truffle.cmd test ./test/TestSolnSquareVerifier.js`

`truffle.cmd test ./test/TestERC721Mintable.js`

### Rinkeby Deployment info

Deploy to rinkeby:

Update the `truffle-config.js` file to reflect your infura settings for rinkeby

In a terminal window run :

`truffle migrate --network rinkeby`

Deployed Contract address:
verifier address = 0xfeBB2Ac6eDC9fcD0be63Ee3725eaa31517Df960C

SolnSquareVerfifer contract address = 0xDA4E7b4DC98c1D467dF8C010A0a355b4B08b114b

###Opensea

https://rinkeby.opensea.io/category/decentralizedhousingproductp8v2

ABI is named "contract.abi" under the root directory 

5 houses purchased by another account:

0xf1ac2bd65bbb5c6b801893fafe2183592c2cdceb

# Project Resources

* [Remix - Solidity IDE](https://remix.ethereum.org/)
* [Visual Studio Code](https://code.visualstudio.com/)
* [Truffle Framework](https://truffleframework.com/)
* [Ganache - One Click Blockchain](https://truffleframework.com/ganache)
* [Open Zeppelin ](https://openzeppelin.org/)
* [Interactive zero knowledge 3-colorability demonstration](http://web.mit.edu/~ezyang/Public/graph/svg.html)
* [Docker](https://docs.docker.com/install/)
* [ZoKrates](https://github.com/Zokrates/ZoKrates)
