Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCF24EE4983
	for <linux-doc@archiver.kernel.org>; Fri, 18 Aug 2023 17:44:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379179AbjHRRoL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Aug 2023 13:44:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379235AbjHRRoC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Aug 2023 13:44:02 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29DEB3590
        for <linux-doc@vger.kernel.org>; Fri, 18 Aug 2023 10:44:01 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::646])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id D2B5F5BF;
        Fri, 18 Aug 2023 17:44:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D2B5F5BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1692380641; bh=KxGEy0TepZzH2DjEJ3dJuWbTm/tfYAsi4AcFY1cBxYU=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=JSCYcwQmmYG03adkmmQu09Om63FKyIJDNC+eckY55zeGbifJQPWeDWbdsg0lzWTva
         gKH1+hQe9r3y4fhUr3zxBVkpzrqlJVi/a9Wt9CWf6pYtgGQXKYHjvggxurT0vSb+iH
         b8cpbeNp6IWKeGWxwa5PSzPBWyBSFvnbLuRREnU90bt8E0g5pqkGS+QLYf11yEkkIR
         1iKYs4a3R4RN4H0gzbOujj5dLIc8lkz0FA4oD1eHVZhRc9kRnZRE/cb5047yCAm0HA
         g9N5htwQcXovZXUeM24aS16Z5kMAEbQZFU2wY0M09WXOWsdzFaYUf/8I+dXlO7/aVs
         cdgypsOE/szpA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Xueshi Hu <xueshi.hu@smartx.com>, alexs@kernel.org,
        siyanteng@loongson.cn
Cc:     linux-doc@vger.kernel.org, Xueshi Hu <xueshi.hu@smartx.com>
Subject: Re: [PATCH] docs/zh_CN: correct regi_chg(),regi_add() to
 region_chg(),region_add()
In-Reply-To: <20230813132417.815036-1-xueshi.hu@smartx.com>
References: <20230813132417.815036-1-xueshi.hu@smartx.com>
Date:   Fri, 18 Aug 2023 11:44:00 -0600
Message-ID: <87edk0kzz3.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Xueshi Hu <xueshi.hu@smartx.com> writes:

> Minor typo fix in translations.
>
> Signed-off-by: Xueshi Hu <xueshi.hu@smartx.com>
> ---
>  Documentation/translations/zh_CN/mm/hugetlbfs_reserv.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

jon
