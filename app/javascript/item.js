function item (){
  const priceInput = document.getElementById("item-price")
  const priceAddTax = document.getElementById("add-tax-price")
  const priceProfit = document.getElementById("profit")

  priceInput.addEventListener("input",function(event){
    const value = event.target.value;
    priceAddTax.innerHTML = Math.floor(value * 0.1)
    priceProfit.innerHTML = Math.floor(value * 0.9)
  })

};

window.addEventListener("turbo:load", item);
document.addEventListener("turbo:render", item);

