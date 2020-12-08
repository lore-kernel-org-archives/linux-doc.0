Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ACECC4361B
	for <linux-doc@archiver.kernel.org>; Tue,  8 Dec 2020 17:23:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5350423B16
	for <linux-doc@archiver.kernel.org>; Tue,  8 Dec 2020 17:23:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727463AbgLHRXQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Dec 2020 12:23:16 -0500
Received: from ms.lwn.net ([45.79.88.28]:38096 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726278AbgLHRXQ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 8 Dec 2020 12:23:16 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id DFFED300;
        Tue,  8 Dec 2020 17:22:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net DFFED300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1607448156; bh=wPdJQjWMZ5S3SyS3x/KfvIqcFtAqrf1k+4+ICav21bM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=nkYZOELoEX+RW0l1xsU9nmIjwPrZuTvFVpeWQ5CMaOrSnrI2vRNJyS6Hu2TC+1ynC
         ayCwn1QkAVjYlx/Rb04eAqhta/zmzxkh1ZYbp1odXhe+JT5Mgk41uqy00DRlYElEf6
         N0B63TewvDSHbczDB0daz4EuGo5BPogO3xl51w3HIm+dRLfECZb6GmoQ2mPj1OfBFr
         xJ/+MoUINTV3T0+bcqSkici8pA3fHmupe4ysyleT74mf2NsoNwOx32RxfnDi13FU5x
         kZwTLYyLw5Jv3DiIbmCnrgq9HLV5lKijBGLEJ25hXUSEoX+6L3+3w9m2lYUeWmQys3
         JKqmlbL1jtlcQ==
Date:   Tue, 8 Dec 2020 10:22:34 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Stephen Kitt <steve@sk2.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        "Guilherme G . Piccoli" <gpiccoli@canonical.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Eric Biggers <ebiggers@google.com>,
        Qais Yousef <qais.yousef@arm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: clean up sysctl/kernel: titles, version
Message-ID: <20201208102234.7b31fb42@lwn.net>
In-Reply-To: <20201208074922.30359-1-steve@sk2.org>
References: <20201208074922.30359-1-steve@sk2.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue,  8 Dec 2020 08:49:22 +0100
Stephen Kitt <steve@sk2.org> wrote:

> This cleans up a few titles with extra colons, and removes the
> reference to kernel 2.2. The docs don't yet cover *all* of 5.10 or
> 5.11, but I think they're close enough. Most entries are documented,
> and have been checked against current kernels.
> 
> Signed-off-by: Stephen Kitt <steve@sk2.org>
> ---
>  Documentation/admin-guide/sysctl/kernel.rst | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Applied, thanks.

jon
