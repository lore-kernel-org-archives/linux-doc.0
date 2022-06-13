Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9501BC433EF
	for <linux-doc@archiver.kernel.org>; Mon, 13 Jun 2022 05:02:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbiFMFCM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 13 Jun 2022 01:02:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbiFMFCL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Jun 2022 01:02:11 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BF488EE2A
        for <linux-doc@vger.kernel.org>; Sun, 12 Jun 2022 22:02:09 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.110.105])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9BxOeTLxKZiLn49AA--.4099S4;
        Mon, 13 Jun 2022 13:02:06 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com, zhoubinbin@loongson.cn
Subject: [PATCH v2 2/3] docs/zh_CN: Update the translation of page_owner to 5.19-rc1
Date:   Mon, 13 Jun 2022 13:03:41 +0800
Message-Id: <4407c99c5c7dc85e70a10ea8817fea2b5e6bc9dc.1655094814.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1655094814.git.siyanteng@loongson.cn>
References: <cover.1655094814.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9BxOeTLxKZiLn49AA--.4099S4
X-Coremail-Antispam: 1UD129KBjvJXoWxXFyUZw18GrWrKr1rXFWxCrg_yoWrGw17pa
        sFk345Ja12y3W3ZFyjk3929F17Ga1fWw4jkFyxKa98Zr1DJFZavrWqkayqqr15Ga48Jay5
        XrWjyrsFyF9YyrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPG14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
        ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
        xKxwCY02Avz4vE14v_GrWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l
        x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
        v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IY
        x2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
        Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIF
        yTuYvjfU16wZDUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

update to commit d1ed51fcdbd6 ("docs: vm/page_owner: tweak
literal block in STANDARD FORMAT SPECIFIERS")

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/vm/page_owner.rst      | 72 +++++++++++++++++--
 1 file changed, 65 insertions(+), 7 deletions(-)

diff --git a/Documentation/translations/zh_CN/vm/page_owner.rst b/Documentation/translations/zh_CN/vm/page_owner.rst
index 9e951fabba9d..0086e6763e77 100644
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
+		-f		过滤掉内存已被释放的块的信息。
 
-   其它函数:
+	选择:
+		--pid <pidlist>		按pid选择。这将选择进程ID号出现在<pidlist>中的块。
+		--tgid <tgidlist>	按tgid选择。这将选择其线程组ID号出现在<tgidlist>
+		                    中的块。
+		--name <cmdlist>	按任务命令名称选择。这将选择其任务命令名称出现在
+		                    <cmdlist>中的区块。
 
-	Cull:
-		-c		通过比较堆栈跟踪而不是总块来进行剔除。
+		<pidlist>, <tgidlist>, <cmdlist>是以逗号分隔的列表形式的单个参数，
+		它提供了一种指定单个选择规则的方法。
 
-	Filter:
-		-f		过滤掉内存已被释放的块的信息。
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
-- 
2.27.0

