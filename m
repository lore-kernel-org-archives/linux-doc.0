Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD7E3C432BE
	for <linux-doc@archiver.kernel.org>; Fri,  6 Aug 2021 02:23:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C478F611C6
	for <linux-doc@archiver.kernel.org>; Fri,  6 Aug 2021 02:23:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236411AbhHFCXh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 5 Aug 2021 22:23:37 -0400
Received: from mail.loongson.cn ([114.242.206.163]:34438 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236593AbhHFCXg (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 5 Aug 2021 22:23:36 -0400
Received: from localhost.localdomain (unknown [223.106.24.69])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxz0APnQxhudkrAA--.60302S2;
        Fri, 06 Aug 2021 10:23:12 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, chenfeiyang@loongson.cn,
        chris.chenfeiyang@gmail.com, siyanteng01@gmail.com,
        chenweiguang82@126.com
Subject: [PATCH v3 0/8] docs/zh_CN: add infiniband translation
Date:   Fri,  6 Aug 2021 10:23:19 +0800
Message-Id: <cover.1628213809.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxz0APnQxhudkrAA--.60302S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFy5KrWkXry8Jw4xAF17Awb_yoW8ZFWrpF
        n7KryfK3WUAF1akw4fGFW7JF4fJ3WxG398Gr9Fqwn5tFn5Xa1Fqrn0k34jgayfJr18Xa15
        Xr4F9r1DWrWxCrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUva14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
        W0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
        628vn2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
        02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_
        GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
        CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE
        14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyT
        uYvjfUoOJ5UUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v3:

* Modified some words under Alex's advices;

* pick Review-by tags.

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

