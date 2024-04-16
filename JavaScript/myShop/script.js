var productsArray = new Array();
var selectedProducts = new Array();

function loadProducts(json) {
    let prodcontainer = document.getElementById("productContainer");
    let products = json.products;
    products.forEach(
        (product) => {
            try {
                let newElement = document.createElement('div');
                newElement.className = "row";
                newElement.innerHTML = getProductElement(product);
                prodcontainer.appendChild(newElement);
                productsArray.push(product);
            } catch (e) {
                  console.log("Failed to create element for product: " + product.title);  
            }
        }
    )
}

// function convert product object to HTML element
function getProductElement(product) {
    let template = '<div class="card" style="width: 12rem;">' +
        `<img src="${product.thumbnail}">` +
        '<div class="card-body text-center">' +
        `<h5 class="card-title">${product.title}</h5>` +
        `<p class="card-text">${product.description}</p>` +
        `<p>$${product.price}</p>` +
        `<a href="#" class="btn btn-primary" onclick="addProduct(${product.id})">Buy</a>` +
        '</div>' +
        '</div>';
    return template;
}

function getSelectedProductElement(product) {
    let template = `<div class="card" style="width: 12rem;">` +
        `<img src="${product.thumbnail}">` +
        '<div class="card-body text-center">' +
        `<h5 class="card-title">${product.title}</h5>` +
        `<p class="card-text">${product.description}</p>` +
        `<p>$${product.price}</p>` +
        `<a href="#" class="btn btn-primary" onclick="removeProduct(${product.id})">Remove</a>` +
        '</div>' +
        '</div>';
    return template;
}
function addProduct(id) {
    //TODO: add to order
    let products = productsArray.filter(
        (prod) => prod.id === id
    )
    let selProduct = products[0];
    try{
    let newElement = document.createElement('div');
                newElement.className = "row";
                newElement.id = selProduct.id;
                newElement.innerHTML = getSelectedProductElement(selProduct);
    document.querySelector("#selProductContainer").appendChild(newElement);
    selectedProducts.push(selProduct);
    }catch(e){
        console.log("Failed to create selected element: " + selProduct.id);
    }
}
function removeProduct(id){
    let products = selectedProducts.filter(
        (prod) => prod != id
    )

    try{
        //remove visual components
    let container = document.getElementById("selProductContainer");

    let element = document.getElementById(id);
    element.remove();

    //remove from array
    selectedProducts.splice(0, selectedProducts.length);
    selectedProducts.push(products);
    }catch(e){
        console.log("Failed to remove selected element: " + id);
        console.log(e.message);
    }

}
function checkOut(){
    localStorage.setItem("selectedProducts", JSON.stringify(selectedProducts));

    window.location = "cart.html";
}

function showSelected(){
    let selected = JSON.parse(localStorage.getItem("selectedProducts"));

    let prodcontainer = document.getElementById("selProductContainer");

    let ttlElem = document.getElementById("total");
    selected.forEach(
        (product) => {
            try {
                let newElement = document.createElement('div');
                newElement.className = "row";
                newElement.innerHTML = getSelectedProductElement(product);
                prodcontainer.appendChild(newElement);
                productsArray.push(product);
            } catch (e) {
                  console.log("Failed to create element for product: " + product.title);  
            }
        }
    )
    ttlElem.innerText(getTotal(selected));

}
function getTotal(selArray){
    let ttl = 0;
    for( prod in selArray){
        ttl += prod.price;
    }
return ttl;
}