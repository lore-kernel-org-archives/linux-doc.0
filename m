Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 514EEC433DB
	for <linux-doc@archiver.kernel.org>; Sun, 28 Feb 2021 05:38:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1138164E54
	for <linux-doc@archiver.kernel.org>; Sun, 28 Feb 2021 05:38:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230040AbhB1Fh7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 28 Feb 2021 00:37:59 -0500
Received: from [43.250.32.171] ([43.250.32.171]:19535 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S230008AbhB1Fh6 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 28 Feb 2021 00:37:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=iQ0Ca31M3cLuRV3UFnYzeLr+uRVPC3B1Ow7Ef
        yz9iQI=; b=JDRsFii8fc1ZenMWydk7nqATVFjc2pC5Xoc7TWhtrcNOZ6xQO1Mm8
        QHGXEMWu7MUUsd0A6pAew+CqGVijMapCCmP+3EUbqrCmKYdn02/eFiZfHvn/CXrE
        ynXBkPLsXfBbwfmIqLgNRMi3G90le+wBFXh6Qa/p+EQo34567T4Wtw=
Received: from mipc (unknown [120.238.248.239])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgA3qtAMLDtgOMwJAA--.25872S2;
        Sun, 28 Feb 2021 13:37:17 +0800 (CST)
Date:   Sun, 28 Feb 2021 13:37:16 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Alex Shi <alex.shi@linux.alibaba.com>
Cc:     Harry Wei <harryxiyou@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Subject: [PATCH v2 0/9] docs/zh_CN: Improve language in zh_CN/process/
Message-ID: <cover.1614488009.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgA3qtAMLDtgOMwJAA--.25872S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw1kJFW8tr4UtrW7Cr48WFg_yoW8CF4fpF
        13Krn5uF48u3Wa93yfG3yxZFyrGF18Xa9xtrsrt34Sqr1rCw17Xry7Jr18W3yDWrySk3Z8
        XrWfJFWUuFy2vFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUqSb7Iv0xC_tr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4U
        Jr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCF04
        k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
        wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc4
        0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
        xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
        1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUUVyIUUUU
        U
X-Originating-IP: [120.238.248.239]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi all,

This set of patchs aims to polish context, improve on fluency, idiomatic
and grammar in some files in zh_CN/process/, and synchronize them with 
original files. Some structure modifications need to rewrite the whole 
sentences, so here are a lot of changes.

* V0
** Add [Patch 1/9] ~ [Patch 5/9] 

* V1
** Add [Patch 6/9] ~ [Patch 9/9]
** Modified [Patch 1/9] ~ [Patch 5/9] under Alex Shi's suggestions.
   Previous discussions see:
     <https://lore.kernel.org/linux-doc/20210219090947.GA15328@mipc/>

* V2
** Modified [Patch 6/9] ~ [Patch 9/9] under Alex Shi's suggestions.
   Previous discussions see:
     <https://lore.kernel.org/linux-doc/cover.1614162064.git.bobwxc@email.cn/>
** No other new change.

Thanks!

Wu XiangCheng (9):
  docs/zh_CN: Improve zh_CN/process/index.rst
  docs/zh_CN: Improve zh_CN/process/1.Intro.rst
  docs/zh_CN: Improve zh_CN/process/2.Process.rst
  docs/zh_CN: Improve zh_CN/process/3.Early-stage.rst
  docs/zh_CN: Improve zh_CN/process/4.Coding.rst
  docs/zh_CN: Improve zh_CN/process/5.Posting.rst
  docs/zh_CN: Improve zh_CN/process/6.Followthrough
  docs/zh_CN: Improve zh_CN/process/7.AdvancedTopics
  docs/zh_CN: Improve zh_CN/process/8.Conclusion.rst

 .../translations/zh_CN/process/1.Intro.rst    | 155 +++++----
 .../translations/zh_CN/process/2.Process.rst  | 319 +++++++++---------
 .../zh_CN/process/3.Early-stage.rst           | 131 +++----
 .../translations/zh_CN/process/4.Coding.rst   | 262 +++++++-------
 .../translations/zh_CN/process/5.Posting.rst  | 223 ++++++------
 .../zh_CN/process/6.Followthrough.rst         | 141 ++++----
 .../zh_CN/process/7.AdvancedTopics.rst        | 121 ++++---
 .../zh_CN/process/8.Conclusion.rst            |  57 ++--
 .../translations/zh_CN/process/index.rst      |  10 +-
 9 files changed, 739 insertions(+), 680 deletions(-)

-- 
2.20.1

