Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9995C432BE
	for <linux-doc@archiver.kernel.org>; Wed, 18 Aug 2021 08:32:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C95026108B
	for <linux-doc@archiver.kernel.org>; Wed, 18 Aug 2021 08:32:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238324AbhHRIdN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 18 Aug 2021 04:33:13 -0400
Received: from mail.loongson.cn ([114.242.206.163]:35664 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238168AbhHRIdM (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 18 Aug 2021 04:33:12 -0400
Received: from localhost.localdomain (unknown [112.20.110.91])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxv0OYxRxhUK4xAA--.877S2;
        Wed, 18 Aug 2021 16:32:26 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, chenfeiyang@loongson.cn,
        chris.chenfeiyang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH v3 0/6] docs/zh_CN: add core-api Memory management translation
Date:   Wed, 18 Aug 2021 16:32:15 +0800
Message-Id: <cover.1629274856.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxv0OYxRxhUK4xAA--.877S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFyDJr48AF45Zw4kuw4rKrg_yoW8Ary5pF
        yxKryfG3Z7AF17Cw4xWw4DJF1UJayxWa98Kw4Iqwn5trn3trWYyrWDtry3K3yfJr1vqFyr
        Zr4SkFWDu34jyF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
        xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
        8cxan2IY04v7MxkIecxEwVAFwVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
        WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
        67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
        IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1l
        IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
        C2KfnxnUUI43ZEXa7VUjNJ55UUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v3:

* Modified some words under Jiaxun's advices.[PATCH 5/6]

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

