Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 315DAC48BE8
	for <linux-doc@archiver.kernel.org>; Sun, 13 Jun 2021 23:03:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F2C0C61029
	for <linux-doc@archiver.kernel.org>; Sun, 13 Jun 2021 23:03:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232164AbhFMXFN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 13 Jun 2021 19:05:13 -0400
Received: from ms.lwn.net ([45.79.88.28]:41672 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232154AbhFMXFM (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 13 Jun 2021 19:05:12 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 97FC84B7;
        Sun, 13 Jun 2021 23:03:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 97FC84B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1623625390; bh=i/Ig4C18y9UMOSdCcsir6vEOKDwKEPE8Fnz90fUWKbA=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=DylKUjhwCduhoSXcpcOa2ZU48OK2M9SHqbQiKFTS9dBzHx66mljoenHBDLquNGrN5
         5B9x1igJl1C7QxPI/sXIyIE+7651X6hI8ho5CP+G1gnfaZ8+82RFVsQBY9Nu2JDFBs
         Q4SUQgwHV+KROICxDg3QsaMse1NT54eEKYPWXr6PcWWXhd0UsyjNSDpwGxtnViwd+c
         1UBYmtJ6J7NuzItYzbryJujNU+h/xeW2Bf4dLQk4pp3C5LncanSqqTeOu8IbGw7r3z
         6m8tK48ywynwmHeF20uMrpe0/10YuxmCAoE6fGkxI+zhJXddFc72JzX2IHLINNeVdD
         b58Ev/wYieAPg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Kir Kolyshkin <kolyshkin@gmail.com>, linux-doc@vger.kernel.org
Cc:     Kir Kolyshkin <kolyshkin@gmail.com>,
        Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
Subject: Re: [PATCH 3/3] docs: fix a cross-ref
In-Reply-To: <20210611030044.1982911-4-kolyshkin@gmail.com>
References: <20210611030044.1982911-1-kolyshkin@gmail.com>
 <20210611030044.1982911-4-kolyshkin@gmail.com>
Date:   Sun, 13 Jun 2021 17:03:10 -0600
Message-ID: <87o8c9bc5t.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Kir Kolyshkin <kolyshkin@gmail.com> writes:

> Commit acda97acb2e98c9 changes dax.txt to dax.rst.
> Fix the references accordingly.
>
> Cc: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
> Signed-off-by: Kir Kolyshkin <kolyshkin@gmail.com>
> ---
>  Documentation/admin-guide/ext4.rst | 2 +-
>  Documentation/filesystems/ext2.rst | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

I've applied this one, thanks.  The devicetree ones should go to the
devicetree maintainers, though.

jon
