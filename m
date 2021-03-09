Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07A36C433E0
	for <linux-doc@archiver.kernel.org>; Tue,  9 Mar 2021 00:11:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB76D6529C
	for <linux-doc@archiver.kernel.org>; Tue,  9 Mar 2021 00:11:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231946AbhCIAK6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 8 Mar 2021 19:10:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231993AbhCIAKx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Mar 2021 19:10:53 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66E47C06174A;
        Mon,  8 Mar 2021 16:10:53 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 1AC042B0;
        Tue,  9 Mar 2021 00:10:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1AC042B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1615248653; bh=/GaDRGGk05tX0Je/Q0Wp+F5ymXhXO+oe5K7WvkXOx44=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=NuhPYCecyvEzM0T99e+Sr4jhwIW4CA6nfc6+Htep7iqH4whNQ5FGClJS3HtcoNBxR
         uepPcpzncWWFinGEcVMY7c+OzJrhv7eQ3qcuuFKHEZJw4GdWNe2XIe3YZGOvhKHof7
         lTbbPzvzhmI3rlD7UWDUUIW+rLlRT91bzE5iWvJ8A3SCpfGgfo3Xf42uST3EMvqfUK
         SHx3HvSS9pAbHablHhHPB89TFcrNVEXaplkbpN+K1NFlI/FFGD4VnzIFl4OxQI9M3k
         5cT2rMr6M58NP7nKxQEBn77hwtovIutkPrOjsfmI85+7s1mmqS7GXMRTTaL1zfgEqs
         m+CwSTB/uQ34g==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts/kernel-doc: ignore identifier on anonymous enums
In-Reply-To: <055ad57879f1b9381b90879e00f72fde1c3a5647.1614760910.git.mchehab+huawei@kernel.org>
References: <CAHp75VcG544HZ1j_6jvZoba6kEjKXXfZ8deJWmwNQ08mC35NrA@mail.gmail.com>
 <055ad57879f1b9381b90879e00f72fde1c3a5647.1614760910.git.mchehab+huawei@kernel.org>
Date:   Mon, 08 Mar 2021 17:10:52 -0700
Message-ID: <87czw95gqb.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> When anonymous enums are used, the identifier is empty.
>
> While, IMO, it should be avoided the usage of such enums,
> adding support for it is not hard.
>
> So, postpone the check for empty identifiers to happen
> only at the dump phase.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  scripts/kernel-doc | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

Applied, thanks.

jon
