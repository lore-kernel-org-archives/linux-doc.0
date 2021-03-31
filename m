Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FA21C433B4
	for <linux-doc@archiver.kernel.org>; Wed, 31 Mar 2021 20:35:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 18DC561057
	for <linux-doc@archiver.kernel.org>; Wed, 31 Mar 2021 20:35:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236510AbhCaUes (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 31 Mar 2021 16:34:48 -0400
Received: from ms.lwn.net ([45.79.88.28]:51648 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236545AbhCaUen (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 31 Mar 2021 16:34:43 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id B1C49867;
        Wed, 31 Mar 2021 20:34:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B1C49867
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1617222880; bh=1i3VmWpjW5ITzSMDuKxJHRj2tK84bgQPxEi3hvtLsGk=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=ITAPKLeiVrZ9nYMZbhP0SxTCTwTyfbmRX3YWM/mWzvmfTPGwZh6hGgpnzYmEu55Ps
         ngWXHftlYkkP2Rk866n7+A4zEoNvtw1PH64B885uyKc0YhGwvIIMZj6Mz/bGjzg1CP
         4BS1h0q63i7gZlRGGO1M6vaEQcT/QnbYJo/CFL2/fzfX3v9SvtYmsmctamVDNhdXZv
         5h0zSAS8x9hGf//vgaOUW1xfRo73NVPLIcvJ903220LLRzJoHH3yG6A1zwNgU/uh8a
         fD9Cv2lQPWKir1xG9erEFu/S+GCUBv5hR3RqLqPeVoO9WpX2aqidYlSnTjAXSAxpWc
         bsoHs+NAwCQ3w==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Ismael Luceno <ismael@iodev.co.uk>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ismael Luceno <ismael@iodev.co.uk>,
        Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [PATCH] docs: reporting-issues: Remove reference to oldnoconfig
In-Reply-To: <20210331163541.28356-1-ismael@iodev.co.uk>
References: <20210331163541.28356-1-ismael@iodev.co.uk>
Date:   Wed, 31 Mar 2021 14:34:40 -0600
Message-ID: <87im57jc4f.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Ismael Luceno <ismael@iodev.co.uk> writes:

> Replace it with olddefconfig. oldnoconfig didn't do what the document
> suggests (it aliased to olddefconfig), and isn't available since 4.19.
>
> Ref: 04c459d20448 ("kconfig: remove oldnoconfig target")
> Ref: 312ee68752fa ("kconfig: announce removal of oldnoconfig if used")
> Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
> ---
>  Documentation/admin-guide/reporting-issues.rst | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/Documentation/admin-guide/reporting-issues.rst b/Documentation/admin-guide/reporting-issues.rst
> index 07879d01fe68..ffa0d4c6e450 100644
> --- a/Documentation/admin-guide/reporting-issues.rst
> +++ b/Documentation/admin-guide/reporting-issues.rst
> @@ -1000,8 +1000,7 @@ In the whole process keep in mind: an issue only qualifies as regression if the
>  older and the newer kernel got built with a similar configuration. The best way
>  to archive this: copy the configuration file (``.config``) from the old working
>  kernel freshly to each newer kernel version you try. Afterwards run ``make
> -oldnoconfig`` to adjust it for the needs of the new version without enabling
> -any new feature, as those are allowed to cause regressions.
> +olddefconfig`` to adjust it for the needs of the new version.

[CC += Thorsten]

Applied, thanks.

jon
