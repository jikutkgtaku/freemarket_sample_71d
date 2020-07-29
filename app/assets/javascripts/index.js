$(function(){

  // ブランド選択リストのHTML作成
  function brandList(brand) {
    $("#brand-search-result").show();
    let html =`<p class="brand-list", data-brand-id="${brand.id}", data-brand-name="${brand.name}">${brand.name}</p>`;
    $("#brand-search-result").append(html);
  }

  // 選択したブランド名を項目欄に追加、選択リストは非表示にする
  function addBrand(brandId, brandName) {
    $("#item_brand_id").val(brandName); 
    $("#brand-search-result").hide();

    // DB送信時にbrand_idの情報を持たせる
    let brand_data = `<input value="${brandId}" name="item[brand_id]" type="hidden" />`;
    $(`#item_brand_id`).append(brand_data);
  }

  
  // ブランド項目欄へ文字を入力する事でのイベント発火
  $(document).on("keyup", "#item_brand_id", function(){
    let input = $("#item_brand_id").val();
    $.ajax({
      type: 'GET',
      url: '/brands',
      data: { keyword: input },
      dataType: 'json'
    })
    
    .done(function(brands){
      $("#brand-search-result").empty();
      if(brands.length !== 0) {
        brands.forEach(function(brand) {
          brandList(brand);
        });
      } else {
        return false;
      }
    });
  });
  
  // リストから特定のブランド名を選択し、ブランド項目の欄に設定
  $(document).on("click", ".brand-list", function() {
    const brandId = $(this).attr("data-brand-id");
    const brandName = $(this).attr("data-brand-name");
    addBrand(brandId, brandName);
  });

 // editアクション用（デフォルトでブランド名称を画面に表示させるにあたりid情報を持てていない為、以下のコードが必要となる。）
  $(window).on('turbolinks:load', function () {
    // submitボタン押下時に入っていたvalue(ブランド名)を取得
    const brandData = $("#item_brand_id").val();

    // そのブランド名でインクリメンタルサーチを発火
    if(brandData != ""){
      $.ajax({
        type: "GET",
        url: '/brands',
        data: { keyword: brandData },
        dataType: 'json',
      })

      // 名称をキーワードに取得したブランドデータからbrand_idを取得。paramsにidを載せる為、input valueにbrand_idの情報を持たせる。
      .done(function(brands){
        const brand = brands[0]
        let brand_data = `<input value="${brand.id}" name="item[brand_id]" type="hidden" />`;
        $(`#item_brand_id`).append(brand_data);        
      });
    }
  });
});