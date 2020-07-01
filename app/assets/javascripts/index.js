$(function(){

  // ブランド選択リストのHTML作成
  function brandList(brand) {
    $("#brand-search-result").show();
    let html =`<p class="brand-list", data-brand-id="${brand.id}", data-brand-name="${brand.name}">${brand.name}</p>`;
    $("#brand-search-result").append(html);
  }

  // 選択したブランド名を項目欄に追加、選択リストは非表示にする
  function addBrand(brandId) {
    $("#item_brand_id").val(brandId); 
    $("#brand-search-result").hide();
  }

  // DBにブランド情報をいれる
  // function setBrandId(brandId, brandName) {
  //   let brand_data = `<input name="item[brand_id]" type="hidden" value="${brandId}" />`;
  //   $(`#item_brand_id`).append(brand_data);
  // }

  
  // ブランド項目欄へ文字を入力する事でのイベント発火
  $(document).on("keyup", "#item_brand_id", function(){
    let input = $("#item_brand_id").val();
    console.log(input)
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
    addBrand(brandId);
    // setBrandId(brandId, brandName);
  });
});