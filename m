Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35DACC433DB
	for <linux-doc@archiver.kernel.org>; Wed, 13 Jan 2021 16:38:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D6AAB23382
	for <linux-doc@archiver.kernel.org>; Wed, 13 Jan 2021 16:38:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725747AbhAMQiX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 13 Jan 2021 11:38:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:46564 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726081AbhAMQiX (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 13 Jan 2021 11:38:23 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1B47D23382;
        Wed, 13 Jan 2021 16:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1610555862;
        bh=rNpPBUxzOtFeYQhjhJFIhCcd7eBnFUnIlqvd5Zv0Yo0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zaOvU6qCpGaMdRReegvltKhk0kPpGFvxQUKcpn4eXsSyK8sAWpDqR6Jxr8yT14/Bj
         wfvScIB73L3xTzZmT+Ns4lECU3mEM5Km0O4Rs6DZ2HgmAx7/MsIj+/yPF35tggCHPU
         RKLXcceMtKf5heO4bqyZbONReu1oXG+qOMt4HcVU=
Date:   Wed, 13 Jan 2021 17:38:49 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/1] docs: submitting-patches: Emphasise the
 requirement to Cc: stable when using Fixes: tag
Message-ID: <X/8iGSDhdjPJ3YSp@kroah.com>
References: <20210113163315.1331064-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210113163315.1331064-1-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jan 13, 2021 at 04:33:15PM +0000, Lee Jones wrote:
> Clear-up any confusion surrounding the Fixes: tag with regards to the
> need to Cc: the stable mailing list when submitting stable patch
> candidates.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
> v2:
>  - Link to the 'stable-kernel-rules' document as per Greg's request
> 
>  Documentation/process/submitting-patches.rst | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> index 7c97ad580e7d0..7f48cccc75cdf 100644
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -556,6 +556,11 @@ which stable kernel versions should receive your fix. This is the preferred
>  method for indicating a bug fixed by the patch. See :ref:`describe_changes`
>  for more details.
>  
> +Note: Attaching a Fixes: tag does not subvert the stable kernel rules
> +process nor the requirement to Cc: stable@vger.kernel.org on all stable 
> +patch candidates. For more information, please read
> +:ref:`Documentation/process/stable-kernel-rules.rst <stable_kernel_rules>`
> +     
>  .. _the_canonical_patch_format:
>  
>  The canonical patch format

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
