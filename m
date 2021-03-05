Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6BE3C433DB
	for <linux-doc@archiver.kernel.org>; Fri,  5 Mar 2021 05:25:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A026565015
	for <linux-doc@archiver.kernel.org>; Fri,  5 Mar 2021 05:25:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbhCEFZr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 5 Mar 2021 00:25:47 -0500
Received: from m32-153.88.com ([43.250.32.153]:42210 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229448AbhCEFZq (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 5 Mar 2021 00:25:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=+er7pFkfN4H5wS+R/VsPzf0FP78e6XQP87bOb
        wZKIw8=; b=HkrOnZJ2rUOlN3HAFVWNmx3CWTxzSsf3qO27RavNEafdys3p3wL0Y
        EGCTkFYyN4x9JzIdslMhcjL+DKBgbELtDYq0JbSvdeYM4wkHJr4bNN/2/zSuXByl
        To3Wnb2FiEHV5HZ61ls4FNbV4zknUGlMD81Y4iYlaNtAdTPV3jgB90=
Received: from mipc (unknown [120.238.248.239])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgCHEyTQwEFgqkkXAA--.64092S2;
        Fri, 05 Mar 2021 13:25:38 +0800 (CST)
Date:   Fri, 5 Mar 2021 13:25:36 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Alex Shi <alex.shi@linux.alibaba.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH v3 0/9] docs/zh_CN: Improve language in zh_CN/process/
Message-ID: <cover.1614920267.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgCHEyTQwEFgqkkXAA--.64092S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw1kJFW8tr4UtrW7Cr48WFg_yoW5JryDpF
        13Krn5uF18u3Wa93yfG3yxZF1rJF1rXa9xtrsrK34Iqr1rCw1UXr9akr18X34DXrWSk3Z8
        XrWfJFWj9Fy2vrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUqab7Iv0xC_KF4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzx
        vE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_Cr1U
        Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxAIw2
        8IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
        xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrx
        kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
        6r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
        CI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07UbyCJUUUUU
        =
X-Originating-IP: [120.238.248.239]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi all,
 
This set of patches aims to polish context, improve on fluency, idiomatic
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

* V3
** Modified some words in [Patch 4/9] under Alex Shi's suggestions.
   Previous discussions see:
     <https://lore.kernel.org/linux-doc/f11fd22b-705b-3258-9551-e202b6c3b03b@linux.alibaba.com/>
** Refill shorter lines in all patches under Alex Shi's suggestion.
   Previous discussions see:
     <https://lore.kernel.org/linux-doc/f71b3159-7ea4-c482-8383-7d113ef68511@linux.alibaba.com/>
** Add Alex Shi's Reviewed-by tag.
   See:
     <https://lore.kernel.org/linux-doc/7df50b3b-9990-a816-0f45-e7324a490106@linux.alibaba.com/>
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

 .../translations/zh_CN/process/1.Intro.rst    | 195 +++++-----
 .../translations/zh_CN/process/2.Process.rst  | 345 +++++++++---------
 .../zh_CN/process/3.Early-stage.rst           | 139 +++----
 .../translations/zh_CN/process/4.Coding.rst   | 279 +++++++-------
 .../translations/zh_CN/process/5.Posting.rst  | 243 ++++++------
 .../zh_CN/process/6.Followthrough.rst         | 165 +++++----
 .../zh_CN/process/7.AdvancedTopics.rst        | 141 +++----
 .../zh_CN/process/8.Conclusion.rst            |  60 +--
 .../translations/zh_CN/process/index.rst      |  10 +-
 9 files changed, 815 insertions(+), 762 deletions(-)

-- 
2.20.1

