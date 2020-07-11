// turbolinks:loadイベントを監視することでページ遷移ごとの処理が実装できる
$(document).on('turbolinks:load', () => {
  const buildFileField = (index) => {
    const html = `
    <div class="js-file_group" data-index="${index}" >
      <label>
        <input class="photos--form" accept="image/png,image/jpeg" type="file" name=item[images_attributes][${index}][image]" id="item_images_attributes_${index}_image">
        <div class="photos--drops">
          <i class ="fas fa-camera"></i>
        </div>
      </label>
    </div>
    `;
    return html;
  }

  const buildImg = (index, url) => {
    const html = `
    <div>
      <img data-index="${index}" src="${url}" width="100px" height="100px">
      <div class="js-remove">削除</div>
    </div>
    `;
    return html;
  }

  let fileIndex = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  // photos-boxの要素に変化があったときにphotos--form要素に対して実行
  $(".photos-box").on("change", ".photos--form", function (e) {
    // photos--formの親要素を取得し、data-index属性の値をtargetIndexと定義
    const targetIndex = $(this).parent().data('index');
    console.log(targetIndex)
    // eは発火させたイベント,すなわち、photos-boxの要素変化そのもの
    const file = e.target.files[0];
    // ファイルのブラウザ上でのURLを取得
    const blobUrl = window.URL.createObjectURL(file);
    // 該当indexを持つimgタグがあれば、取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      // setAttributeメソッドでimgタグのsrc属性にファイルのURLが入力
      img.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      // preview要素にbuildImgを実行
      $('.previews').append(buildImg(targetIndex, blobUrl));
      // photos-boxにbuildFileFieldを実行
      $(".photos-box").append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に１を足した数を追加する。
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    }
  });
});