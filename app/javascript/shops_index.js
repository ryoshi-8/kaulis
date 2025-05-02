document.addEventListener('turbo:load', () => {
  const checkboxes = document.querySelectorAll('input[type="checkbox"]');

  checkboxes.forEach(checkbox => {
    checkbox.addEventListener('change', () => {
      submitAndRemove(checkbox);
    });
  });
});

function submitAndRemove(checkbox) {
  const form = checkbox.form;
  const itemRow = form.closest('.item-row');

  const xhr = new XMLHttpRequest();
  xhr.open('PATCH', form.action, true);
  xhr.setRequestHeader('Accept', 'application/json');
  xhr.setRequestHeader('Content-Type', 'application/json');
  xhr.setRequestHeader('X-CSRF-Token', document.querySelector('meta[name="csrf-token"]').content);

  xhr.onload = function() {
    if (xhr.status >= 200 && xhr.status < 300) {
      // チェックされたら即非表示にする（DOMから削除）
      if (checkbox.checked) {
        itemRow.remove();
      }
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