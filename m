Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D8FBC11F68
	for <linux-doc@archiver.kernel.org>; Fri,  9 Jul 2021 02:57:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 06D31610CC
	for <linux-doc@archiver.kernel.org>; Fri,  9 Jul 2021 02:57:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbhGIDAR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 8 Jul 2021 23:00:17 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45066 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230406AbhGIDAP (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 8 Jul 2021 23:00:15 -0400
Received: from localhost.localdomain (unknown [112.20.109.145])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9BxUOIQu+dg_xgeAA--.15063S5;
        Fri, 09 Jul 2021 10:57:25 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH v2 3/6] docs/zh_CN: add core-api mm-api translation
Date:   Fri,  9 Jul 2021 10:57:44 +0800
Message-Id: <0686399da92a9e2e15b0850e0f5837d905a98611.1625795862.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1625795862.git.siyanteng@loongson.cn>
References: <cover.1625795862.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9BxUOIQu+dg_xgeAA--.15063S5
X-Coremail-Antispam: 1UD129KBjvJXoWxJF4rWF1xWr4DZrykXr4fXwb_yoW5AF48pF
        yqk34xG3WfKry7Crn7GrykWFyxWa1fWay7K3yxJwnIqFnxtFy5Jr4Dtry3K3s7Cr40kFZ5
        XF4SkrWUuryjy3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPK14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
        x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0D
        M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
        v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
        F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2
        IY04v7MxkIecxEwVAFwVW8JwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8
        JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1V
        AFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4
        A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU
        0xZFpf9x0JUHrWrUUUUU=
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

