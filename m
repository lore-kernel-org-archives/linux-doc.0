Return-Path: <SRS0=qlPG=BQ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E988AC433E0
	for <linux-doc@archiver.kernel.org>; Thu,  6 Aug 2020 23:46:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F120821744
	for <linux-doc@archiver.kernel.org>; Thu,  6 Aug 2020 23:46:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="VzKdlHCh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbgHFXqV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 Aug 2020 19:46:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725272AbgHFXqV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Aug 2020 19:46:21 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9853C061574
        for <linux-doc@vger.kernel.org>; Thu,  6 Aug 2020 16:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=8t8Ko21yQBhNjBb0q03OGW4PW7/4NFm/E6dDpUlYWQY=; b=VzKdlHChtnQpos1buAIx267Kue
        5X0X+XFyu8qOKH7R6kwAXFC3m/MHCcvagA6+2FEtB1usHwu/JROkVRVtoCQR0dRdgwEQ4vtSQhd4y
        5B2Xl90IhdkxNunjvee6G2MlLWu/7v2oArFla/bLBGJeRKO3+/6zKF6cem6dqrxYcfmJ4djk2UZ1B
        2As8XIzzBqdaVWUKDPuSlCG9OZV/htQXp3t5O/FBSmafRPYLvPkRqsHDmAY+mIx3UVahLuqKkSoHj
        5qwAqN6uf9EXqfOz5u3SYxpUFI3fKpRRnaxUnf2dqtlM1td7uF6EpWK5OOEXLjzueVuyxWVY2p0DD
        sWYfe/bQ==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1k3paS-0008M4-8y; Thu, 06 Aug 2020 23:46:16 +0000
Subject: Re: [PATCH] docs: Correct the release date of 5.2 stable
To:     Billy Wilson <billy_wilson@byu.edu>, linux-doc@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>
References: <20200806231754.7735-1-billy_wilson@byu.edu>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <84f3c886-7ade-5870-22a0-6cef2735c19b@infradead.org>
Date:   Thu, 6 Aug 2020 16:46:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200806231754.7735-1-billy_wilson@byu.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 8/6/20 4:17 PM, Billy Wilson wrote:
> A table lists the 5.2 stable release date as September 15, but it was
> released on July 7. This may confuse a reader who is trying to
> understand the stable update release cycle.
> 
> Signed-off-by: Billy Wilson <billy_wilson@byu.edu>
> ---
>  Documentation/process/2.Process.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/process/2.Process.rst b/Documentation/process/2.Process.rst
> index 3588f48841eb..4ae1e0f600c1 100644
> --- a/Documentation/process/2.Process.rst
> +++ b/Documentation/process/2.Process.rst
> @@ -113,7 +113,7 @@ than one development cycle past their initial release. So, for example, the
>  5.2 kernel's history looked like this (all dates in 2019):
>  
>  	==============  ===============================
> -	September 15 	5.2 stable release
> +	July 7		5.2 stable release
>  	July 14		5.2.1
>  	July 21		5.2.2
>  	July 26		5.2.3

Hi,
For clarification, what 5.2 kernel do you find that was released on
July 7, 2019?  IOW, what you consider the 5.2 stable release of that date?
or where did you get that date?

thanks.

-- 
~Randy

