Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4604D7D082
	for <lwn-linux-doc@archive.lwn.net>; Thu, 18 Oct 2018 18:31:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728211AbeJSCeB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 18 Oct 2018 22:34:01 -0400
Received: from ms.lwn.net ([45.79.88.28]:45000 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726132AbeJSCeB (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 18 Oct 2018 22:34:01 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 1B4B72BA;
        Thu, 18 Oct 2018 18:31:41 +0000 (UTC)
Date:   Thu, 18 Oct 2018 12:31:26 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Will Korteland <will@korte.land>
Cc:     gregkh@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs/uio: fix a grammar nitpick
Message-ID: <20181018123126.3e59c3fd@lwn.net>
In-Reply-To: <7e426c03c0e342ade7ce86a977ef13b2@korte.land>
References: <7e426c03c0e342ade7ce86a977ef13b2@korte.land>
Organization: LWN.net
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 16 Oct 2018 08:57:44 +0000 (UTC)
Will Korteland <will@korte.land> wrote:

> This patch fixes a minor, incorrect piece of grammar in the UIO howto.
> 
> Signed-off-by: Will Korteland <will@korte.land>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> The sole change since v1 is that I re-did the patch against
> linux-next-20181016 instead of linux. Sorry for the extra work Greg, and
> thanks Randy for the acked-by.

Unfortunately, this patch is badly white-space mangled.  I tried fixing
it up but eventually had to give up and move on.

Please fix up your email client so that this doesn't happen; see
Documentation/process/email-clients.rst for some helpful suggestions
to that end.  Once you can email the patch to yourself and apply the
result successfully, please resubmit it.

Thanks,

jon
> 
>   Documentation/driver-api/uio-howto.rst | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/driver-api/uio-howto.rst 
> b/Documentation/driver-api/uio-howto.rst
> index fb2eb73be4a3..25f50eace28b 100644
> --- a/Documentation/driver-api/uio-howto.rst
> +++ b/Documentation/driver-api/uio-howto.rst
> @@ -463,8 +463,8 @@ Getting information about your UIO device
> 
>   Information about all UIO devices is available in sysfs. The first 
> thing
>   you should do in your driver is check ``name`` and ``version`` to make
> -sure your talking to the right device and that its kernel driver has 
> the
> -version you expect.
> +sure you're talking to the right device and that its kernel driver has
> +the version you expect.
> 
>   You should also make sure that the memory mapping you need exists and
>   has the size you expect.
