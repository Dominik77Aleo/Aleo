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

    transition transferToRecipient(receiver: address, amount: u64, input: Token) -> (Token, Token) {
        let balance: u64 = input.balance - amount;
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