Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC9DFC433ED
	for <linux-doc@archiver.kernel.org>; Mon, 17 May 2021 10:34:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B414E61241
	for <linux-doc@archiver.kernel.org>; Mon, 17 May 2021 10:34:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231754AbhEQKf1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 May 2021 06:35:27 -0400
Received: from [43.250.32.171] ([43.250.32.171]:5611 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S233962AbhEQKf1 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 17 May 2021 06:35:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=P44t/xemdU0h5mdfKQIBh1IPAHcjUhVuLC2Yb
        bGgUdU=; b=kfLNom50yTOYzmtfZpdPn7iiwDLbLxeaMbi9ujNrDBzAy9CYIZy3e
        FjGjSfchb7NlNeltnEv8EcNiUzmOpoQQ3Pt8km3TjtQXWpdzO+QIXUfzZ3V6uy1i
        ODq55gsAJnutw/fmp2qWuXYb93QH1Tn0fUBEa7pQXTUBCGjUuNCKFw=
Received: from bobwxc.top (unknown [120.238.248.9])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgBnLkGcRqJgd+EuAA--.48447S2;
        Mon, 17 May 2021 18:34:06 +0800 (CST)
Date:   Mon, 17 May 2021 18:34:04 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v4 0/6] docs/zh_CN: Add translation zh_CN/maintainer
Message-ID: <cover.1621243426.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgBnLkGcRqJgd+EuAA--.48447S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJrykCF4fXFWDKF17tFy5urg_yoW8KF13pa
        1Igrn3G3WkAF17Ca1fGF1UXF15Ja4fC3y5GrnxW3Z5trWvyrWYyrWUtF9I9r9xWr48XF43
        Zw4SkF1ku395AFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUqSb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4U
        Jr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCF04
        k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
        wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc4
        0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
        xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
        1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvj4RRbyZUUUU
        U
X-Originating-IP: [120.238.248.9]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi all,

This set of patches aims to add translations zh_CN/maintainer.

v4:
* Modified translation of word "backport" and a sentence under Alex
  Shi's suggestion, thanks.

v3:
<https://lore.kernel.org/linux-doc/cover.1620932189.git.bobwxc@email.cn/T/#t>
* Rebase to newest jc/docs-next tree

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
 .../zh_CN/maintainer/rebasing-and-merging.rst | 165 ++++++++++++++++++
 7 files changed, 540 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/maintainer/configure-git.rst
 create mode 100644 Documentation/translations/zh_CN/maintainer/index.rst
 create mode 100644 Documentation/translations/zh_CN/maintainer/maintainer-entry-profile.rst
 create mode 100644 Documentation/translations/zh_CN/maintainer/modifying-patches.rst
 create mode 100644 Documentation/translations/zh_CN/maintainer/pull-requests.rst
 create mode 100644 Documentation/translations/zh_CN/maintainer/rebasing-and-merging.rst

-- 
2.20.1

