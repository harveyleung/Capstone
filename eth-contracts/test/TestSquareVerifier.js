const Verifier = artifacts.require('verifier')

// Test verification with correct proof
// - use the contents from proof.json generated from zokrates steps

contract('Verifier', accounts => {

    const { proof, input } = require('../../zokrates/code/square/proof.json')
    // console.log("proof.a is " + proof.a);
    // console.log("proof.b is " + proof.b);
    // console.log("proof.b is " + proof.c);
    // console.log("input is " + inputs);

    beforeEach(async () => {
        this.contract = await Verifier.new({ from: accounts[0] })
    })

    // Test verification with correct proof
    it('VerifyTx returns true with correct proof', async () => {
        const result = await this.contract.verifyTx.call(
            proof.A,
            proof.A_p,
            proof.B,
            proof.B_p,
            proof.C,
            proof.C_p,
            proof.H,
            proof.K,
            input
        )
        console.log("The result is :" +  result)
        assert(result, 'Incorrect Proof results')
    })

    // Test verification with incorrect proof
    it('VerifyTx returns false with incorrect proof', async () => {

        //original is 9,1 change to 9,2
        const modifiedInput = [9,2]

        const result = await this.contract.verifyTx.call(
            proof.A,
            proof.A_p,
            proof.B,
            proof.B_p,
            proof.C,
            proof.C_p,
            proof.H,
            proof.K,
            modifiedInput
        )
        console.log("The result is" + result);
        assert(!result, 'The proof check result should have resulted false')
    })
})