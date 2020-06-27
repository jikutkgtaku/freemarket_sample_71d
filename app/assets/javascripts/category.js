$(function(){
  function appendOption(category) { //optionの作成
    var html = `<option value="${category.id}">${category.name}</option>`;
    return html;
  }
  function appendChidrenBox(insertHTML){ //子セレクトボックスのhtml作成
    var childSelectHtml = '';
      childSelectHtml = `<div class='product-select-wrapper' id= 'children_wrapper'>
                        <div class='items-date--category__child' >
                        <select class="select-box" id="child_category" name="item[category_id]">
                        <option value="---">選択してください</option>
                        ${insertHTML}
                        </select>
                        </div>
                        <div class= 'items-date--category__grandchild'>
                        </div>
                        </div>`;
    $('.items-date--category__child').append(childSelectHtml);
  }
  function appendgrandChildrenBox(insertHTML){
    var grandchildrenSelectHtml = '';
    grandchildrenSelectHtml = `<div class='product-select-wrapper' id= 'grandchildren_wrapper'>
                              <div class='items-date--category__grandchild'>
                              <select class="select-box" id="grandchild_category" name="item[category_id]">
                              <option value="---">選択してください</option>
                              ${insertHTML}
                              </select>
                              </div>
                              <div class= 'items-date--category__grandchild'>
                              </div>
                              </div>`;
    $('.items-date--category__grandchild').append(grandchildrenSelectHtml);
  }

  $(document).on('change', '#category_select', function(){ //親セレクトボックスの選択肢を変えたら発火
    var productcategory = document.getElementById('category_select').value; //productcategoryに選択した親のvalueを代入
    if (productcategory != ''){ // productcategoryが空では無い場合のみAjax通信を行う。選択を初期選択肢'---'に変えると、通信失敗となってしまうため。
      $.ajax({
        url: 'category_children',
        type: 'GET',
        data: { productcategory: productcategory },
        dataType: 'json'
      })
      .done(function(children){ //送られてきたデータをchildrenに代入
        var insertHTML = '';
        children.forEach(function(child){ //forEachでchildに１つづつデータを代入。
          insertHTML += appendOption(child);
        });
        appendChidrenBox(insertHTML);
        $(document).on('change', '#category_select', function(){
        //通信成功時に親の選択肢を変えたらイベント発火、子と孫を削除、selectのidにかけるのではなく、親要素にかけないと残ってしまう
          $('#children_wrapper').remove();
          $('#grandchildren_wrapper').remove();
        })
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }
  });

  //document,もしくは親を指定しないと発火しない
  $(document).on('change', '#child_category', function(){ 
    var productcategory = document.getElementById('child_category').value;
    if (productcategory != ''){
      $.ajax ({
        url: 'category_grandchildren',
        type: 'GET',
        data: { productcategory: productcategory },
        dataType: 'json'
      })
      .done(function(grandchildren) {
        var insertHTML = '';
        grandchildren.forEach(function(grandchild){
          insertHTML += appendOption(grandchild);
        });
        appendgrandChildrenBox(insertHTML);
        $(document).on('change', '#child_category', function(){
          $('#grandchildren_wrapper').remove();
        })
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }
  });
});