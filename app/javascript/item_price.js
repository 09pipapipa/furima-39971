document.addEventListener('DOMContentLoaded', function() {
  const priceInput = document.getElementById('item-price');
  const addTaxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  priceInput.addEventListener('input', function() {
    const price = parseInt(priceInput.value, 10) || 0;

    // 販売手数料 (10%)
    const tax = Math.floor(price * 0.1);
    addTaxPrice.textContent = tax.toLocaleString();

    // 販売利益
    const profitValue = price - tax;
    profit.textContent = profitValue.toLocaleString();
  });
});