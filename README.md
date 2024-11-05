# Smart Contract Development Assignment

In this assignment, your task is to develop smart contracts using both Solidity and Rust. The requirements are detailed below, with specific instructions for each component.

## Solidity Development

1. **Environment Setup**:  
   - Set up the Solidity development environment using both **Foundry** and **Hardhat**.

2. **Token Contract**:  
   - Create an ERC-20 token contract with a capped supply of 1 billion tokens.

3. **Liquidity Pool (LP) on Uniswap-v3**:  
   - Set up a liquidity pool for the token paired with `mockUSDT` on Uniswap-v3.
   - Choose an appropriate fee tier.
   - Ensure the initial token price is set to a 1:30 ratio, meaning for every 1 `mockUSDT`, 30 of your tokens should be available for swap.

4. **Locked Token Bridge to Solana**:  
   - Develop a smart contract that supports a locked token bridge to the Solana blockchain.
   - In this bridge, tokens will be locked on the source chain, and an equivalent amount of tokens will be minted on the Solana chain.
   - Use either LayerZero or Axelar Network as the bridging mechanism.

## Rust Development (Solana Side)

1. **Token Contract on Solana**:  
   - Implement a token contract in Rust that can receive tokens from the Ethereum chain.
   - **Note**: Minting of new tokens is *not allowed* on Solana. Only tokens bridged from the source chain should be utilized.

2. **Locker Contract**:  
   - Build a simple locker contract that can receive tokens on Solana.
   - The locker should allow users to:
     - Deposit tokens.
     - Withdraw tokens equal to the amount initially locked.

---

This assignment will require familiarity with:
- Solidity for Ethereum-based contracts
- Rust for Solana-based contracts
- Uniswap-v3 for liquidity pool setup
- Bridging protocols such as LayerZero or Axelar Network
- **Foundry** and **Hardhat** for Solidity environment setup

All implementations should follow best practices for security and gas efficiency. Good luck!
