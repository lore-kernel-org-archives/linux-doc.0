Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62969C433ED
	for <linux-doc@archiver.kernel.org>; Sun, 25 Apr 2021 02:25:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3873561078
	for <linux-doc@archiver.kernel.org>; Sun, 25 Apr 2021 02:25:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbhDYC0K (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 24 Apr 2021 22:26:10 -0400
Received: from [43.250.32.171] ([43.250.32.171]:54408 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S229514AbhDYC0K (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 24 Apr 2021 22:26:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=kyHm5lENNLUQ42mZWnpQwgbDMDZTSQUkHpW3K
        sOCIa8=; b=KPtb13osE5QRMO8/vFvrHxTM8SMun3mnHUn0WUL89v76dpZZlR5yX
        H9f7TKRUj4hYjHVvKf69gec9gb8K2+DeCwz6d+AbHwJ2JMY4ycArl/eeKRDCJPnI
        oU1Um8eD4IhmyBBbPxVO+2w9l8LdLRckluWXOQIctzxrJI44lCM93E=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgBngj8J04RgWJoIAA--.2712S2;
        Sun, 25 Apr 2021 10:25:14 +0800 (CST)
Date:   Sun, 25 Apr 2021 10:25:12 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>,
        hjh <huangjianghui@uniontech.com>
Subject: [PATCH v2 0/6] docs/zh_CN: Add translation zh_CN/maintainer
Message-ID: <cover.1619278582.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgBngj8J04RgWJoIAA--.2712S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJrykCF4fXFy5GF15CFy8Xwb_yoW8ury7pa
        1Igrn3C3WkAF17CF4fGFyUXF15Ja4Sk3y5GrnxW3Z5tryvy3yYyryUtF9I9rW3Wr48XF43
        Zw4SkF1kW395CFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUqab7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzx
        vE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_Cr1U
        Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxAIw2
        8IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
        xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrx
        kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
        6r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
        CI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0zR_Oz3UUUUU
        =
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi all,

This set of patches aims to add translations zh_CN/maintainer.

v2:
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

 Documentation/translations/zh_CN/index.rst    |   1 +
 .../zh_CN/maintainer/configure-git.rst        |  62 +++++++
 .../translations/zh_CN/maintainer/index.rst   |  21 +++
 .../maintainer/maintainer-entry-profile.rst   |  92 ++++++++++
 .../zh_CN/maintainer/modifying-patches.rst    |  51 ++++++
 .../zh_CN/maintainer/pull-requests.rst        | 148 ++++++++++++++++
 .../zh_CN/maintainer/rebasing-and-merging.rst | 166 ++++++++++++++++++
 7 files changed, 541 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/maintainer/configure-git.rst
 create mode 100644 Documentation/translations/zh_CN/maintainer/index.rst
 create mode 100644 Documentation/translations/zh_CN/maintainer/maintainer-entry-profile.rst
 create mode 100644 Documentation/translations/zh_CN/maintainer/modifying-patches.rst
 create mode 100644 Documentation/translations/zh_CN/maintainer/pull-requests.rst
 create mode 100644 Documentation/translations/zh_CN/maintainer/rebasing-and-merging.rst


base-commit: 441ca977a84dadac6173db7c07c25db110b76c1e
-- 
2.20.1

