Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B9B3C07E99
	for <linux-doc@archiver.kernel.org>; Mon, 12 Jul 2021 16:16:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4FAB06024A
	for <linux-doc@archiver.kernel.org>; Mon, 12 Jul 2021 16:16:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233330AbhGLQTX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 12 Jul 2021 12:19:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229848AbhGLQTW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 12 Jul 2021 12:19:22 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12097C0613E5
        for <linux-doc@vger.kernel.org>; Mon, 12 Jul 2021 09:16:34 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id B3A292ED;
        Mon, 12 Jul 2021 16:16:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B3A292ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1626106593; bh=PY9buDRN8mKjHFSXEDhnPDkmkhJ3qzVEi3QnZjWwXdM=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=oSYNAqPfKgt8cW4U9K4twiXHfZgrCqUMlRXuKVQ08lF5yMEuH9DHa5hFlzihkPy3u
         hRTvVvBlsr7CuYw+MgeIGs1MZieKERVnVKnrPCFcSGEjSX+XxUkjs9TYx3cwT+ss9y
         xb7Jg1mEXa2LG8/9wcwo0vc9qFIkXbLwixH9YNJ0+FCHMHANdjuGdRFufYHZBp0Q9D
         GDjirxPR2U2cEKyF6RiK4YLntCOyuIa90KW4OHtCFoPAljPukXzKlt/B/Rhl/B65Ao
         rMM4hYul9kpFbgn71Qj4mgVgciMxlMqOdZtQwtYa8Zoiyb7NQSavLP1Fsf5Blt29PD
         oLKVt9tcYbasQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yang Xu <xuyang2018.jy@fujitsu.com>, akpm@linux-foundation.org
Cc:     mchehab+samsung@kernel.org, bigeasy@linutronix.de,
        linux-doc@vger.kernel.org, Yang Xu <xuyang2018.jy@fujitsu.com>
Subject: Re: [RESEND] admin-guide/cputopology.rst: Remove non-existed
 cpu-hotplug.txt
In-Reply-To: <1624412269-13155-1-git-send-email-xuyang2018.jy@fujitsu.com>
References: <1624412269-13155-1-git-send-email-xuyang2018.jy@fujitsu.com>
Date:   Mon, 12 Jul 2021 10:16:32 -0600
Message-ID: <87h7gzqzhb.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yang Xu <xuyang2018.jy@fujitsu.com> writes:

> Since kernel commit ff58fa7f556c ("Documentation: Update CPU hotplug and move it to core-api"),
> cpu_hotplug.txt has been removed. We should update it in here.
>
> Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
> ---
>  Documentation/admin-guide/cputopology.rst | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/admin-guide/cputopology.rst b/Documentation/admin-guide/cputopology.rst
> index b90dafcc8237..cc28b1a16371 100644
> --- a/Documentation/admin-guide/cputopology.rst
> +++ b/Documentation/admin-guide/cputopology.rst
> @@ -135,9 +135,9 @@ source for the output is in brackets ("[]").
>  		[NR_CPUS-1]
>  
>      offline:	CPUs that are not online because they have been
> -		HOTPLUGGED off (see cpu-hotplug.txt) or exceed the limit
> -		of CPUs allowed by the kernel configuration (kernel_max
> -		above). [~cpu_online_mask + cpus >= NR_CPUS]
> +		HOTPLUGGED off or exceed the limit of CPUs allowed by the
> +		kernel configuration (kernel_max above).
> +		[~cpu_online_mask + cpus >= NR_CPUS]

Is there a reason why you took out the reference to cpu-hotplug.txt
entirely rather than switching it to the rst file?

Thanks,

jon
