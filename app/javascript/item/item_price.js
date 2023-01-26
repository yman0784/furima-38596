// window.addEventListener('load', () => {
//   console.log("OK");
// });

window.addEventListener('load', function() 
{const priceInput = document.getElementById("item-price")
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;

  const commission = 0.1;
  const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * commission);

  const profit = document.getElementById("profit");
    profit.innerHTML = Math.floor(inputValue - (inputValue * commission));
})});

