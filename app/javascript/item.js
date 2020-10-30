function item() {
  const priceInput = document.getElementById("sell-price");
  priceInput.addEventListener("input", (e) => {
     const inputValue = priceInput.value;

     const addTaxDom = document.getElementById("add-tax-price");
     addTaxDom.innerHTML = Math.floor(inputValue*0.10)

     const profitOutput = document.getElementById("profit");
     profitOutput.innerHTML = Math.floor(inputValue-addTaxDom.innerHTML);
     
     e.preventDefault();
  });
  
}

setInterval(item, 1000);