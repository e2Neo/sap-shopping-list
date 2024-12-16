using {managed} from '@sap/cds/common';

namespace shopping.list;

entity ShoppingLists : managed {
    key ID    : UUID;
        name   : String;
        Items : Composition of many ShoppingLists.Items
                    on Items.parent = $self;
}

entity ShoppingLists.Items : managed {
    key ID     : UUID;
    key parent : Association to ShoppingLists;
        name   : String;
        amount : Integer;
}

entity Persons {
    key ID   : UUID;
        name : String(100);
        list : Association to many ShoppingLists
}
