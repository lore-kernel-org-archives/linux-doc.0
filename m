Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6953CC48BC2
	for <linux-doc@archiver.kernel.org>; Fri, 25 Jun 2021 09:12:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5130A6142B
	for <linux-doc@archiver.kernel.org>; Fri, 25 Jun 2021 09:12:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230282AbhFYJOx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 25 Jun 2021 05:14:53 -0400
Received: from mail.loongson.cn ([114.242.206.163]:33778 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230020AbhFYJOx (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 25 Jun 2021 05:14:53 -0400
Received: from localhost.localdomain (unknown [112.20.109.145])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP0L4ndVgVckXAA--.6297S2;
        Fri, 25 Jun 2021 17:12:25 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH v5 0/2] docs/core-api: add memory_hotplug and protection keys
Date:   Fri, 25 Jun 2021 17:13:21 +0800
Message-Id: <cover.1624612063.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxP0L4ndVgVckXAA--.6297S2
X-Coremail-Antispam: 1UD129KBjvdXoWrury5AryUXr13CFyxZFyxXwb_yoWftwb_Za
        n7XFWkAw4xAFn3tFZ3Xr13JrWY9F40k39YyFy3t39rtrZ8Cr4DuFyqq39YgFW5tF4DJrW3
        KFZ7Ww1SqF9rGjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbVkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
        6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
        n2kIc2xKxwCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
        0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
        17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
        C0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF
        0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2Kf
        nxnUUI43ZEXa7VUjMmh5UUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v5:

* pick Alex's Reviewed-by tag.

v4:

* pick Xiangcheng's Reviewed-by tag.

v3:

PATCH 2/2:
* Modified some words under Xiangcheng's advices;
* add 校译者(proofreading) sign.If you don't want me to do this, please let me know.

v2:

PATCH 1/2:
* Modified some words under Xiangcheng's advices;
* add 校译者(proofreading) sign.If you don't want me to do this, please let me know.

Yanteng Si (2):
  docs/zh_CN: add core api memory_hotplug translation
  docs/zh_CN: add core api protection keys translation

 .../translations/zh_CN/core-api/index.rst     |   2 +-
 .../zh_CN/core-api/memory-hotplug.rst         | 126 ++++++++++++++++++
 .../zh_CN/core-api/protection-keys.rst        |  99 ++++++++++++++
 3 files changed, 226 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/core-api/memory-hotplug.rst
 create mode 100644 Documentation/translations/zh_CN/core-api/protection-keys.rst

-- 
2.27.0

