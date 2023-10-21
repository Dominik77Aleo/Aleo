program token.aleo {
    record Token {
        owner: address,
        balance: u64
    }

    transition mintToken (balance: u64) -> Token {
        return Token {
            owner: self.caller, 
            balance: balance 
        };
    }

    transition transferToRecipientWithFee(receiver: address, amount: u64, input: Token) -> (Token, Token) {
        let fee: u64 = 2u64;
        let balance: u64 = input.balance - amount - fee;
        let recipient: Token = Token {
            owner: receiver,
            balance: amount 
        };

        let sender: Token = Token {
            owner: self.caller, 
            balance
        }; 

        return (recipient, sender);
    }   
}
