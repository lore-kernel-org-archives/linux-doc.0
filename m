Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11941C432BE
	for <linux-doc@archiver.kernel.org>; Sun,  1 Aug 2021 12:25:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E2832610CF
	for <linux-doc@archiver.kernel.org>; Sun,  1 Aug 2021 12:25:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231546AbhHAMZh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 1 Aug 2021 08:25:37 -0400
Received: from mail.loongson.cn ([114.242.206.163]:53402 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231461AbhHAMZg (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 1 Aug 2021 08:25:36 -0400
Received: from localhost.localdomain (unknown [223.106.24.69])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL+OrkgZhQeonAA--.4804S2;
        Sun, 01 Aug 2021 20:25:17 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, chenweiguang82@126.com,
        siyanteng01@gmail.com
Subject: [PATCH v2 0/8] docs/zh_CN: add infiniband translation.
Date:   Sun,  1 Aug 2021 20:25:30 +0800
Message-Id: <cover.1627820210.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxL+OrkgZhQeonAA--.4804S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFy5KrWkXry8Jw4xAF17Awb_yoW8Zr47pF
        n7KryfK3WUAF1akw4fGFW7JF4fJ3WxG398Jr9Fqwn5tFs5Xa1Fqr90k34jgFWfJr18Xa15
        Xr4F9r1DWrWxCrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUv214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
        1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
        628vn2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
        02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_
        GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
        CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAF
        wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa
        7VUbXdbUUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v2:

* Modified some words under Alex's and Puyu advices; Thanks for their review!

* add 校译者(proofreading) sign.If you don't want me to do this, please let me know.

*--CC chenweiguang82@126.com

Yanteng Si (8):
  docs/zh_CN: add infiniband index translation
  docs/zh_CN: add infiniband core_locking translation
  docs/zh_CN: add infiniband ipoib translation
  docs/zh_CN: add infiniband opa_vnic translation
  docs/zh_CN: add infiniband sysfs translation
  docs/zh_CN: add infiniband tag_matching translation
  docs/zh_CN: add infiniband user_mad translation
  docs/zh_CN: add infiniband user_verbs translation

 Documentation/translations/zh_CN/index.rst    |   2 +-
 .../zh_CN/infiniband/core_locking.rst         | 115 ++++++++++++
 .../translations/zh_CN/infiniband/index.rst   |  40 +++++
 .../translations/zh_CN/infiniband/ipoib.rst   | 111 ++++++++++++
 .../zh_CN/infiniband/opa_vnic.rst             | 156 +++++++++++++++++
 .../translations/zh_CN/infiniband/sysfs.rst   |  21 +++
 .../zh_CN/infiniband/tag_matching.rst         |  63 +++++++
 .../zh_CN/infiniband/user_mad.rst             | 164 ++++++++++++++++++
 .../zh_CN/infiniband/user_verbs.rst           |  72 ++++++++
 9 files changed, 743 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/infiniband/core_locking.rst
 create mode 100644 Documentation/translations/zh_CN/infiniband/index.rst
 create mode 100644 Documentation/translations/zh_CN/infiniband/ipoib.rst
 create mode 100644 Documentation/translations/zh_CN/infiniband/opa_vnic.rst
 create mode 100644 Documentation/translations/zh_CN/infiniband/sysfs.rst
 create mode 100644 Documentation/translations/zh_CN/infiniband/tag_matching.rst
 create mode 100644 Documentation/translations/zh_CN/infiniband/user_mad.rst
 create mode 100644 Documentation/translations/zh_CN/infiniband/user_verbs.rst

-- 
2.27.0

