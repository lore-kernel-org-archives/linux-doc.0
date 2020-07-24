Return-Path: <SRS0=Lhqp=BD=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB012C433E3
	for <linux-doc@archiver.kernel.org>; Fri, 24 Jul 2020 13:38:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 93CF72074F
	for <linux-doc@archiver.kernel.org>; Fri, 24 Jul 2020 13:38:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726990AbgGXNiv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 24 Jul 2020 09:38:51 -0400
Received: from ms.lwn.net ([45.79.88.28]:46398 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726455AbgGXNiu (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 24 Jul 2020 09:38:50 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 5117C2BA;
        Fri, 24 Jul 2020 13:38:50 +0000 (UTC)
Date:   Fri, 24 Jul 2020 07:38:49 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     mchehab@kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs/admin-guide:binfmt-misc:duplicate apostrophe
Message-ID: <20200724073849.73cd072e@lwn.net>
In-Reply-To: <20200724132400.26808-1-unixbhaskar@gmail.com>
References: <20200724132400.26808-1-unixbhaskar@gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 24 Jul 2020 18:54:02 +0530
Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote:

> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  Documentation/admin-guide/binfmt-misc.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/binfmt-misc.rst b/Documentation/admin-guide/binfmt-misc.rst
> index 7a864131e5ea..0f5f82236853 100644
> --- a/Documentation/admin-guide/binfmt-misc.rst
> +++ b/Documentation/admin-guide/binfmt-misc.rst
> @@ -83,7 +83,7 @@ Here is what the fields mean:
>        ``F`` - fix binary
>              The usual behaviour of binfmt_misc is to spawn the
>  	    binary lazily when the misc format file is invoked.  However,
> -	    this doesn``t work very well in the face of mount namespaces and
> +	    this doesn`t work very well in the face of mount namespaces and

This seems like a good thing to fix, but ... you might as well replace it
with a proper apostrophe rather than a backtick.  Also, please pay some
attention to your subject line and provide a changelog.

Thanks,

jon
