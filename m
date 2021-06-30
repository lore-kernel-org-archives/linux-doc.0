Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC28EC11F69
	for <linux-doc@archiver.kernel.org>; Wed, 30 Jun 2021 10:22:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B3E9E61CF6
	for <linux-doc@archiver.kernel.org>; Wed, 30 Jun 2021 10:22:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234112AbhF3KZK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 30 Jun 2021 06:25:10 -0400
Received: from mail.loongson.cn ([114.242.206.163]:40628 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234210AbhF3KZJ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 30 Jun 2021 06:25:09 -0400
Received: from localhost.localdomain (unknown [112.20.109.145])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxf0PoRdxgKsUaAA--.10417S2;
        Wed, 30 Jun 2021 18:22:33 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH 0/6] docs/zh_CN: add core-api Memory management translation
Date:   Wed, 30 Jun 2021 18:23:22 +0800
Message-Id: <cover.1625048200.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxf0PoRdxgKsUaAA--.10417S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww15trWkCw1rJF47AF1UKFg_yoW8Xry3pF
        1xKryfG3Z7AF17Cr4xWw4DJF1UGayxWa98Kw4IqwnYqrn3trWYyrWDtry3K34xJr1ktFyr
        Zr4SkF4Du34jyr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
        n2kIc2xKxwCY02Avz4vE14v_Gw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
        0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
        17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
        C0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF
        0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2Kf
        nxnUUI43ZEXa7VUbGQ6JUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate a small part of the core-api Memory-management docs.

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

