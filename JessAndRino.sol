// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract JessAndRino is ERC721, Ownable {
    constructor() Ownable(InitialOwner) ERC721("Me and Jess", "JKRP") {}

    address InitialOwner = 0x6E5163fC4BFc1511Dbe06bB605cc14a3e462332b;
    string public hijess = "iloveu";
    string public picture = "";
    bool public locked = false;

    /**
     * @dev Set the NFT picture.
     * @param _picture The picture, encoded in base122 and compressed in .tar.xz.
    */
    function setPicture(
      string memory _picture)
    public {
      require(
        locked == true,
        "picture already set");
      picture = _picture;
      locked = true;
    }

    function _baseURI()
    view
    internal
    override
    returns (string memory) {
      return picture;
    }

    function safeMint(
      address to,
      uint256 tokenId)
    public onlyOwner {
	require(
      tokenId == 1);
      _safeMint(to, tokenId);
    }
}
