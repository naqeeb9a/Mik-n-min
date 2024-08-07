import 'package:graphql/client.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app screens/authenctication screens/login.dart';
import '../utils/constants.dart';

var storeFrontAccessToken = "349be28f473c630afa1bd73e38703a99";
var storeName = "miknmin";
getShopifyProductsBestSelling() async {
  var shopifyProducts = '''
{
  products(first:10 sortKey:BEST_SELLING query: "available_for_sale:true") {
    edges {
      node {
        id
        description
        title
        productType
        availableForSale
        totalInventory
        vendor
        variants(first :10){
            edges{
                node
                {
                    id
                    price
                    sku
                    compareAtPrice
                    requiresShipping
                    availableForSale
                }
            }
        }
        options{
            values
        }
        images(first:10){
            edges{
                node{
                    src
                }
            }
        }
      }
    }
  }
}
 ''';
  final HttpLink httpLink = HttpLink(
      "https://$storeName.myshopify.com/api/2021-10/graphql.json",
      defaultHeaders: {
        "X-Shopify-Storefront-Access-Token": storeFrontAccessToken
      });
  GraphQLClient client = GraphQLClient(link: httpLink, cache: GraphQLCache());
  final QueryOptions options = QueryOptions(
    document: gql(shopifyProducts),
  );
  final QueryResult result = await client.query(options);

  if (result.hasException) {
    return "Server Error";
  } else {
    return result.data!["products"]["edges"];
  }
}

getShopifyCategory() async {
  var shopifyCategory = '''
{
  	collections(first: 250) {
    	edges {
      	node {
        	  id
            title
            handle
            image{
                src
            }
      	}
    	}
  	}
}
 ''';
  final HttpLink httpLink = HttpLink(
      "https://$storeName.myshopify.com/api/2021-10/graphql.json",
      defaultHeaders: {
        "X-Shopify-Storefront-Access-Token": storeFrontAccessToken
      });
  GraphQLClient client = GraphQLClient(link: httpLink, cache: GraphQLCache());
  final QueryOptions options = QueryOptions(
    document: gql(shopifyCategory),
  );
  final QueryResult result = await client.query(options);

  if (result.hasException) {
    return "Server Error";
  } else {
    return result.data!["collections"]["edges"];
  }
}

getShopifyProducts() async {
  var shopifyProducts = '''
{
  products(first:250) {
    edges {
      node {
        id
        description
        title
        availableForSale
        totalInventory
        variants(first :10){
            edges{
                node
                {
                    id
                    price
                    sku
                    compareAtPrice
                    requiresShipping
                    availableForSale
                }
            }
        }
        options{
            values
        }
        images(first:10){
            edges{
                node{
                    src
                }
            }
        }
      }
    }
  }
}
 ''';
  final HttpLink httpLink = HttpLink(
      "https://$storeName.myshopify.com/api/2021-10/graphql.json",
      defaultHeaders: {
        "X-Shopify-Storefront-Access-Token": storeFrontAccessToken
      });
  GraphQLClient client = GraphQLClient(link: httpLink, cache: GraphQLCache());
  final QueryOptions options = QueryOptions(
    document: gql(shopifyProducts),
  );
  final QueryResult result = await client.query(options);

  if (result.hasException) {
    getShopifyProducts();
    return "Server Error";
  } else {
    return result.data!["products"]["edges"];
  }
}

getShopifyCollection(handle) async {
  var shopifyCollection = '''
{
  collectionByHandle(handle:"$handle") {
    products(first:250) {
    edges {
      node {
        id
        description
        title
        availableForSale
        totalInventory
        vendor
        variants(first :10){
            edges{
                node
                {
                    id
                    price
                    sku
                    compareAtPrice
                    requiresShipping
                    availableForSale
                }
            }
        }
        options{
            values
        }
        images(first:10){
            edges{
                node{
                    src
                }
            }
        }
      }
    }
  }
  }
}
 ''';
  final HttpLink httpLink = HttpLink(
      "https://$storeName.myshopify.com/api/2021-10/graphql.json",
      defaultHeaders: {
        "X-Shopify-Storefront-Access-Token": storeFrontAccessToken
      });
  GraphQLClient client = GraphQLClient(link: httpLink, cache: GraphQLCache());
  final QueryOptions options = QueryOptions(
    document: gql(shopifyCollection),
  );
  final QueryResult result = await client.query(options);

  if (result.hasException) {
    getShopifyCollection(handle);
    return "Server Error";
  } else {
    return result.data!["collectionByHandle"]["products"]["edges"];
  }
}

