Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EFDFC433ED
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 07:06:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B436A610CB
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 07:06:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233371AbhDAHGL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Apr 2021 03:06:11 -0400
Received: from [43.250.32.171] ([43.250.32.171]:61882 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S229539AbhDAHFo (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 1 Apr 2021 03:05:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=0QB4h50hZuLr3iOwOaq9YirqUfeGldMZUeHOZ
        5T6QQQ=; b=lGIPIG2Oy8Svvvbx8cICMNUH0wdia0y9FU8YThwS4m1THj6ZEXE9J
        +QoOpCs96Em651oOCwZZ6qikCQcnmkGbADVuNddqm8VFOgxURZzrmwhijKHjAIwG
        0jzBrb62NilPzJAQ2O64WQr8qX5qmO9P1tz3RA+7Gr9ipwib3udwUY=
Received: from mipc (unknown [120.238.248.129])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgB36c+7cGVgxqBFAA--.24088S2;
        Thu, 01 Apr 2021 15:05:33 +0800 (CST)
Date:   Thu, 1 Apr 2021 15:05:31 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Alex Shi <alexs@kernel.org>
Cc:     Alex Shi <seakeel@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 0/5] docs/zh_CN: Add translations in zh_CN/doc-guide/
Message-ID: <cover.1617260163.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-today: happy
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgB36c+7cGVgxqBFAA--.24088S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WFWrKFyDtw15Cr4fCw1DAwb_yoW8Jw1rpF
        45KryfG3Wqyr13Kw1fWFWUCF1rCa1xuws5K34Iqw1Fqr95Kr4vqrWDKry2gFZxJr10vFn8
        ZF4Fkr4Uu34UAFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgab7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2
        z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0x
        vYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_
        Cr1UJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkIecxEwVAFwVW8CwCF04
        k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j
        6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
        AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
        2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
        C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73
        UjIFyTuYvjxUUJ5rDUUUU
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi all,

This set of patches add some translations in zh_CN/doc-guide/

Thanks!

base: next tree
  commit 3501c960dfda ("docs/zh_CN: Add translations in zh_CN/kernel-hacking/")

Wu XiangCheng (5):
  docs/zh_CN: Add translation zh_CN/doc-guide/index.rst
  docs/zh_CN: Link zh_CN/doc-guide to zh_CN/index.rst
  docs/zh_CN: Add translation zh_CN/doc-guide/sphinx.rst
  docs/zh_CN: Add two image example files
  docs/zh_CN: Add translation zh_CN/doc-guide/kernel-doc.rst

 .../translations/zh_CN/doc-guide/hello.dot    |   3 +
 .../translations/zh_CN/doc-guide/index.rst    |  30 ++
 .../zh_CN/doc-guide/kernel-doc.rst            | 497 ++++++++++++++++++
 .../translations/zh_CN/doc-guide/sphinx.rst   | 415 +++++++++++++++
 .../zh_CN/doc-guide/svg_image.svg             |  10 +
 Documentation/translations/zh_CN/index.rst    |   1 +
 6 files changed, 956 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/doc-guide/hello.dot
 create mode 100644 Documentation/translations/zh_CN/doc-guide/index.rst
 create mode 100644 Documentation/translations/zh_CN/doc-guide/kernel-doc.rst
 create mode 100644 Documentation/translations/zh_CN/doc-guide/sphinx.rst
 create mode 100644 Documentation/translations/zh_CN/doc-guide/svg_image.svg

-- 
2.20.1

