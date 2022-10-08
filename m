Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19735C433FE
	for <linux-doc@archiver.kernel.org>; Sat,  8 Oct 2022 09:43:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbiJHJnN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 8 Oct 2022 05:43:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229776AbiJHJnM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 8 Oct 2022 05:43:12 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6009251A02
        for <linux-doc@vger.kernel.org>; Sat,  8 Oct 2022 02:43:10 -0700 (PDT)
Received: from localhost.localdomain (unknown [223.106.24.89])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8DxvmskRkFjBmQoAA--.5340S2;
        Sat, 08 Oct 2022 17:43:01 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, corbet@lwn.net
Cc:     wu.xiangcheng@linux.dev, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com, Yanteng Si <siyanteng@loongson.cn>,
        kernel test robot <lkp@intel.com>,
        Wu XiangCheng <bobwxc@email.cn>
Subject: [PATCH v2] docs/zh_CN: Fix build warning
Date:   Sat,  8 Oct 2022 17:41:39 +0800
Message-Id: <20221008094139.314151-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxvmskRkFjBmQoAA--.5340S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXFW5tFW7Kr4UXr17ZryDAwb_yoWrJF1kpF
        92krWxW3WfCw17W3yxGF17Jr47JFyxua15GF9rtwnYqF1kJryrtrZFq34qga4fJr1xuFW5
        XFWfKFWrWry0yw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkq14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r4f
        MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
        0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
        wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
        W8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
        cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjwSdDUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Since a patch set in my translation devicetree
introduce some build warnings:

Warning: Documentation/translations/zh_CN/devicetree/changesets.rst
references a file that doesn't exist:
Documentation/Devicetree/changesets.rst
...

Change the first letter of Devicetree to lowercase.

Fixes: 9485acfded20 ("docs/zh_CN: add dt kernel-api translation")
Fixes: f773455ce59d ("docs/zh_CN: add dt overlay-notes translation")
Fixes: 5e38432db8f3 ("docs/zh_CN: add dt dynamic-resolution-notes translation")
Fixes: 330f5a300548 ("docs/zh_CN: add dt changesets translation")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
---
v2:

* Fix overlay-notes, dynamic-resolution-notes and kernel-api.
* Modify commit message.
* Add Fix tag.

 Documentation/translations/zh_CN/devicetree/changesets.rst      | 2 +-
 .../translations/zh_CN/devicetree/dynamic-resolution-notes.rst  | 2 +-
 Documentation/translations/zh_CN/devicetree/kernel-api.rst      | 2 +-
 Documentation/translations/zh_CN/devicetree/overlay-notes.rst   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

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
 
diff --git a/Documentation/translations/zh_CN/devicetree/dynamic-resolution-notes.rst b/Documentation/translations/zh_CN/devicetree/dynamic-resolution-notes.rst
index 115190341305..6dfd946d7093 100644
--- a/Documentation/translations/zh_CN/devicetree/dynamic-resolution-notes.rst
+++ b/Documentation/translations/zh_CN/devicetree/dynamic-resolution-notes.rst
@@ -1,7 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: Documentation/Devicetree/dynamic-resolution-notes.rst
+:Original: Documentation/devicetree/dynamic-resolution-notes.rst
 
 :翻译:
 
diff --git a/Documentation/translations/zh_CN/devicetree/kernel-api.rst b/Documentation/translations/zh_CN/devicetree/kernel-api.rst
index 6aa3b685494e..2fb729368b40 100644
--- a/Documentation/translations/zh_CN/devicetree/kernel-api.rst
+++ b/Documentation/translations/zh_CN/devicetree/kernel-api.rst
@@ -1,7 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: Documentation/Devicetree/kernel-api.rst
+:Original: Documentation/devicetree/kernel-api.rst
 
 :翻译:
 
diff --git a/Documentation/translations/zh_CN/devicetree/overlay-notes.rst b/Documentation/translations/zh_CN/devicetree/overlay-notes.rst
index 1bd482cb0a1b..43e3c0bc5a9f 100644
--- a/Documentation/translations/zh_CN/devicetree/overlay-notes.rst
+++ b/Documentation/translations/zh_CN/devicetree/overlay-notes.rst
@@ -1,7 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: Documentation/Devicetree/overlay-notes.rst
+:Original: Documentation/devicetree/overlay-notes.rst
 
 :翻译:
 
-- 
2.31.1