loginUser(email, password) async {
  SharedPreferences saveUser = await SharedPreferences.getInstance();
  const createUserAccessToken = r'''
                mutation customerAccessTokenCreate($input: CustomerAccessTokenCreateInput!) {
                  customerAccessTokenCreate(input: $input) {
                    customerAccessToken {
                      accessToken
                      expiresAt
                    }
                    customerUserErrors {
                      code
                      field
                      message
                    }
                  }
                }
            ''';
  var variables = {
    "input": {"email": email, "password": password}
  };
  final HttpLink httpLink = HttpLink(
      "https://$storeName.myshopify.com/api/2021-10/graphql.json",
      defaultHeaders: {
        "X-Shopify-Storefront-Access-Token": storeFrontAccessToken
      });
  GraphQLClient client = GraphQLClient(link: httpLink, cache: GraphQLCache());
  final QueryOptions options =
      QueryOptions(document: gql(createUserAccessToken), variables: variables);
  final QueryResult result = await client.query(options);

  if (result.hasException) {
    return "Server Error";
  } else {
    if (result.data!["customerAccessTokenCreate"]["customerAccessToken"] !=
        null) {
      saveUser.setString(
          "loginInfo",
          result.data!["customerAccessTokenCreate"]["customerAccessToken"]
              ["accessToken"]);
      return result.data!["customerAccessTokenCreate"]["customerAccessToken"]
          ["accessToken"];
    } else {
      return result.data!["customerAccessTokenCreate"]["customerAccessToken"];
    }
  }
}




passwordReset(email) async {
  var reset = r'''
mutation customerRecover($email: String!) {
  customerRecover(email: $email) {
    customerUserErrors {
      code
      field
      message
    }
  }
}
 ''';
  final HttpLink httpLink = HttpLink(
       "https://$storeName.myshopify.com/api/2021-10/graphql.json",
      defaultHeaders: {
        "X-Shopify-Storefront-Access-Token": storeFrontAccessToken
      });
  GraphQLClient client = GraphQLClient(link: httpLink, cache: GraphQLCache());
  final QueryOptions options = QueryOptions(
    document: gql(reset),
    variables: {
      "email": email,
    },
  );
  final QueryResult result = await client.query(options);

  if (result.hasException) {
    return "Server Error";
  } else {
    return "done";
  }
}

getUserOrders() async {
  var createUserAccessToken = '''
{
    customer (customerAccessToken: "$globalAccessToken")
    {
        id
        orders(first:10){
             edges{
                 node{
                     orderNumber 
                     email 
                     fulfillmentStatus 
                     cancelReason
                     lineItems(first:5){
                         edges{
                             node{
                                 title
                                 quantity
                                 variant {
                                     product{
                                         variants(first:1){
                                        edges{
                                        node{
                                            price     
                                          }
                                        }
                                        }
                                         images(first:1){
                                            edges{
                                                node{
                                                    src
                                                }
                                            }
                                    }
                                     }
                                 }
                             }
                         }
                     }
                 }
             }
         }     
    }
}
 ''';
  final HttpLink httpLink = HttpLink(
      "https://$storeName.myshopify.com/api/2021-10/graphql.json",
      defaultHeaders: {
        "X-Shopify-Storefront-Access-Token": storeFrontAccessToken
      });
  GraphQLClient client = GraphQLClient(link: httpLink, cache: GraphQLCache());
  final QueryOptions options = QueryOptions(
    document: gql(createUserAccessToken),
  );
  final QueryResult result = await client.query(options);

  if (result.hasException) {
    return "Server Error";
  } else {
    if (result.data!["customer"] == null) {
      return "Token Expired";
    } else {
      return result.data!["customer"]["orders"]["edges"];
    }
  }
}

logoutUser(accessToken) async {
  SharedPreferences saveUser = await SharedPreferences.getInstance();

  var deleteUserAccessToken = r'''
              mutation customerAccessTokenDelete($customerAccessToken: String!) {
                customerAccessTokenDelete(customerAccessToken: $customerAccessToken) {
                  deletedAccessToken
                  deletedCustomerAccessTokenId
                  userErrors {
                    field
                    message
                  }
                }
              }
 ''';
  var variables = {"customerAccessToken": accessToken.toString()};
  final HttpLink httpLink = HttpLink(
      "https://$storeName.myshopify.com/api/2021-10/graphql.json",
      defaultHeaders: {
        "X-Shopify-Storefront-Access-Token":
        storeFrontAccessToken
      });
  GraphQLClient client =
  GraphQLClient(link: httpLink, cache: GraphQLCache());
  final QueryOptions options = QueryOptions(
      document: gql(deleteUserAccessToken), variables: variables);
  final QueryResult result = await client.query(options);
  if (result.hasException) {
    return "Server Error";
  } else {
    await saveUser.clear();
    // Phoenix.rebirth(context);
  }
}

