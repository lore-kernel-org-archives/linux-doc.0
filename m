Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2FEA77D8A3
	for <lwn-linux-doc@archive.lwn.net>; Mon, 19 Nov 2018 10:03:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727624AbeKSU0c (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 19 Nov 2018 15:26:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:34956 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727584AbeKSU0c (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 19 Nov 2018 15:26:32 -0500
Received: from localhost (5356596B.cm-6-7b.dynamic.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A4D3F20831;
        Mon, 19 Nov 2018 10:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1542621804;
        bh=8qx3xu2GbeEOZmep+WWp/pi5JLhqKDlE7QQPZXDAZok=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1kSptsLEjDY9zGjMHfUEH+vcFPCyg8IDDwmoKQF5Q1N/SdesbtLeBbOyf98UH9U/e
         GXqz0U7U9tkstgoXYlx+xlfjozQLnh7PG0guSjpEeOgC8bG8U70Hv8Fc0Y8KeGiMix
         ar8nRxvBFrFfZpxPodTakzVDr9radjbBVOxFXJCk=
Date:   Mon, 19 Nov 2018 11:03:22 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Alexey Budankov <alexey.budankov@linux.intel.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Kees Cook <keescook@chromium.org>,
        Jann Horn <jannh@google.com>, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Andi Kleen <ak@linux.intel.com>,
        Jonatan Corbet <corbet@lwn.net>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        kernel-hardening@lists.openwall.com, linux-doc@vger.kernel.org
Subject: Re: [PATCH v1 1/2]: Documentation/admin-guide: update admin-guide
 index.rst
Message-ID: <20181119100322.GA19910@kroah.com>
References: <0ac97cd0-4773-fff6-7d4e-74c4a1f076c4@linux.intel.com>
 <810bb4aa-777f-77ed-19f0-882354bdf9c7@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <810bb4aa-777f-77ed-19f0-882354bdf9c7@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Nov 19, 2018 at 08:41:31AM +0300, Alexey Budankov wrote:
> 
> Extend index.rst index file at admin-guide root directory with 
> the reference to perf-security.rst file being introduced.
> 
> Signed-off-by: Alexey Budankov <alexey.budankov@linux.intel.com>
> ---
>  Documentation/admin-guide/index.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/admin-guide/index.rst b/Documentation/admin-guide/index.rst
> index 0873685bab0f..885cc0de9114 100644
> --- a/Documentation/admin-guide/index.rst
> +++ b/Documentation/admin-guide/index.rst
> @@ -75,6 +75,7 @@ configure specific aspects of kernel behavior to your liking.
>     thunderbolt
>     LSM/index
>     mm/index
> +   perf-security

You just broke the build with this patch.  They need to be ordered the
other way around :(

