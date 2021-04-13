Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41BCAC433B4
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 13:11:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 23A08613AE
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 13:11:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231486AbhDMNMQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Apr 2021 09:12:16 -0400
Received: from mail.loongson.cn ([114.242.206.163]:53474 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239533AbhDMNMP (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Apr 2021 09:12:15 -0400
Received: from localhost.localdomain (unknown [223.106.57.161])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxvciUmHVg5YsHAA--.10319S2;
        Tue, 13 Apr 2021 21:11:49 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com,
        Wu XiangCheng <bobwxc@email.cn>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v3 00/11] docs/zh_CN: add core api and openrisc translation
Date:   Tue, 13 Apr 2021 21:12:26 +0800
Message-Id: <20210413131237.2253955-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxvciUmHVg5YsHAA--.10319S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw48tr17CF1UJr4xWF45Wrg_yoW8CrW5pF
        y7Kr93J3WxAF1akw1fWr47Jr15Ga4xW398tws2qwn3tFs8tw48tr4UKr9Igas7Jr10va4F
        vw4akrWUur1jyrUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUP214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE
        5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeV
        CFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l
        FIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr4
        1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AK
        xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrx
        kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
        6r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVW8JV
        WxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUjE_
        MDUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This series of patches translates core-api/irq/* and openrisc/* into
Chinese

v1 -> v2:

Modify some words under Xiangcheng Wu's suggestion. Thanks for his rewiew!

v2 -> v3:

keep the signs number equal to the title char under Alex's suggestion. 
Thanks for his rewiew!


Yanteng Si(11):
docs/zh_CN: add core-api irq concepts.rst translation
docs/zh_CN: add core-api irq irq-affinity.rst translation
docs/zh_CN: add core-api irq irq-domain.rst translation
docs/zh_CN: add core-api irq irqflags-tracing.rst
docs/zh_CN: add core-api irq index.rst translation
docs/zh_CN: add core-api index.rst translation
docs/zh_CN: add translation to zh_CN index
docs/zh_CN: add openrisc openrisc_port.rst translation
docs/zh_CN: add openrisc todo.rst translation
docs/zh_CN: add openrisc index.rst translation
docs/zh_CN: add translation to zh_CN index

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
Documentation/translations/zh_CN/core-api/index.rst                     | 126 ++++++++++++++
Documentation/translations/zh_CN/core-api/irq/concepts.rst              | 24  ++++++++++++++
Documentation/translations/zh_CN/core-api/irq/index.rst                 | 19  ++++++++++++++
Documentation/translations/zh_CN/core-api/irq/irq-affinity.rst          | 76  ++++++++++++++
Documentation/translations/zh_CN/core-api/irq/irq-domain.rst            | 228 ++++++++++++++
Documentation/translations/zh_CN/core-api/irq/irqflags-tracing.rst      | 45  ++++++++++++++
Documentation/translations/zh_CN/index.rst                              | 2   ++++++++++++++
Documentation/translations/zh_CN/openrisc/index.rst                     | 27  ++++++++++++++
Documentation/translations/zh_CN/openrisc/openrisc_port.rst             | 124 ++++++++++++++
Documentation/translations/zh_CN/openrisc/todo.rst                      | 20  ++++++++++++++
10 files changed, 691 insertions(+)

