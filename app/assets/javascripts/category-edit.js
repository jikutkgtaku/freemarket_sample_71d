//category編集時
$(function(){
  function appendOption(category){
    var html = `<option value="${category.id}">${category.name}</option>`;
    return html;
  }

// 子カテゴリー用のhtmlの作成。子カテゴリーのidはいらないので name=""としています。
  function appendChild(insertHTML) {
    var childSelectHTML = '';
    childSelectHTML = `<div class='product-select-wrapper' id= 'children_wrapper_edit'>
                        <div class="items-data--category--edit__child">
                          <select class="select-box" id="child_category_edit" name="item[category_id]">
                            <option value="---">選択してください</option>
                            ${insertHTML}
                          </select>
                        </div>
                        <div class= 'items-data--category--edit__grandchild'>
                        </div>
                      </div>`;
    $('.items-data--category--edit').append(childSelectHTML);
  }

// 孫カテゴリー用のhtmlを作成。孫カテゴリーのidが欲しいのでname="product[category_id]"としています。
  function appendgrandChildren(insertHTML) {
    var grandChildSelect = '';
    grandChildSelect = `<div class='product-select-wrapper' id= 'grandchildren_wrapper_edit'>
                          <div class="items-data--category--edit__grandchild">
                            <select class="select-box" id="grandchild_category_edit" name="item[category_id]">
                              <option value="---">選択してください</option>
                              ${insertHTML}
                            </select>
                          </div>
                          <div class= 'items-data--category--edit__grandchild'>
                          </div>
                        </div>`;
    $('.items-data--category--edit').append(grandChildSelect);
  }

// 親カテゴリーの値が変わった時の処理を書きます
  $(document).on('change', '#parent_category_edit', function() {
    // 親カテゴリーのデータを取得して変数にいれる
    var parentCategoryEdit = document.getElementById('parent_category_edit').value;
    if (parentCategoryEdit != ''){
    // ajaxの処理。urlを/products/get_category_childrenにしないとrenderでeditに戻された時に上手く働かない
      $.ajax({
        url: '/items/category_children',
        type: 'GET',
        data: { category_id: parentCategoryEdit },
        dataType: 'json'
      })
    // 成功した時の処理
      .done(function(children){
        // 元々あった子カテゴリーと孫カテゴリーを消す。
        $('#child_category_edit').remove();
        $('#grandchild_category_edit').remove();
        $('.items-data--category__size_wrapper').remove();
        // insertHTMLを定義して中身にオプションをつける。
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        // オプション付きのinsertHTMLをappendChildにいれる。
        // 上のappendChildで定義された$('.listing-select-wrapper--edit').append(childSelectHTML);により一番、つまり親カテゴリーのしたに差し込まれる。
        appendChild(insertHTML);
        $(document).on('change', '#parent_category_edit', function(){
          //通信成功時に親の選択肢を変えたらイベント発火、子と孫を削除、selectのidにかけるのではなく、親要素にかけないと残ってしまう
            $('#children_wrapper_edit').remove();
            $('#grandchildren_wrapper_edit').remove();
            $('.items-data--category__size_wrapper').remove();
          })
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }
  });

  // 子カテゴリーとやっていることは基本的に同じです 
  $('.items-data--category--edit').on('change', '#child_category_edit', function(){
    var childIdEdit = document.getElementById('child_category_edit').value;
    if (childIdEdit != '') {
      $.ajax({
        url: '/items/category_grandchildren',
        type: 'GET',
        data: { child_id: childIdEdit },
        dataType: 'json'
      })
      .done(function(grandchildren) {
        $('#grandchild_category_edit').remove();
        $('.items-data--category__size_wrapper').remove();

        var insertHTML = '';
        grandchildren.forEach(function(grandchild){
          insertHTML += appendOption(grandchild);
        });
        appendgrandChildren(insertHTML);
        $(document).on('change', '#child_category', function(){
          $('#grandchildren_wrapper_edit').remove();
          $('.items-data--category__size_wrapper').remove();
        })
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }
  })

    //孫カテゴリー選択後のイベント
    $(document).on('change', '#grandchild_category_edit', function(){
      var grandchildId = document.getElementById('grandchild_category_edit').value; //選択された孫カテゴリーのidを取得
      if (grandchildId != '---'){
        $.ajax ({
          url: '/items/get_size',
          type: 'GET',
          data: { grandchild_id: grandchildId },
          dataType: 'json'
        })
        .done(function(sizes) {
          if (sizes.length != 0) {
            var insertHTML = '';
            sizes.forEach(function(size){
              insertHTML += appendSizeOption(size);
            });
            appendSizeBox(insertHTML);
            $(document).on('change', '#grandchildren_wrapper_edit', function(){
              $('.items-data--category__size_wrapper').remove(); //孫が変更された時、サイズ蘭以下を削除する
            })
          }
        })
        .fail(function(){
          alert('サイズ取得に失敗しました。');
        })
      }
    })
})


//size編集
$(function(){
  function appendSizeOption(size){
    var html = `<option value="${size.id}">${size.name}</option>`;
    return html;
  }

  function appendSizeBox(insertHTML){ //sizeボックスのhtml作成
    var sizeSelectHtml = '';
    sizeSelectHtml = `<div class="items-deta--category__size" id= 'size_wrapper_edit'>
                        <label class="items-data--size" class="contents-height" for="サイズ">サイズ</label>
                          <span class='form-required'>必須</span>
                          <select class="select-box" id="size" name="item[size_id]">
                          <option value="---">選択してください</option>
                          ${insertHTML}
                          </select>
                      </div>`;
    $('.items-data--category').append(sizeSelectHtml);
  }
  
  //孫カテゴリー選択後のイベント
  $(document).on('change', '#grandchild_category_edit', function(){
    var grandchildId = document.getElementById('grandchild_category_edit').value; //選択された孫カテゴリーのidを取得
    if (grandchildId != '---'){
      $.ajax ({
        url: '/items/get_size',
        type: 'GET',
        data: { grandchild_id: grandchildId },
        dataType: 'json'
      })
      .done(function(sizes) {
        if (sizes.length != 0) {
          $('#size_wrapper_edit').remove(); 
          var insertHTML = '';
          sizes.forEach(function(size){
            insertHTML += appendSizeOption(size);
          });
          appendSizeBox(insertHTML);
          $(document).on('change', '#grandchildren_wrapper_edit', function(){
            $('#size_wrapper_edit').remove(); //孫が変更された時、サイズ蘭以下を削除する
          })
        }
      })
      .fail(function(){
        alert('サイズ取得に失敗しました。');
      })
    }
  })
})