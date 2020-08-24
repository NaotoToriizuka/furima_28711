function price(){
  const item_price = document.getElementById("item-price");
  const add_tax_price = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  
  item_price.addEventListener('keyup',() =>{
    const value = item_price.value;

    if (value >= 300 && value <= 9999999){
      let fee = value * 0.1
      let gain = value - fee
      add_tax_price.textContent = Math.floor(fee);
      profit.textContent = Math.floor(gain);
    } else {
      let fee = '0';
      let gain = '0';
      add_tax_price.textContent = fee;
      profit.textContent = gain;
    }
  });
}
window.addEventListener('load', price);