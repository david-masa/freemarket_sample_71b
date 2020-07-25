$(document).on('turbolinks:load', function(){
  function appendOption(category){
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }

  function appendChidrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<select class="sell__item-category" id="child_category" name="item[category_id]">
                            <option value="---" data-category="---">---</option>
                            ${insertHTML}
                          <select>`;
    $('.sell-category-box').append(childSelectHtml);
  }
  function appendGrandchidrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `    <select class="sell__item-category" id="grandchild_category" name="item[category_id]">
                                  <option value="---" data-category="---">---</option>
                                  ${insertHTML}
                                </select>`;
    $('.sell-category-box').append(grandchildSelectHtml);
  }

  $('#item_category_id').on('change', function(){
    var parentCategory = document.getElementById('item_category_id').value;
    if (parentCategory != "---"){
      $.ajax({
        url: '/items/get_category_children', //エラーが起きる場合はurlを'/items/get_category_children'に変更する 
        type: 'GET',
        data: { parent_id: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        $('#child_category').remove();
        $('#grandchild_category').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChidrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#child_category').remove();
      $('#grandchild_category').remove();
    }
  });
  $('.sell-category-box').on('change', '#child_category', function(){
    var childId = $('#child_category option:selected').data('category');
    if (childId != "---"){
      $.ajax({
        url: '/items/get_category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#grandchild_category').remove();
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchidrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#grandchild_category').remove();
    }
  });
});