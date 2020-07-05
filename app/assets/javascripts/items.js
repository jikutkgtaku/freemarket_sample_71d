$(document).on('turbolinks:load', () => {
  // 画像用のインプットを生成
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
    // name属性についてはproduct[images_attributes][0][src]という値に、id属性についてはproduct_images_attributes_0_srcという値になる。fields_forで生成されるフォームの1つ目は、このように0という添え字が当てられる。2つ目のフォーム以降は、この添え字の部分を1, 2...といった具合に増やす。
    return html;
  }

  const buildImg = (index, url) => {
    const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;
    return html;
  }
  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  // photos-box要素内の状態に変化がある場合に発火
  // onの引数に".photos--form"を追記することにより、後から追加されたものでも発火する。
  $(".photos-box").on("change", ".photos--form", function (e) {
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