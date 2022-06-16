Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 700EEC43334
	for <linux-doc@archiver.kernel.org>; Thu, 16 Jun 2022 07:43:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230000AbiFPHnq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Jun 2022 03:43:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359633AbiFPHno (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Jun 2022 03:43:44 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 86DD55C843
        for <linux-doc@vger.kernel.org>; Thu, 16 Jun 2022 00:43:42 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.110.105])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr08o36pipIVFAA--.8884S4;
        Thu, 16 Jun 2022 15:43:39 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        zhoubinbin@loongson.cn
Subject: [PATCH v3 2/3] docs/zh_CN: Update the translation of page_owner to 5.19-rc1
Date:   Thu, 16 Jun 2022 15:44:57 +0800
Message-Id: <e96557b73b036c33a9fa5abdab0c541704235e92.1655362610.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1655362610.git.siyanteng@loongson.cn>
References: <cover.1655362610.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxr08o36pipIVFAA--.8884S4
X-Coremail-Antispam: 1UD129KBjvJXoWxXFyUZw18GrWrtFW8GrykZrb_yoWrXF1kpa
        sF9a45Ja17t3W3ZFyjka929F18Can3Ww4jkFWxKa98Ar1DJFZaqrWqkayqqr15Ga48Jay3
        XrWjkrZrAF9YvrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPC14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
        e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
        8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
        jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
        kIwI1lc2xSY4AK67AK6r4xMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4U
        MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67
        AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0
        cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
        80aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI
        43ZEXa7VUUZ2-5UUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

update to commit d1ed51fcdbd6 ("docs: vm/page_owner: tweak
literal block in STANDARD FORMAT SPECIFIERS")

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/vm/page_owner.rst      | 79 ++++++++++++++++---
 1 file changed, 70 insertions(+), 9 deletions(-)

diff --git a/Documentation/translations/zh_CN/vm/page_owner.rst b/Documentation/translations/zh_CN/vm/page_owner.rst
index 9e951fabba9d..0034d2ae1cd5 100644
--- a/Documentation/translations/zh_CN/vm/page_owner.rst
+++ b/Documentation/translations/zh_CN/vm/page_owner.rst
@@ -96,21 +96,82 @@ page owner在默认情况下是禁用的。所以，如果你想使用它，你
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
+		-n		按任务命令名称排序。
 		-r		按内存释放时间排序。
 		-s		按堆栈跟踪排序。
 		-t		按时间排序（默认）。
-
-   其它函数:
-
-	Cull:
-		-c		通过比较堆栈跟踪而不是总块来进行剔除。
-
-	Filter:
+       --sort <order> 指定排序顺序。排序的语法是[+|-]key[,[+|-]key[,...]]。从
+       **标准格式指定器**那一节选择一个键。"+"是可选的，因为默认的方向是数字或
+       词法的增加。允许混合使用缩写和完整格式的键。
+
+        例子:
+				./page_owner_sort <input> <output> --sort=n,+pid,-tgid
+				./page_owner_sort <input> <output> --sort=at
+
+    其它函数::
+
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

