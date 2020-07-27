Return-Path: <SRS0=Ik1b=BG=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 937DBC433E1
	for <linux-doc@archiver.kernel.org>; Mon, 27 Jul 2020 22:30:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7742220729
	for <linux-doc@archiver.kernel.org>; Mon, 27 Jul 2020 22:30:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726854AbgG0Wad (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 27 Jul 2020 18:30:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726171AbgG0Wad (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 27 Jul 2020 18:30:33 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BB68C061794
        for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2020 15:30:33 -0700 (PDT)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id C11A72E7;
        Mon, 27 Jul 2020 22:30:32 +0000 (UTC)
Date:   Mon, 27 Jul 2020 16:30:31 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     mchehab@kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs/binfmt-misc:Change backtick to apostrophe
Message-ID: <20200727163031.1579579b@lwn.net>
In-Reply-To: <20200724141209.32627-1-unixbhaskar@gmail.com>
References: <20200724141209.32627-1-unixbhaskar@gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 24 Jul 2020 19:42:09 +0530
Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote:

> This patch changed the backtick to apostrophe.
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
> Jon,
>  I have changed as per your suggestion.Sorry about picking all the nits.
> 
>  Documentation/admin-guide/binfmt-misc.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/binfmt-misc.rst b/Documentation/admin-guide/binfmt-misc.rst
> index 0f5f82236853..e2abd08b985c 100644
> --- a/Documentation/admin-guide/binfmt-misc.rst
> +++ b/Documentation/admin-guide/binfmt-misc.rst
> @@ -83,7 +83,7 @@ Here is what the fields mean:
>        ``F`` - fix binary
>              The usual behaviour of binfmt_misc is to spawn the
>  	    binary lazily when the misc format file is invoked.  However,
> -	    this doesn`t work very well in the face of mount namespaces and
> +	    this doesn't work very well in the face of mount namespaces and

This doesn't apply to docs-next, probably because I didn't apply your
other patch.  Please send *one* patch that fixes it properly.

Thanks,

jon
