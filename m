Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70EA4C433B4
	for <linux-doc@archiver.kernel.org>; Sun, 25 Apr 2021 03:35:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 48AEB61580
	for <linux-doc@archiver.kernel.org>; Sun, 25 Apr 2021 03:35:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230452AbhDYDfx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 24 Apr 2021 23:35:53 -0400
Received: from mail.loongson.cn ([114.242.206.163]:38570 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229514AbhDYDfw (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 24 Apr 2021 23:35:52 -0400
Received: from localhost.localdomain (unknown [112.3.197.94])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxHchf44Rg1ZMNAA--.595S2;
        Sun, 25 Apr 2021 11:34:57 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net
Cc:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com, bobwxc@email.cn,
        siyanteng01@gmail.com, huangjianghui@uniontech.com,
        willy@infradead.org
Subject: [PATCH v2 0/3] add three core api docs
Date:   Sun, 25 Apr 2021 11:35:38 +0800
Message-Id: <cover.1619317151.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxHchf44Rg1ZMNAA--.595S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAFyUtry8GFWDuF15CFW7Jwb_yoW5GF48pF
        y7Kryrt3ZxGF1Uuwn7W34kZr1Uua48uws8Ka9rXwn5tan8KrW0yw4jgF9Iqasaqr1vqF1F
        vF43KF9093yjyrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvI14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
        WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
        Yx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
        WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7Cj
        xVA2Y2ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
        Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q
        6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
        kF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE
        14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf
        9x0JUdHUDUUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v1 -> v2:

* Some bad translations have been modified as suggested by Xiangcheng.Thank you for your review

  https://lore.kernel.org/linux-doc/cover.1618836460.git.siyanteng@loongson.cn/T/#t

* As Matthew and Xiangcheng suggested:

  call kernel-doc to generate related docs (0001 and 0002).Thanks!

  I tested it on other computers (at least three) with no problem,
  But on my computers it prints 1000+ warnings, I tried to find the
  cause in the past few days but no clue.
  So, the two patches may print as follows:(maybe your computer won't print anything)

  linux-next/Documentation/translations/zh_CN/core-api/kernel-api.rst:235: WARNING: Duplicate C declaration, also defined at core-api/kernel-api:235.
  Declaration is '.. c:None:: struct list_head *prev'.
  linux-next/Documentation/translations/zh_CN/core-api/kernel-api.rst:235: WARNING: Duplicate C declaration, also defined at core-api/kernel-api:235.
  Declaration is '.. c:None:: struct list_head *next'.
  linux-next/Documentation/translations/zh_CN/core-api/kernel-api.rst:235: WARNING: Duplicate C declaration, also defined at core-api/kernel-api:235.
  Declaration is '.. c:None:: void (*sync)(void)'.
  linux-next/Documentation/translations/zh_CN/core-api/kernel-api.rst:283: WARNING: Duplicate C declaration, also defined at core-api/kernel-api:283.
  Declaration is '.. c:function:: void list_splice_init_rcu(struct list_head *list, struct list_head *head, void (*sync)(void))'.
  linux-next/Documentation/translations/zh_CN/core-api/kernel-api.rst:283: WARNING: Duplicate C declaration, also defined at core-api/kernel-api:283.
  Declaration is '.. c:None:: struct list_head *list'.
  ...

  I'm a little skeptical now that something's wrong with my computer.

Yanteng Si (3):
  docs/zh_CN: add core-api kernel-api.rst translation
  docs/zh_CN: add core-api printk-basics.rst translation
  docs/zh_CN: add core-api printk-formats.rst translation

 .../translations/zh_CN/core-api/index.rst     |   7 +-
 .../zh_CN/core-api/kernel-api.rst             | 385 ++++++++++++
 .../zh_CN/core-api/printk-basics.rst          | 111 ++++
 .../zh_CN/core-api/printk-formats.rst         | 580 ++++++++++++++++++
 4 files changed, 1081 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/core-api/kernel-api.rst
 create mode 100644 Documentation/translations/zh_CN/core-api/printk-basics.rst
 create mode 100644 Documentation/translations/zh_CN/core-api/printk-formats.rst

-- 
2.27.0

