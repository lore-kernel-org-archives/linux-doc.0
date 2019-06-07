Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 78FCF7D2EF
	for <lwn-linux-doc@archive.lwn.net>; Fri,  7 Jun 2019 17:22:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729014AbfFGRWg (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 7 Jun 2019 13:22:36 -0400
Received: from ms.lwn.net ([45.79.88.28]:57740 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728998AbfFGRWg (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 7 Jun 2019 13:22:36 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 0C881737;
        Fri,  7 Jun 2019 17:22:35 +0000 (UTC)
Date:   Fri, 7 Jun 2019 11:22:33 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Aurelien Thierry <aurelien.thierry@quoscient.io>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        John Stultz <john.stultz@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-doc@vger.kernel.org, trivial@kernel.org
Subject: Re: [PATCH] Documentation: fix typo CLOCK_MONONOTNIC_COARSE
Message-ID: <20190607112233.1b91c3bb@lwn.net>
In-Reply-To: <593f6e44-af55-ac7c-1c67-12e515028fe5@quoscient.io>
References: <593f6e44-af55-ac7c-1c67-12e515028fe5@quoscient.io>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 7 Jun 2019 10:07:02 +0200
Aurelien Thierry <aurelien.thierry@quoscient.io> wrote:

> Fix typo in documentation file timekeeping.rst: CLOCK_MONONOTNIC_COARSE
> should be CLOCK_MONOTONIC_COARSE.
> 
> Signed-off-by: Aurelien Thierry <aurelien.thierry@quoscient.io>
> ---
>  Documentation/core-api/timekeeping.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/core-api/timekeeping.rst
> b/Documentation/core-api/timekeeping.rst
> index 93cbeb9daec0..5f87d9c8b04d 100644
> --- a/Documentation/core-api/timekeeping.rst
> +++ b/Documentation/core-api/timekeeping.rst
> @@ -111,7 +111,7 @@ Some additional variants exist for more specialized
> cases:
>          void ktime_get_coarse_raw_ts64( struct timespec64 * )
>  
>      These are quicker than the non-coarse versions, but less accurate,
> -    corresponding to CLOCK_MONONOTNIC_COARSE and CLOCK_REALTIME_COARSE
> +    corresponding to CLOCK_MONOTONIC_COARSE and CLOCK_REALTIME_COARSE
>      in user space, along with the equivalent boottime/tai/raw
>      timebase not available in user space.

Patch applied; congratulations on what appears to be your first kernel
patch!

Note that this patch was badly corrupted by your mailer; it took me a
while to unmangle it.  Before sending your next one, I'd recommend being
sure that you can email it to yourself and apply the result.  There are
some hints in Documentation/process/email-clients.rst.

Thanks,

jon
