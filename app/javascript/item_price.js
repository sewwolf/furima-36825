window.onload = function(){
  const priceInput = document.getElementById("item-price")
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1)

    const profitDom = document.getElementById("profit");
    const addTax = inputValue * 0.1
    profitDom.innerHTML = Math.floor(inputValue - addTax);

  })
  
}
