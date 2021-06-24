Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B368AC49EA6
	for <linux-doc@archiver.kernel.org>; Thu, 24 Jun 2021 07:29:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 930E2613E7
	for <linux-doc@archiver.kernel.org>; Thu, 24 Jun 2021 07:29:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231466AbhFXHcD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Jun 2021 03:32:03 -0400
Received: from mail.loongson.cn ([114.242.206.163]:35982 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231589AbhFXHcD (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 24 Jun 2021 03:32:03 -0400
Received: from localhost.localdomain (unknown [112.20.109.145])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxH0BiNNRgIvQWAA--.5239S2;
        Thu, 24 Jun 2021 15:29:38 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH v4 0/2] docs/core-api: add memory_hotplug and protection keys
Date:   Thu, 24 Jun 2021 15:30:41 +0800
Message-Id: <cover.1624517569.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxH0BiNNRgIvQWAA--.5239S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKF18JF4kAr18Xw4kCFy3Jwb_yoWfCFX_Za
        n7XFWkAw4xAFn3tFZ3Xr13JrWY9F40k39YyFy5t39rtrZ0yrsruryqq3sYgFW5tF4DJrW3
        KFZ7Ww1SqF9rGjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb3xFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
        6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
        Y2ka0xkIwI1lc2xSY4AK67AK6r4xMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
        1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
        b7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
        vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1l
        IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
        C2KfnxnUUI43ZEXa7VUbhiSPUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v4:

* pick Xiangcheng's Review-by tag.

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

