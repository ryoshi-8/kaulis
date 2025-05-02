document.addEventListener('turbo:load', () => {
  const checkboxes = document.querySelectorAll('input[type="checkbox"]');

  checkboxes.forEach(checkbox => {
    checkbox.addEventListener('change', () => {
      submitAndResort(checkbox);
    });
  });
});

function submitAndResort(checkbox) {
  const form = checkbox.form;
  const itemRow = form.closest('.item-row');

  const xhr = new XMLHttpRequest();
  xhr.open('PATCH', form.action, true);
  xhr.setRequestHeader('Accept', 'application/json');
  xhr.setRequestHeader('Content-Type', 'application/json');
  xhr.setRequestHeader('X-CSRF-Token', document.querySelector('meta[name="csrf-token"]').content);

  xhr.onload = function() {
    if (xhr.status >= 200 && xhr.status < 300) {
      itemRow.dataset.checked = checkbox.checked;

      if (checkbox.checked) {
        itemRow.classList.add('checked-item');
      } else {
        itemRow.classList.remove('checked-item');
      }

      resortItems();
    } else {
      console.error('更新に失敗しました', xhr.responseText);
    }
  };

  xhr.onerror = function() {
    console.error('リクエストエラー');
  };

  xhr.send(JSON.stringify({
    item: {
      checked: checkbox.checked
    }
  }));
}

function resortItems() {
  const list = document.getElementById('items-list');
  const items = Array.from(list.children);

  items.sort((a, b) => {
    if (a.dataset.checked !== b.dataset.checked) {
      return (a.dataset.checked === 'true') - (b.dataset.checked === 'true');
    }
    return a.dataset.id - b.dataset.id;
  });

  list.innerHTML = '';
  items.forEach(item => list.appendChild(item));
}