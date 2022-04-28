Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C87B5C433EF
	for <linux-doc@archiver.kernel.org>; Thu, 28 Apr 2022 09:46:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230325AbiD1Jtl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 28 Apr 2022 05:49:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243041AbiD1JXC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Apr 2022 05:23:02 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 522876D973
        for <linux-doc@vger.kernel.org>; Thu, 28 Apr 2022 02:19:47 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.112.130])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP9ssXGpiNWkBAA--.7498S2;
        Thu, 28 Apr 2022 17:19:41 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH 0/2] docs/zh_CN: add page_migration and vmalloced-kernel-stacks translation
Date:   Thu, 28 Apr 2022 17:20:19 +0800
Message-Id: <cover.1651137289.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxP9ssXGpiNWkBAA--.7498S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GrWxXF18Cr45AFWfWry5XFb_yoWxCFX_Zw
        4kJFWYyrnrtF9rKFWFkF4xXryakF4rKry8JFy5t398Wa9rGrWDK34DX3Z09a98XrsrZry5
        GrWDtr1vkrn2gjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbcxFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
        Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_GFWl
        42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
        WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAK
        I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
        4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
        0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbgyCJUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate .../vm/page_migration.rst and .../vm/vmalloced-kernel-stacks.rst into Chinese.

Yanteng Si (2):
  docs/zh_CN: add vm page_migration translation
  docs/zh_CN: add vm vmalloced-kernel-stacks translation

 Documentation/translations/zh_CN/vm/index.rst |   4 +-
 .../translations/zh_CN/vm/page_migration.rst  | 229 ++++++++++++++++++
 .../zh_CN/vm/vmalloced-kernel-stacks.rst      | 133 ++++++++++
 3 files changed, 364 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/vm/page_migration.rst
 create mode 100644 Documentation/translations/zh_CN/vm/vmalloced-kernel-stacks.rst

-- 
2.27.0

