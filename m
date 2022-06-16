Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B43CCA47F
	for <linux-doc@archiver.kernel.org>; Thu, 16 Jun 2022 07:43:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230347AbiFPHnr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Jun 2022 03:43:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359643AbiFPHno (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Jun 2022 03:43:44 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A08765D189
        for <linux-doc@vger.kernel.org>; Thu, 16 Jun 2022 00:43:43 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.110.105])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr08o36pipIVFAA--.8884S5;
        Thu, 16 Jun 2022 15:43:39 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        zhoubinbin@loongson.cn
Subject: [PATCH v3 3/3] docs/zh_CN: Update the translation of vm index to 5.19-rc1
Date:   Thu, 16 Jun 2022 15:44:58 +0800
Message-Id: <35d10864fb9b57bf288d4efa5642f93a60079029.1655362610.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1655362610.git.siyanteng@loongson.cn>
References: <cover.1655362610.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxr08o36pipIVFAA--.8884S5
X-Coremail-Antispam: 1UD129KBjvJXoWxZFyxtry8Jr18Ww4UKr13twb_yoW5GF4fpr
        nrGryfK3ZrJ3W3u34fG347CF4rGF4xWwsrWFWjgwnY9rsrtrW0yr4qyr1jga4xWryfZay8
        XFWayr1kury2y37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPC14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
        x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
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
        43ZEXa7VUbfgA5UUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

update to commit 481cc97349d6 ("mm,doc: Add new
documentation structure")

Note: There are some empty files that do not need to be updated for now,
they are:

bootmem,
oom,
page_allocation,
page_cache,
page_reclaim,
page_tables,
physical_memory
process_addrs,
shmfs,
slab,
vmalloc,
swap.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
---
 Documentation/translations/zh_CN/vm/index.rst | 27 ++++++++++++++-----
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/Documentation/translations/zh_CN/vm/index.rst b/Documentation/translations/zh_CN/vm/index.rst
index a1c6d529b6ff..e02976f438ab 100644
--- a/Documentation/translations/zh_CN/vm/index.rst
+++ b/Documentation/translations/zh_CN/vm/index.rst
@@ -12,11 +12,27 @@
 Linux内存管理文档
 =================
 
-这是一个关于Linux内存管理（mm）子系统内部的文档集，其中有不同层次的细节，包括注释
-和邮件列表的回复，用于阐述数据结构和算法的基本情况。如果你正在寻找关于简单分配内存的建
-议，请参阅(Documentation/translations/zh_CN/core-api/memory-allocation.rst)。
-对于控制和调整指南，请参阅(Documentation/admin-guide/mm/index)。
-TODO:待引用文档集被翻译完毕后请及时修改此处）
+这是一份关于了解Linux的内存管理子系统的指南。如果你正在寻找关于简单分配内存的
+建议，请参阅内存分配指南
+(Documentation/translations/zh_CN/core-api/memory-allocation.rst)。
+关于控制和调整的指南，请看管理指南
+(Documentation/translations/zh_CN/admin-guide/mm/index.rst)。
+
+
+.. toctree::
+   :maxdepth: 1
+
+   highmem
+
+该处剩余文档待原始文档有内容后翻译。
+
+
+遗留文档
+========
+
+这是一个关于Linux内存管理（MM）子系统内部的旧文档的集合，其中有不同层次的细节，
+包括注释和邮件列表的回复，用于阐述数据结构和算法的描述。它应该被很好地整合到上述
+结构化的文档中，如果它已经完成了它的使命，可以删除。
 
 .. toctree::
    :maxdepth: 1
@@ -25,7 +41,6 @@ TODO:待引用文档集被翻译完毕后请及时修改此处）
    balance
    damon/index
    free_page_reporting
-   highmem
    ksm
    frontswap
    hmm
-- 
2.27.0

