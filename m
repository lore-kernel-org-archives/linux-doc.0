Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FF92C43334
	for <linux-doc@archiver.kernel.org>; Mon, 25 Jul 2022 09:23:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbiGYJXl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 25 Jul 2022 05:23:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231189AbiGYJXk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Jul 2022 05:23:40 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8A9EFBE0C
        for <linux-doc@vger.kernel.org>; Mon, 25 Jul 2022 02:23:39 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.110.136])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9BxI9AUYd5iLF02AA--.13233S2;
        Mon, 25 Jul 2022 17:23:33 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        zhoubinbin@loongson.cn, yizhou.tang@shopee.com,
        wanjiabing@vivo.com, leoyang.li@nxp.com, src.res@email.cn
Subject: [PATCH 5/8] Docs/zh_CN: Update the translation of usage to 5.19-rc8
Date:   Mon, 25 Jul 2022 17:24:11 +0800
Message-Id: <59c1792d8a9cdf8fd6a83301efa955de4657346b.1658740151.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1658740151.git.siyanteng@loongson.cn>
References: <cover.1658740151.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9BxI9AUYd5iLF02AA--.13233S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJr15tFyDCr18Kw1kur43Awb_yoW8JFW3pa
        s2kryIg3W7AFn09r4UWFy3Aa17Za1kCws8JFZY9an3Jrn5tw4vqFW2gF15tr9Ivr1fJa4x
        ZFZ5K34kuFy2yFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUB014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
        xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
        8cxan2IY04v7MxkIecxEwVAFwVW8uwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
        WUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
        Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
        IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK
        8VAvwI8IcIk0rVW8JVW3JwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
        0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU09NVDUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Update to commit b57e39a743e4 ("Docs/admin-guide
/damon/sysfs: document 'LRU_DEPRIO' scheme action")

0bcba960b1fa ("Docs/admin-guide/damon/sysfs: document 'LRU_PRIO' scheme action")

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/translations/zh_CN/admin-guide/mm/damon/usage.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/translations/zh_CN/admin-guide/mm/damon/usage.rst b/Documentation/translations/zh_CN/admin-guide/mm/damon/usage.rst
index cd41ada4fdad..aeae2ab65dd8 100644
--- a/Documentation/translations/zh_CN/admin-guide/mm/damon/usage.rst
+++ b/Documentation/translations/zh_CN/admin-guide/mm/damon/usage.rst
@@ -210,6 +210,8 @@ schemes/<N>/
  - ``pageout``: 为具有 ``MADV_PAGEOUT`` 的区域调用 ``madvise()`` 。
  - ``hugepage``: 为带有 ``MADV_HUGEPAGE`` 的区域调用 ``madvise()`` 。
  - ``nohugepage``: 为带有 ``MADV_NOHUGEPAGE`` 的区域调用 ``madvise()``。
+ - ``lru_prio``: 在其LRU列表上对区域进行优先排序。
+ - ``lru_deprio``: 对区域的LRU列表进行降低优先处理。
  - ``stat``: 什么都不做，只计算统计数据
 
 schemes/<N>/access_pattern/
-- 
2.31.1

