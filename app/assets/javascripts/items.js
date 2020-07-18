//  document ＝ 開いているWebページのDOMツリーが入っているオブジェクト
//  turbolinks:load ＝ 初回読み込み、リロード、ページ切り替えで動く。
$(document).on('turbolinks:load', () => {
  const buildFileField = (index) => {
    const html = `
    <div class="js-file_group" data-index="${index}" >
      <input class="photos--form" accept="image/png,image/jpeg" type="file" name="item[images_attributes][${index}][image]" id="item_images_attributes_${index}_image">
    </div>
    `;
    return html;
  }

  const buildImg = (index, url) => {
    const html = `
    <div class="preview">
      <img data-index="${index}" src="${url}" width="105px" height="90px">
      <div class="js-remove" id="delete-btn-${index}">削除</div>
    </div>
    `;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列（上記のindexに入る数字）
  let fileIndex = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  // すでに使われているindexを除外
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);
  $('.hidden-destroy').hide();

  // photos-boxの要素に変化があったときにphotos--form要素に対して実行
  $(".photos-box").on("change", ".photos--form", function (e) {
    const targetIndex = $(this).parent().data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    const countIMG = $(".preview").length;
    console.log(countIMG)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      $('.previews').append(buildImg(targetIndex, blobUrl));
      $(".photos--drops").append(buildFileField(fileIndex[0]));
      $(".photos--drops").attr({ for: `item_images_attributes_${targetIndex + 1}_image` });
      fileIndex.shift();
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    }
    // previewが10になったら、フォームを非表示にする
    if (countIMG == 9) {
      $(".photos--drops").toggle(false);
    }
  });

  $('.photos-box').on("click", '.js-remove', function () {
    // js-remove要素のidを取得し、数字の部分を抽出
    const targetIMG = $(this).attr("id").replace(/[^0-9]/g, '');
    const countIMG = $(".preview").length;
    $(this).parent().remove();
    console.log(countIMG)
    // 削除した画像のフォームの中身を削除
    $(`#item_images_attributes_${targetIMG}_image`).remove();
    
    // previewが10未満になったら、フォームを表示する
    if (countIMG < 11) {
      $(".photos--drops").toggle(true);
    }
  });
});