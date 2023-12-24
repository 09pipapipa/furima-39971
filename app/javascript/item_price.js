document.addEventListener('DOMContentLoaded', function item_price () {

  const priceInput = document.getElementById('item-price');
  const addTaxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  priceInput.addEventListener('input', function() {
    const price = parseInt(priceInput.value, 10) || 0;

    const tax = Math.floor(price * 0.1);
    addTaxPrice.textContent = tax.toLocaleString();

    const profitValue = price - tax;
    profit.textContent = profitValue.toLocaleString();
  });
});
window.addEventListener('load',item_price);