 function getQueryString(name) {
     var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
     var r = window.location.search.substr(1).match(reg);
     if (r != null) {
         return unescape(r[2]);
     } else {
         return null;
     }
 }

 var contents = null;
 layui.use('form', function() {
     var form = layui.form,
         jq = layui.jquery;
     var uid = jq('#uid').val();
     var zuid = jq('#zuid').val();

     //���
     if ($(window).width() > 750) {
         layer.photos({
             photos: '.photos',
             zIndex: 9999999999,
             anim: -1
         });
     } else {
         $('body').on('click', '.photos img', function() {
             window.open(this.src);
         });
     }
     //���޻ظ�
     jq('span[type=zan]').click(function() {
         if (uid == "") {
             layer.msg('���½����ܲ�����');
             return false;
         }
         var idnum = jq(this).data('id');
         var url = jq(this).data('url');
         var obj = jq(this);
         jq.post(url, {
             'zan_collect': 'zan',
             'id': idnum,
             'type': 2
         }, function(data) {

             if (data.code == 200) {
                 var intnum = parseInt(jq(obj).find('em').html());
                 if (data.res == '��') {
                     jq(obj).removeClass('zanok');
                     jq(obj).find('em').html(intnum - 1);
                 } else {
                     jq(obj).addClass('zanok');
                     jq(obj).find('em').html(intnum + 1);
                 }
             } else {
                 layer.msg(data.msg);
             }
         });
     });
     //�ٱ�
     jq('span[type=jubao]').click(function() {
         if (uid == "") {
             layer.msg('���½����ܲ�����');
             return false;
         }
         var url = jq(this).data('url');
         var id = jq(this).data('id');
         var type = jq(this).data('type');
         var title = jq(this).data('title');
         layer.prompt({ title: '�����ھٱ�' + title, btn: ['�����ٱ�', '�ֻ�����'] }, function(liyou, index) {

             var loading = layer.load(2, {
                 shade: [0.2, '#000']
             });
             jq.post(url, { id: id, type: type, str: liyou }, function(data) {
                 if (data.code == 200) {
                     layer.close(loading);
                     layer.msg(data.msg, { icon: 1, time: 1000 }, function() {
                         location.reload();
                     });
                 } else {
                     layer.close(loading);
                     layer.msg(data.msg, { icon: 2, anim: 6, time: 1000 });
                 }
             });


         }) && jq('.layui-layer-prompt').find('input').attr('placeholder', '�ٱ�����');





     });
     jq('.del_btn').click(function() {
         var id = jq(this).data('id');
         var cid = jq("#cateid").val();
         var url = jq(this).data('url');
         layer.confirm('ȷ��ɾ���û���?', function(index) {
             loading = layer.load(2, {
                 shade: [0.2, '#000']
             });
             jq.post(url, { 'id': id, 'cid': cid }, function(data) {
                 if (data.code == 200) {
                     layer.close(loading);
                     layer.msg(data.msg, { icon: 1, time: 1000 }, function() {
                         location.reload();
                     });
                 } else {
                     layer.close(loading);
                     layer.msg(data.msg, { icon: 2, anim: 6, time: 1000 });
                 }
             });
         });
     });
     jq('.jinyan_btn').click(function() {
         var id = jq(this).data('id');
         var cid = jq("#cateid").val();
         var url = jq(this).data('url');
         layer.confirm('ȷ����ֹ' + aa + '�ٷ���?', function(index) {
             loading = layer.load(2, {
                 shade: [0.2, '#000']
             });
             jq.post(url, { 'id': id, 'cid': cid }, function(data) {
                 if (data.code == 200) {
                     layer.close(loading);
                     layer.msg(data.msg, { icon: 1, time: 1000 }, function() {
                         location.reload();
                     });
                 } else {
                     layer.close(loading);
                     layer.msg(data.msg, { icon: 2, anim: 6, time: 1000 });
                 }
             });
         });
     });
     jq('span[type=reply]').click(function() {
         if (uid == "") {
             layer.msg('���½����ܲ�����');
             return false;
         }
         var idnum = jq(this).data('id');

         var htmlname = '@' + jq('li#tpt' + idnum).find('.username').html();

         jq('#tid').val(idnum);
         editor.$txt.focus();
         jq('#huifu').html('<i style="color:#F7B824">' + htmlname + '</i>');
     });

     var seelz = getQueryString("see_lz");
     var seedesc = getQueryString("see_desc");
     //alert(seelz);
     if (seelz == "1") {
         jq("#onlyseelz").attr("href", "?");
         jq("#onlyseelz").html("ȡ��ֻ��¥��");
         jq("#onlyseelz").addClass('layui-bg-gray');
     }
     if (seedesc == "1") {
         jq("#seebydesc").attr("href", "?");
         jq("#seebydesc").html("ȡ��������");
         jq("#seebydesc").addClass('layui-bg-gray');
     }



     //��������/�ղ�����
     jq('.zancoll').click(function() {
         if (uid == "") {
             layer.msg('���½����ܲ�����');
             return false;
         }
         var obj = jq(this);
         var zan_collect = jq(this).data('do');
         var idnum = jq(this).parent().data('id');

         //  if (zan_collect == 'collect') {
         //      idnum = zuid;
         //  }
         if (zuid == uid) {
             layer.msg('�����Թ·�����Ŷ��');
             return false;
         }
         var url = jq(this).data('url');
         jq.post(url, {
             'zan_collect': zan_collect,
             'id': idnum,
             'type': jq(this).data('type')
         }, function(data) {

             if (data.code == 200) {
                 var intnum = parseInt(jq(obj).find('em').html());
                 if (data.res == '��') {
                     jq(obj).removeClass('layui-bg-gray');
                     jq(obj).find('em').html(intnum - 1);
                 } else {
                     jq(obj).addClass('layui-bg-gray');
                     jq(obj).find('em').html(intnum + 1);
                 }
             } else {
                 layer.msg(data.msg);
             }
         });
     });

     contents = jq('#dashang');
     //��������
     jq('#tipauthor').click(function() {
         if (uid == "") {
             layer.msg('���½����ܲ�����');
             return false;
         }
         if (zuid == uid) {
             layer.msg('�����Թ·�����Ŷ��');
             return false;
         }

         var a = 1,
             b = 200;
         var num = Math.random() * (b - a) + a;

         jq("#rewarding_input").val(parseInt(num, 10));
         layer.open({
             title: false,
             type: 1,
             closeBtn: 0,
             skin: 'pop_reward_page',
             area: ['400px', '363px'],
             content: contents
         });



     });

     jq('.close_reward').click(function() {

         layer.closeAll(); //�رմ���ҳ��
         //contents = null;
         jq('.dashang').css('display', 'none');

     });

     jq('#reward_btn').on('click', function() {

         var reward_number = parseInt(jq("input[name='reward_number']").val());
         var reward_id = jq("#reward_id").val();
         var num = Number(jq("#tipauthor").find("em").text());
         var url = jq(this).data('url');
         jq.post(url, {
             'id': reward_id,
             'pay': jq.trim(reward_number)
         }, function(datas) {
             var data = JSON.parse(datas);
             if (data.code == 200) {

                 layer.msg(data.msg, {
                     icon: 1,
                     time: 1000
                 }, function() {

                     layer.closeAll();
                     jq("#tipauthor").find("em").text((num + 1));

                     jq('.dashang').css('display', 'none');

                 });
             } else if (data.code == -1) {

                 layer.msg(data.msg, {
                     icon: 2,
                     time: 2000
                 });
             } else {

                 layer.msg(data.msg, {
                     icon: 2,
                     anim: 6,
                     time: 2000
                 }, function() {
                     layer.closeAll();
                     jq('.dashang').css('display', 'none');
                 });
             }
         });

     });
     form.on('submit(comment_add)', function(data) {
         var url = jq(this).data('url');
         if (uid == "") {
             layer.msg('���½����ܲ�����');
             return false;
         }

         loading = layer.load(2, {
             shade: [0.2, '#000']
         });
         var param = data.field;

         jq.post(url, param, function(data) {
             if (data.code == 200) {
                 layer.close(loading);
                 layer.msg(data.msg, {
                     icon: 1,
                     time: 1000
                 }, function() {
                     location.reload();
                 });
             } else {
                 layer.close(loading);
                 layer.msg(data.msg, {
                     icon: 2,
                     anim: 6,
                     time: 1000
                 });
             }
         });
         return false;
     });
 })