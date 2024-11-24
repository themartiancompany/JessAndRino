// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract JessAndRino is ERC721, Ownable {
    constructor() ERC721("Me and Jess", "JKRP") {}

    string public hijess = "iloveu";
    string public picture = "";

    /**
     * @dev Set the NFT picture.
     * @param _picture The picture, encoded in base122 and compressed in .tar.xz.
    */
    function setPicture(string memory _picture) public {
      require(picture == "", "picture already set");
      picture = _picture;
    }

    function _baseURI() internal pure override returns (string memory) {
        return picture;
    }

    function safeMint(address to, uint256 tokenId) public onlyOwner {
	require(tokenId == 1);
        _safeMint(to, tokenId);
    }
}
