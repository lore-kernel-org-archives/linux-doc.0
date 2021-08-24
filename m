Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF986C4338F
	for <linux-doc@archiver.kernel.org>; Tue, 24 Aug 2021 19:28:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA5C1611C9
	for <linux-doc@archiver.kernel.org>; Tue, 24 Aug 2021 19:28:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232038AbhHXT3f (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 24 Aug 2021 15:29:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230197AbhHXT3e (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Aug 2021 15:29:34 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90F81C061757;
        Tue, 24 Aug 2021 12:28:50 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 4F5EF304D;
        Tue, 24 Aug 2021 19:28:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4F5EF304D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1629833330; bh=nQmcFwMR5wYzqmeDSxDZd6l3SH8LeGOIwTVQSjV1CeU=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=MAgDf6LY2IjOlsrTyFYN3R2mVrcq0foWhOMxHsKVApFPHmfUlnm5hXcappRRxJ00F
         84wBO/fcFRWWarOJzJwHfH/kj+GJJ9ALK/W6aBJV3xg1Vp+mkmQXjARca0xKbZl6H6
         iJaYHLDnfF+LhF6sEVRQEybuVDELyp8js9hqDPNhl/p45oI3s/PpGJXkIRhccZ305Y
         sRTZl7KhF+Oho7PtmEwht9PgCLvVP5digu/TxUyVks8WI2GZ7YmggDI+4ntDMwcv71
         q2JfEd3QjnEwPyfUZyIcYYFnDWdl716mQsKo4errHD9db9ezvd45hStDcB48v/YVla
         +s6cwgB1ERIbg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Changbin Du <changbin.du@gmail.com>
Cc:     Federico Vaga <federico.vaga@vaga.pv.it>,
        Alex Shi <alexs@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Changbin Du <changbin.du@gmail.com>
Subject: Re: [PATCH v2] Documentation: in_irq() cleanup
In-Reply-To: <20210814014831.53083-1-changbin.du@gmail.com>
References: <20210814014831.53083-1-changbin.du@gmail.com>
Date:   Tue, 24 Aug 2021 13:28:49 -0600
Message-ID: <875yvumyku.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Changbin Du <changbin.du@gmail.com> writes:

> Replace the obsolete and ambiguos macro in_irq() with new
> macro in_hardirq().
>
> Signed-off-by: Changbin Du <changbin.du@gmail.com>
>
> ---
> v2: remove unnecessary ':c:func:'.
> ---
>  Documentation/kernel-hacking/hacking.rst                    | 4 ++--
>  Documentation/kernel-hacking/locking.rst                    | 4 ++--
>  Documentation/translations/it_IT/kernel-hacking/hacking.rst | 2 +-
>  Documentation/translations/it_IT/kernel-hacking/locking.rst | 4 ++--
>  Documentation/translations/zh_CN/kernel-hacking/hacking.rst | 2 +-
>  5 files changed, 8 insertions(+), 8 deletions(-)

Applied, thanks.

jon
