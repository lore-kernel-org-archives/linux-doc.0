Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3F31ECAAD3
	for <linux-doc@archiver.kernel.org>; Thu,  1 Sep 2022 11:16:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233998AbiIALQZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Sep 2022 07:16:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234002AbiIALQY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Sep 2022 07:16:24 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4AD7A12693D
        for <linux-doc@vger.kernel.org>; Thu,  1 Sep 2022 04:16:22 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.110.237])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Bx32t4lBBjyrkOAA--.58656S4;
        Thu, 01 Sep 2022 19:16:15 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: [PATCH v1 2/5] docs/zh_CN: add dt changesets translation
Date:   Thu,  1 Sep 2022 19:15:43 +0800
Message-Id: <967ae2411a8ed7a5b130dd81cb8abe31a1356c74.1662022757.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1662022757.git.siyanteng@loongson.cn>
References: <cover.1662022757.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bx32t4lBBjyrkOAA--.58656S4
X-Coremail-Antispam: 1UD129KBjvJXoWxXFyftr1DCFWkWFW7KF1ftFb_yoW5Aw17pr
        yIkas3Ka1Fvr47WayxKF17Gr42yF1xCw40kF92yw4Sgr1UJ3ySvw4Ut34qgFy3Wr1xAFyY
        gF4Fkr95ZFW0yw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBS14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_Gw4l42xK82
        IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
        0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMI
        IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF
        0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
        Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUjNtxDUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate .../devicetree/changesets.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../zh_CN/devicetree/changesets.rst           | 37 +++++++++++++++++++
 .../translations/zh_CN/devicetree/index.rst   |  3 +-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/devicetree/changesets.rst

diff --git a/Documentation/translations/zh_CN/devicetree/changesets.rst b/Documentation/translations/zh_CN/devicetree/changesets.rst
new file mode 100644
index 000000000000..88b2075f1ea0
--- /dev/null
+++ b/Documentation/translations/zh_CN/devicetree/changesets.rst
@@ -0,0 +1,37 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/Devicetree/changesets.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+
+============
+设备树变更集
+============
+
+设备树变更集是一种方法，它允许人们以这样一种方式在实时树中应用变化，即要么应用全部的
+变化，要么不应用。如果在应用变更集的过程中发生错误，那么树将被回滚到之前的状态。一个
+变更集也可以在应用后被删除。
+
+当一个变更集被应用时，所有的改变在发出OF_RECONFIG通知器之前被一次性应用到树上。这是
+为了让接收者在收到通知时看到一个完整的、一致的树的状态。
+
+一个变化集的顺序如下。
+
+1. of_changeset_init() - 初始化一个变更集。
+
+2. 一些DT树变化的调用，of_changeset_attach_node(), of_changeset_detach_node(),
+   of_changeset_add_property(), of_changeset_remove_property,
+   of_changeset_update_property()来准备一组变更。此时不会对活动树做任何变更。所有
+   的变更操作都记录在of_changeset的 `entries` 列表中。
+
+3. of_changeset_apply() - 将变更应用到树上。要么整个变更集被应用，要么如果有错误，
+   树会被恢复到之前的状态。核心通过锁确保正确的顺序。如果需要的话，可以使用一个解锁的
+   __of_changeset_apply版本。
+
+如果一个成功应用的变更集需要被删除，可以用of_changeset_revert()来完成。
diff --git a/Documentation/translations/zh_CN/devicetree/index.rst b/Documentation/translations/zh_CN/devicetree/index.rst
index 3fc355fe0037..e9aff2ccc579 100644
--- a/Documentation/translations/zh_CN/devicetree/index.rst
+++ b/Documentation/translations/zh_CN/devicetree/index.rst
@@ -34,9 +34,10 @@ Devicetree Overlays
 .. toctree::
    :maxdepth: 1
 
+   changesets
+
 Todolist:
 
-*   changesets
 *   dynamic-resolution-notes
 *   overlay-notes
 
-- 
2.31.1

