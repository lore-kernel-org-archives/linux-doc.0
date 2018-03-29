Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 791BB7DD31
	for <lwn-linux-doc@archive.lwn.net>; Thu, 29 Mar 2018 21:56:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752048AbeC2V4W (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 29 Mar 2018 17:56:22 -0400
Received: from ms.lwn.net ([45.79.88.28]:53782 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751172AbeC2V4V (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 29 Mar 2018 17:56:21 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id AB955AAB;
        Thu, 29 Mar 2018 21:56:20 +0000 (UTC)
Date:   Thu, 29 Mar 2018 15:56:19 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Sanjeev Gupta <ghane0@gmail.com>
Cc:     linux-wimax@intel.com, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation/wimax: Point dead link to working copy
Message-ID: <20180329155619.1ab8c30f@lwn.net>
In-Reply-To: <20180328144707.13103-1-ghane0@gmail.com>
References: <20180328144707.13103-1-ghane0@gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 28 Mar 2018 22:47:07 +0800
Sanjeev Gupta <ghane0@gmail.com> wrote:

> The linuxwimax.org domain, registered by the Linux Foundation,
> no longer has any DNS entries.  Locate a copy on archive.org and
> update the documentation.

Hmm...I worry a bit about pointing into archive.org; it's not a sign that
we're giving our readers current information.  Did anybody ask the LF what
happened to that page?

More to the point, though:

> Signed-off-by: Sanjeev Gupta <ghane0@gmail.com>
> ---
>  Documentation/wimax/README.i2400m | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/wimax/README.i2400m b/Documentation/wimax/README.i2400m
> index 7dffd8919cb0..d11502d17818 100644
> --- a/Documentation/wimax/README.i2400m
> +++ b/Documentation/wimax/README.i2400m
> @@ -61,8 +61,9 @@ $ make KDIR=/path/to/kernel/dev/tree
>  
>  3. Installing the firmware
>  
> -   The firmware can be obtained from http://linuxwimax.org or might have
> -   been supplied with your hardware.
> +   The firmware can be obtained from
> +   https://web.archive.org/web/20101224002849/http://linuxwimax.org/
> +   or might have been supplied with your hardware.

If you go into that page, you find that they don't appear to have archived
any of the tarballs, so the promised firmware isn't actually there.  So
we're not really helping people by pointing there.  It does appear that
this firmware can be found in the linux-firmware repository, though.  So
that seems like where we should be pointing people...?

Thanks,

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
