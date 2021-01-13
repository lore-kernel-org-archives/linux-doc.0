Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EC47C433DB
	for <linux-doc@archiver.kernel.org>; Wed, 13 Jan 2021 17:13:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 60D5C2339F
	for <linux-doc@archiver.kernel.org>; Wed, 13 Jan 2021 17:13:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbhAMRMz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 13 Jan 2021 12:12:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726235AbhAMRMz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Jan 2021 12:12:55 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25824C061795
        for <linux-doc@vger.kernel.org>; Wed, 13 Jan 2021 09:12:15 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id r4so2282978wmh.5
        for <linux-doc@vger.kernel.org>; Wed, 13 Jan 2021 09:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=c7b4E16YOwgpza0HIydnpFyNMAoTuzbuWt8Po2GaTu8=;
        b=m+HZYJrqh0DnFL+2Ra1oBihA6B5f1/bGTOMg83bfd5JsRI55Pg6cOawpyYGVSenaVE
         oqsRkZEih94Lc5xrZivWic5I2fo+hBgV8CA/rw/XW8CdbxoWNCg1NoA/ozazJVBLxv/E
         dwgW4iQ/0yJUfbMPfpbiJOijdgndcqw6JEballW1qqGkfrgvMoAgDgXbJd8uD01jaVuc
         dEMZpau/AvxuZWMfbxltkg1MbihefKZiKT2+6eUQDD4Pp2d3QlWrC8ZnECKuu5MQeZ2U
         BUqh4Xg7Pt23+SWYKkb+cn5rL6k0h6lAnETwP6z5zduPBo4sQQ8+wnwHzE3vclmaPGS7
         Zl/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=c7b4E16YOwgpza0HIydnpFyNMAoTuzbuWt8Po2GaTu8=;
        b=dQHhorunQPDJlvNzLVRWXuca37X0w6hfBC5G7wqra1ajPzJ0Ck5s8fHJGbFImA052C
         dxaB2mcEiLH/3nlp+53dwC0z0x7Lw53ZwmognucNo3srwk7pm52bMc8ob0FCJqRCrkjE
         1M9SkQ+Evhz49ewIjKgicTMDr/BffXXd6cIXSTU6bAETPeJ8kaTcLasHPs2AoJ6ktHFF
         8hk0fkXlucI9AHFyxdj8xzDlVfrf646yBDpASI2m6gVJ04Agyf1Ev+4DD0o1NxuB2oww
         UE9/qw0KU2wcVOuRHmSI8vLpoHOA0sGmaYoeD+NxrTt1rpnnp6LEqzBKUI+wwhNjMuDA
         f4Cg==
X-Gm-Message-State: AOAM5325CV94WqAcEy1bIyx0H7ZnCzty6bXP45iSn5YAQhr4SwdUDOvX
        UIQjKX7e17N5J1HAEFGXQhJZ/8yXf2V6q+e+
X-Google-Smtp-Source: ABdhPJzZ3LZrsLfZHiK6m5IEDbaQ3BoXy5i+lpcBWgVqY5sLOcN7RPj+H0NtaHgq93jnNZEQ32lqhw==
X-Received: by 2002:a05:600c:19cb:: with SMTP id u11mr251737wmq.110.1610557933899;
        Wed, 13 Jan 2021 09:12:13 -0800 (PST)
Received: from dell ([91.110.221.229])
        by smtp.gmail.com with ESMTPSA id r16sm4329471wrx.36.2021.01.13.09.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 09:12:13 -0800 (PST)
Date:   Wed, 13 Jan 2021 17:12:11 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/1] docs: submitting-patches: Emphasise the
 requirement to Cc: stable when using Fixes: tag
Message-ID: <20210113171211.GF3975472@dell>
References: <20210113163315.1331064-1-lee.jones@linaro.org>
 <87bldssrzu.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87bldssrzu.fsf@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 13 Jan 2021, Jani Nikula wrote:

> On Wed, 13 Jan 2021, Lee Jones <lee.jones@linaro.org> wrote:
> > Clear-up any confusion surrounding the Fixes: tag with regards to the
> > need to Cc: the stable mailing list when submitting stable patch
> > candidates.
> >
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Jonathan Corbet <corbet@lwn.net>
> > Cc: linux-doc@vger.kernel.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> > v2:
> >  - Link to the 'stable-kernel-rules' document as per Greg's request
> >
> >  Documentation/process/submitting-patches.rst | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> > index 7c97ad580e7d0..7f48cccc75cdf 100644
> > --- a/Documentation/process/submitting-patches.rst
> > +++ b/Documentation/process/submitting-patches.rst
> > @@ -556,6 +556,11 @@ which stable kernel versions should receive your fix. This is the preferred
> >  method for indicating a bug fixed by the patch. See :ref:`describe_changes`
> >  for more details.
> >  
> > +Note: Attaching a Fixes: tag does not subvert the stable kernel rules
> > +process nor the requirement to Cc: stable@vger.kernel.org on all stable 
> > +patch candidates. For more information, please read
> > +:ref:`Documentation/process/stable-kernel-rules.rst <stable_kernel_rules>`
> 
> Has there been a process change, or should I take it that a Fixes: tag
> without Cc: stable *may* still end up being backported to stable?

The 'process' has not changed.  Cc:ing the stable mailing list has
been a requirement for years.  This patch clears up the misconception
that you (and I ... and many others by all accounts) hold that the
Fixes: tag is enough.

Fixes: only works when/if Greg and/or Sasha run their magical scripts
to scan for them.  By them doing so has "perpetuated a myth that this
was the proper thing to do".  It's not.

Greg got fed-up of people asking that same question, so I'm fixing
that and giving him something to point to and say "RTFD".

Hope that clears things up.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
