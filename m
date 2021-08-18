Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F9B1C4320E
	for <linux-doc@archiver.kernel.org>; Wed, 18 Aug 2021 08:32:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 211F660C3E
	for <linux-doc@archiver.kernel.org>; Wed, 18 Aug 2021 08:32:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238168AbhHRIdN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 18 Aug 2021 04:33:13 -0400
Received: from mail.loongson.cn ([114.242.206.163]:35710 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238801AbhHRIdM (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 18 Aug 2021 04:33:12 -0400
Received: from localhost.localdomain (unknown [112.20.110.91])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxv0OYxRxhUK4xAA--.877S5;
        Wed, 18 Aug 2021 16:32:30 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, chenfeiyang@loongson.cn,
        chris.chenfeiyang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH v3 3/6] docs/zh_CN: add core-api mm-api translation
Date:   Wed, 18 Aug 2021 16:32:18 +0800
Message-Id: <22e6c7ae2b02f8b4f98dfb0c800edb66624029c0.1629274856.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1629274856.git.siyanteng@loongson.cn>
References: <cover.1629274856.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxv0OYxRxhUK4xAA--.877S5
X-Coremail-Antispam: 1UD129KBjvJXoWxJF4rWF1xWr4DZrykXr4fXwb_yoW5AF48pF
        yqk34xG3WfKry7Crn7GrykWFyxWa1fWay7K3yxJwnIqFnxtFy5Jr4Dtry3K3s7Cr40kFZ5
        XF4SkrWUuryjy3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPC14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
        x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
        e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
        8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
        jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
        kIwI1lc2xSY4AK67AK6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4U
        MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67
        AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0
        cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
        80aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI
        43ZEXa7VUjtxhPUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate Documentation/core-api/mm-api.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 .../translations/zh_CN/core-api/index.rst     |   2 +-
 .../translations/zh_CN/core-api/mm-api.rst    | 110 ++++++++++++++++++
 2 files changed, 111 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/core-api/mm-api.rst

diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
index 9bc1dfeab98e..e5d2f4d5413c 100644
--- a/Documentation/translations/zh_CN/core-api/index.rst
+++ b/Documentation/translations/zh_CN/core-api/index.rst
@@ -101,6 +101,7 @@ Todolist:
 
    memory-allocation
    unaligned-memory-access
+   mm-api
 
 Todolist:
 
@@ -108,7 +109,6 @@ Todolist:
    dma-api-howto
    dma-attributes
    dma-isa-lpc
-   mm-api
    genalloc
    pin_user_pages
    boot-time-mm
diff --git a/Documentation/translations/zh_CN/core-api/mm-api.rst b/Documentation/translations/zh_CN/core-api/mm-api.rst
new file mode 100644
index 000000000000..52e23aa3a59b
--- /dev/null
+++ b/Documentation/translations/zh_CN/core-api/mm-api.rst
@@ -0,0 +1,110 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/core-api/mm-api.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+ 时奎亮<alexs@kernel.org>
+
+.. _cn_core-api_mm-api:
+
+============
+内存管理APIs
+============
+
+API（Application Programming Interface，应用程序接口）
+
+用户空间内存访问
+================
+
+该API在以下内核代码中:
+
+arch/x86/include/asm/uaccess.h
+
+arch/x86/lib/usercopy_32.c
+
+mm/gup.c
+
+.. _mm-api-gfp-flags:
+
+内存分配控制
+============
+
+该API在以下内核代码中:
+
+include/linux/gfp.h
+
+Slab缓存
+========
+
+此缓存非cpu片上缓存，请读者自行查阅资料。
+
+该API在以下内核代码中:
+
+include/linux/slab.h
+
+mm/slab.c
+
+mm/slab_common.c
+
+mm/util.c
+
+虚拟连续（内存页）映射
+======================
+
+该API在以下内核代码中:
+
+mm/vmalloc.c
+
+
+文件映射和页面缓存
+==================
+
+该API在以下内核代码中:
+
+mm/readahead.c
+
+mm/filemap.c
+
+mm/page-writeback.c
+
+mm/truncate.c
+
+include/linux/pagemap.h
+
+内存池
+======
+
+该API在以下内核代码中:
+
+mm/mempool.c
+
+DMA池
+=====
+
+DMA(Direct Memory Access，直接存储器访问)
+
+该API在以下内核代码中:
+
+mm/dmapool.c
+
+更多的内存管理函数
+==================
+
+该API在以下内核代码中:
+
+mm/memory.c
+
+mm/page_alloc.c
+
+mm/mempolicy.c
+
+include/linux/mm_types.h
+
+include/linux/mm.h
+
+include/linux/mmzone.h
-- 
2.27.0

