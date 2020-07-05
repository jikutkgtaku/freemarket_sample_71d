$(function(){
  function appendOption(category) { //optionの作成
    var html = `<option value="${category.id}">${category.name}</option>`;
    return html;
  }
  function appendChidrenBox(insertHTML){ //子セレクトボックスのhtml作成
    var childSelectHtml = '';
      childSelectHtml = `<div class='product-select-wrapper' id= 'children_wrapper'>
                        <div class='items-data--category__child' >
                        <select class="select-box" id="child_category" name="item[category_id]">
                        <option value="---">選択してください</option>
                        ${insertHTML}
                        </select>
                        </div>
                        <div class= 'items-data--category__grandchild'>
                        </div>
                        </div>`;
    $('.items-data--category__child').append(childSelectHtml);
  }
  function appendgrandChildrenBox(insertHTML){
    var grandchildrenSelectHtml = '';
    grandchildrenSelectHtml = `<div class='product-select-wrapper' id= 'grandchildren_wrapper'>
                              <div class='items-data--category__grandchild'>
                              <select class="select-box" id="grandchild_category" name="item[category_id]">
                              <option value="---">選択してください</option>
                              ${insertHTML}
                              </select>
                              </div>
                              <div class= 'items-data--category__grandchild'>
                              </div>
                              </div>`;
    $('.items-data--category__grandchild').append(grandchildrenSelectHtml);
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
          $('#size_wrapper').remove();
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
        if (insertHTML != ''){
          appendgrandChildrenBox(insertHTML);
        }
        
        $(document).on('change', '#child_category', function(){
          $('#grandchildren_wrapper').remove();
          $('#size_wrapper').remove();
        })
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }
  });
});

$(function(){
  function appendSizeOption(size){ //sizeの作成
    var html = `<option value="${size.id}">${size.name}</option>`;
    return html;
  }

  function appendSizeBox(insertHTML){ //sizeボックスのhtml作成
    var sizeSelectHtml = '';
    sizeSelectHtml = `<div class="listing-product-detail__size" id= 'size_wrapper'>
                        <div class="items-data--size" class="contents-height">
                          <h3>サイズ</h3>
                          <span class='form-required'>必須</span>
                          <select class="select-box" id="size" name="item[size_id]">
                          <option value="---">選択してください</option>
                          ${insertHTML}
                          </select>
                        </div>
                      </div>`;
    $('.items-data--category__grandchild').append(sizeSelectHtml);
  }
  //孫カテゴリー選択後のイベント
  $(document).on('change', '#grandchild_category', function(){
    var grandchildId = document.getElementById('grandchild_category').value; //選択された孫カテゴリーのidを取得
    if (grandchildId != '---'){
      $.ajax ({
        url: 'get_size',
        type: 'GET',
        date: { grandchild_id: grandchildId },
        dataType: 'json'
      })
      .done(function(sizes) {
        if (sizes.length != 0) {
          var insertHTML = '';
          sizes.forEach(function(size){
            insertHTML += appendSizeOption(size);
          });
          appendSizeBox(insertHTML);
          $(document).on('change', '#grandchildren_wrapper', function(){
            $('#size_wrapper').remove(); //孫が変更された時、サイズ蘭以下を削除する
          })
        }
      })
      .fail(function(){
        alert('サイズ取得に失敗しました。');
      })
    }
  })
})