getUserData(accessToken, context) async {
  globalAccessToken = accessToken;
  var createUserAccessToken = '''
{
    customer (customerAccessToken: "$accessToken")
    {
         id
         email
         defaultAddress{
             address1
         }
         phone
         firstName
         lastName
    }
}
 ''';
  final HttpLink httpLink = HttpLink(
      "https://$storeName.myshopify.com/api/2021-10/graphql.json",
      defaultHeaders: {
        "X-Shopify-Storefront-Access-Token": storeFrontAccessToken,
      });
  GraphQLClient client = GraphQLClient(link: httpLink, cache: GraphQLCache());
  final QueryOptions options = QueryOptions(
    document: gql(createUserAccessToken),
  );
  final QueryResult result = await client.query(options);

  if (result.hasException) {
    return "Server Error";
  } else if (result.data!["customer"] == null) {
    SharedPreferences saveUserEmail = await SharedPreferences.getInstance();
    SharedPreferences saveUserPassword = await SharedPreferences.getInstance();
    await loginUser(saveUserEmail.getString("email"),
        saveUserPassword.getString("password"));
    // Phoenix.rebirth(context);
  } else {
    id = result.data!["customer"]["id"];
    checkOutEmail = result.data!["customer"]["email"];
    return result.data!["customer"];
  }
}
// createDraftOrders(subtotal) async {
//   var localOrderList = [];
//   for (var i = 0; i < cartItems.length; i++) {
//     localOrderList.add({
//       "variantId":
//           utf8.decode(base64Decode(cartItems[i]["variantId"])).toString(),
//       "quantity": (cartItems[i]["quantity"])
//     });
//   }
//   var createUserAccessToken = r'''
// mutation draftOrderCreate($input: DraftOrderInput!) {
//   draftOrderCreate(input: $input) {
//     userErrors {
//       field
//       message
//     }
//     draftOrder {
//      id
//      name
//      status
//      subtotalPrice
//      totalPrice
//      customer{
//          displayName
//          id
//          ordersCount
//          defaultAddress{
//              address1
//              city
//          }
//      }
//      billingAddress{
//          address1
//          city
//      }
//     }
//   }
// }
//  ''';
//   var orderVariables = {
//     "input": {
//       "customerId": utf8.decode(base64Decode(id)).toString(),
//       "note": "Test draft order",
//       "email": "$checkOutEmail",
//       "tags": ["Ordered via mobile application ANDROID"],
//       "shippingLine": {
//         "title": "Cash on Delivery",
//         "price": (subtotal < 2000) ? 200 : 0
//       },
//       "shippingAddress": {
//         "address1": addressList[group.value]["node"]["address1"].toString(),
//         "city": addressList[group.value]["node"]["city"].toString(),
//         "province": addressList[group.value]["node"]["province"].toString(),
//         "country": addressList[group.value]["node"]["country"].toString(),
//         "zip": addressList[group.value]["node"]["zip"].toString()
//       },
//       "billingAddress": {
//         "address1": addressList[group.value]["node"]["address1"].toString(),
//         "city": addressList[group.value]["node"]["city"].toString(),
//         "province": addressList[group.value]["node"]["province"].toString(),
//         "country": addressList[group.value]["node"]["country"].toString(),
//         "zip": addressList[group.value]["node"]["zip"].toString()
//       },
//       "lineItems": localOrderList
//     }
//   };
//   final HttpLink httpLink = HttpLink(
//       "https://dd6d360887ab7d86f82444a53178889c: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@$storeName.myshopify.com/admin/api/2021-10/graphql.json");
//   GraphQLClient client = GraphQLClient(link: httpLink, cache: GraphQLCache());
//   final QueryOptions options = QueryOptions(
//       document: gql(createUserAccessToken), variables: orderVariables);
//   final QueryResult result = await client.query(options);

//   if (result.hasException) {
//     return "Server Error";
//   } else {
//     print(result.data!["draftOrderCreate"]["draftOrder"]["id"]);
//     print(result.data!["draftOrderCreate"]["draftOrder"]["totalPrice"]);
//     return result.data!["draftOrderCreate"]["draftOrder"]["id"];
//   }
// }
