Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF96C433B4
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 07:50:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DEF45613A9
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 07:50:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239759AbhDGHuX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Apr 2021 03:50:23 -0400
Received: from [43.250.32.171] ([43.250.32.171]:27383 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S234159AbhDGHuW (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 7 Apr 2021 03:50:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=VGcvhjEhn69onn9z8U9Q1/PbO3AQjHdJ6Ntkl
        DKfJ40=; b=n9rwG5L8HlD10H2qbXgGuAk78H21RYnj4kjq0nT74HlJ8+kMqoh76
        VSChBsArovOS37uoarOF5zu81eSy2B+MbYJ4NbtIhquUsnWqJJKCFgQhTVXcLAZp
        V6NxiOKVomkIDh84hdGmGBaIfnCbgIXkeUUK0KMNr2QI9fqpUnzxR0=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgA3qtAtZG1gv15QAA--.48844S2;
        Wed, 07 Apr 2021 15:50:07 +0800 (CST)
Date:   Wed, 7 Apr 2021 15:50:05 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Alex Shi <alexs@kernel.org>
Cc:     Alex Shi <seakeel@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Jonathan Corbet <corbet@lwn.net>,
        YanTeng Si <sterlingteng@gmail.com>, linux-doc@vger.kernel.org
Subject: [PATCH v3 0/8] docs/zh_CN: Add translations in zh_CN/doc-guide/
Message-ID: <cover.1617699755.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgA3qtAtZG1gv15QAA--.48844S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXFWUJF47uw1rWFWDtry8Grg_yoW5XryUpa
        1rKryfG3WkAr15KrWfGFWUCF1rCa1xuwsYg34xXw1ftr95Kr4qqrWjkry2gr9xAr10vFn0
        vF4Skr1Uu3yUAFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgSb7Iv0xC_tr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2
        z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcx
        kEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWx
        Jr1UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc2xSY4AK67AK6r4xMxAIw2
        8IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_
        Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
        CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
        I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
        8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2Kfnx
        nUUI43ZEXa7IUUa9aPUUUUU==
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi all,

This set of patches add some translations in zh_CN/doc-guide/

V3:
* Add NEW [Patch 4~6/8]
  docs/zh_CN: Add translation zh_CN/doc-guide/parse-headers.rst
  docs/zh_CN: Add translation zh_CN/doc-guide/contributing.rst
  docs/zh_CN: Add translation zh_CN/doc-guide/maintainer-profile.rst
* Pick YanTeng Si' Reviewed-by tags for [Patch 1~3/8] [Patch 7~8/8]
* Adjust patches order

V2:
<https://lore.kernel.org/linux-doc/cover.1617412012.git.bobwxc@email.cn/T/>
* Modify some words and add missed sentences under YanTeng Si's
  suggestion. Thanks for his rewiew!
* Specific changes see <http://fars.ee/n5rt/diff>
* Add Cc: tag for YanTeng Si.

V1:
<https://lore.kernel.org/linux-doc/cover.1617260163.git.bobwxc@email.cn/T/>

base: next tree
  commit 3501c960dfda ("docs/zh_CN: Add translations in zh_CN/kernel-hacking/")

Thanks!

Wu XiangCheng (8):
  docs/zh_CN: Add translation zh_CN/doc-guide/sphinx.rst
  docs/zh_CN: Add two image example files
  docs/zh_CN: Add translation zh_CN/doc-guide/kernel-doc.rst
  docs/zh_CN: Add translation zh_CN/doc-guide/parse-headers.rst
  docs/zh_CN: Add translation zh_CN/doc-guide/contributing.rst
  docs/zh_CN: Add translation zh_CN/doc-guide/maintainer-profile.rst
  docs/zh_CN: Add translation zh_CN/doc-guide/index.rst
  docs/zh_CN: Link zh_CN/doc-guide to zh_CN/index.rst

 .../zh_CN/doc-guide/contributing.rst          | 238 +++++++++
 .../translations/zh_CN/doc-guide/hello.dot    |   3 +
 .../translations/zh_CN/doc-guide/index.rst    |  27 +
 .../zh_CN/doc-guide/kernel-doc.rst            | 500 ++++++++++++++++++
 .../zh_CN/doc-guide/maintainer-profile.rst    |  43 ++
 .../zh_CN/doc-guide/parse-headers.rst         | 182 +++++++
 .../translations/zh_CN/doc-guide/sphinx.rst   | 415 +++++++++++++++
 .../zh_CN/doc-guide/svg_image.svg             |  10 +
 Documentation/translations/zh_CN/index.rst    |   1 +
 9 files changed, 1419 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/doc-guide/contributing.rst
 create mode 100644 Documentation/translations/zh_CN/doc-guide/hello.dot
 create mode 100644 Documentation/translations/zh_CN/doc-guide/index.rst
 create mode 100644 Documentation/translations/zh_CN/doc-guide/kernel-doc.rst
 create mode 100644 Documentation/translations/zh_CN/doc-guide/maintainer-profile.rst
 create mode 100644 Documentation/translations/zh_CN/doc-guide/parse-headers.rst
 create mode 100644 Documentation/translations/zh_CN/doc-guide/sphinx.rst
 create mode 100644 Documentation/translations/zh_CN/doc-guide/svg_image.svg

-- 
2.20.1

