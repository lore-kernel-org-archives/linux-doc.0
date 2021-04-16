Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D26CC433ED
	for <linux-doc@archiver.kernel.org>; Fri, 16 Apr 2021 03:20:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 21936611AC
	for <linux-doc@archiver.kernel.org>; Fri, 16 Apr 2021 03:20:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238079AbhDPDUi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 15 Apr 2021 23:20:38 -0400
Received: from mail.loongson.cn ([114.242.206.163]:47404 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238060AbhDPDUi (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 15 Apr 2021 23:20:38 -0400
Received: from localhost.localdomain (unknown [223.106.57.161])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxycldAnlg648IAA--.15727S8;
        Fri, 16 Apr 2021 11:20:08 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com,
        Wu XiangCheng <bobwxc@email.cn>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v6 06/11] docs/zh_CN: add core-api index.rst translation
Date:   Fri, 16 Apr 2021 11:20:42 +0800
Message-Id: <20210416032047.2752858-7-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210416032047.2752858-1-siyanteng@loongson.cn>
References: <20210416032047.2752858-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9CxycldAnlg648IAA--.15727S8
X-Coremail-Antispam: 1UD129KBjvJXoWxCF1fCr1fXrWDKry3KrWfZrb_yoW5Ww4DpF
        nF9ryxKa15Xry7Ar1fGr1UWr18Ga97uFsrK3yxXwn0vFn8XFWFyr45t3sIq34xGrWvyFyr
        ZF43trWjyry29r7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
        4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE
        3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
        x0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8
        JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2
        ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
        67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MI
        IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E
        14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr
        0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUQ
        SdkUUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch translates Documentation/core-api/index.rst into Chinese.
add Documentation/translations/zh_CN/core-api/irq/* to zh_CN/core-api/index.rst.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
---
 .../translations/zh_CN/core-api/index.rst     | 126 ++++++++++++++++++
 1 file changed, 126 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/core-api/index.rst

diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
new file mode 100644
index 000000000000..f1fa71e45c77
--- /dev/null
+++ b/Documentation/translations/zh_CN/core-api/index.rst
@@ -0,0 +1,126 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: :doc:`../../../core-api/irq/index`
+:Translator: Yanteng Si <siyanteng@loongson.cn>
+
+.. _cn_core-api_index.rst:
+
+
+===========
+核心API文档
+===========
+
+这是核心内核API手册的首页。 非常感谢为本手册转换(和编写!)的文档!
+
+核心实用程序
+============
+
+本节包含通用的和“核心中的核心”文档。 第一部分是 docbook 时期遗留下
+来的大量 kerneldoc 信息；有朝一日，若有人有动力的话，应当把它们拆分
+出来。
+
+Todolist:
+
+   kernel-api
+   workqueue
+   printk-basics
+   printk-formats
+   symbol-namespaces
+
+数据结构和低级实用程序
+======================
+
+在整个内核中使用的函数库。
+
+Todolist:
+
+   kobject
+   kref
+   assoc_array
+   xarray
+   idr
+   circular-buffers
+   rbtree
+   generic-radix-tree
+   packing
+   bus-virt-phys-mapping
+   this_cpu_ops
+   timekeeping
+   errseq
+
+并发原语
+========
+
+Linux如何让一切同时发生。 详情请参阅
+:doc:`/locking/index`
+
+.. toctree::
+   :maxdepth: 1
+
+   irq/index
+
+Todolist:
+
+   refcount-vs-atomic
+   local_ops
+   padata
+   ../RCU/index
+
+低级硬件管理
+============
+
+缓存管理，CPU热插拔管理等。
+
+Todolist:
+
+   cachetlb
+   cpu_hotplug
+   memory-hotplug
+   genericirq
+   protection-keys
+
+
+内存管理
+========
+
+如何在内核中分配和使用内存。请注意，在
+:doc:`/vm/index` 中有更多的内存管理文档。
+
+Todolist:
+
+   memory-allocation
+   unaligned-memory-access
+   dma-api
+   dma-api-howto
+   dma-attributes
+   dma-isa-lpc
+   mm-api
+   genalloc
+   pin_user_pages
+   boot-time-mm
+   gfp_mask-from-fs-io
+
+内核调试的接口
+==============
+
+Todolist:
+
+   debug-objects
+   tracepoint
+   debugging-via-ohci1394
+
+其它文档
+========
+
+不适合放在其它地方或尚未归类的文件；
+
+Todolist:
+
+   librs
+
+.. only:: subproject and html
+
+   Indices
+   =======
+
+   * :ref:`genindex`
-- 
2.27.0

