Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF04EC433DB
	for <linux-doc@archiver.kernel.org>; Wed, 13 Jan 2021 16:10:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 612722343B
	for <linux-doc@archiver.kernel.org>; Wed, 13 Jan 2021 16:10:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727155AbhAMQJt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 13 Jan 2021 11:09:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727012AbhAMQJt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Jan 2021 11:09:49 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 035C5C061786
        for <linux-doc@vger.kernel.org>; Wed, 13 Jan 2021 08:09:03 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id w5so2677216wrm.11
        for <linux-doc@vger.kernel.org>; Wed, 13 Jan 2021 08:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=zGaFG6Yz9aSW0b45VX30cQ6Ygah6IcUybvH0IP7gJ9E=;
        b=rpG1n6IkSCxRPm/Ihn3e2VN0Z41A3uNhZ5++D6iXnTZhg8lTapbhxAp5to4zK49J62
         kauwMOoXXnxOr4yroJd9JpAdaimUX4J0iwzbG14eHKvp1l+gjpFErKOhSXjFzBnLAcEZ
         9sVbFbZ03S2RqV1JAON07pt1UYHiAa+3pNwgUHWwuQoF6x6lUiviFFL8ogZwquj7Vh6K
         Q9HA/UVmn3O+0gk9JyBrTzePbyKqmKVjvvagjbl6tILyr7JXdUv2pZ9nHsjage06sbPw
         M5Y62NkKbF4J75OAWc7Uf5+EN3/GOdCN0Gt08y/lXvxseinlO12kC6ABb3x1xGnxnP5m
         +K+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=zGaFG6Yz9aSW0b45VX30cQ6Ygah6IcUybvH0IP7gJ9E=;
        b=XKwQGuoSYJZjK0PkRLwtTEM6dInouC+82Ir4a1L48BwM33UO4bQazzYv2J42QQqzXu
         pX+8AIqrZeE3Jg5BsWvg9BIbpCoFdHH9RiM/kcQyjHd5cKi487g7xp62f0vvWuMSUPPH
         j01L89m5Z2qg1BUtqBSS+JH1I9ORR9cVnuk2dokwSN+wmxH7Cxeh7eKlXaJVPLoxy1aB
         H/I33AYQVpuIGCdBrcNDFx3cnMsSP1A4LKPaf9Agl+nNCHq5PdRSwh0nO4DAslvw91eL
         TRwbgrkAWrBtnKlffG8E90NjJmU99bCrMFXXaywGNPMT3jRjiqQmFdAtlf0M15G1zhCO
         jwlg==
X-Gm-Message-State: AOAM530617edNQpcMctynQI+wTtIo1Y4y8V9+U9YTBlRQKqSRNGJl3ZO
        MWwUSHyg0hpfuLRqgCBGVxGlFg==
X-Google-Smtp-Source: ABdhPJzqvHtdgJahhofmO5YKsploUOpWJy7B0mEzcByyg9gwr10NixDhD+8JJZXMQFxUgoU5u9JCKg==
X-Received: by 2002:a5d:504d:: with SMTP id h13mr3446999wrt.246.1610554141784;
        Wed, 13 Jan 2021 08:09:01 -0800 (PST)
Received: from dell ([91.110.221.229])
        by smtp.gmail.com with ESMTPSA id n8sm4071875wrs.34.2021.01.13.08.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 08:09:01 -0800 (PST)
Date:   Wed, 13 Jan 2021 16:08:59 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/1] docs: submitting-patches: Emphasise the requirement
 to Cc: stable when using Fixes: tag
Message-ID: <20210113160859.GE3975472@dell>
References: <20210113142347.1263024-1-lee.jones@linaro.org>
 <X/8XUMW709ThubH1@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <X/8XUMW709ThubH1@kroah.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 13 Jan 2021, Greg Kroah-Hartman wrote:

> On Wed, Jan 13, 2021 at 02:23:47PM +0000, Lee Jones wrote:
> > Clear-up any confusion surrounding the Fixes: tag with regards to the
> > need to Cc: the stable mailing list when submitting stable patch
> > candidates.
> > 
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Jonathan Corbet <corbet@lwn.net>
> > Cc: linux-doc@vger.kernel.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  Documentation/process/submitting-patches.rst | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> > index 7c97ad580e7d0..636ef067c1565 100644
> > --- a/Documentation/process/submitting-patches.rst
> > +++ b/Documentation/process/submitting-patches.rst
> > @@ -554,7 +554,8 @@ is used to make it easy to determine where a bug originated, which can help
> >  review a bug fix. This tag also assists the stable kernel team in determining
> >  which stable kernel versions should receive your fix. This is the preferred
> >  method for indicating a bug fixed by the patch. See :ref:`describe_changes`
> > -for more details.
> > +for more details. Attaching a Fixes: tag does not replace the requirement to
> > +Cc: stable@vger.kernel.org on all stable patch candidates.
> 
> Want to just link to the "stable kernel rules" document here to show
> the proper way to do this is documented there?

I think this needs to be clearly stated here.

What if we linked to the rules document *as well*?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
