{% extends 'templates/main.volt' %}

{% block content %}

    <form class="layui-form kg-form" method="POST" action="{{ url({'for':'admin.course.create'}) }}">
        <fieldset class="layui-elem-field layui-field-title">
            <legend>添加课程</legend>
        </fieldset>
        <div class="layui-form-item">
            <label class="layui-form-label">类型</label>
            <div class="layui-input-block">
                <input type="radio" name="model" value="vod" title="点播" lay-filter="model" checked="checked">
                <input type="radio" name="model" value="live" title="直播" lay-filter="model">
                <input type="radio" name="model" value="read" title="图文" lay-filter="model">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"></label>
            <div class="layui-input-block">
                <div class="layui-form-mid layui-word-aux" id="model-tips"></div>
            </div>
        </div>
        <div class="layui-form-item" style="margin:25px 0px 35px 0px;">
            <label class="layui-form-label">标题</label>
            <div class="layui-input-block">
                <input class="layui-input" type="text" name="title" lay-verify="required">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"></label>
            <div class="layui-input-block">
                <button id="kg-submit" class="layui-btn" lay-submit="true" lay-filter="go">提交</button>
                <button type="button" class="kg-back layui-btn layui-btn-primary">返回</button>
            </div>
        </div>
    </form>

{% endblock %}

{% block inline_js %}

    <script>

        layui.use(['jquery', 'form'], function () {

            var $ = layui.jquery;
            var form = layui.form;

            var modelTips = {
                vod: '通过音视频呈现课程内容，内容可视化，有图像有声音，适合大部分场景',
                live: '通过直播呈现课程内容，交互性强，适合需要交互反馈、情绪表达的场景',
                read: '通过图文呈现课程内容，简单直接，适合撰写文档、书籍、教程的场景'
            };

            var modelTipsBlock = $('#model-tips');

            form.on('radio(model)', function (data) {
                modelTipsBlock.html(modelTips[data.value]);
            });

            modelTipsBlock.html(modelTips.vod);

        });

    </script>

{% endblock %}
