Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB94DC433ED
	for <linux-doc@archiver.kernel.org>; Wed, 12 May 2021 08:20:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB03B613E9
	for <linux-doc@archiver.kernel.org>; Wed, 12 May 2021 08:20:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbhELIVe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 12 May 2021 04:21:34 -0400
Received: from mail.loongson.cn ([114.242.206.163]:50686 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230181AbhELIVd (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 12 May 2021 04:21:33 -0400
Received: from localhost.localdomain (unknown [112.3.197.94])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP+7Aj5tgJWQVAA--.17234S2;
        Wed, 12 May 2021 16:20:17 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, bobwxc@email.cn, siyanteng01@gmail.com,
        huangjianghui@uniontech.com
Subject: [PATCH v4 0/3] docs/zh_CN: add parisc Chinese documents
Date:   Wed, 12 May 2021 16:20:56 +0800
Message-Id: <cover.1620805100.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxP+7Aj5tgJWQVAA--.17234S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw1UZw13Ar1fCw47ZFW5ZFb_yoW8Wr4Upa
        s3Kr1fGa18Aryakr4xCr47Xry7C3WfG3y5GFW2qwnaqrs8Kr95tr15K39I9a9xWry8ZF4U
        Xr4fKry8u34jyrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvF14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
        Y2ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
        xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43
        MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
        0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AK
        xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj
        fUoOJ5UUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v3 -> v4:

fix detailed description of the contents of the patch 1/3 and 2/3.

diff:

-This ptch translates Documentation/parisc/index.rst into Chinese.
+This patch translates Documentation/parisc/index.rst into Chinese.

-This translates Documentation/parisc/debugging.rst into Chinese.
+This patch translates Documentation/parisc/debugging.rst into Chinese.

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

