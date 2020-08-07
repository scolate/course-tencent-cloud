layui.use(['jquery', 'layer'], function () {

    var $ = layui.jquery;
    var layer = layui.layer;

    $('.kg-preview').on('click', function () {

        var chapterId = $(this).attr('chapter-id');
        var playUrl = $(this).attr('play-url');
        var frameUrl = '/admin/vod/player?chapter_id=' + chapterId + '&play_url=' + playUrl;

        layer.open({
            id: 'player',
            type: 2,
            title: '媒体播放器',
            resize: false,
            area: ['720px', '445px'],
            content: [frameUrl, 'no']
        });

    });

});