// turbolinks:loadイベントを監視することでページ遷移ごとの処理が実装できる
$(document).on('turbolinks:load', () => {
  const buildFileField = (index) => {
    const html = `
    <div class="js-file_group" data-index="${index}" >
      <label>
        <input class="photos--form" accept="image/png,image/jpeg" type="file" name=item[images_attributes][${index}][image]" id="item_images_attributes_${index}_image">
        <div class="photos--drops">
          <div class="photos--drops__comment">
            <p>ドラッグアンドドロップ</p>
          </div>
        </div>
      </label>
    </div>
    `;
    return html;
  }

  const buildImg = (index, url) => {
    const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;
    return html;
  }

  let fileIndex = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  // photos-boxの
  $(".photos-box").on("change", ".photos--form", function (e) {
    // photo
    const targetIndex = $(this).parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    // 該当indexを持つimgタグがあれば、取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      $('.previews').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      // appendで指定した子要素の最後にテキスト文字やHTML要素を追加する
      // $(".photos-box").append(buildFileField(fileIndex[0]));
      // 配列から最初の要素を削除してその要素を返す
      fileIndex.shift();
      // 末尾の数に１を足した数を追加する。
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    }
  });
});