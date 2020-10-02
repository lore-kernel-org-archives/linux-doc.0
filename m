Return-Path: <SRS0=qRT1=DJ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F3FC46466
	for <linux-doc@archiver.kernel.org>; Fri,  2 Oct 2020 22:30:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 88C7921789
	for <linux-doc@archiver.kernel.org>; Fri,  2 Oct 2020 22:30:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QTGIaEWe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725788AbgJBWad (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 2 Oct 2020 18:30:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbgJBWad (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Oct 2020 18:30:33 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78975C0613E2
        for <linux-doc@vger.kernel.org>; Fri,  2 Oct 2020 15:30:32 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id x2so1767044pjk.0
        for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2020 15:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iHORDgL7N+0Gk80t2oJ3ls3XDjhaOxJCscBFMqsVHZY=;
        b=QTGIaEWe/cAiRXbQ98Bzkfj00jBAMtZ6BjF/+vA7dzjuMnkZwXOaMVumeS4vzAsPjJ
         g+fnxma0MOV04GhEbLbMFKLDjieRjr7xcm/n5AQlKAWRRh/OpuDowkVVS9/jyKac3Pdx
         tkb0i3EVxlNNYk09mUBlGyyIvAHLoG1AWEaLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iHORDgL7N+0Gk80t2oJ3ls3XDjhaOxJCscBFMqsVHZY=;
        b=b/lzt5r68agqXbPeO09bY9xEvWG+c7Kfw8bv4J8c1W8gRxPiyvVby/4IQU5UcGQCcl
         tTzhRO2iP7P4RPxNk49Q4fO7qjKbU6N/Puk+RZ4MQvudWnSpNo4/Wnp8gPZCZ8qvixSv
         s2Sg2LMD9xhmodX5TZAXWw+yGCTtk00u1Amg3YkGW2PZwbqVBYGXJPmzhEGl+5FO/8ss
         oVXwclOY2ZNm+ccUIauEVaPiRql6Gu6Lsj3lmivJ406YoMaMxjKHfeJLe2V+ks1SFdnv
         ME8+FaZ0SjnZZFHMc2HWy2FetlQo41A4leEAQUet+eQilYvvuukG4/tje4BHVf7mtJrD
         4tvg==
X-Gm-Message-State: AOAM532IcfBocoepbntDcC6e4fd3zpQCq6Xev1kvTntsnEKAFBuPBPMn
        GlsEi7m2JKv6iY2HARmVjjNULw==
X-Google-Smtp-Source: ABdhPJz/xaSdkNFHvpoaJ0mtP1vUS51ugmxsFdZo5NuYV1gLUji2vDPmm3z3SApKmsggM+cLM+icaw==
X-Received: by 2002:a17:90b:ecc:: with SMTP id gz12mr4912105pjb.123.1601677831937;
        Fri, 02 Oct 2020 15:30:31 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id gt11sm2505440pjb.48.2020.10.02.15.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 15:30:31 -0700 (PDT)
Date:   Fri, 2 Oct 2020 15:30:30 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Joe Perches <joe@perches.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Denis Efremov <efremov@linux.com>,
        Julia Lawall <julia.lawall@inria.fr>,
        Alex Dewar <alex.dewar90@gmail.com>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH V3 1/8] sysfs: Add sysfs_emit and sysfs_emit_at to format
 sysfs output
Message-ID: <202010021527.DF20CE0@keescook>
References: <cover.1600285923.git.joe@perches.com>
 <884235202216d464d61ee975f7465332c86f76b2.1600285923.git.joe@perches.com>
 <20200930115740.GA1611809@kroah.com>
 <202009302108.18B05CA38@keescook>
 <9b57d0d4896a91debc330a70a20ae0f240afbd3b.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b57d0d4896a91debc330a70a20ae0f240afbd3b.camel@perches.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Sep 30, 2020 at 09:22:19PM -0700, Joe Perches wrote:
> On Wed, 2020-09-30 at 21:17 -0700, Kees Cook wrote:
> > On Wed, Sep 30, 2020 at 01:57:40PM +0200, Greg Kroah-Hartman wrote:
> > > Kees, and Rafael, I don't know if you saw this proposal from Joe for
> > > sysfs files, questions below:
> > 
> > I'm a fan. I think the use of sprintf() in sysfs might have been one of
> > my earliest complaints about unsafe code patterns in the kernel. ;)
> []
> > > > +	if (WARN(!buf || offset_in_page(buf),
> > > > +		 "invalid sysfs_emit: buf:%p\n", buf))
> 
> The dump_stack() is also going to emit pointers
> so I don't see how it does anything but help
> show where the buffer was.  It is hashed...

dump_stack() is going to report symbols and register contents.

I was just pointing out that %p has no value here[1]. The interesting
states are: "was it NULL?" "how offset was it?". Its actual content
won't matter.

-Kees

[1] "New uses of %p should not be added to the kernel"
    https://www.kernel.org/doc/html/latest/process/deprecated.html#p-format-specifier

-- 
Kees Cook
