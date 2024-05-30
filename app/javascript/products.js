document.addEventListener('DOMContentLoaded', function() {
    const checkboxes = document.querySelectorAll('input[type="checkbox"][name="category_ids[]"]');
    
    checkboxes.forEach((checkbox) => {
      checkbox.addEventListener('change', function() {
        this.form.submit();
      });
    });
  });
  