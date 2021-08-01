Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B74AFC43216
	for <linux-doc@archiver.kernel.org>; Sun,  1 Aug 2021 13:32:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A13BB610CF
	for <linux-doc@archiver.kernel.org>; Sun,  1 Aug 2021 13:32:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231992AbhHANch (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 1 Aug 2021 09:32:37 -0400
Received: from mail.loongson.cn ([114.242.206.163]:60982 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231984AbhHANce (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 1 Aug 2021 09:32:34 -0400
Received: from localhost.localdomain (unknown [223.106.24.69])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxX0NYogZhYe8nAA--.27721S2;
        Sun, 01 Aug 2021 21:32:10 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, chenfeiyang@loongson.cn,
        chris.chenfeiyang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH v3 0/8] docs/zh_CN: add some virt docs translation
Date:   Sun,  1 Aug 2021 21:32:24 +0800
Message-Id: <cover.1627823347.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxX0NYogZhYe8nAA--.27721S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw17tF1DZF1fAryrAry7Jrb_yoW8ur1xpF
        1kKr95G3WxAF12kw4fKa1UWF1rAas7G398Gw12qwnYgrn7tr45tFW5tryagFZxZr1xXFyr
        Xr4Skr4UWryjvaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvI14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
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
        wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf
        9x0JUdHUDUUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v3:

* Modified some words under Alex's advices;
* add 校译者(proofreading) sign.If you don't want me to do this, please let me know
* pick Alex's Review-by tag for [patch 1-4/8]

v2:

patch 2/8:

* Modified some words under Feiyang's advices;
* add 校译者(proofreading) sign.If you don't want me to do this, please let me know.

Yanteng Si (8):
  docs/zh_CN: add virt index translation
  docs/zh_CN: add virt paravirt_ops translation
  docs/zh_CN: add virt guest-halt-polling translation
  docs/zh_CN: add virt ne_overview translation
  docs/zh_CN: add virt acrn index translation
  docs/zh_CN: add virt acrn introduction translation
  docs/zh_CN: add virt acrn io-request translation
  docs/zh_CN: add virt acrn cpuid translation

 Documentation/translations/zh_CN/index.rst    |  2 +-
 .../translations/zh_CN/virt/acrn/cpuid.rst    | 56 +++++++++++
 .../translations/zh_CN/virt/acrn/index.rst    | 25 +++++
 .../zh_CN/virt/acrn/introduction.rst          | 52 ++++++++++
 .../zh_CN/virt/acrn/io-request.rst            | 99 +++++++++++++++++++
 .../zh_CN/virt/guest-halt-polling.rst         | 87 ++++++++++++++++
 .../translations/zh_CN/virt/index.rst         | 38 +++++++
 .../translations/zh_CN/virt/ne_overview.rst   | 88 +++++++++++++++++
 .../translations/zh_CN/virt/paravirt_ops.rst  | 41 ++++++++
 9 files changed, 487 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/virt/acrn/cpuid.rst
 create mode 100644 Documentation/translations/zh_CN/virt/acrn/index.rst
 create mode 100644 Documentation/translations/zh_CN/virt/acrn/introduction.rst
 create mode 100644 Documentation/translations/zh_CN/virt/acrn/io-request.rst
 create mode 100644 Documentation/translations/zh_CN/virt/guest-halt-polling.rst
 create mode 100644 Documentation/translations/zh_CN/virt/index.rst
 create mode 100644 Documentation/translations/zh_CN/virt/ne_overview.rst
 create mode 100644 Documentation/translations/zh_CN/virt/paravirt_ops.rst

-- 
2.27.0

