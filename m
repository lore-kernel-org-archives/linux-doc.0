Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDAA2C43460
	for <linux-doc@archiver.kernel.org>; Tue, 27 Apr 2021 02:06:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A102A61165
	for <linux-doc@archiver.kernel.org>; Tue, 27 Apr 2021 02:06:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234074AbhD0CHP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Apr 2021 22:07:15 -0400
Received: from mail.loongson.cn ([114.242.206.163]:36986 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234072AbhD0CHO (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 26 Apr 2021 22:07:14 -0400
Received: from localhost.localdomain (unknown [112.3.197.94])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx7++YcYdgP0kOAA--.8941S2;
        Tue, 27 Apr 2021 10:06:18 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net
Cc:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com, bobwxc@email.cn,
        siyanteng01@gmail.com, huangjianghui@uniontech.com
Subject: [PATCH v3 0/3] docs/zh_CN add three core api docs
Date:   Tue, 27 Apr 2021 10:06:59 +0800
Message-Id: <cover.1619488828.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx7++YcYdgP0kOAA--.8941S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAFyUtry8GFWDuF15CFW7Jwb_yoW5XrW3pF
        y7KrWft3ZxGF1Uuwn7W3ykZr1UWa4xuws8Kay7Xwn5tanxKrW0yw4jgF9Iqasaqr1vqF1F
        vF43KFyq93yjyrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvF14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
        4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
        628vn2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
        02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_
        GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
        CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAF
        wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvj
        fUoOJ5UUUUU
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

v2 -> v3:

* Pick Xiangcheng Wu's review-by tag for [patch 1-3/3]

* fix two original links. [1/3 and 3/3]

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

