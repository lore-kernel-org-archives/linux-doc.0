Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C71FC4332F
	for <linux-doc@archiver.kernel.org>; Sat, 10 Dec 2022 03:26:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbiLJD0i (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Dec 2022 22:26:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229732AbiLJD0i (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Dec 2022 22:26:38 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B16B026492
        for <linux-doc@vger.kernel.org>; Fri,  9 Dec 2022 19:26:36 -0800 (PST)
Received: from loongson.cn (unknown [112.20.108.31])
        by gateway (Coremail) with SMTP id _____8Cxrutr_JNjPZgEAA--.10836S3;
        Sat, 10 Dec 2022 11:26:35 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.108.31])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8BxoOJq_JNjyPIpAA--.37251S3;
        Sat, 10 Dec 2022 11:26:35 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        bobwxc@email.cn, chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH v2 11/13] docs/zh_CN: Update the translation of ksm to 6.1-rc8
Date:   Sat, 10 Dec 2022 11:27:03 +0800
Message-Id: <4d11b3d7b7223c16b38ef913a6a6de108a0886d3.1670642548.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1670642548.git.siyanteng@loongson.cn>
References: <cover.1670642548.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxoOJq_JNjyPIpAA--.37251S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxurW7Jry3Kr4fGw45Cr4kZwb_yoWrJF4fpF
        9FkrWIgF47AF929Fy7Kr1DuF43trZ7Gw47Kw17taykXas5Ja92qr40kFyrJF1fZ34kA3yY
        qrWqvFs3CF9FywUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        b-8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84
        ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1U
        M2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zV
        CFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWrXVW3AwAv7VC2
        z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04
        k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC2
        0s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI
        0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv2
        0xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
        Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU
        0xZFpf9x07jxSdgUUUUU=
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Update to commit 21b7bdb504ae ("ksm: add profit monitoring
documentation")

commit 94bfe85bde18 ("mm/vmstat: add events for ksm cow")

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/admin-guide/mm/ksm.rst | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/translations/zh_CN/admin-guide/mm/ksm.rst b/Documentation/translations/zh_CN/admin-guide/mm/ksm.rst
index 4829156ef1ae..0029c4fd2201 100644
--- a/Documentation/translations/zh_CN/admin-guide/mm/ksm.rst
+++ b/Documentation/translations/zh_CN/admin-guide/mm/ksm.rst
@@ -146,3 +146,53 @@ stable_node_dups
 
 比值 ``pages_sharing/pages_shared`` 的最大值受限制于 ``max_page_sharing``
 的设定。要想增加该比值，则相应地要增加 ``max_page_sharing`` 的值。
+
+监测KSM的收益
+=============
+
+KSM可以通过合并相同的页面来节省内存，但也会消耗额外的内存，因为它需要生成一些rmap_items
+来保存每个扫描页面的简要rmap信息。其中有些页面可能会被合并，但有些页面在被检查几次
+后可能无法被合并，这些都是无益的内存消耗。
+
+1) 如何确定KSM在全系统范围内是节省内存还是消耗内存？这里有一个简单的近似计算方法供参考::
+
+       general_profit =~ pages_sharing * sizeof(page) - (all_rmap_items) *
+                         sizeof(rmap_item);
+
+   其中all_rmap_items可以通过对 ``pages_sharing`` 、 ``pages_shared`` 、 ``pages_unshared``
+   和 ``pages_volatile`` 的求和而轻松获得。
+
+2) 单一进程中KSM的收益也可以通过以下近似的计算得到::
+
+       process_profit =~ ksm_merging_pages * sizeof(page) -
+                         ksm_rmap_items * sizeof(rmap_item).
+
+   其中ksm_merging_pages显示在 ``/proc/<pid>/`` 目录下，而ksm_rmap_items
+   显示在 ``/proc/<pid>/ksm_stat`` 。
+
+从应用的角度来看， ``ksm_rmap_items`` 和 ``ksm_merging_pages`` 的高比例意
+味着不好的madvise-applied策略，所以开发者或管理员必须重新考虑如何改变madvis策
+略。举个例子供参考，一个页面的大小通常是4K，而rmap_item的大小在32位CPU架构上分
+别是32B，在64位CPU架构上是64B。所以如果 ``ksm_rmap_items/ksm_merging_pages``
+的比例在64位CPU上超过64，或者在32位CPU上超过128，那么应用程序的madvise策略应
+该被放弃，因为ksm收益大约为零或负值。
+
+监控KSM事件
+===========
+
+在/proc/vmstat中有一些计数器，可以用来监控KSM事件。KSM可能有助于节省内存，这是
+一种权衡，因为它可能会在KSM COW或复制中的交换上遭受延迟。这些事件可以帮助用户评估
+是否或如何使用KSM。例如，如果cow_ksm增加得太快，用户可以减少madvise(, , MADV_MERGEABLE)
+的范围。
+
+cow_ksm
+        在每次KSM页面触发写时拷贝（COW）时都会被递增，当用户试图写入KSM页面时，
+        我们必须做一个拷贝。
+
+ksm_swpin_copy
+        在换入时，每次KSM页被复制时都会被递增。请注意，KSM页在换入时可能会被复
+        制，因为do_swap_page()不能做所有的锁，而需要重组一个跨anon_vma的KSM页。
+
+--
+Izik Eidus,
+Hugh Dickins, 2009年11月17日。
-- 
2.31.1

