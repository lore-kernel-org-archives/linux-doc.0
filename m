Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AC39C07E99
	for <linux-doc@archiver.kernel.org>; Fri,  9 Jul 2021 02:57:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 57DAB6145C
	for <linux-doc@archiver.kernel.org>; Fri,  9 Jul 2021 02:57:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbhGIDAQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 8 Jul 2021 23:00:16 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45018 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230336AbhGIDAP (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 8 Jul 2021 23:00:15 -0400
Received: from localhost.localdomain (unknown [112.20.109.145])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9BxUOIQu+dg_xgeAA--.15063S2;
        Fri, 09 Jul 2021 10:57:21 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH v2 0/6] docs/zh_CN: add core-api Memory management translation
Date:   Fri,  9 Jul 2021 10:57:41 +0800
Message-Id: <cover.1625795862.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9BxUOIQu+dg_xgeAA--.15063S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFyDJr48AF45Zw4kuw4rKrg_yoW8WFWUpF
        WxKryfG3Z7AF12kw4xWw4DJF1UJayxWa98Kw4IqwnYqrn3trWYyrWUtry3K34fJryvqFyr
        Zr4SkFWDu34jyF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
        W0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
        628vn2kIc2xKxwCY02Avz4vE14v_Gr1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
        v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
        1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
        AIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0D
        MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvf
        C2KfnxnUUI43ZEXa7VUbpwZ7UUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v2:

* Modified some words under Alex's advices;Many thanks to alex for his review, which
    kept him busy until the early hours of the morning.Thank you!

* add 校译者(proofreading) sign.If you don't want me to do this, please let me know.

Yanteng Si (6):
  docs/zh_CN: add core-api memory-allocation translation
  docs/zh_CN: add core-api unaligned-memory-access translation
  docs/zh_CN: add core-api mm-api translation
  docs/zh_CN: add core-api genalloc translation
  docs/zh_CN: add core-api boot-time-mm translation
  docs/zh_CN: add core-api gfp_mask-from-fs-io translation

 .../zh_CN/core-api/boot-time-mm.rst           |  49 ++++
 .../translations/zh_CN/core-api/genalloc.rst  | 109 +++++++++
 .../zh_CN/core-api/gfp_mask-from-fs-io.rst    |  66 +++++
 .../translations/zh_CN/core-api/index.rst     |  14 +-
 .../zh_CN/core-api/memory-allocation.rst      | 138 +++++++++++
 .../translations/zh_CN/core-api/mm-api.rst    | 110 +++++++++
 .../core-api/unaligned-memory-access.rst      | 229 ++++++++++++++++++
 7 files changed, 710 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/core-api/boot-time-mm.rst
 create mode 100644 Documentation/translations/zh_CN/core-api/genalloc.rst
 create mode 100644 Documentation/translations/zh_CN/core-api/gfp_mask-from-fs-io.rst
 create mode 100644 Documentation/translations/zh_CN/core-api/memory-allocation.rst
 create mode 100644 Documentation/translations/zh_CN/core-api/mm-api.rst
 create mode 100644 Documentation/translations/zh_CN/core-api/unaligned-memory-access.rst

-- 
2.27.0

