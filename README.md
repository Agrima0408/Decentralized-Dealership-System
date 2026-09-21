# 🚗 Decentralized Dealership System

A blockchain-based vehicle dealership system built using **Solidity** and deployed/tested on the **Ethereum blockchain through Remix IDE**.

The smart contract manages Kia Sonet models, their prices, available stock, vehicle purchases, and buyer ownership records directly on-chain.

## ✨ Features

* 🚘 Multiple Kia Sonet variants with predefined prices
* 📦 Real-time vehicle stock management
* 👤 Buyer-specific ownership records
* 💰 ETH-based vehicle purchases
* 🔐 Owner-only restocking functionality
* ⛓️ Blockchain-based transparent transaction records
* 🔎 Public functions to check vehicle stock

## 🛠️ Tech Stack

* **Solidity** `^0.8.31`
* **Ethereum**
* **Remix IDE**
* **Smart Contracts**

## 🚘 Available Models

| Model    |  Price |
| -------- | -----: |
| HTE      |  8 ETH |
| HTK      |  9 ETH |
| HTK PLUS | 10 ETH |
| HTX      | 11 ETH |
| HTX PLUS | 13 ETH |
| GTX PLUS | 14 ETH |
| X LINE   | 15 ETH |

## ⚙️ Smart Contract

The main contract is:

```text
KiaSonet.sol
```

### Contract Structure

The contract uses an enum to represent the available Kia Sonet models:

```solidity
enum model {
    HTE,
    HTK,
    HTK_PLUS,
    HTX,
    HTX_PLUS,
    GTX_PLUS,
    X_LINE
}
```

Each model stores:

* Price
* Available stock

Buyer ownership is tracked using a nested mapping:

```solidity
mapping(address => mapping(model => uint)) public buyer;
```

This allows the contract to maintain how many vehicles of each model a particular address owns.

## 🔑 Main Functions

### `purchase()`

Allows a buyer to purchase one or more vehicles of a selected model by sending ETH.

```solidity
purchase(model _model, uint amount)
```

The function verifies:

* Sufficient ETH has been sent
* Enough vehicles are available in stock

The stock is then reduced and the buyer's ownership count is updated.

### `restock()`

Allows only the dealership owner to add vehicles to the available stock.

```solidity
restock(model _model, uint amount)
```

Protected using the `onlyOwner` modifier.

### `checkStock()`

Returns the current stock available for a particular Kia Sonet model.

```solidity
checkStock(model _model)
```

### `onlyOwner`

A modifier that restricts certain dealership management functions to the contract owner.

## 🔄 How It Works

```text
                 ┌─────────────────────┐
                 │  Contract Deployed  │
                 └──────────┬──────────┘
                            │
                            ▼
                 ┌─────────────────────┐
                 │ Kia Sonet Inventory │
                 │ Price + Stock       │
                 └──────────┬──────────┘
                            │
              ┌─────────────┴─────────────┐
              │                           │
              ▼                           ▼
       ┌──────────────┐           ┌──────────────┐
       │ Dealership   │           │    Buyer     │
       │    Owner     │           │              │
       └──────┬───────┘           └──────┬───────┘
              │                          │
              ▼                          ▼
        Restock Cars               Purchase Cars
                                         │
                                         ▼
                                  Ownership Updated
```

## 🚀 Deployment

The contract can be deployed and tested using **Remix IDE**.

### Steps

1. Open Remix IDE.
2. Create a new Solidity file.
3. Add `KiaSonet.sol`.
4. Compile using Solidity `0.8.31` or a compatible compiler.
5. Deploy the contract using the **Deploy & Run Transactions** tab.
6. Interact with the contract through Remix.

## 🧪 Example Workflow

### 1. Deploy

The account deploying the contract becomes the dealership owner.

### 2. Check Stock

Use:

```text
checkStock(HTE)
```

to view the current HTE inventory.

### 3. Purchase

A buyer can call:

```text
purchase(HTE, 1)
```

while sending the required ETH.

### 4. Ownership

The buyer's ownership record is updated automatically.

### 5. Restock

The contract owner can call:

```text
restock(HTE, 10)
```

to increase the available inventory.

## 🔐 Access Control

The contract uses an `onlyOwner` modifier to restrict dealership management operations.

```solidity
modifier onlyOwner() {
    require(msg.sender == owner, "Only Owner is allowed");
    _;
}
```

This ensures that only the address that deployed the contract can restock vehicles.

## 📌 Future Improvements

* Add vehicle ownership transfer functionality
* Add refund handling for excess ETH
* Emit events for purchases and restocking
* Add a frontend for interacting with the smart contract
* Add transaction history
* Add vehicle identification numbers (VINs)
* Deploy on an Ethereum testnet
* Add automated testing using Hardhat or Foundry

## 📄 License

This project is licensed under the **MIT License**.
