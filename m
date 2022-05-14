Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD6EBC433EF
	for <linux-doc@archiver.kernel.org>; Sat, 14 May 2022 08:50:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229606AbiENIuK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 14 May 2022 04:50:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229733AbiENIuJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 14 May 2022 04:50:09 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A66DD1082
        for <linux-doc@vger.kernel.org>; Sat, 14 May 2022 01:50:06 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.109.92])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Axutg5bX9iX2oVAA--.5166S2;
        Sat, 14 May 2022 16:50:02 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH v2 0/2] docs/zh_CN: add page_migration and vmalloced-kernel-stacks translation
Date:   Sat, 14 May 2022 16:51:27 +0800
Message-Id: <cover.1652517913.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Axutg5bX9iX2oVAA--.5166S2
X-Coremail-Antispam: 1UD129KBjvdXoWruFW8JrykAFW3AFWDXFy7Wrg_yoWxKFX_Zw
        4kJFWFyr9rtF9rKFWFkF4xXryakF4rKry8tFy5ta98W39rGrWDK34DX3Z09a98XrsrZry5
        GrWDtr1vyrnFgjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbcAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
        Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
        0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8
        ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
        1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij
        64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
        0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
        IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUOnmRUUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v2:
Resolving conflicts on next-20220513.

v1:
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

