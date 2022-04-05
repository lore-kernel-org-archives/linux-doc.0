Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA77EC4167E
	for <linux-doc@archiver.kernel.org>; Tue,  5 Apr 2022 22:55:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235447AbiDEWeA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 5 Apr 2022 18:34:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1457545AbiDEQJJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Apr 2022 12:09:09 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6956B25CD
        for <linux-doc@vger.kernel.org>; Tue,  5 Apr 2022 09:07:10 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:35:2589:2a93:190d:b787])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id DB27330D;
        Tue,  5 Apr 2022 16:07:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net DB27330D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1649174830; bh=caHmw3d4uc7aoSZGimSPdevTWO+8w9Z+IMtdSwQptio=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=i+SQsd3ZYlXspWlFjLmLLGwKXzmzfphPwFdWO6qWAGeyMFoUf6JH5rFXgkg+nZ3Z7
         0JL+/aTXoRYem9wDwKguI88HsmJpmhqniYppXl4WbkIIsdu3EzxYJsgpEfCr/mlSwG
         tQAH2hK2zvYV1ChjEXAkM/MimAWMK2v1ApDSr3VInBRrAIISfkrO2XgaV4NPcIUP4H
         f/EckjZEnjXlgRiwKyXh+0QwoWd+u2FsHJpva/x8IPNJH/EngH1q3jyyLFBrHInKdg
         dfJ18taYrWCee7ZuEM/Yl0NLHVSt1fqqII3G56rWucKf+N1Fnb2upqmPIw3ZODE7t3
         a0/FYqVIPR9xg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng01@gmail.com>, alexs@kernel.org,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: Re: [PATCH v2 0/3] docs/zh_CN: update damon translation
In-Reply-To: <cover.1648471647.git.siyanteng@loongson.cn>
References: <cover.1648471647.git.siyanteng@loongson.cn>
Date:   Tue, 05 Apr 2022 10:07:09 -0600
Message-ID: <87pmlvecpe.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng01@gmail.com> writes:

> v2:
> * Pick Alex's Reviewed-by tag.
>
> v1:
> * Sync update .../vm/damon/design.rst and .../admin/mm/damon/usage.rst.
> * Add sysfs interface translation.
> * Typo fix. (enable -> enabled)
>
> Yanteng Si (3):
>   docs/zh_CN/damon: update outdated term 'regions update interval'
>   docs/zh_CN/damon: add sysfs interface
>   docs/zh_CN/damon: typo fix
>
>  .../zh_CN/admin-guide/mm/damon/reclaim.rst    |   4 +-
>  .../zh_CN/admin-guide/mm/damon/usage.rst      | 291 +++++++++++++++++-
>  .../translations/zh_CN/vm/damon/design.rst    |   7 +-
>  3 files changed, 287 insertions(+), 15 deletions(-)

Applied, thanks.  I'm glad to see some effort going into maintaining the
existing translations!

jon
