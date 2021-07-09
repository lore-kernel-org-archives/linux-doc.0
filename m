Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4D36C07E96
	for <linux-doc@archiver.kernel.org>; Fri,  9 Jul 2021 03:00:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A199661421
	for <linux-doc@archiver.kernel.org>; Fri,  9 Jul 2021 03:00:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230352AbhGIDCo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 8 Jul 2021 23:02:44 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45992 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230336AbhGIDCo (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 8 Jul 2021 23:02:44 -0400
Received: from localhost.localdomain (unknown [112.20.109.145])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Bx4OKru+dgOBkeAA--.14843S2;
        Fri, 09 Jul 2021 10:59:56 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH v4 0/2] docs/core-api: add cpu_hotplug and protection keys translation
Date:   Fri,  9 Jul 2021 11:00:33 +0800
Message-Id: <cover.1625798719.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Bx4OKru+dgOBkeAA--.14843S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtw43WF4DGrWfKw4Utr45GFg_yoW3Crg_AF
        s7JFWvyw1IyFn7tFZxWr13Jr4Yva1Y93yFkF15ta9rtrW7Cr1Dur97t34v9FyYgan8JrW7
        KF97W34fXr9rGjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb3xFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
        6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
        xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
        8cxan2IY04v7MxkIecxEwVAFwVW8JwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
        WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
        67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42
        IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVW3JVWrJr1l
        IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
        C2KfnxnUUI43ZEXa7VU1sYFtUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v4:

* Is anyone else reviewing this set? :-)

v3:

PATCH 2/2:
* Modified some words under Xiangcheng's advices;
* add 校译者(proofreading) sign.If you don't want me to do this, please let me know.

v2:

PATCH 1/2:
* Modified some words under Xiangcheng's advices;
* add 校译者(proofreading) sign.If you don't want me to do this, please let me know.

Yanteng Si (2):
  docs/core-api: Modify document layout
  docs/zh_CN: add core api cpu_hotplug translation

 Documentation/core-api/cpu_hotplug.rst        |  38 +-
 .../zh_CN/core-api/cpu_hotplug.rst            | 348 ++++++++++++++++++
 .../translations/zh_CN/core-api/index.rst     |   2 +-
 3 files changed, 373 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/core-api/cpu_hotplug.rst

-- 
2.27.0

