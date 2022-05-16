Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF89C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 16 May 2022 15:55:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233622AbiEPPzU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 16 May 2022 11:55:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbiEPPzT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 May 2022 11:55:19 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 74D47CE09
        for <linux-doc@vger.kernel.org>; Mon, 16 May 2022 08:55:17 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.109.92])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Axqtjfc4JiGm4YAA--.8209S2;
        Mon, 16 May 2022 23:55:11 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH v3 0/2] docs/zh_CN: add vm page_migration translation
Date:   Mon, 16 May 2022 23:56:30 +0800
Message-Id: <cover.1652713779.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Axqtjfc4JiGm4YAA--.8209S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKF15Cry8uFW7Wr43ZFW5Jrb_yoW3Wwc_Zw
        4kJFWFkrnrtF9rtFWFkF4xXryakF4rKrW8tFy5ta98Wa9rGrWDK34DX3Z09a98XrsrZry5
        GrWDtrnYyr12gjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb2AFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
        Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
        1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
        cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
        ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6ryrMxAI
        w28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
        4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxG
        rwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8Jw
        CI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
        6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JU3Ma8UUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

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

