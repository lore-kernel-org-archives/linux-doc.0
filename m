Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A14C4743C
	for <linux-doc@archiver.kernel.org>; Wed, 23 Jun 2021 11:13:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7EEC5610C7
	for <linux-doc@archiver.kernel.org>; Wed, 23 Jun 2021 11:13:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230161AbhFWLPx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Jun 2021 07:15:53 -0400
Received: from [43.250.32.171] ([43.250.32.171]:23545 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S230098AbhFWLPw (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 23 Jun 2021 07:15:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=s2CDvxtBeheab/d0jvJvgp/4r6/hNuSCtraMg
        +RZXRM=; b=lYeXNTE1vPCAj0kqHvIXWyuu8Aas1EnuvGGaNN9KX0C+/WUKRLmHw
        HZk0a+WIFdkcAZJv0MG+yVJeXig4ugQTyipFC/sdU80SHfg3jZTETT8wWRutP21a
        NUiB5j9rlEBVWRcZMs1vdbzmsH9TFoSWhyG0gOiD+SXcnOKZDTzyg4=
Received: from bobwxc.top (unknown [120.238.248.220])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgDngjZOF9NgR18gAA--.2058S2;
        Wed, 23 Jun 2021 19:13:20 +0800 (CST)
Date:   Wed, 23 Jun 2021 19:13:18 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH v2 0/2] docs/zh_CN: Add two new translations in
 zh_CN/admin-guide
Message-ID: <cover.1624434673.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgDngjZOF9NgR18gAA--.2058S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JFWUCw15uF4kWw4UKw43Awb_yoWfCrcEkw
        n7XrZYyF17AFyxGFWxCF1UAryqkF45K390yF15trW7J39rGws8Xr1kXF95X345Wrs0yrW5
        GrWkJryfKrnrWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbY8YjsxI4VWxJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
        s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
        8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E
        87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcV
        Aq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWxJr1U
        JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc2xSY4AK67AK6r4kMxAIw28Icx
        kI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l
        x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
        v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IY
        x2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
        Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIF
        yTuYvjxUbwIDDUUUU
X-Originating-IP: [120.238.248.220]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add two new translations
    zh_CN/admin-guide/efi-stub.rst
    zh_CN/admin-guide/initrd.rst

v2:
* modify some words under Alex Shi and Yanteng Si's suggestions,
  see <http://fars.ee/1MWq/diff> .
  Thanks for their's review!

v1:
<https://lore.kernel.org/linux-doc/cover.1624169811.git.bobwxc@email.cn/T/>

Thanks!

Wu XiangCheng (2):
  docs/zh_CN: Add translation zh_CN/admin-guide/efi-stub.rst
  docs/zh_CN: Add translation zh_CN/admin-guide/initrd.rst

 .../zh_CN/admin-guide/efi-stub.rst            |  86 +++++
 .../translations/zh_CN/admin-guide/index.rst  |   4 +-
 .../translations/zh_CN/admin-guide/initrd.rst | 321 ++++++++++++++++++
 3 files changed, 409 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/admin-guide/efi-stub.rst
 create mode 100644 Documentation/translations/zh_CN/admin-guide/initrd.rst

-- 
2.20.1

