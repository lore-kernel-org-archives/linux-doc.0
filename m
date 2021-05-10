Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F05C43460
	for <linux-doc@archiver.kernel.org>; Mon, 10 May 2021 02:18:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D835961155
	for <linux-doc@archiver.kernel.org>; Mon, 10 May 2021 02:18:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230130AbhEJCTa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 9 May 2021 22:19:30 -0400
Received: from mail.loongson.cn ([114.242.206.163]:38654 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230127AbhEJCT1 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 9 May 2021 22:19:27 -0400
Received: from localhost.localdomain (unknown [112.3.197.94])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxz+_ll5hgKUsUAA--.16885S2;
        Mon, 10 May 2021 10:18:15 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, bobwxc@email.cn, siyanteng01@gmail.com,
        huangjianghui@uniontech.com
Subject: [PATCH v3 0/3] docs/zh_CN: add parisc Chinese documents
Date:   Mon, 10 May 2021 10:18:55 +0800
Message-Id: <cover.1620612066.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxz+_ll5hgKUsUAA--.16885S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZF1rtF13Cw13GF43tryDGFg_yoWkKrXE9a
        1kJFW0yr47ZF97KFW8CF15ZF40kFW0gry8ZFn8ta98W395urWDXr1vqasY9a45XF43Ar15
        GFWkXr4fWrnrWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb3AFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
        Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
        1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
        628vn2kIc2xKxwCY02Avz4vE14v_Gr1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
        v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
        1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
        AIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyU
        JwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
        nIWIevJa73UjIFyTuYvjfUO_MaUUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v2 -> v3

* Pick Xiangcheng Wu's review-by tag for [patch 2-3/3]

v1 -> v2:

* Some bad translations have been modified as suggested by Xiangcheng.Thank you for your review.
    https://lore.kernel.org/linux-doc/cover.1619665430.git.siyanteng@loongson.cn/T/#t

* Update [PATCH 1/3].
    Because zh_CN/inxdex.rst has been refactored by Xiangcheng Wu.

* Pick Xiangcheng Wu's review-by tag for [patch 1/3]

v1:

* This set translates Documentation/parisc/* into Chinese.

Yanteng Si (3):
  docs/zh_CN: add parisc index translation
  docs/zh_CN: add parisc debugging.rst translation
  docs/zh_CN: add parisc registers.rst translation

 Documentation/translations/zh_CN/index.rst    |   2 +-
 .../translations/zh_CN/parisc/debugging.rst   |  42 +++++
 .../translations/zh_CN/parisc/index.rst       |  28 ++++
 .../translations/zh_CN/parisc/registers.rst   | 153 ++++++++++++++++++
 4 files changed, 224 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/parisc/debugging.rst
 create mode 100644 Documentation/translations/zh_CN/parisc/index.rst
 create mode 100644 Documentation/translations/zh_CN/parisc/registers.rst

-- 
2.27.0

