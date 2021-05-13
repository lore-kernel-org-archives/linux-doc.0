Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73BA7C433ED
	for <linux-doc@archiver.kernel.org>; Thu, 13 May 2021 19:06:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F255613E6
	for <linux-doc@archiver.kernel.org>; Thu, 13 May 2021 19:06:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232116AbhEMTHQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 May 2021 15:07:16 -0400
Received: from m32-153.88.com ([43.250.32.153]:10003 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231570AbhEMTHP (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 13 May 2021 15:07:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=5TrxHJroB5Z7eHUuS5jW6f77zmOsoMmEvUcsc
        jez9kM=; b=CFg7qmaFoaeYKDvA6Dt+E/H5lTQ2gDS/83MMKgUnGM7rASWq5066+
        vc+ty3hz+8e6wz6ULfL7sRGIIUBsjGkrdwwqH4nHPmpeKlcPcGbyvCGkCNmjVw3u
        C7vj9VLiWZAyqifC68ejjfXxAT418ysCBHTaEpwdgrARqiT6+rxqEQ=
Received: from bobwxc.top (unknown [112.96.109.117])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgAHVliWeJ1g704vAA--.53953S2;
        Fri, 14 May 2021 03:06:00 +0800 (CST)
Date:   Fri, 14 May 2021 03:05:57 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v3 0/6] docs/zh_CN: Add translation zh_CN/maintainer/index.rst
Message-ID: <cover.1620932189.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgAHVliWeJ1g704vAA--.53953S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJrykCF4fXFy5CrWkAFyrZwb_yoW8uw13pa
        1Igrn3G3WkAF17CF4fGFyUXF15Ja4fC3y5GrnxW3Z5tryvy3yYyrWUtF9I9rZxWr48XF43
        Zw4SkF1ku395CFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUqqb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2
        z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8JVW8Jr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4U
        Jr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCF04
        k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
        wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc4
        0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
        xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
        1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7xRRJPEDUU
        UUU==
X-Originating-IP: [112.96.109.117]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi all,

This set of patches aims to add translations zh_CN/maintainer.

v3:
* rebase to newest jc/docs-next tree

v2:
<https://lore.kernel.org/linux-doc/87sg2q63sd.fsf@meer.lwn.net/T/>
* Modified some words in [Patch 3-4/6] under Yanteng Si's advices.
  Thanks for his review!
* Pick Yanteng Si's reviewed-by tag for [Patch 1-6/6]

v1:
<https://lore.kernel.org/linux-doc/cover.1619093668.git.bobwxc@email.cn/T/#t>

Please note that since each patch need to modify their own entry
in zh_CN/maintainer/index.rst, patches should be applied in order.

Thanks!

Base on jc/docs-next

Wu XiangCheng (6):
  docs/zh_CN: Add translation zh_CN/maintainer/index.rst
  docs/zh_CN: Add translation zh_CN/maintainer/configure-git.rst
  docs/zh_CN: Add translation zh_CN/maintainer/rebasing-and-merging.rst
  docs/zh_CN: Add translation zh_CN/maintainer/pull-requests.rst
  docs/zh_CN: Add translation
    zh_CN/maintainer/maintainer-entry-profile.rst
  docs/zh_CN: Add translation zh_CN/maintainer/modifying-patches.rst

 Documentation/translations/zh_CN/index.rst    |   2 +-
 .../zh_CN/maintainer/configure-git.rst        |  62 +++++++
 .../translations/zh_CN/maintainer/index.rst   |  21 +++
 .../maintainer/maintainer-entry-profile.rst   |  92 ++++++++++
 .../zh_CN/maintainer/modifying-patches.rst    |  51 ++++++
 .../zh_CN/maintainer/pull-requests.rst        | 148 ++++++++++++++++
 .../zh_CN/maintainer/rebasing-and-merging.rst | 166 ++++++++++++++++++
 7 files changed, 541 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/maintainer/configure-git.rst
 create mode 100644 Documentation/translations/zh_CN/maintainer/index.rst
 create mode 100644 Documentation/translations/zh_CN/maintainer/maintainer-entry-profile.rst
 create mode 100644 Documentation/translations/zh_CN/maintainer/modifying-patches.rst
 create mode 100644 Documentation/translations/zh_CN/maintainer/pull-requests.rst
 create mode 100644 Documentation/translations/zh_CN/maintainer/rebasing-and-merging.rst

-- 
2.20.1

