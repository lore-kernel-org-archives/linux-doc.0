Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A57C49361
	for <linux-doc@archiver.kernel.org>; Sat, 19 Jun 2021 06:28:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E9884611B0
	for <linux-doc@archiver.kernel.org>; Sat, 19 Jun 2021 06:28:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232515AbhFSGa7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 19 Jun 2021 02:30:59 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45276 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232246AbhFSGa6 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 19 Jun 2021 02:30:58 -0400
Received: from localhost.localdomain (unknown [223.106.58.132])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr0KVjs1gWBcUAA--.23753S2;
        Sat, 19 Jun 2021 14:28:39 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH v3 0/2] Translate core api cpu_hotplug
Date:   Sat, 19 Jun 2021 14:29:08 +0800
Message-Id: <cover.1624083828.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxr0KVjs1gWBcUAA--.23753S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Xw1rKF1xKF1UZFy3JF4UCFg_yoW3KFc_AF
        1kXFZ2ywn2yFn7tFW5Wr13JFWYvw4Y9rW0k3W8tayqyrZrGrWDu3sFq3sY9w15Wws8CrW7
        KFZ3C34fXrnFgjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbxkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
        Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
        0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
        Y2ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
        xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43
        MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
        0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v2
        6r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUb
        XdbUUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v3:

* pick Xiangcheng's Reviewed-by tag.
* modify two strings.

v2:

PATCH 1/2 fix a typo.

PATCH 2/2  Modified some words under Xiangcheng's advices;
add 校译者(proofreading) sign.If you don't want me to do this, please let me know.

v1:

PATCH 1/2 Modify the layout of the origin document and remove unnecessary symbols.
PATCH 2/2 Translate Documentation/core-api/cpu_hotplug.rst into Chinese.

Yanteng Si (2):
  docs/core-api: Modify document layout
  docs/zh_CN: add core api cpu_hotplug translation

 Documentation/core-api/cpu_hotplug.rst        |  38 +-
 .../zh_CN/core-api/cpu_hotplug.rst            | 348 ++++++++++++++++++
 .../translations/zh_CN/core-api/index.rst     |   2 +-
 3 files changed, 373 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/core-api/cpu_hotplug.rst

-- 
2.27.0

