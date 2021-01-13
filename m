Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6687FC433DB
	for <linux-doc@archiver.kernel.org>; Wed, 13 Jan 2021 20:34:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 25A8122BEA
	for <linux-doc@archiver.kernel.org>; Wed, 13 Jan 2021 20:34:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726725AbhAMUec (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 13 Jan 2021 15:34:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbhAMUec (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Jan 2021 15:34:32 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2765C061786
        for <linux-doc@vger.kernel.org>; Wed, 13 Jan 2021 12:33:51 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id t30so3544377wrb.0
        for <linux-doc@vger.kernel.org>; Wed, 13 Jan 2021 12:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=uZ7Hgjq3EwFlb9h2mNHzEA//LZq6FUIgncCnYkTCuws=;
        b=Sso1YrFRy85VawRnTMzqET8IW53+1x1oHBSzmGHtd347+EcGNLBryZFMfwgkl9FVhl
         WGCrKg+RawNman31i8FAR9kmYcpxyokYmeKHvzLrWzCYAq5rU3rLdO5wsD6CjTocV3kZ
         xg9piVdZ8UQqaUlTmP5PFBwrNgVaILb5SFwMruQ8R40kdMIrwBx9IaTmdzi+rVzAaSAE
         cWI5Yz4uuH36x285mTCrTi8i8czP403l5OI2CymZGcRkhuFP5364Q7taEDgm2mHj1+/Q
         Rw7JqR/o+ZVO7VIz14jDMiy1JeQP9mWPoq26PCL+Hq1Qip/+ufR9JcUdHYlxyThBeLbu
         mPuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=uZ7Hgjq3EwFlb9h2mNHzEA//LZq6FUIgncCnYkTCuws=;
        b=riyY0EySVFfVWohO0KNiF7ZT0EbnPycmnfX4ZnEZS4gl1Xj8VVT3fl5hYXWQrco6LZ
         m2uKZr+/OPnY+DxBcJsVrauKSwraM8qSV2Ijb7twkZIzG8U++vwygZLHelBRlMNrh0Ph
         kRGaEJf+AhItFZRQB5xZDaNpL2R5WJAwlZiQ7p8tVu2fnMMchj0KJZgYv2VBCDNGzRLV
         uytpDxUyZUD9U9Jm20ZAjDZkL2qvJDEkqKfT/k05Kc3CdxDqm1FU2FFjmmtF6PYtDG/k
         yV61L05Gi93JmZmM8h2bND3zlCjkAhSYDwaLWpxm9EK66BP18/rfP81b7ypTdzeiCwm0
         IKuA==
X-Gm-Message-State: AOAM530eYY2FdfAjUh1orF1q+m48/q1pz3oOinR21lDOtXeHNaKKtj6S
        I7yYwR+s2/LGEe48H4AiXmB5zA==
X-Google-Smtp-Source: ABdhPJw1+muA9rZ09tzUpEpzGFWjjxkRNbnfx/YtF76gWJ48/LVuRr6PPrRzYhBQ5xDtKTsFfVYslA==
X-Received: by 2002:adf:ebc2:: with SMTP id v2mr4355940wrn.88.1610570030708;
        Wed, 13 Jan 2021 12:33:50 -0800 (PST)
Received: from dell ([91.110.221.193])
        by smtp.gmail.com with ESMTPSA id j7sm4691438wmb.40.2021.01.13.12.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 12:33:50 -0800 (PST)
Date:   Wed, 13 Jan 2021 20:33:48 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/1] docs: submitting-patches: Emphasise the
 requirement to Cc: stable when using Fixes: tag
Message-ID: <20210113203348.GH3975472@dell>
References: <20210113163315.1331064-1-lee.jones@linaro.org>
 <87bldssrzu.fsf@intel.com>
 <20210113171211.GF3975472@dell>
 <878s8wspsz.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <878s8wspsz.fsf@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 13 Jan 2021, Jani Nikula wrote:

> On Wed, 13 Jan 2021, Lee Jones <lee.jones@linaro.org> wrote:
> > On Wed, 13 Jan 2021, Jani Nikula wrote:
> >
> >> On Wed, 13 Jan 2021, Lee Jones <lee.jones@linaro.org> wrote:
> >> > Clear-up any confusion surrounding the Fixes: tag with regards to the
> >> > need to Cc: the stable mailing list when submitting stable patch
> >> > candidates.
> >> >
> >> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >> > Cc: Jonathan Corbet <corbet@lwn.net>
> >> > Cc: linux-doc@vger.kernel.org
> >> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> >> > ---
> >> > v2:
> >> >  - Link to the 'stable-kernel-rules' document as per Greg's request
> >> >
> >> >  Documentation/process/submitting-patches.rst | 5 +++++
> >> >  1 file changed, 5 insertions(+)
> >> >
> >> > diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> >> > index 7c97ad580e7d0..7f48cccc75cdf 100644
> >> > --- a/Documentation/process/submitting-patches.rst
> >> > +++ b/Documentation/process/submitting-patches.rst
> >> > @@ -556,6 +556,11 @@ which stable kernel versions should receive your fix. This is the preferred
> >> >  method for indicating a bug fixed by the patch. See :ref:`describe_changes`
> >> >  for more details.
> >> >  
> >> > +Note: Attaching a Fixes: tag does not subvert the stable kernel rules
> >> > +process nor the requirement to Cc: stable@vger.kernel.org on all stable 
> >> > +patch candidates. For more information, please read
> >> > +:ref:`Documentation/process/stable-kernel-rules.rst <stable_kernel_rules>`
> >> 
> >> Has there been a process change, or should I take it that a Fixes: tag
> >> without Cc: stable *may* still end up being backported to stable?
> >
> > The 'process' has not changed.  Cc:ing the stable mailing list has
> > been a requirement for years.  This patch clears up the misconception
> > that you (and I ... and many others by all accounts) hold that the
> > Fixes: tag is enough.
> >
> > Fixes: only works when/if Greg and/or Sasha run their magical scripts
> > to scan for them.  By them doing so has "perpetuated a myth that this
> > was the proper thing to do".  It's not.
> 
> I held no misconception here, and we've scripted adding appropriate Cc:
> stable for years along with the Fixes: tag.
> 
> There's been debate in the past whether commits with *only* Fixes:
> should be automatically backported with the magic scripts at all. I
> don't mean to reopen that question now, but that was what I was
> referring to with the process change.

There's an on-going effort to pull in as many stable-worthy patches
as possible from across a plethora of varying sources.  Patches with
Fixes: tags which "forgot" to Cc: the stable mailing list is just one
of those sources.

In answer to the question you didn't ask; there is still a requirement
this scenario to be catered for, IMHO.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
