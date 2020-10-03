Return-Path: <SRS0=Dt6R=DK=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C878CC41604
	for <linux-doc@archiver.kernel.org>; Sat,  3 Oct 2020 22:15:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 72EB1206C9
	for <linux-doc@archiver.kernel.org>; Sat,  3 Oct 2020 22:15:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OWf8W/ak"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725980AbgJCWPZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 3 Oct 2020 18:15:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbgJCWPZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 3 Oct 2020 18:15:25 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7464FC0613E7
        for <linux-doc@vger.kernel.org>; Sat,  3 Oct 2020 15:15:25 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id a17so2580243pju.1
        for <linux-doc@vger.kernel.org>; Sat, 03 Oct 2020 15:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=M4HF7g1d0vJnY9H0PTtn0Kn7BvX/4ucoesfW9cqR2nI=;
        b=OWf8W/akknscbZ1L7tVZ+uusj+60T2f01UlnU2oUNwWPNeMYGKKZi4Q2d4E5hp2yE6
         pt/C3AXTYTXSExWDRuWyVECJ+9FQWKMH9/nGOwR5ihgMO25uiSzSHNSY9kEdnZnIOwzn
         /6YwGs5AQxCoovuHztbtLl746j7yPZkl9UKAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=M4HF7g1d0vJnY9H0PTtn0Kn7BvX/4ucoesfW9cqR2nI=;
        b=h7kDZKg7SztPE/U6leyeXYASxYL0rbhjCHAIHujuZOdWKdXwyfGbyXjD9Lu03uPnvv
         2611iAMIxqjWEtkqeNTr0LOSgr66SZkXpX7iUY6j00dOUq5+Ur2cAD5jCV+7XNacaV60
         ZjCrvD0XEbtriHaXv2LZFgMv7DGPdx39Tz1ePXwgUSRDhRK1YMu3GAyt1ahrtRcL7acP
         OIM2lcUsShtalXmn+EizXpmywqKL9LGKNvzRJqqwuFk7/wzHfuLVsTkanpqD0ESeYBzm
         jnGciiZAGFmrcxtTWp2UJ3nf5S2PBXFgL165NG+QnOMZB6CcPTHYkBNGVZanYBvNqSG0
         BLXQ==
X-Gm-Message-State: AOAM530xuTPAh84bF4XXXYAgR3z3ScGMTpGY2Y20bfAeyRlfBjgpG1vS
        hu2SrfsO+SfXZqg8Zw6A7jtpZA==
X-Google-Smtp-Source: ABdhPJwG0j09i2Gjxfhz8UVAnFLxcWNUBIxl37Tk2NE/qmJLANVy9sRbgzcmjQrTIeWcbGSsQa3Saw==
X-Received: by 2002:a17:90b:198:: with SMTP id t24mr9413193pjs.107.1601763324908;
        Sat, 03 Oct 2020 15:15:24 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id gl17sm5577505pjb.49.2020.10.03.15.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2020 15:15:23 -0700 (PDT)
Date:   Sat, 3 Oct 2020 15:15:22 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Joe Perches <joe@perches.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Denis Efremov <efremov@linux.com>,
        Julia Lawall <julia.lawall@inria.fr>,
        Alex Dewar <alex.dewar90@gmail.com>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH V3 1/8] sysfs: Add sysfs_emit and sysfs_emit_at to format
 sysfs output
Message-ID: <202010031513.60B9BF7557@keescook>
References: <cover.1600285923.git.joe@perches.com>
 <884235202216d464d61ee975f7465332c86f76b2.1600285923.git.joe@perches.com>
 <20200930115740.GA1611809@kroah.com>
 <202009302108.18B05CA38@keescook>
 <9b57d0d4896a91debc330a70a20ae0f240afbd3b.camel@perches.com>
 <202010021527.DF20CE0@keescook>
 <20201003135551.GA3187@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201003135551.GA3187@kroah.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Oct 03, 2020 at 03:55:51PM +0200, Greg Kroah-Hartman wrote:
> On Fri, Oct 02, 2020 at 03:30:30PM -0700, Kees Cook wrote:
> > On Wed, Sep 30, 2020 at 09:22:19PM -0700, Joe Perches wrote:
> > > On Wed, 2020-09-30 at 21:17 -0700, Kees Cook wrote:
> > > > On Wed, Sep 30, 2020 at 01:57:40PM +0200, Greg Kroah-Hartman wrote:
> > > > > Kees, and Rafael, I don't know if you saw this proposal from Joe for
> > > > > sysfs files, questions below:
> > > > 
> > > > I'm a fan. I think the use of sprintf() in sysfs might have been one of
> > > > my earliest complaints about unsafe code patterns in the kernel. ;)
> > > []
> > > > > > +	if (WARN(!buf || offset_in_page(buf),
> > > > > > +		 "invalid sysfs_emit: buf:%p\n", buf))
> > > 
> > > The dump_stack() is also going to emit pointers
> > > so I don't see how it does anything but help
> > > show where the buffer was.  It is hashed...
> > 
> > dump_stack() is going to report symbols and register contents.
> > 
> > I was just pointing out that %p has no value here[1]. The interesting
> > states are: "was it NULL?" "how offset was it?". Its actual content
> > won't matter.
> 
> Ok, suggestions for a better error message are always welcome :)

... I did. :P

https://lore.kernel.org/lkml/202009302108.18B05CA38@keescook/

But it doesn't need to hold up the series; %p is hashed, so I don't
care. It's just that the mandate from Linus was to not add new %p uses.
:P

-- 
Kees Cook
