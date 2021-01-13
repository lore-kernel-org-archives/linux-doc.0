Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D66FC433E0
	for <linux-doc@archiver.kernel.org>; Wed, 13 Jan 2021 15:52:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC785233FD
	for <linux-doc@archiver.kernel.org>; Wed, 13 Jan 2021 15:52:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbhAMPwX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 13 Jan 2021 10:52:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:37612 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726531AbhAMPwX (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 13 Jan 2021 10:52:23 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0FDCF233F8;
        Wed, 13 Jan 2021 15:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1610553102;
        bh=O5Pnl+7KBSaSZ+JoISWRhpAZuhB1L9X/rp2n9iqSnKw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FBxg4wrsIrK9P+124nLG5JjUWDCsxgyAlfgYKf29oWA8QocFI1LBKiDsxN4rZMOeS
         U/jrNU7sfZJkoPMc122qlWfnZgVBT7mY9UXLDjJrwAf3tI4Rkzr6pF2R0jKGrgEsCV
         5pr1w+2Xlqzdtgo2pmpCrspE/W3nCY8f8X22MH/8=
Date:   Wed, 13 Jan 2021 16:52:48 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/1] docs: submitting-patches: Emphasise the requirement
 to Cc: stable when using Fixes: tag
Message-ID: <X/8XUMW709ThubH1@kroah.com>
References: <20210113142347.1263024-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210113142347.1263024-1-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jan 13, 2021 at 02:23:47PM +0000, Lee Jones wrote:
> Clear-up any confusion surrounding the Fixes: tag with regards to the
> need to Cc: the stable mailing list when submitting stable patch
> candidates.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  Documentation/process/submitting-patches.rst | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> index 7c97ad580e7d0..636ef067c1565 100644
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -554,7 +554,8 @@ is used to make it easy to determine where a bug originated, which can help
>  review a bug fix. This tag also assists the stable kernel team in determining
>  which stable kernel versions should receive your fix. This is the preferred
>  method for indicating a bug fixed by the patch. See :ref:`describe_changes`
> -for more details.
> +for more details. Attaching a Fixes: tag does not replace the requirement to
> +Cc: stable@vger.kernel.org on all stable patch candidates.

Want to just link to the "stable kernel rules" document here to show
the proper way to do this is documented there?

thanks,

greg k-h
