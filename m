Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E678C43460
	for <linux-doc@archiver.kernel.org>; Fri,  7 May 2021 10:06:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2CBFD60200
	for <linux-doc@archiver.kernel.org>; Fri,  7 May 2021 10:06:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235091AbhEGKHi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 7 May 2021 06:07:38 -0400
Received: from mail.loongson.cn ([114.242.206.163]:41554 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235363AbhEGKHg (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 7 May 2021 06:07:36 -0400
Received: from localhost.localdomain (unknown [112.3.197.94])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr+4cEZVgvScTAA--.12861S2;
        Fri, 07 May 2021 18:06:21 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net
Cc:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com, bobwxc@email.cn,
        siyanteng01@gmail.com, huangjianghui@uniontech.com
Subject: [PATCH v2 0/3] docs/zh_CN: add parisc Chinese documents
Date:   Fri,  7 May 2021 18:07:02 +0800
Message-Id: <cover.1620284974.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxr+4cEZVgvScTAA--.12861S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jr15WrWDKr1fXF4fXw1fZwb_yoWkArbE9a
        1kXrW0yr47ZF97KFW8GF15ZF409FW0gry8ZFn8ta98W3ykurWDXr1vqasYvay5XF43Ar15
        GFykXr1SgrnrWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbxxFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
        6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
        n2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
        0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFyl
        IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
        AFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_
        Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUoO
        J5UUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v1 -> v2:

* Some bad translations have been modified as suggested by Xiangcheng.Thank you for your review.
https://lore.kernel.org/linux-doc/cover.1619665430.git.siyanteng@loongson.cn/T/#t

* Update [PATCH 1/3].
Because zh_CN/inxdex.rst has been refactored by Xiangcheng Wu.

* Pick Xiangcheng Wu's review-by tag for [patch 1/3]

v1:

This set translates Documentation/parisc/* into Chinese.

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

