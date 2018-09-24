pragma solidity ^0.4.6;

contract SupplyChain
{
    string buyer;
    string seller;
    string[] shippingEntities;
    uint256[] timestamps;
    
    string[] locations;
    string[] statusMessages;

    address buyerAddress;
    address sellerAddress;
    address[] shippingEntitiesAddresses;

    address temporaryMoneyStorageAddress; //set default value    

    string orderNumber;
    string orderDescription;
    uint orderPrice;
    string orderStatus; // Placed, Accepted, Rejected, ShippingInProgress, ShippingFinished, Closed

    string shippingNumber;
    string shippingStatus = "Not Started"; // NotStarted (default), InProgress, Cancelled, ReplacedByNewShipping, ConfirmedSuccessfull

    string packageStatus = "OK"; // OK (default), Lost, Damaged

    function placeOrder(string description, uint price) public payable {

        orderDescription = description;
        orderPrice = price;
        orderStatus = "Placed";
        orderNumber = "1234"; // some random number

        // send money from buyerAddress to temporaryMoneyStorageAddress

    }

    function acceptOrder(string initialLocation, string statusMessage) public {

        orderStatus = "Accepted";
        locations.push(initialLocation);
        statusMessages.push(statusMessage);
        shippingEntities.push(seller);
        shippingEntitiesAddresses.push(sellerAddress);

    }

    function rejectOrder(string statusMessage) public payable {

        orderStatus = "Rejected";
        statusMessages.push(statusMessage);

        // return money from temporaryMoneyStorageAddress to buyerAddress

    }

    function startShipping(string shippingEntity, address shippingEntityAddress, string statusMessage) public {

        shippingNumber = "9876"; // some random number
        shippingStatus = "In Progress";
        orderStatus = "Shipping In Progress";
        statusMessages.push(statusMessage);
        timestamps.push(now);
        shippingEntities.push(shippingEntity);
        shippingEntitiesAddresses.push(shippingEntityAddress);

    }

    function updateShipping(string shippingEntity, address shippingEntityAddress, string statusMessage) public {

        statusMessages.push(statusMessage);
        timestamps.push(now);
        shippingEntities.push(shippingEntity);
        shippingEntitiesAddresses.push(shippingEntityAddress);

    }

    function confirmReceivedByBuyer(string statusMessage) public payable {

        timestamps.push(now);
        shippingEntities.push(buyer);
        shippingEntitiesAddresses.push(buyerAddress);
        statusMessages.push(statusMessage);
        orderStatus = "Shipping Finished";
        shippingStatus = "Confirmed Successfull";

        // send money from temporaryMoneyStorageAddress to sellerAddress

    }

    function getOrderInfo() public view returns (string, string, string, string, uint) {

        return (buyer, seller, orderNumber, orderDescription, orderPrice);

    }

    function getOrderStatus() public view returns (string) {

        return orderStatus;

    }

    function getShippingStatus() public view returns (string) {

        return shippingStatus;

    }

    function getShippingEntitiesCount() public view returns (uint) {

        return shippingEntities.length;

    }

    function getShippingEntity(uint index) public view returns (string) {
        
        return shippingEntities[index];

    }

    function getTimestamp(uint index) public view returns (uint256) {

        return timestamps[index];

    }

    function getCurrentHolder() public view returns (string) {

        uint shippingEntitiesCount = shippingEntities.length;
        if (shippingEntitiesCount > 0) {
            return shippingEntities[shippingEntitiesCount - 1];
        }
        else {
            return "";
        }
        
    }

    function refund() public payable {

        // send money from temporaryMoneyStorageAddress to buyer

    }

    function closeOrder() public {

        orderStatus = "Closed";

    }

}