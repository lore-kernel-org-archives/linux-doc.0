Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E1E1C433ED
	for <linux-doc@archiver.kernel.org>; Sat,  3 Apr 2021 01:24:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F335C611AC
	for <linux-doc@archiver.kernel.org>; Sat,  3 Apr 2021 01:24:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234821AbhDCBYE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 2 Apr 2021 21:24:04 -0400
Received: from m32-153.88.com ([43.250.32.153]:24744 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234488AbhDCBYD (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 2 Apr 2021 21:24:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=0VZRqpo4WvX3JU1xbEj+nx0pgMJXLjx8r71rt
        PPhOas=; b=bfMCoh8lB+kXjOziUW4VSdd7lkMDaLIPpWq/wphH7yjUcLJU0NPgh
        LU0CYYsCFI6+xBVgj0vSFgVVBysMAomWRcGNE+BzLLWoOVghOVlNa9Ie9WBf79Yz
        ZwUClLPvZ3j+Gu84DnMW3NfANaZCxmtVr2wyKyc8t4F/SNuqcxJDmQ=
Received: from mipc (unknown [120.238.248.129])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgAXoiKkw2dg3oJYAA--.64137S2;
        Sat, 03 Apr 2021 09:23:50 +0800 (CST)
Date:   Sat, 3 Apr 2021 09:23:48 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Alex Shi <alexs@kernel.org>
Cc:     Alex Shi <seakeel@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Jonathan Corbet <corbet@lwn.net>,
        YanTeng Si <sterlingteng@gmail.com>, linux-doc@vger.kernel.org
Subject: [PATCH v2 0/5] docs/zh_CN: Add translations in zh_CN/doc-guide/
Message-ID: <cover.1617412012.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgAXoiKkw2dg3oJYAA--.64137S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WFWrAFWfXr4rAFW3Kry5twb_yoW8Wr4xpF
        45KryfG3WqvF15K3yfGFWUCF1rCa1xuws5K34Iqw1rtr95Kr4vvrWDKry2grZxAr40yFn0
        vF4Skr1Uu3yUCFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgYb7Iv0xC_Zr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2
        z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r4UJwAS0I0E0xvYzx
        vE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_Cr1U
        Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkIecxEwVAFwVWkMxAIw28Icx
        kI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l
        x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
        v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IY
        x2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
        Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZF
        pf9x07UniSdUUUUU=
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi all,

This set of patches add some translations in zh_CN/doc-guide/

V2:
* Modify some words and add missed sentences under YanTeng Si's
  suggestion. Thanks for his rewiew!
* Specific changes see <http://fars.ee/n5rt/diff>
* Add Cc: tag for YanTeng Si.

V1:
<https://lore.kernel.org/linux-doc/cover.1617260163.git.bobwxc@email.cn/T/>

base: next tree
  commit 3501c960dfda ("docs/zh_CN: Add translations in zh_CN/kernel-hacking/")

Thanks!

Wu XiangCheng (5):
  docs/zh_CN: Add translation zh_CN/doc-guide/index.rst
  docs/zh_CN: Link zh_CN/doc-guide to zh_CN/index.rst
  docs/zh_CN: Add translation zh_CN/doc-guide/sphinx.rst
  docs/zh_CN: Add two image example files
  docs/zh_CN: Add translation zh_CN/doc-guide/kernel-doc.rst

 .../translations/zh_CN/doc-guide/hello.dot    |   3 +
 .../translations/zh_CN/doc-guide/index.rst    |  30 ++
 .../zh_CN/doc-guide/kernel-doc.rst            | 500 ++++++++++++++++++
 .../translations/zh_CN/doc-guide/sphinx.rst   | 415 +++++++++++++++
 .../zh_CN/doc-guide/svg_image.svg             |  10 +
 Documentation/translations/zh_CN/index.rst    |   1 +
 6 files changed, 959 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/doc-guide/hello.dot
 create mode 100644 Documentation/translations/zh_CN/doc-guide/index.rst
 create mode 100644 Documentation/translations/zh_CN/doc-guide/kernel-doc.rst
 create mode 100644 Documentation/translations/zh_CN/doc-guide/sphinx.rst
 create mode 100644 Documentation/translations/zh_CN/doc-guide/svg_image.svg

-- 
2.20.1

