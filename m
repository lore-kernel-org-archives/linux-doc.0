Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B4EFECAAD8
	for <linux-doc@archiver.kernel.org>; Fri, 23 Sep 2022 04:05:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232217AbiIWEFi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Sep 2022 00:05:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232262AbiIWEF1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Sep 2022 00:05:27 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7FA8BD69C9
        for <linux-doc@vger.kernel.org>; Thu, 22 Sep 2022 21:05:25 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.112.163])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8DxBOJ8MC1jJHkgAA--.56189S2;
        Fri, 23 Sep 2022 12:05:16 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, corbet@lwn.net
Cc:     wu.xiangcheng@linux.dev, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] docs/zh_CN: Fix build warning
Date:   Fri, 23 Sep 2022 12:04:19 +0800
Message-Id: <20220923040419.3787429-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxBOJ8MC1jJHkgAA--.56189S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XFyDuFy3ZryUKFyfGF17KFg_yoWkAFX_Zr
        s2gF4vyFsxJFyFga18AF1DGF1UAF1fKr48Z3WDt398Aw1UXrWqg3WqqwnavFyUGF4fur98
        urWkZrW5ZrsrXjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb2kFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
        Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
        0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
        jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
        1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8XwCF
        04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
        18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vI
        r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
        1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvE
        x4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUjoa0DUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Since commit 702f436ab07b ("docs/zh_CN: add dt changesets translation")
introduce a build warning:

Warning: Documentation/translations/zh_CN/devicetree/changesets.rst
references a file that doesn't exist:
Documentation/Devicetree/changesets.rst

Change the first letter of Devicetree to lowercase.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/translations/zh_CN/devicetree/changesets.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_CN/devicetree/changesets.rst b/Documentation/translations/zh_CN/devicetree/changesets.rst
index 2ace05f3c377..3df1b03c5695 100644
--- a/Documentation/translations/zh_CN/devicetree/changesets.rst
+++ b/Documentation/translations/zh_CN/devicetree/changesets.rst
@@ -1,7 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: Documentation/Devicetree/changesets.rst
+:Original: Documentation/devicetree/changesets.rst
 
 :翻译:
 
-- 
2.31.1

