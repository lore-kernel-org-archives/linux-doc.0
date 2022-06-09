Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C242CCA47B
	for <linux-doc@archiver.kernel.org>; Thu,  9 Jun 2022 13:25:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245389AbiFINZo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Jun 2022 09:25:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245539AbiFINZk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Jun 2022 09:25:40 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5232AA869E
        for <linux-doc@vger.kernel.org>; Thu,  9 Jun 2022 06:25:38 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.112.55])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxf0zM9KFiSWk0AA--.696S4;
        Thu, 09 Jun 2022 21:25:35 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com, zhoubinbin@loongson.cn
Subject: [PATCH 2/3] docs/zh_CN: Update the translation of page_owner to 5.19-rc1
Date:   Thu,  9 Jun 2022 21:27:19 +0800
Message-Id: <f4343c39432ca3566fed2ba29c86261e452c92ec.1654780922.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1654780922.git.siyanteng@loongson.cn>
References: <cover.1654780922.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxf0zM9KFiSWk0AA--.696S4
X-Coremail-Antispam: 1UD129KBjvJXoWxXF4kuF4xAryfWw1Uuw17ZFb_yoW5Kw1Dp3
        sF9345J3W7t3W3ZFyUK3929F1UGa1fWw4jkFyxGayDZr1DJFZaqrWDKayqqr15Ga48Jay3
        XrWjyrsFyFyvvrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPl14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
        xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
        vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
        r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
        v7MxkIecxEwVAFwVW5GwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC2
        0s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI
        0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv2
        0xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2js
        IE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZF
        pf9x0JUUGYJUUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

update to commit d1ed51fcdbd6 ("docs: vm/page_owner: tweak
literal block in STANDARD FORMAT SPECIFIERS")

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/vm/page_owner.rst      | 70 +++++++++++++++++--
 1 file changed, 64 insertions(+), 6 deletions(-)

diff --git a/Documentation/translations/zh_CN/vm/page_owner.rst b/Documentation/translations/zh_CN/vm/page_owner.rst
index 9e951fabba9d..9f88c9c999bc 100644
--- a/Documentation/translations/zh_CN/vm/page_owner.rst
+++ b/Documentation/translations/zh_CN/vm/page_owner.rst
@@ -96,21 +96,79 @@ page owner在默认情况下是禁用的。所以，如果你想使用它，你
    默认情况下， ``page_owner_sort`` 是根据buf的时间来排序的。如果你想
    按buf的页数排序，请使用-m参数。详细的参数是:
 
-   基本函数:
+   基本函数::
 
-	Sort:
+	排序:
 		-a		按内存分配时间排序
 		-m		按总内存排序
 		-p		按pid排序。
 		-P		按tgid排序。
+		-n      按任务命令名称排序。
 		-r		按内存释放时间排序。
 		-s		按堆栈跟踪排序。
 		-t		按时间排序（默认）。
 
-   其它函数:
+        例子:
+				./page_owner_sort <input> <output> --sort=n,+pid,-tgid
+				./page_owner_sort <input> <output> --sort=at
 
-	Cull:
-		-c		通过比较堆栈跟踪而不是总块来进行剔除。
+    其它函数::
 
-	Filter:
+	剔除:
+		--cull <rules>
+		        指定剔除规则。剔除的语法是key[,key[,...]]。从**标准格式指定器**
+				部分选择一个多字母键。
+		<rules>是一个以逗号分隔的列表形式的单一参数，它提供了一种指定单个剔除规则的
+		方法。 识别的关键字在下面的**标准格式指定器**部分有描述。<规则>可以通过键的
+		序列k1,k2,...来指定，在下面的标准排序键部分有描述。允许混合使用简写和完整形
+		式的键。
+
+		Examples:
+				./page_owner_sort <input> <output> --cull=stacktrace
+				./page_owner_sort <input> <output> --cull=st,pid,name
+				./page_owner_sort <input> <output> --cull=n,f
+
+	过滤:
 		-f		过滤掉内存已被释放的块的信息。
+
+	选择:
+		--pid <pidlist>		按pid选择。这将选择进程ID号出现在<pidlist>中的块。
+		--tgid <tgidlist>	按tgid选择。这将选择其线程组ID号出现在<tgidlist>
+		                    中的块。
+		--name <cmdlist>	按任务命令名称选择。这将选择其任务命令名称出现在
+		                    <cmdlist>中的区块。
+
+		<pidlist>, <tgidlist>, <cmdlist>是以逗号分隔的列表形式的单个参数，
+		它提供了一种指定单个选择规则的方法。
+
+
+		例子:
+				./page_owner_sort <input> <output> --pid=1
+				./page_owner_sort <input> <output> --tgid=1,2,3
+				./page_owner_sort <input> <output> --name name1,name2
+
+标准格式指定器
+==============
+::
+
+  --sort的选项:
+
+	键		键长		描述
+	p		pid		进程ID
+	tg		tgid		线程组ID
+	n		name		任务命令名称
+	st		stacktrace	页面分配的堆栈跟踪
+	T		txt		块的全文
+	ft		free_ts		页面发布时的时间戳
+	at		alloc_ts	页面被分配时的时间戳
+	ator		allocator	页面的内存分配器
+
+  --curl的选项:
+
+	键		键长		描述
+	p		pid		进程ID
+	tg		tgid		线程组ID
+	n		name		任务命令名称
+	f		free		该页是否已经发布
+	st		stacktrace	页面分配的堆栈跟踪
+	ator		allocator	页面的内存分配器
-- 
2.27.0

