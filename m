Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85701C433ED
	for <linux-doc@archiver.kernel.org>; Fri, 16 Apr 2021 03:20:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6285361184
	for <linux-doc@archiver.kernel.org>; Fri, 16 Apr 2021 03:20:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238026AbhDPDUb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 15 Apr 2021 23:20:31 -0400
Received: from mail.loongson.cn ([114.242.206.163]:47250 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234992AbhDPDUa (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 15 Apr 2021 23:20:30 -0400
Received: from localhost.localdomain (unknown [223.106.57.161])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxycldAnlg648IAA--.15727S2;
        Fri, 16 Apr 2021 11:19:59 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com,
        Wu XiangCheng <bobwxc@email.cn>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v6 00/11] docs/zh_CN: add core api and openrisc translation
Date:   Fri, 16 Apr 2021 11:20:36 +0800
Message-Id: <20210416032047.2752858-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9CxycldAnlg648IAA--.15727S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw48tr1rtrW8XF1fJF4UXFb_yoW8uw1xpF
        47Kr93X3WxAF12kw1fWr47Jr15Ga4xWa98tan2qwn5tFs8tr4Utr1UKr9Igas7Jr10vFyF
        vw4akrWDur1jyrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUv214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
        xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
        8cxan2IY04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
        8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8
        ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
        0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAF
        wI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa
        7VUbXdbUUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This series of patches translates core-api/irq/* and openrisc/* into Chinese.

v1 -> v2:

Modify some words under Xiangcheng Wu's suggestion. Thanks for his rewiew!

v2 -> v3:

keep the signs number equal to the title char under Alex's suggestion. 
Thanks for his rewiew!

v3 -> v4:

Add Xiangcheng Wu's review sign to 0002、0003 and 0008; Thanks for his rewiew!

v4 -> v5:

Split 1-7 into a separate series.

v5 -> v6:

Modify the Subject of patches 07 and 11.
Patch 11 will not be sent if not modified. (name repeat)

Revert to one series because there is no need to split into two series.


Yanteng Si(11):
docs/zh_CN: add core-api irq concepts.rst translation
docs/zh_CN: add core-api irq irq-affinity.rst translation
docs/zh_CN: add core-api irq irq-domain.rst translation
docs/zh_CN: add core-api irq irqflags-tracing.rst
docs/zh_CN: add core-api irq index.rst translation
docs/zh_CN: add core-api index.rst translation
docs/zh_CN: add core-api translation to zh_CN index
docs/zh_CN: add openrisc openrisc_port.rst translation
docs/zh_CN: add openrisc todo.rst translation
docs/zh_CN: add openrisc index.rst translation
docs/zh_CN: add openrisc translation to zh_CN index

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/translations/zh_CN/core-api/index.rst                | 126 ++++++++++++++++++++++
 Documentation/translations/zh_CN/core-api/irq/concepts.rst         |  24 +++++
 Documentation/translations/zh_CN/core-api/irq/index.rst            |  19 ++++
 Documentation/translations/zh_CN/core-api/irq/irq-affinity.rst     |  76 +++++++++++++
 Documentation/translations/zh_CN/core-api/irq/irq-domain.rst       | 227 +++++++++++++++++++++++++++++++++++++++
 Documentation/translations/zh_CN/core-api/irq/irqflags-tracing.rst |  45 ++++++++
 Documentation/translations/zh_CN/index.rst                         |   2 +
 Documentation/translations/zh_CN/openrisc/index.rst                |  30 ++++++
 Documentation/translations/zh_CN/openrisc/openrisc_port.rst        | 124 +++++++++++++++++++++
 Documentation/translations/zh_CN/openrisc/todo.rst                 |  20 ++++
 10 files changed, 693 insertions(+)

