Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E0BEC12002
	for <linux-doc@archiver.kernel.org>; Mon, 19 Jul 2021 09:42:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 734E261164
	for <linux-doc@archiver.kernel.org>; Mon, 19 Jul 2021 09:42:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231928AbhGSJBp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Jul 2021 05:01:45 -0400
Received: from mail.loongson.cn ([114.242.206.163]:39262 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235297AbhGSJBp (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 19 Jul 2021 05:01:45 -0400
Received: from localhost.localdomain (unknown [112.20.113.90])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxz0LvSPVghpEhAA--.19840S2;
        Mon, 19 Jul 2021 17:42:09 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, chenfeiyang@loongson.cn,
        chris.chenfeiyang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH 0/8] docs/zh_CN: add some virt docs translation
Date:   Mon, 19 Jul 2021 17:42:47 +0800
Message-Id: <cover.1626687013.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxz0LvSPVghpEhAA--.19840S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr18urykuw1UKryUZw1UKFg_yoW8AFWfp3
        ZrKr93G3W7AF12k3yfGF4UWF1rAas7Gws8Gw12qwnYgFn7tw4rtF4Utryaga93Xr18XFyr
        Xr4Skr4UWryjvaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
        n2kIc2xKxwCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
        0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
        17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
        C0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF
        0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxh
        VjvjDU0xZFpf9x0JUhNVgUUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate some Documentation/virt docs into Chinese.

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
 .../translations/zh_CN/virt/paravirt_ops.rst  | 40 ++++++++
 9 files changed, 486 insertions(+), 1 deletion(-)
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

