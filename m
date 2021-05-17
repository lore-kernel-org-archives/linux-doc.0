Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 591EDC433B4
	for <linux-doc@archiver.kernel.org>; Mon, 17 May 2021 18:09:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2BF216101E
	for <linux-doc@archiver.kernel.org>; Mon, 17 May 2021 18:09:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236910AbhEQSK2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 May 2021 14:10:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240157AbhEQSK1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 May 2021 14:10:27 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 457F7C061573
        for <linux-doc@vger.kernel.org>; Mon, 17 May 2021 11:09:11 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 9525E2F3;
        Mon, 17 May 2021 18:09:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9525E2F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1621274950; bh=i/76D7zfV5S+m1dkJm6lZ5uU4pjPrG/rdhHSnrEM80g=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=VazPlGHa0+I2WiWpWzBiQ12rNfd7nycRFMuItNOAmKR18d3z3T31TPSOqnGSEgGr4
         3FWBKVuFFuf0R1p8E11IQ6jVtbve1+E+RB/4CSc/ZJB71zZ75vkODJAgus4bGzMelT
         hijFpDLl52JzOGkunEOQO6mn64sJTRz1MbRNL6XQ4mypfpoix+74o/IEBrgDhbpdja
         qnzSQuoATnEkk24o3eFs7vz7g5jR4SUMKT+wT+2BQNuys5HMmr8BGRRQKd13Cvtz1j
         idv1+66r90401dN3+DN5bXqCgpLBZiMWp5SYwGxGmXip3iPFH/I9+PT/br9A4PCivx
         XVlLGRmECD5+g==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Wu XiangCheng <bobwxc@email.cn>
Cc:     Alex Shi <alexs@kernel.org>, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
Subject: Re: [PATCH v4 0/6] docs/zh_CN: Add translation zh_CN/maintainer
In-Reply-To: <cover.1621243426.git.bobwxc@email.cn>
References: <cover.1621243426.git.bobwxc@email.cn>
Date:   Mon, 17 May 2021 12:09:10 -0600
Message-ID: <874kf144hl.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Wu XiangCheng <bobwxc@email.cn> writes:

> Hi all,
>
> This set of patches aims to add translations zh_CN/maintainer.
>
> v4:
> * Modified translation of word "backport" and a sentence under Alex
>   Shi's suggestion, thanks.
>
> v3:
> <https://lore.kernel.org/linux-doc/cover.1620932189.git.bobwxc@email.cn/T/#t>
> * Rebase to newest jc/docs-next tree
>
> v2:
> <https://lore.kernel.org/linux-doc/87sg2q63sd.fsf@meer.lwn.net/T/>
> * Modified some words in [Patch 3-4/6] under Yanteng Si's advices.
>   Thanks for his review!
> * Pick Yanteng Si's reviewed-by tag for [Patch 1-6/6]
>
> v1:
> <https://lore.kernel.org/linux-doc/cover.1619093668.git.bobwxc@email.cn/T/#t>
>
> Please note that since each patch need to modify their own entry
> in zh_CN/maintainer/index.rst, patches should be applied in order.
>
> Thanks!
>
> Base on jc/docs-next
>
> Wu XiangCheng (6):
>   docs/zh_CN: Add translation zh_CN/maintainer/index.rst
>   docs/zh_CN: Add translation zh_CN/maintainer/configure-git.rst
>   docs/zh_CN: Add translation zh_CN/maintainer/rebasing-and-merging.rst
>   docs/zh_CN: Add translation zh_CN/maintainer/pull-requests.rst
>   docs/zh_CN: Add translation
>     zh_CN/maintainer/maintainer-entry-profile.rst
>   docs/zh_CN: Add translation zh_CN/maintainer/modifying-patches.rst
>
>  Documentation/translations/zh_CN/index.rst    |   2 +-
>  .../zh_CN/maintainer/configure-git.rst        |  62 +++++++
>  .../translations/zh_CN/maintainer/index.rst   |  21 +++
>  .../maintainer/maintainer-entry-profile.rst   |  92 ++++++++++
>  .../zh_CN/maintainer/modifying-patches.rst    |  51 ++++++
>  .../zh_CN/maintainer/pull-requests.rst        | 148 ++++++++++++++++
>  .../zh_CN/maintainer/rebasing-and-merging.rst | 165 ++++++++++++++++++
>  7 files changed, 540 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/maintainer/configure-git.rst
>  create mode 100644 Documentation/translations/zh_CN/maintainer/index.rst
>  create mode 100644 Documentation/translations/zh_CN/maintainer/maintainer-entry-profile.rst
>  create mode 100644 Documentation/translations/zh_CN/maintainer/modifying-patches.rst
>  create mode 100644 Documentation/translations/zh_CN/maintainer/pull-requests.rst
>  create mode 100644 Documentation/translations/zh_CN/maintainer/rebasing-and-merging.rst

Applied, thanks.

jon
