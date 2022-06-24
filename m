Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 932D6C433EF
	for <linux-doc@archiver.kernel.org>; Fri, 24 Jun 2022 19:30:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbiFXTam (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 24 Jun 2022 15:30:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbiFXTal (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Jun 2022 15:30:41 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DEBA51319
        for <linux-doc@vger.kernel.org>; Fri, 24 Jun 2022 12:30:41 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id A52422A0;
        Fri, 24 Jun 2022 19:30:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A52422A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1656099040; bh=hc04pTODor8NIk4n8bASLA4gmJ7Xm73ng1MVVswJGnw=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Gz1g179JuAVPYvbqVtyLEwNULrKCnzCwCcTQMKo6NsPDUZZM0zy/1OF9tv1gvwRA6
         bwFmQwLBbICVeZHh/oZkk0JWIciTygeOcitGOjZ17bEjZRTw2bx+cW2nilUZvVsV4Y
         8f1XyNBrc+JW+6EkFJVbBLumwCjUu4KtAHX4PjybG/oywXjHJUWJlMdnRVjjI6a35V
         xJRxyij2j/SdLjoFn74pvN46Za3jacu7tk0v96Mdn2P31zr9mfN0G8wPN0slfVhNQE
         LsEPz8h94D+vgOBFcuVB4g8aGELDdfgxGGZWAxEGND9VEZJbwUanW5vmibOVwCKCBi
         cCop8KI48GaNA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com, zhoubinbin@loongson.cn
Subject: Re: [PATCH v3 0/3] docs/zh_CN: Update the translation of vm to
 5.19-rc1
In-Reply-To: <cover.1655362610.git.siyanteng@loongson.cn>
References: <cover.1655362610.git.siyanteng@loongson.cn>
Date:   Fri, 24 Jun 2022 13:30:40 -0600
Message-ID: <87bkuh5067.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng@loongson.cn> writes:

> v3:
> * Remove empty files.
> * Add the missing text in v2,and replace space with tab.
>
> v2:
> Modify some words under Xiangcheng's advice.
> add disclaimer-zh_CN to [PATCH 3/3].
>
> v1:
> Update .../zh_CN/vm/* to 5.19-rc1.
>
> Yanteng Si (3):
>   docs/zh_CN: Update the translation of highmem to 5.19-rc1
>   docs/zh_CN: Update the translation of page_owner to 5.19-rc1
>   docs/zh_CN: Update the translation of vm index to 5.19-rc1
>
>  .../translations/zh_CN/vm/highmem.rst         | 77 ++++++++++--------
>  Documentation/translations/zh_CN/vm/index.rst | 27 +++++--
>  .../translations/zh_CN/vm/page_owner.rst      | 79 ++++++++++++++++---
>  3 files changed, 134 insertions(+), 49 deletions(-)

Series applied, thanks.

jon
