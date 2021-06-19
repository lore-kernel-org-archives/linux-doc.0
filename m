Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F51C2B9F4
	for <linux-doc@archiver.kernel.org>; Sat, 19 Jun 2021 06:37:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C1D4761001
	for <linux-doc@archiver.kernel.org>; Sat, 19 Jun 2021 06:37:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232357AbhFSGjK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 19 Jun 2021 02:39:10 -0400
Received: from mail.loongson.cn ([114.242.206.163]:46834 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231637AbhFSGjJ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 19 Jun 2021 02:39:09 -0400
Received: from localhost.localdomain (unknown [223.106.58.132])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9BxwOKGkM1gPBgUAA--.32920S2;
        Sat, 19 Jun 2021 14:36:54 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH v2 0/2] docs/core-api: add memory_hotplug and protection keys translation
Date:   Sat, 19 Jun 2021 14:37:25 +0800
Message-Id: <cover.1624084273.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9BxwOKGkM1gPBgUAA--.32920S2
X-Coremail-Antispam: 1UD129KBjvdXoWruw4rAFy8CF18GryxCrW7urg_yoWxKFg_Za
        1kXFW0kw4xZFn3tFWrWr13JrWj9r4093s5KF15t3yDt3y5trnrCryDX3sYgFW5JF4DArW3
        GFZ7Ww1SqFnrGjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb3kFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
        Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
        1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
        8cxan2IY04v7MxkIecxEwVAFwVW8AwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
        WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
        67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
        IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1U
        MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
        VFxhVjvjDU0xZFpf9x0JUkhLnUUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v2:

PATCH 1/2:
* Modified some words under Xiangcheng's advices;
* add 校译者(proofreading) sign.If you don't want me to do this, please let me know.

Yanteng Si (2):
  docs/zh_CN: add core api memory_hotplug translation
  docs/zh_CN: add core api protection keys translation

 .../translations/zh_CN/core-api/index.rst     |   2 +-
 .../zh_CN/core-api/memory-hotplug.rst         | 126 ++++++++++++++++++
 .../zh_CN/core-api/protection-keys.rst        |  98 ++++++++++++++
 3 files changed, 225 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/core-api/memory-hotplug.rst
 create mode 100644 Documentation/translations/zh_CN/core-api/protection-keys.rst

-- 
2.27.0

