<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>七牛云信息</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <!-- 页面描述 -->
    <meta name="description" content=""/>
    <!-- 页面关键词 -->
    <meta name="keywords" content=""/>
    <!-- 网页作者 -->
    <meta name="author" content=""/>
    <link rel="stylesheet" href="${ctx}/resources/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="${ctx}/resources/css/public.css" media="all"/>
    <style type="text/css">
        .layui-form-item .layui-inline {
            width: 33.333%;
            float: left;
            margin-right: 0;
        }

        @media (max-width: 1240px) {
            .layui-form-item .layui-inline {
                width: 100%;
                float: none;
            }
        }

        .layui-form-item .role-box {
            position: relative;
        }

        .layui-form-item .role-box .jq-role-inline {
            height: 100%;
            overflow: auto;
        }

        .layui-form[wid100] .layui-form-label {
            width: 110px;
        }

        .layui-form[wid100] .layui-input-block {
            margin-left: 140px;
        }
    </style>
</head>
<body class="childrenBody">
<div class="layui-container" style="margin-top: 15px;">
    <form class="layui-form" wid100>
        <input type="hidden" value="" name="qiniuTestAccess" id="qiniuTestAccess">
        <div class="layui-form-item">
            <label class="layui-form-label">Bucket域名<span class="layui-badge-dot"></span></label>
            <div class="layui-input-block">
                <input type="text" class="layui-input" name="qiniuBasePath" value=""
                       lay-verify="required" placeholder="请输入七牛Bucket 域名或者自有自有域名">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">Bucket目录<span class="layui-badge-dot"></span></label>
            <div class="layui-input-block">
                <input type="text" class="layui-input" name="qiniuBucketName" value=""
                       lay-verify="required" placeholder="请输入七牛Bucket目录">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">存储目录</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input" name="qiniuDir" value="" placeholder="请输入存储目录">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">ACCESS_KEY<span class="layui-badge-dot"></span></label>
            <div class="layui-input-block">
                <input type="password" class="layui-input" name="qiniuAccessKey" value=""
                       lay-verify="required" placeholder="请输入七牛ACCESS_KEY">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">SECRET_KEY<span class="layui-badge-dot"></span></label>
            <div class="layui-input-block">
                <input type="password" class="layui-input" name="qiniuSecretKey" value=""
                       lay-verify="required" placeholder="请输入七牛SECRET_KEY">
            </div>
        </div>
        <div class="layui-form-item" align="center">
            <button class="layui-btn" lay-submit="" lay-filter="saveQiniuInfo">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </form>
</div>
<script type="text/javascript" src="${ctx}/resources/layui/layui.js"></script>
<script>
    layui.use(['form', 'jquery', 'layer'], function () {
        var form = layui.form,
            $ = layui.jquery,
            layer = layui.layer;

        form.on("submit(saveQiniuInfo)", function (data) {
            var loadIndex = layer.load(2, {
                shade: [0.3, '#333']
            });
            $.ajax({
                type: "post",
                url: "${ctx}/resource/saveQiniuInfo.json",
                data: data.field,
                success: function (res) {
                    layer.close(loadIndex);
                    if (res.success) {
                        parent.layer.msg("七牛云信息更新成功!", {time: 1500}, function () {
                            //刷新父页面
                            parent.layer.closeAll();
                        });
                    } else {
                        parent.layer.msg(res.message, {time: 1500}, function () {
                            //刷新父页面
                            parent.location.reload();
                        });
                    }
                }
            });
            return false;
        });
    });
</script>
</body>
</html>
