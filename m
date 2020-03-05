Return-Path: <SRS0=ObY3=4W=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98CB3C3F2CD
	for <linux-doc@archiver.kernel.org>; Thu,  5 Mar 2020 06:47:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 70F732166E
	for <linux-doc@archiver.kernel.org>; Thu,  5 Mar 2020 06:47:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TrXFGp1U"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726164AbgCEGrV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 5 Mar 2020 01:47:21 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:37968 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725818AbgCEGrU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 5 Mar 2020 01:47:20 -0500
Received: by mail-pf1-f193.google.com with SMTP id q9so2288504pfs.5
        for <linux-doc@vger.kernel.org>; Wed, 04 Mar 2020 22:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Hi+ymt1+ZK+4/hZC+nU21CDGGtFU5NQQqT7q6q0SBFo=;
        b=TrXFGp1UOLZ81xjjj8Ld6ZXKtw2LxXMuAhkikXLeq7NEU9qtgy78LQeOfi1M5k88Tu
         Mg+W7wQdZK7P7xCvaJhZBT77l7k9ZZGWCjbdrgbnM6+30B5npV6eVynIAZ5IOJKx3hOc
         iTHZaabE3ienA6Kld85mTCGrwU/WQhB/MtnOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Hi+ymt1+ZK+4/hZC+nU21CDGGtFU5NQQqT7q6q0SBFo=;
        b=GLMWS7lHab8fMYhbAa3f7KE1Y/AJNxXBMaItgEtPWY1t5mMYpDp0+amDKnh/UGXucR
         WXBXzD2FfDe5GuUqRtEKcOO02T0qR6eBiZTnDmb6n9UKjrmFMamVg6dLtkj3Pq+Ww8L7
         mAxnfKZAEFFcwzLBrzIdkBGhM/TQ2VXEF4ab/NxyRm8+2ipgi0CxAapBZyrzL8dnzuzv
         RBMqhOhcTOCHng5FsOpZvlNGn6wxLvMiVXZHsgAQAEm28r9l7z1Aa/Sx4I1GYhFiUi2t
         4Rf+GkWmRH19bU8h1Xg+mm/V/BJCAZwkRlkyo3nfg+y15ljdck2ONyg8MsHIp0t0CBL2
         WfRw==
X-Gm-Message-State: ANhLgQ11DyGR6Jz1iRESxS9AAFDCSgRziEmNSJjqjDifA5iTtdHnpXKL
        fy61DlEIuuf0BHg+loh9lG2u5A==
X-Google-Smtp-Source: ADFU+vsbqls1nrbe9BpspSCMfdCIY41dz2xuWpmDc4hCJpU6bz5CXXDt1Q4w4Okrvft+R6Ri34q0Yw==
X-Received: by 2002:a65:53cc:: with SMTP id z12mr5426000pgr.399.1583390839872;
        Wed, 04 Mar 2020 22:47:19 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b133sm30300515pga.43.2020.03.04.22.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2020 22:47:19 -0800 (PST)
Date:   Wed, 4 Mar 2020 22:47:18 -0800
From:   Kees Cook <keescook@chromium.org>
To:     James Troup <james.troup@canonical.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: deprecated.rst: Add %p to the list
Message-ID: <202003042240.3F6201CC3@keescook>
References: <202003041103.A5842AD@keescook>
 <87mu8vtj6g.fsf@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mu8vtj6g.fsf@canonical.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Ah! A wild Troup appears! :)

On Thu, Mar 05, 2020 at 07:22:31AM +0100, James Troup wrote:
> Kees Cook <keescook@chromium.org> writes:
> 
> > diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
> > index f9f196d3a69b..a4db119f4e09 100644
> > --- a/Documentation/process/deprecated.rst
> > +++ b/Documentation/process/deprecated.rst
> > @@ -109,6 +109,23 @@ the given limit of bytes to copy. This is inefficient and can lead to
> >  linear read overflows if a source string is not NUL-terminated. The
> >  safe replacement is :c:func:`strscpy`.
> >  
> > +%p format specifier
> > +-------------------
> > +Using %p in format strings leads to a huge number of address exposures.
> 
> Perhaps this sentence should be in the past tense, since %p currently
> prints a hashed value?

Yeah, good point; that should be more clear.

> 
> > +Instead of leaving these to be exploitable, "%p" should not be used in
> > +the kernel.
> 
> On its face, this seems to contradict the guidance below?
> 
> > If used currently, it is a hashed value, rendering it
> 
> Perhaps: s/it is/it prints/ ?

I'll rewrite this whole area...

> 
> > +unusable for addressing. Paraphrasing Linus's current `guideance
> > <https://lore.kernel.org/lkml/CA+55aFwQEd_d40g4mUCSsVRZzrFPUJt74vc6PPpb675hYNXcKw@mail.gmail.com/>`_:
> 
> Typo: guidance

Thanks for the review! I wonder why ":set spell" missed that...

-Kees

-- 
Kees Cook
