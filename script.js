function addPurchases() {
    const taskInput = document.getElementById('purchasesInput');
    const taskText = purchasesInput.value.trim();

    if (purchasesText === '') {
        alert("Введите список покупок!");
        return;
    }

    const purchasesList = document.getElementById('purchasesList');
    const li = document.createElement('li');
    li.innerHTML = `
        <span>${purchasesText}</span>
        <button onclick="this.parentElement.remove()">Удалить</button>
    `;
    purchasesList.appendChild(li);

    // Очищаем поле ввода и возвращаем фокус
    purchasesInput.value = '';
    purchasesInput.focus();
} 
