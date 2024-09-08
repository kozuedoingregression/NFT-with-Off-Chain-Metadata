// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract Sentiment is ERC721, ERC721Enumerable, Ownable(msg.sender) {
    using Strings for uint256;
    uint256 maxsupply = 13;
    uint256 cost = 0.001 ether;
    string baseURI = "ipfs://QmWd3sGbRgsqFpgmo6Gzy1PHNevozuAGkPk8oeHMFCa9Fp";

    constructor()
        ERC721("Dimensionality", "NFT")
    {}

    function _baseURI() internal view override returns (string memory) {
        return baseURI;
    }

    function tokenURI(uint256 tokenId) public  view override returns (string memory)
    {
        return bytes(baseURI).length > 0 ? string(abi.encodePacked(baseURI, tokenId.toString(), ".json")) : "";
    }

    function safeMint(address to) public payable {
        uint256 _currentSupply = totalSupply();
        require(_currentSupply<maxsupply,"You reached max!");
        require(msg.value == cost, "Please, add amount value");
        _safeMint(to, _currentSupply);
    }

    function withdraw() public onlyOwner() {
        (bool success, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(success);
    }

    // The following functions are overrides required by Solidity.

    function _update(address to, uint256 tokenId, address auth)
        internal
        override(ERC721, ERC721Enumerable)
        returns (address)
    {
        return super._update(to, tokenId, auth);
    }

    function _increaseBalance(address account, uint128 value)
        internal
        override(ERC721, ERC721Enumerable)
    {
        super._increaseBalance(account, value);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
