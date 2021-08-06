Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB4CFC432BE
	for <linux-doc@archiver.kernel.org>; Fri,  6 Aug 2021 01:26:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 89B05611C5
	for <linux-doc@archiver.kernel.org>; Fri,  6 Aug 2021 01:26:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241390AbhHFB0y (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 5 Aug 2021 21:26:54 -0400
Received: from mail.loongson.cn ([114.242.206.163]:46972 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S241239AbhHFB0x (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 5 Aug 2021 21:26:53 -0400
Received: from localhost.localdomain (unknown [223.106.24.69])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx30PFjwxhvs8rAA--.54926S2;
        Fri, 06 Aug 2021 09:26:31 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, chenfeiyang@loongson.cn,
        chris.chenfeiyang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH v4 0/8] docs/zh_CN: add some virt docs translation
Date:   Fri,  6 Aug 2021 09:26:38 +0800
Message-Id: <cover.1628212777.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx30PFjwxhvs8rAA--.54926S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr1DWFykAw48Kw48KryUZFb_yoW8uw1rpF
        1kKr95G3WxAF12kw4fKa1UWF1rAas7G398Gw12qwnYgrn7tr45tFWYyryagFZxZr1xXFyr
        Xw4Skr4UWryjvaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUva14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
        W8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xf
        McIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7
        v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF
        7I0E8cxan2IY04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
        0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWU
        tVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
        CY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv
        67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyT
        uYvjfUoOJ5UUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v4:

* Modified some words under Alex's advices;
* pick Alex's Review-by tag for [patch 5-8/8]

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

