function addPurchases() {
    const taskInput = document.getElementById('purchasesInput');
    const taskText = purchasesInput.value.trim();

    // Валидация - проверяем, что поле не пустое и вводим изменения
    if (purchasesText === '') {
        alert("Введите изменения для списка покупок!");
        return;
    }

    // Создаем новый элемент списка
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
