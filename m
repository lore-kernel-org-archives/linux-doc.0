Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03CC9C433ED
	for <linux-doc@archiver.kernel.org>; Fri, 16 Apr 2021 10:31:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CEE7E61184
	for <linux-doc@archiver.kernel.org>; Fri, 16 Apr 2021 10:31:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238717AbhDPKcR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 16 Apr 2021 06:32:17 -0400
Received: from mail.loongson.cn ([114.242.206.163]:40192 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237997AbhDPKcQ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 16 Apr 2021 06:32:16 -0400
Received: from localhost.localdomain (unknown [223.106.57.161])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxucmRZ3lgFq8IAA--.15956S2;
        Fri, 16 Apr 2021 18:31:46 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net
Cc:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com, bobwxc@email.cn,
        siyanteng01@gmail.com
Subject: [PATCH v7 00/11] docs/zh_CN: add core api and openrisc translation
Date:   Fri, 16 Apr 2021 18:32:23 +0800
Message-Id: <cover.1618568135.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9CxucmRZ3lgFq8IAA--.15956S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWr1rWr1xJFW3AF43Xw4kCrg_yoW5XF4UpF
        47KryfG3WxAF12kw1IgF4UJr1UCa4xW398Ka97Xwn3tFsYqw4Utr4UKryagayxJr1vqFyr
        Zr4SkFWDu34jyrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUyE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vI
        r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
        xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
        cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
        AvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF
        7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUb0D73UUUUU==
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

v6 -> v7:

Send patch 11 to the series. Thank you Xiangcheng for your help!

Yanteng Si (11):
  docs/zh_CN: add core-api irq concepts.rst translation
  docs/zh_CN: add core-api irq irq-affinity.rst translation
  docs/zh_CN: add core-api irq irq-domain.rst translation
  docs/zh_CN: add core-api irq irqflags-tracing.rst translation
  docs/zh_CN: add core-api irq index.rst translation
  docs/zh_CN: add core-api index.rst translation
  docs/zh_CN: add core api translation to zh_CN index
  docs/zh_CN: add openrisc openrisc_port.rst translation
  docs/zh_CN: add openrisc todo.rst translation
  docs/zh_CN: add openrisc index.rst translation
  docs/zh_CN: add openrisc translation to zh_CN index

 .../translations/zh_CN/core-api/index.rst     | 126 ++++++++++
 .../zh_CN/core-api/irq/concepts.rst           |  24 ++
 .../translations/zh_CN/core-api/irq/index.rst |  19 ++
 .../zh_CN/core-api/irq/irq-affinity.rst       |  76 ++++++
 .../zh_CN/core-api/irq/irq-domain.rst         | 227 ++++++++++++++++++
 .../zh_CN/core-api/irq/irqflags-tracing.rst   |  45 ++++
 Documentation/translations/zh_CN/index.rst    |   2 +
 .../translations/zh_CN/openrisc/index.rst     |  30 +++
 .../zh_CN/openrisc/openrisc_port.rst          | 124 ++++++++++
 .../translations/zh_CN/openrisc/todo.rst      |  20 ++
 10 files changed, 693 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/core-api/index.rst
 create mode 100644 Documentation/translations/zh_CN/core-api/irq/concepts.rst
 create mode 100644 Documentation/translations/zh_CN/core-api/irq/index.rst
 create mode 100644 Documentation/translations/zh_CN/core-api/irq/irq-affinity.rst
 create mode 100644 Documentation/translations/zh_CN/core-api/irq/irq-domain.rst
 create mode 100644 Documentation/translations/zh_CN/core-api/irq/irqflags-tracing.rst
 create mode 100644 Documentation/translations/zh_CN/openrisc/index.rst
 create mode 100644 Documentation/translations/zh_CN/openrisc/openrisc_port.rst
 create mode 100644 Documentation/translations/zh_CN/openrisc/todo.rst

-- 
2.27.0

