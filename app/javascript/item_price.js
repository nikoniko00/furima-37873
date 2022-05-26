window.addEventListener('load', () => {

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
     const inputValue = priceInput.value;
     addTaxValue = Math.floor(inputValue * 0.1);
     const addTaxDom = document.getElementById("add-tax-price");
     addTaxDom.innerHTML = addTaxValue;

     const addProfitDom = document.getElementById("profit");
     addProfitValue = (inputValue - addTaxValue);
     addProfitDom.innerHTML = addProfitValue;
  })
});