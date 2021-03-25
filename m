Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EF38C433DB
	for <linux-doc@archiver.kernel.org>; Thu, 25 Mar 2021 17:54:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03D3F619AB
	for <linux-doc@archiver.kernel.org>; Thu, 25 Mar 2021 17:54:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230243AbhCYRyQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Mar 2021 13:54:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbhCYRyI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Mar 2021 13:54:08 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B5ABC06174A
        for <linux-doc@vger.kernel.org>; Thu, 25 Mar 2021 10:54:08 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id AA5276A2;
        Thu, 25 Mar 2021 17:54:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net AA5276A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1616694847; bh=L5tV1fppYXYD4WoiHRUqy+huZGlviN9+k9xx9TLvTuw=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=nvgtuA5pq/kDLBi5ny3JaFx0+Bj9jSEySOjUkzuLayJPLfbu8oZcwFxyi9lMGF40E
         QOL5s7ilmnJGd0ow2oMK9VuuWJ8tTogUMzqK04eAa0vGlFd/TgS1bWSHyqtHoKsxLJ
         sTRmIYOGDIGuG+IGBTGiX/LaNb1ofe8+JMhFk48xgLTO00ZPCPvS+aPGt8RKUmbSF+
         LAwtgLL24+mcXWcmwJEMDuMk1ELXrpwGL8EvdaQuiFQ1zumH6t25B3gXJpoFIyXKz3
         d7cZUKpSYiu2X4IkwUpM7bS1p/B1eeDZD+N9mVd1nRR0MIs1HR0wLejF5FabfKBFMd
         rQXZv3jC4Bt6Q==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Wu XiangCheng <bobwxc@email.cn>,
        Alex Shi <alex.shi@linux.alibaba.com>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 0/6] Add translations in zh_CN/admin-guide/
In-Reply-To: <cover.1616050069.git.bobwxc@email.cn>
References: <cover.1616050069.git.bobwxc@email.cn>
Date:   Thu, 25 Mar 2021 11:54:07 -0600
Message-ID: <87blb715mo.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Wu XiangCheng <bobwxc@email.cn> writes:

> Hi all,
>
> This set of patches aims to add some translations in zh_CN/admin-guide/ 
> about issues or bugs.
>
> And please notice that, since each patch needs to modify their own entry in
> the same index.rst, patches of this set need to be applied in order.
>
> - V2
>
>   - Add zh_CN/admin-guide/tainted-kernels.rst
>   - Add zh_CN/admin-guide/init.rst
>   - Pick Alex Shi's Reviewed-by tag for [Patch 3~4/6]
>   - No more new changes will be added to this set, that's all
>
> - V1
>   <https://lore.kernel.org/linux-doc/cover.1615950640.git.bobwxc@email.cn/>
>
>   - Re-manage the patch thread 
>   - Add zh_CN/admin-guide/security-bugs.rst
>     <https://lore.kernel.org/linux-doc/2552eb0fb4ddea81f80d020c69b7b7a3699dd93a.1615950640.git.bobwxc@email.cn/>
>   - Modify one word in [Patch 3/4] under Alex Shi's suggestion
>   - Pick Alex Shi's Reviewed-by tag for [Patch 1~2/6]
>
> - V0
>
>   - Add zh_CN/admin-guide/reporting-issues.rst
>     <https://lore.kernel.org/linux-doc/20210315110119.GA9524@mipc/>
>   - Add zh_CN/admin-guide/bug-bisect.rst
>     <https://lore.kernel.org/linux-doc/b032e8ab75e91b37ae88f2c80102ab6dde1bfa45.1615909052.git.bobwxc@email.cn/>
>   - Add zh_CN/admin-guide/bug-hunting.rst
>     <https://lore.kernel.org/linux-doc/20210317030323.GA20733@mipc/>
>
> Thanks!
>
> Wu XiangCheng (6):
>   docs/zh_CN: Add zh_CN/admin-guide/reporting-issues
>   docs/zh_CN: Add zh_CN/admin-guide/bug-bisect.rst
>   docs/zh_CN: Add zh_CN/admin-guide/bug-hunting.rst
>   docs/zh_CN: Add zh_CN/admin-guide/security-bugs.rst
>   docs/zh_CN: Add zh_CN/admin-guide/tainted-kernels.rst
>   docs/zh_CN: Add zh_CN/admin-guide/init.rst
>
>  .../zh_CN/admin-guide/bug-bisect.rst          |   81 ++
>  .../zh_CN/admin-guide/bug-hunting.rst         |  340 +++++
>  .../translations/zh_CN/admin-guide/index.rst  |   11 +-
>  .../translations/zh_CN/admin-guide/init.rst   |   54 +
>  .../zh_CN/admin-guide/reporting-issues.rst    | 1269 +++++++++++++++++
>  .../zh_CN/admin-guide/security-bugs.rst       |   74 +
>  .../zh_CN/admin-guide/tainted-kernels.rst     |  157 ++
>  7 files changed, 1983 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/admin-guide/bug-bisect.rst
>  create mode 100644 Documentation/translations/zh_CN/admin-guide/bug-hunting.rst
>  create mode 100644 Documentation/translations/zh_CN/admin-guide/init.rst
>  create mode 100644 Documentation/translations/zh_CN/admin-guide/reporting-issues.rst
>  create mode 100644 Documentation/translations/zh_CN/admin-guide/security-bugs.rst
>  create mode 100644 Documentation/translations/zh_CN/admin-guide/tainted-kernels.rst

I've applied the set, thanks.

jon
