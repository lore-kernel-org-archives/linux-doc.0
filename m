Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D426BC433DB
	for <linux-doc@archiver.kernel.org>; Thu, 18 Mar 2021 07:19:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA35764F10
	for <linux-doc@archiver.kernel.org>; Thu, 18 Mar 2021 07:19:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbhCRHTO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 18 Mar 2021 03:19:14 -0400
Received: from m32-153.88.com ([43.250.32.153]:6286 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229558AbhCRHTH (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 18 Mar 2021 03:19:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=B+ugild91JwI0tjlrwz56W7GcqKa+qIDZlV6+
        WgCJ7Y=; b=TiYNFKNdROtqpyyjmNyroDf2T3thc+LDIXj/AvCBWnfodgl5XDnpl
        Xv6G/FQrr2CDoOg9PnPDx2lD2Km4q1x0InrCaEOnLnS82TU02tyXMtr0GmMJRuzm
        dCGzFgEufyfOisHLUI6SMrG+JB9/4bHfBaAWxTBZqQNzSiuFchA7lk=
Received: from mipc (unknown [120.238.248.129])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgA3wyPh_lJgJOwzAA--.62655S2;
        Thu, 18 Mar 2021 15:18:59 +0800 (CST)
Date:   Thu, 18 Mar 2021 15:18:57 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Alex Shi <alex.shi@linux.alibaba.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH v2 0/6] Add translations in zh_CN/admin-guide/
Message-ID: <cover.1616050069.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgA3wyPh_lJgJOwzAA--.62655S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXrW7AFyrtw4UKF1UCrW8Xrb_yoW5Xr4rpa
        yvkryFg3WxAF13Gr4xGr47W3W7tF48Z3s8K34fWw18Awn5AF1qqr1jgr4aqr98Zry5t3Wf
        ZrZ3tr1YkryjyrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgIb7Iv0xC_tr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcx
        kEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWx
        Jr1UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc2xSY4AK67AK6r4xMxAIw2
        8IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_
        Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
        CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
        I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
        8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU
        0xZFpf9x07Una9-UUUUU=
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi all,

This set of patches aims to add some translations in zh_CN/admin-guide/ 
about issues or bugs.

And please notice that, since each patch needs to modify their own entry in
the same index.rst, patches of this set need to be applied in order.

- V2

  - Add zh_CN/admin-guide/tainted-kernels.rst
  - Add zh_CN/admin-guide/init.rst
  - Pick Alex Shi's Reviewed-by tag for [Patch 3~4/6]
  - No more new changes will be added to this set, that's all

- V1
  <https://lore.kernel.org/linux-doc/cover.1615950640.git.bobwxc@email.cn/>

  - Re-manage the patch thread 
  - Add zh_CN/admin-guide/security-bugs.rst
    <https://lore.kernel.org/linux-doc/2552eb0fb4ddea81f80d020c69b7b7a3699dd93a.1615950640.git.bobwxc@email.cn/>
  - Modify one word in [Patch 3/4] under Alex Shi's suggestion
  - Pick Alex Shi's Reviewed-by tag for [Patch 1~2/6]

- V0

  - Add zh_CN/admin-guide/reporting-issues.rst
    <https://lore.kernel.org/linux-doc/20210315110119.GA9524@mipc/>
  - Add zh_CN/admin-guide/bug-bisect.rst
    <https://lore.kernel.org/linux-doc/b032e8ab75e91b37ae88f2c80102ab6dde1bfa45.1615909052.git.bobwxc@email.cn/>
  - Add zh_CN/admin-guide/bug-hunting.rst
    <https://lore.kernel.org/linux-doc/20210317030323.GA20733@mipc/>

Thanks!

Wu XiangCheng (6):
  docs/zh_CN: Add zh_CN/admin-guide/reporting-issues
  docs/zh_CN: Add zh_CN/admin-guide/bug-bisect.rst
  docs/zh_CN: Add zh_CN/admin-guide/bug-hunting.rst
  docs/zh_CN: Add zh_CN/admin-guide/security-bugs.rst
  docs/zh_CN: Add zh_CN/admin-guide/tainted-kernels.rst
  docs/zh_CN: Add zh_CN/admin-guide/init.rst

 .../zh_CN/admin-guide/bug-bisect.rst          |   81 ++
 .../zh_CN/admin-guide/bug-hunting.rst         |  340 +++++
 .../translations/zh_CN/admin-guide/index.rst  |   11 +-
 .../translations/zh_CN/admin-guide/init.rst   |   54 +
 .../zh_CN/admin-guide/reporting-issues.rst    | 1269 +++++++++++++++++
 .../zh_CN/admin-guide/security-bugs.rst       |   74 +
 .../zh_CN/admin-guide/tainted-kernels.rst     |  157 ++
 7 files changed, 1983 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/admin-guide/bug-bisect.rst
 create mode 100644 Documentation/translations/zh_CN/admin-guide/bug-hunting.rst
 create mode 100644 Documentation/translations/zh_CN/admin-guide/init.rst
 create mode 100644 Documentation/translations/zh_CN/admin-guide/reporting-issues.rst
 create mode 100644 Documentation/translations/zh_CN/admin-guide/security-bugs.rst
 create mode 100644 Documentation/translations/zh_CN/admin-guide/tainted-kernels.rst

-- 
2.20.1

