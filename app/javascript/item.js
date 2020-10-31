function item() {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
     const inputValue = priceInput.value;
    console.log(inputValue);
     const addTaxDom = document.getElementById("add-tax-price");
     addTaxDom.innerHTML = Math.floor(inputValue*0.10)
      
     const profitOutput = document.getElementById("profit");
     profitOutput.innerHTML = Math.floor(inputValue-addTaxDom.innerHTML);
     
  });
  
}
window.addEventListener("load", item);
