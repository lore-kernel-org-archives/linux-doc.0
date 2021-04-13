Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30C24C433ED
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 07:11:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB8AC613B7
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 07:11:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230283AbhDMHLb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Apr 2021 03:11:31 -0400
Received: from m32-153.88.com ([43.250.32.153]:41150 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229544AbhDMHLa (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Apr 2021 03:11:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=lX2PNSt8zaPsNRLbRJCpRSkanGtdcuN3CTkSy
        Wo3CVQ=; b=KZnWXczpAomaDD5nIKl19ls1B/PTlBZ5rXb5K4yU2vegLfT8SG8iN
        0MvSYkFlQw7mfQNV+xnkGDheVq6N8yKH+rjOmaPku0GbOBVWjXxbAmnhIJ6E8Hb0
        pkSOmeH9wiPbo+ZraXgg7YbQgbmh50XUN4fSZGViHhRlsRag82Eb5A=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgCHEyQGRHVgWSdtAA--.59008S2;
        Tue, 13 Apr 2021 15:11:04 +0800 (CST)
Date:   Tue, 13 Apr 2021 15:11:02 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Alex Shi <alexs@kernel.org>
Cc:     Alex Shi <seakeel@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
        YanTeng Si <sterlingteng@gmail.com>, linux-doc@vger.kernel.org
Subject: [PATCH v5 0/7] docs/zh_CN: Add translations in zh_CN/doc-guide/
Message-ID: <cover.1618295149.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgCHEyQGRHVgWSdtAA--.59008S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZr1rJFW3ur1DCrWDJFW8JFb_yoW5AF1xpF
        4rKryfG3WkZF1Ykw4fGrWUZF1rXF4ruw4Sgw1xXw1rtr95KF10qrWjkry2gr98Ar4FyFn0
        va1fKr1UurWUZFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgIb7Iv0xC_KF4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4U
        Jr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY02Avz4vE14v_GF4l42xK82
        IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWxJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8
        JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1V
        AFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xII
        jxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4
        A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU
        0xZFpf9x07Ue6wZUUUUU=
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi all,

This set of patches add some translations in zh_CN/doc-guide/ .

V5:
* Modified some words under YanTeng Si and Alex Shi's suggestions.
  Thanks for theirs rewiew!
* Make title signs number equal to the title chars
* Drop [PATCH v3 2/8] docs/zh_CN: Add two image example files, use original
  images
* Pick YanTeng Si's Review-by tag for [Patch 5/7]

V4:
<https://lore.kernel.org/linux-doc/20210408141024.GA8507@bobwxc.top/>
* Modified some words in [Patch 4/7] under YanTeng Si's suggestions.
* Pick YanTeng Si's Review-by tag for [Patch 4/7]

V3:
<https://lore.kernel.org/linux-doc/cover.1617699755.git.bobwxc@email.cn/T/>
* Add NEW [Patch 3~5/8]
  docs/zh_CN: Add translation zh_CN/doc-guide/parse-headers.rst
  docs/zh_CN: Add translation zh_CN/doc-guide/contributing.rst
  docs/zh_CN: Add translation zh_CN/doc-guide/maintainer-profile.rst
* Pick YanTeng Si' Reviewed-by tags for [Patch 1~2/7] [Patch 6~7/7]
* Adjust patches order

V2:
<https://lore.kernel.org/linux-doc/cover.1617412012.git.bobwxc@email.cn/T/>
* Modified some words and add missed sentences under YanTeng Si's
  suggestion. Thanks for his rewiew!
* Specific changes see <http://fars.ee/n5rt/diff>
* Add Cc: tag for YanTeng Si.

V1:
<https://lore.kernel.org/linux-doc/cover.1617260163.git.bobwxc@email.cn/T/>

base: next tree
commit 3501c960dfda ("docs/zh_CN: Add translations in zh_CN/kernel-hacking/")

Thanks!

Wu XiangCheng (7):
  docs/zh_CN: Add translation zh_CN/doc-guide/sphinx.rst
  docs/zh_CN: Add translation zh_CN/doc-guide/kernel-doc.rst
  docs/zh_CN: Add translation zh_CN/doc-guide/parse-headers.rst
  docs/zh_CN: Add translation zh_CN/doc-guide/contributing.rst
  docs/zh_CN: Add translation zh_CN/doc-guide/maintainer-profile.rst
  docs/zh_CN: Add translation zh_CN/doc-guide/index.rst
  docs/zh_CN: Link zh_CN/doc-guide to zh_CN/index.rst

 .../zh_CN/doc-guide/contributing.rst          | 238 +++++++++
 .../translations/zh_CN/doc-guide/index.rst    |  27 +
 .../zh_CN/doc-guide/kernel-doc.rst            | 500 ++++++++++++++++++
 .../zh_CN/doc-guide/maintainer-profile.rst    |  43 ++
 .../zh_CN/doc-guide/parse-headers.rst         | 187 +++++++
 .../translations/zh_CN/doc-guide/sphinx.rst   | 415 +++++++++++++++
 Documentation/translations/zh_CN/index.rst    |   1 +
 7 files changed, 1411 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/doc-guide/contributing.rst
 create mode 100644 Documentation/translations/zh_CN/doc-guide/index.rst
 create mode 100644 Documentation/translations/zh_CN/doc-guide/kernel-doc.rst
 create mode 100644 Documentation/translations/zh_CN/doc-guide/maintainer-profile.rst
 create mode 100644 Documentation/translations/zh_CN/doc-guide/parse-headers.rst
 create mode 100644 Documentation/translations/zh_CN/doc-guide/sphinx.rst

-- 
2.20.1

