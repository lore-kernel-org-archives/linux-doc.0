Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A98F8C43334
	for <linux-doc@archiver.kernel.org>; Tue,  7 Jun 2022 07:10:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237498AbiFGHKM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 7 Jun 2022 03:10:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237512AbiFGHKI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 7 Jun 2022 03:10:08 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E85C78720F
        for <linux-doc@vger.kernel.org>; Tue,  7 Jun 2022 00:10:06 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.108.214])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx70_I+Z5i4BcdAA--.41496S2;
        Tue, 07 Jun 2022 15:10:01 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH v4 0/2] add page_migration and vmalloced-kernel-stacks translation
Date:   Tue,  7 Jun 2022 15:11:41 +0800
Message-Id: <cover.1654585011.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx70_I+Z5i4BcdAA--.41496S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jw4kZr15Ww1fuF45CF15urg_yoWfGrb_Zw
        4kJFWFkrnFyFyDtFWFkF4xXryakFWrGrW0yFy5ta98Ja9rGrZrK34DX3Z09as0qrsrZry5
        GrWDtr1ktry2gjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbcxFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
        Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_GF4l
        42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
        WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAK
        I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
        4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
        0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbhiSPUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v4:
Modify some words under Xiangcheng's advice:
×true× -> *true*
虚拟机  -> VM

v3:
Modify some words under Xiangcheng's advice.

v2:
Resolving conflicts on next-20220513.

v1:
Translate .../vm/page_migration.rst and .../vm/vmalloced-kernel-stacks.rst into Chinese.

Yanteng Si (2):
  docs/zh_CN: add vm page_migration translation
  docs/zh_CN: add vm vmalloced-kernel-stacks translation

 Documentation/translations/zh_CN/vm/index.rst |   4 +-
 .../translations/zh_CN/vm/page_migration.rst  | 228 ++++++++++++++++++
 .../zh_CN/vm/vmalloced-kernel-stacks.rst      | 133 ++++++++++
 3 files changed, 363 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/vm/page_migration.rst
 create mode 100644 Documentation/translations/zh_CN/vm/vmalloced-kernel-stacks.rst

-- 
2.27.0

