Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B90D6C4320A
	for <linux-doc@archiver.kernel.org>; Sun,  1 Aug 2021 12:25:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A06F9604D7
	for <linux-doc@archiver.kernel.org>; Sun,  1 Aug 2021 12:25:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231749AbhHAMZj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 1 Aug 2021 08:25:39 -0400
Received: from mail.loongson.cn ([114.242.206.163]:53464 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231766AbhHAMZj (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 1 Aug 2021 08:25:39 -0400
Received: from localhost.localdomain (unknown [223.106.24.69])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL+OrkgZhQeonAA--.4804S9;
        Sun, 01 Aug 2021 20:25:24 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, chenweiguang82@126.com,
        siyanteng01@gmail.com
Subject: [PATCH v2 7/8] docs/zh_CN: add infiniband user_mad translation
Date:   Sun,  1 Aug 2021 20:25:37 +0800
Message-Id: <6f03543a3223734e77fb5c667567c00c3fd0510e.1627820210.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1627820210.git.siyanteng@loongson.cn>
References: <cover.1627820210.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxL+OrkgZhQeonAA--.4804S9
X-Coremail-Antispam: 1UD129KBjvJXoW3XrWUXw45tw1xKFW7Ar1fZwb_yoW3Jr17pr
        9rW34xKw43JF90va1xK3y7ZF18Gas7CwsrGF1kK345JF18trsYyF4DKa47uFy3WFyxAFy7
        Zr409FWjk397C3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPa14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
        1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j
        6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7V
        C0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j
        6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x0262
        8vn2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
        F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
        ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7Cj
        xVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
        WUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU
        OBTYUUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate Documentation/infiniband/user_mad.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/infiniband/index.rst   |   2 +-
 .../zh_CN/infiniband/user_mad.rst             | 164 ++++++++++++++++++
 2 files changed, 165 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/infiniband/user_mad.rst

diff --git a/Documentation/translations/zh_CN/infiniband/index.rst b/Documentation/translations/zh_CN/infiniband/index.rst
index c273088b8686..55645171a675 100644
--- a/Documentation/translations/zh_CN/infiniband/index.rst
+++ b/Documentation/translations/zh_CN/infiniband/index.rst
@@ -27,10 +27,10 @@ infiniband
    opa_vnic
    sysfs
    tag_matching
+   user_mad
 
 TODOLIST:
 
-   user_mad
    user_verbs
 
 .. only::  subproject and html
diff --git a/Documentation/translations/zh_CN/infiniband/user_mad.rst b/Documentation/translations/zh_CN/infiniband/user_mad.rst
new file mode 100644
index 000000000000..d9ab2edfb559
--- /dev/null
+++ b/Documentation/translations/zh_CN/infiniband/user_mad.rst
@@ -0,0 +1,164 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/infiniband/user_mad.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+ 王普宇 Puyu Wang <realpuyuwang@gmail.com>
+ 时奎亮 Alex Shi <alexs@kernel.org>
+
+.. _cn_infiniband_user_mad:
+
+===============
+用户空间MAD访问
+===============
+
+设备文件
+========
+
+  每个InfiniBand设备的每个端口都有一个“umad”设备和一个“issm”设备连接。
+  例如，一个双端口的HCA将有两个umad设备和两个issm设备，而一个交换机将
+  有每个类型的一个设备（对于交换机端口0）。
+
+创建MAD代理
+===========
+
+  一个MAD代理可以通过填写一个结构体ib_user_mad_reg_req来创建，然后在
+  适当的设备文件的文件描述符上调用IB_USER_MAD_REGISTER_AGENT ioctl。
+  如果注册请求成功，结构体中会返回一个32位的ID。比如说::
+
+	struct ib_user_mad_reg_req req = { /* ... */ };
+	ret = ioctl(fd, IB_USER_MAD_REGISTER_AGENT, (char *) &req);
+        if (!ret)
+		my_agent = req.id;
+	else
+		perror("agent register");
+
+  代理可以通过IB_USER_MAD_UNREGISTER_AGENT ioctl取消注册。另外，所有
+  通过文件描述符注册的代理在描述符关闭时将被取消注册。
+
+  2014
+       现在提供了一个新的注册IOctl，允许在注册时提供额外的字段。这个注册
+       调用的用户隐含了对pkey_index的使用（见下文）。现在提供了一个新的
+       注册IOctl，允许在注册时提供额外的字段。这个注册调用的用户隐含了对
+       pkey_index的使用（见下文）。
+
+接收MADs
+========
+
+  使用read()接收MAD。现在接收端支持RMPP。传给read()的缓冲区必须至少是
+  一个struct ib_user_mad + 256字节。比如说:
+
+  如果传递的缓冲区不足以容纳收到的MAD（RMPP），errno被设置为ENOSPC，需
+  要的缓冲区长度被设置在mad.length中。
+
+  正常MAD(非RMPP)的读取示例::
+
+	struct ib_user_mad *mad;
+	mad = malloc(sizeof *mad + 256);
+	ret = read(fd, mad, sizeof *mad + 256);
+	if (ret != sizeof mad + 256) {
+		perror("read");
+		free(mad);
+	}
+
+  RMPP读取示例::
+
+	struct ib_user_mad *mad;
+	mad = malloc(sizeof *mad + 256);
+	ret = read(fd, mad, sizeof *mad + 256);
+	if (ret == -ENOSPC)) {
+		length = mad.length;
+		free(mad);
+		mad = malloc(sizeof *mad + length);
+		ret = read(fd, mad, sizeof *mad + length);
+	}
+	if (ret < 0) {
+		perror("read");
+		free(mad);
+	}
+
+  除了实际的MAD内容外，其他结构体ib_user_mad字段将被填入收到的MAD的信
+  息。例如，远程LID将在mad.lid中。
+
+  如果发送超时，将产生一个接收，mad.status设置为ETIMEDOUT。否则，当一个
+  MAD被成功接收后，mad.status将是0。
+
+  poll()/select()可以用来等待一个MAD可以被读取。
+
+  poll()/select()可以用来等待，直到可以读取一个MAD。
+
+发送MADs
+========
+
+  MADs是用write()发送的。发送的代理ID应该填入MAD的id字段，目的地LID应该
+  填入lid字段，以此类推。发送端确实支持RMPP，所以可以发送任意长度的MAD。
+  比如说::
+
+	struct ib_user_mad *mad;
+
+	mad = malloc(sizeof *mad + mad_length);
+
+	/* fill in mad->data */
+
+	mad->hdr.id  = my_agent;	/* req.id from agent registration */
+	mad->hdr.lid = my_dest;		/* in network byte order... */
+	/* etc. */
+
+	ret = write(fd, &mad, sizeof *mad + mad_length);
+	if (ret != sizeof *mad + mad_length)
+		perror("write");
+
+交换IDs
+=======
+
+  umad设备的用户可以在发送的MAD中使用交换ID字段的低32位（也就是网络字节顺序中
+  最小有效的一半字段）来匹配请求/响应对。上面的32位是保留给内核使用的，在发送
+  MAD之前会被改写。
+
+P_Key索引处理
+=============
+
+  旧的ib_umad接口不允许为发送的MAD设置P_Key索引，也没有提供获取接收的MAD的
+  P_Key索引的方法。一个带有pkey_index成员的struct ib_user_mad_hdr的新布局已
+  经被定义；然而，为了保持与旧的应用程序的二进制兼容性，除非在文件描述符被用于
+  其他用途之前调用IB_USER_MAD_ENABLE_PKEY或IB_USER_MAD_REGISTER_AGENT2 ioctl
+  之一，否则不会使用这种新布局。
+
+  在2008年9月，IB_USER_MAD_ABI_VERSION将被增加到6，默认使用新的ib_user_mad_hdr
+  结构布局，并且IB_USER_MAD_ENABLE_PKEY ioctl将被删除。
+
+设置IsSM功能位
+==============
+
+  要为一个端口设置IsSM功能位，只需打开相应的issm设备文件。如果IsSM位已经被设置，那
+  么打开调用将阻塞，直到该位被清除（或者如果O_NONBLOCK标志被传递给open()，则立即返
+  回，errno设置为EAGAIN）。当issm文件被关闭时，IsSM位将被清除。在issm文件上不能进
+  行任何读、写或其他操作。
+
+/dev文件
+========
+
+为了用 udev自动创建相应的字符设备文件，一个类似::
+
+    KERNEL=="umad*", NAME="infiniband/%k"
+    KERNEL=="issm*", NAME="infiniband/%k"
+
+  的规则可以被使用。它将创建节点的名字::
+
+    /dev/infiniband/umad0
+    /dev/infiniband/issm0
+
+  为第一个端口，以此类推。与这些设备相关的infiniband设备和端口可以从以下文件中确定::
+
+    /sys/class/infiniband_mad/umad0/ibdev
+    /sys/class/infiniband_mad/umad0/port
+
+  和::
+
+    /sys/class/infiniband_mad/issm0/ibdev
+    /sys/class/infiniband_mad/issm0/port
-- 
2.27.0

