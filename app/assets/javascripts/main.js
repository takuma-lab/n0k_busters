// 適用したいHTMLタグに、

// 『class=ring』と、『data-file=音声ファイルの名前』

// をつける


// グローバル変数

var syncerSounds = {

        flag:{},

        currentTime: null,

};



// 即時関数

(function()

{

        // 変数の設定,この箇所だけ設定したら応用できる。

        var setclass = 'ring'; //画像要素のclass名

        var setDir = 'audios/'; //音声ファイルがあるフォルダ


        // クラス名が付いた要素を取得する

        var sounds = document.getElementsByClassName( setclass ) ;


        for(var i=0,I=sounds.length; I > i; i++ ){


                // クリックイベントの設定

                sounds[i].addEventListener('click', function() {

                        // 音声のファイル名を取得

                        var file = this.getAttribute('data-file');


                        // 一度生成したaudioは生成しない。※で初回再生が済んだらflagを1へ変更する

                        if (typeof(syncerSounds.flag[ file ]) === 'undefined' || syncerSounds.flag[ file ] !==1 ) {


                                // audioタグの作成

                                var audio = document.createElement('audio');

                                // audioタグに音声ファイルの名前のIDを指定

                                audio.id = file;


                                // mp3に対応しているかどうか

                                if (audio.canPlayType('audio/mp3')) {

                                        audio.src = setDir + file + '.mp3';

                                }else if (audio.canPlayType('audio/wav')) {

                                        audio.src = setDir + file + '.wav';

                                }


                                // 作成したaudioタグをHTMLにぶちこむ

                                document.body.appendChild(audio);


                        }


                        // 初回以外ファイルを巻き戻す

                        stopCurrentSound() ;


                        // 音声ファイルを再生する

                        document.getElementById(file).play();



                        // 初回以外ファイルを巻き戻す関数に,直近で再生したaudioのidをセットする。

                        // スコープの関係でグローバル変数に入れる必要がある。

                        syncerSounds.currentTime = file;


                        // audioタグを何度も作成しないようにするため、

                        // 初回再生が終わったのでflagを0から1へ変更し、※で判定

                        syncerSounds.flag[ file ] = 1;


                },  false);

        }


                // 初回以外ファイルを巻き戻す関数

                function stopCurrentSound(){


                        var currentSound = document.getElementById(syncerSounds.currentTime);


                        // 初期値でなければ

                        if (currentSound !== null) {

                                // 音を停止して再生時間を0に戻す

                                currentSound.pause();

                                currentSound.currentTime = 0;

                        }

                }



})();