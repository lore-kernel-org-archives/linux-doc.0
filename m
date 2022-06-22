Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAFBEC43334
	for <linux-doc@archiver.kernel.org>; Wed, 22 Jun 2022 10:19:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242248AbiFVKTf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Jun 2022 06:19:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243300AbiFVKTP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Jun 2022 06:19:15 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D49373B3DA
        for <linux-doc@vger.kernel.org>; Wed, 22 Jun 2022 03:19:05 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.108.207])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Cxr+aQ7LJiWBFUAA--.27260S7;
        Wed, 22 Jun 2022 18:19:04 +0800 (CST)
From:   Binbin Zhou <zhoubinbin@loongson.cn>
To:     alexs@kernel.org, siyanteng@loongson.cn
Cc:     corbet@lwn.net, chenhuacai@loongson.cn, bobwxc@email.cn,
        linux-doc@vger.kernel.org, Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 5/9] docs/zh_CN: core-api: Update the translation of mm-api.rst to 5.19-rc3
Date:   Wed, 22 Jun 2022 18:18:51 +0800
Message-Id: <0bd7b03a5d38dd1599715343360bef4289b7c0fb.1655863769.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1655863769.git.zhoubinbin@loongson.cn>
References: <cover.1655863769.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Cxr+aQ7LJiWBFUAA--.27260S7
X-Coremail-Antispam: 1UD129KBjvJXoW7Ar43Xr1xtF4fZFW5uw4Durg_yoW8XF4kpF
        97Cw1fJF4xAry5Crn7WryDAF13WFZ7Way2gay2g3s8ZF13ta1kKrWDtryfKryxAr40vFW8
        XrsxKFZ8uFyjyrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPG14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
        4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
        3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
        IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
        M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_Gw1l42
        xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1l
        x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
        v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IY
        x2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
        Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIF
        yTuYvjfUriihUUUUU
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Synchronous translation from the following commits(Latest in front):

[1]: commit 84dacdbd5352("mm: document and polish read-ahead code")

[2]: commit 2f52578f9c64("mm/util: Add folio_mapping() and
     folio_file_mapping()")

[3]: commit 889a3747b3b7("mm/lru: Add folio LRU functions")

[4]: commit c24016ac3a62("mm: Add folio reference count functions")

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../translations/zh_CN/core-api/mm-api.rst    | 23 ++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_CN/core-api/mm-api.rst b/Documentation/translations/zh_CN/core-api/mm-api.rst
index 0ea43dc67953..a732b0eebf16 100644
--- a/Documentation/translations/zh_CN/core-api/mm-api.rst
+++ b/Documentation/translations/zh_CN/core-api/mm-api.rst
@@ -5,6 +5,7 @@
 :翻译:
 
  司延腾 Yanteng Si <siyanteng@loongson.cn>
+ 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
 
 :校译:
 
@@ -66,12 +67,24 @@ mm/vmalloc.c
 
 该API在以下内核代码中:
 
-mm/readahead.c
+文件映射
+--------
 
 mm/filemap.c
 
+预读
+----
+
+mm/readahead.c
+
+回写
+----
+
 mm/page-writeback.c
 
+截断
+----
+
 mm/truncate.c
 
 include/linux/pagemap.h
@@ -105,6 +118,14 @@ mm/mempolicy.c
 
 include/linux/mm_types.h
 
+include/linux/mm_inline.h
+
+include/linux/page-flags.h
+
 include/linux/mm.h
 
+include/linux/page_ref.h
+
 include/linux/mmzone.h
+
+mm/util.c
-- 
2.20.1

