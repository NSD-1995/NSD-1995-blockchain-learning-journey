// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {

    struct Candidate {
        address id;
        string name;
    }

    Candidate[] public candidates;

    mapping(address => uint256) public numberOfVotes;
    mapping(address => bool) public hasVoted;

    function addCandidate(address id, string calldata name) public {
        candidates.push(Candidate(id, name));
    }

    function vote(address candidateid) external {
        require(!hasVoted[msg.sender], "Already voted");

        hasVoted[msg.sender] = true;
        numberOfVotes[candidateid] += 1;
    }
}