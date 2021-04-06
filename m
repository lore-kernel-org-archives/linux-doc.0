Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FF39C433ED
	for <linux-doc@archiver.kernel.org>; Tue,  6 Apr 2021 13:01:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 36F42613D2
	for <linux-doc@archiver.kernel.org>; Tue,  6 Apr 2021 13:01:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243506AbhDFNBg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Apr 2021 09:01:36 -0400
Received: from mail.loongson.cn ([114.242.206.163]:49350 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240250AbhDFNBf (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Apr 2021 09:01:35 -0400
Received: from localhost.localdomain (unknown [223.106.57.161])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Ax_cifW2xg9tQEAA--.6047S2;
        Tue, 06 Apr 2021 21:01:20 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com,
        Wu XiangCheng <bobwxc@email.cn>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH 00/11] docs/zh_CN: add core api and openrisc translation
Date:   Tue,  6 Apr 2021 21:01:59 +0800
Message-Id: <20210406130210.2725075-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Ax_cifW2xg9tQEAA--.6047S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw48tr48KF47GF4ftr13Jwb_yoW8Ww18pF
        y7Kr93JF1xAF12kw1fGrW7Jr15GFyxW398tws2qwn3tFs8tr4Utr4Utr9Iga97Jr10qa4F
        vw43KrWUur1jyrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvF14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
        n2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
        0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFyl
        IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
        AFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v2
        6r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvj
        fUoOJ5UUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This series of patches translates core-api/irq/* and openrisc/* into
Chinese

Yanteng Si(11):
docs/zh_CN: add core-api irq concepts.rst translation
docs/zh_CN: add core-api irq irq-affinity.rst translation
docs/zh_CN: add core-api/irq/irq-domain.rst translation
docs/zh_CN: add core-api irq irqflags-tracing.rst
docs/zh_CN: add core-api irq index.rst translation
docs/zh_CN: add core-api/index.rst translation
docs/zh_CN: add translation to zh_CN index
docs/zh_CN: add openrisc openrisc_port.rst translation
docs/zh_CN: add openrisc/todo.rst translation
docs/zh_CN: add openrisc/index.rst translation
docs/zh_CN: add translation to zh_CN index

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
Documentation/translations/zh_CN/core-api/index.rst                     | 126 ++++++++++++++
Documentation/translations/zh_CN/core-api/irq/concepts.rst              | 24  ++++++++++++++
Documentation/translations/zh_CN/core-api/irq/index.rst                 | 19  ++++++++++++++
Documentation/translations/zh_CN/core-api/irq/irq-affinity.rst          | 73  ++++++++++++++
Documentation/translations/zh_CN/core-api/irq/irq-domain.rst            | 228 ++++++++++++++
Documentation/translations/zh_CN/core-api/irq/irqflags-tracing.rst      | 45  ++++++++++++++
Documentation/translations/zh_CN/index.rst                              | 2   ++++++++++++++
Documentation/translations/zh_CN/openrisc/index.rst                     | 27  ++++++++++++++
Documentation/translations/zh_CN/openrisc/openrisc_port.rst             | 124 ++++++++++++++
Documentation/translations/zh_CN/openrisc/todo.rst                      | 20  ++++++++++++++
10 files changed, 688 insertions(+)

