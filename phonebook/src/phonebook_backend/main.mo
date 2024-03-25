import Map "mo:base/HashMap"; // Import the HashMap module
import Text "mo:base/Text"; // Import the Text module

actor {

    // Define types to be used in Motoko
    type Name = Text; // Define Name as a Text type
    type Phone = Text; // Define Phone as a Text type

    // Define the Entry type (contains desc and phone fields)
    type Entry = {
        desc : Text; // desc field (of Text type)
        phone : Phone; // phone field (of Phone type)
    };

    // Define a HashMap named phoneBook, with Name keys and Entry values
    let phoneBook = Map.HashMap<Name, Entry>(0, Text.equal, Text.hash);

    // Definition of insert function: takes name and entry parameters, operates asynchronously
    public func insert(name : Name, entry : Entry) : async () {
        phoneBook.put(name, entry); // Add entry value with name key to the phoneBook
    };

    // Definition of lookup function: takes a name parameter, operates asynchronously, can return a value of type ?Entry
    public query func lookup(name : Name) : async ?Entry {
        phoneBook.get(name); // Return the value corresponding to the name key in the phoneBook (if exists)
    };

};
