pragma solidity >=0.7.0 < 0.9.0;

/// @title Governance contract for Athlete Equity
/// @author Kevin Kamto
/// @notice voting with delegation
/// @dev Built from https://docs.soliditylang.org/en/v0.8.1/solidity-by-example.html -- please expect modifications
contract Goverance {

    // Athlete equity voters
    struct Voter {
        uint weight;
        bool voted;
        address delegate;
        uint votes;
    }

    // Ideas to vote upon
    struct Proposal {
        bytes32 name;
        uint voteCount;
    }

    // Athlete Equity founders / heads
    address public chairperson;

    // stores a vote for each possible address
    mapping(address => Voter) public voters;

    // ad infinitum proposals
    Proposal[] public proposals;

    // Creates a new ballot 

    constructor(bytes32[] memory proposalNames) {
        //AE chair
        chairperson = msg.sender;
        // chairperson has big weight
        voters[chairperson].weight = 1;

        for (uint i = 0; i < proposalNames.length; i++)
        {
            proposals.push(
                // can this be encapsulated in a variable (personal convetion)??
                Proposal({
                    name: proposalNames[i],
                    voteCount: 0
                })
            );
        }
    }

    // Gives a member the right to vote

    function giveMemberSuffrage(address voter) public {

        // Ensure the chairperson gives suffrage (constituational monarchy)
        require (
            msg.sender == chairperson
        );

        // Require a voter to have NOT already voted
        require (
            !voters[voter].voted
        );

        // Require those with right to vote has 0 weight
        require(
            voters[voter].weight == 0
        );

        voters[voter].weight = 1;
    }

    // Delegating votes to the voter 'to'

    function delegate(address endVoter) public {
        // assigns reference
        Voter storage sender = voters[msg.sender];
        require(!sender.voted, "You already voted.");

        require(endVoter != msg.sender, "You don't have the authority to delegate suffrage!");

        while (voters[endVoter].delegate != address(0)) 
        {
            endVoter = voters[endVoter].delegate;

            require( endVoter != msg.sender, "Loop detected! May cause excessive gas fees" );
        }

        sender.voted = true;
        sender.delegate = endVoter;

        Voter storage delegate_ = voters[endVoter];

        if (delegate_.voted) {
            // If the delegate already voted,
            // directly add to the number of votes
            proposals[delegate_.vote].voteCount += sender.weight; // This is causing a break -- is it not a struct?
        } else {
            // If the delegate did not vote yet,
            // add to her weight.
            delegate_.weight += sender.weight;
        }
    }

    function vote (uint proposal) public {
        Voter storage sender = voters[msg.sender];

        require(sender.weight !=0, "Has no right to vote");
        require(!sender.voted, "Already Voted");

        sender.voted = true;
        sender.vote = proposal;

        proposals[proposal].voteCount += sender.weight;
    }

    // Compute the winning proposal
    function winningProposal() public view
        returns (uint winningProposal_)
    {
        // counter set
        uint winningVoteCount = 0;
        for (uint x =0; x < proposals.length; p++)
        {
            if (proposals[x].voteCount > winningVoteCount) 
            {
                winningVoteCount = proposals[x].voteCount;
            }
        }
    }

    function winnerName() public view
        returns (bytes32 winnerName_)
        {
            winnerName_ = proposals[winningProposal()].name;
        }
}