Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4435C433E1
	for <linux-doc@archiver.kernel.org>; Thu, 25 Mar 2021 17:47:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C2AB661A2E
	for <linux-doc@archiver.kernel.org>; Thu, 25 Mar 2021 17:47:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbhCYRqm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Mar 2021 13:46:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbhCYRqV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Mar 2021 13:46:21 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EDDDC06174A
        for <linux-doc@vger.kernel.org>; Thu, 25 Mar 2021 10:46:20 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 5E46131A;
        Thu, 25 Mar 2021 17:46:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5E46131A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1616694380; bh=BFaDPUOdW9FA0ccZJmuKWWofud43FsHa/9PrWBWOi18=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=ekEfAaoEaCxk5LBVXRxlMDxy6D5U5N8s/cUSmRFhVKVIiM8ZUT0wTQ5HFKzSez4gD
         3nGLZdi//CzZ4Yzb2B5f68H3mwghlZ2IEhO4IaJSfSZwvAd/AT69z+mdkyxPHjAVCQ
         AYd73eVLampCAVY8bCnQml8B4jAfoeQXXH6ETYer4E45O7NGJMrXSEqDIU1XXcyjrX
         uGWh9GIDuo4/KJge/e85ig9+feBISi93UkyigLWz9t2q7GrkG7zWdGdhsrFI0W8+I9
         6GPzVC31zCVqSDhU0/7PKhiGY5P0kzRhsbB/QsMV5fYGO8+/1JnuKaFcEnR84Lw/DL
         uktKaLgXXGrHQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Wu XiangCheng <bobwxc@email.cn>,
        Alex Shi <alex.shi@linux.alibaba.com>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] docs/zh_CN: Add translations in zh_CN/kernel-hacking/
In-Reply-To: <20210323091651.GA23904@mipc>
References: <20210322143743.GA7820@mipc> <20210323091651.GA23904@mipc>
Date:   Thu, 25 Mar 2021 11:46:19 -0600
Message-ID: <87wntv15zo.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Wu XiangCheng <bobwxc@email.cn> writes:

> Add new translations
>
> * Documentation/translations/zh_CN/kernel-hacking/index.rst
> * Documentation/translations/zh_CN/kernel-hacking/hacking.rst
>
> And link them to zh_CN/index.rst.
>
> Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> ---
> v2:
> Correct typos in commit message.
> Modified some words under Alex Shi's suggestions.
> Specific changes between v1~v2 see <http://fars.ee/9fr7/diff>
>
>  Documentation/translations/zh_CN/index.rst    |   1 +
>  .../zh_CN/kernel-hacking/hacking.rst          | 708 ++++++++++++++++++
>  .../zh_CN/kernel-hacking/index.rst            |  22 +
>  3 files changed, 731 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/kernel-hacking/hacking.rst
>  create mode 100644 Documentation/translations/zh_CN/kernel-hacking/index.rst

Applied, thanks.

jon
