Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F64C433B4
	for <linux-doc@archiver.kernel.org>; Thu, 22 Apr 2021 12:26:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9BF3260E0C
	for <linux-doc@archiver.kernel.org>; Thu, 22 Apr 2021 12:26:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235232AbhDVM1H (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 22 Apr 2021 08:27:07 -0400
Received: from [43.250.32.171] ([43.250.32.171]:28077 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S230510AbhDVM1H (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 22 Apr 2021 08:27:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=CGOE8QASqaAxCYYMCvxIwL5nnv3QsBdzZekQu
        AWRc6o=; b=UICJ2DYoXozdORBYCnqFzorbmMf5M02kCgGsVPgLXbGrOp2oTbxV/
        QxnrmbkAwCjWwZvW8bvgBPaL4/b4KXLvIt+hQQGcCFU6U5B3GSE3yPJ6SskVjZe8
        6cKtzDHa01AW+6T7AojNRseMCixZA6xTOt0tzbujiT27isFiXgC1wA=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgBnLkFra4FgFvQDAA--.12081S2;
        Thu, 22 Apr 2021 20:26:21 +0800 (CST)
Date:   Thu, 22 Apr 2021 20:26:19 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Alex Shi <alexs@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>,
        hjh <huangjianghui@uniontech.com>
Subject: [PATCH 0/6] docs/zh_CN: Add translation zh_CN/maintainer
Message-ID: <cover.1619093668.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgBnLkFra4FgFvQDAA--.12081S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJrykCF4fXw17XrWktw1kKrg_yoW8Cry8p3
        WIgr93C3WkAF17CF4fGFyUXF15Ja4Ik3y5GrnxW3Z5tryvy3yYyFyUtF9I9FW3WF48XF43
        Zw4fCF1kW395CFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUg2b7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4U
        Jr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY02Avz4vE14v_Xr1l42xK82
        IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWxJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8
        JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1V
        AFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xII
        jxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4
        A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI
        43ZEXa7IUUBWlPUUUUU==
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi all,

This set of patches aims to add translations zh_CN/maintainer. 

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

 Documentation/translations/zh_CN/index.rst    |   1 +
 .../zh_CN/maintainer/configure-git.rst        |  62 +++++++
 .../translations/zh_CN/maintainer/index.rst   |  21 +++
 .../maintainer/maintainer-entry-profile.rst   |  92 ++++++++++
 .../zh_CN/maintainer/modifying-patches.rst    |  51 ++++++
 .../zh_CN/maintainer/pull-requests.rst        | 148 ++++++++++++++++
 .../zh_CN/maintainer/rebasing-and-merging.rst | 165 ++++++++++++++++++
 7 files changed, 540 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/maintainer/configure-git.rst
 create mode 100644 Documentation/translations/zh_CN/maintainer/index.rst
 create mode 100644 Documentation/translations/zh_CN/maintainer/maintainer-entry-profile.rst
 create mode 100644 Documentation/translations/zh_CN/maintainer/modifying-patches.rst
 create mode 100644 Documentation/translations/zh_CN/maintainer/pull-requests.rst
 create mode 100644 Documentation/translations/zh_CN/maintainer/rebasing-and-merging.rst


base-commit: 441ca977a84dadac6173db7c07c25db110b76c1e
-- 
2.20.1

