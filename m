Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 548F9C001B0
	for <linux-doc@archiver.kernel.org>; Mon,  3 Jul 2023 20:18:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbjGCUSG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 3 Jul 2023 16:18:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230273AbjGCUR4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Jul 2023 16:17:56 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A9DEE47
        for <linux-doc@vger.kernel.org>; Mon,  3 Jul 2023 13:17:55 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1b52875b8d9so414655ad.0
        for <linux-doc@vger.kernel.org>; Mon, 03 Jul 2023 13:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688415474; x=1691007474;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=M1oX1CfdxJh2QCcl3/DLFnwZiVfUuA9OMZRWZ3EO/94=;
        b=xSLVADKndPZ0kY+x4ESRJlpoZAVzR4TY3YjkqLF1Hk/DhmnHaBsKsRR5MAsprR8yTg
         kDJTc0gIXXIXAJ/Ulo+S23CUqdNHby/32ubaUn30tcZOs3uhjyQPWFoEOxnEuC/juxJV
         zo30mDnfTmv4xELZ3I05WiIGyAUhGo92NTwDNdXqlewgrvNqKWIeGk83RYWLvVlyzUry
         RB6N4FowyeKXfBeqTnFA1Fzui6ZsSR+KehYXra9P13eVoIg81VdDNYRRgGoW6dlj9uPY
         B3OjbSylm2ySCim1uOBfw0mBWsOVkWJfwYC4sg1AzlEIIxAjZcOvita9Q0/EKbIJQIt1
         X/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688415474; x=1691007474;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M1oX1CfdxJh2QCcl3/DLFnwZiVfUuA9OMZRWZ3EO/94=;
        b=FA43Bt1tIWSHxRC7lisiG6FlIdumyQkFJKLTn8426uoVJGD+13KOxO83DyIu3H2vA3
         49Gl+FO/GM5/JKaHQVVtpzDlhU4Gy+/6zlBqDmo6f7Oei3Z7PVqPRZ+KzT4wponUimKR
         CoK3Yw3fgmoIhEmSG6Cz5TfNERnmkhAHwUt+m3U9Kgr3LAEBp0LtsikE3/JIeAK7Gnmk
         hEDn2DwjeeWWKlZyic+TIUdUMh6WzGPOR3KqkgCy2FYhBbypSdnPPDoCT44QIjirfll2
         xjJcjnfRh4uL5xjNalSPEnlt90eQgvQa5fVPsnA0Tg1H6ez9Pov395OdgZfO689T+Vae
         ++6w==
X-Gm-Message-State: ABy/qLauP94dh+bhKVM2PqyzxqqrclCGK8JJyYzZU3gsAXrU+8kA/1s3
        vaOnJpAPtOQ+2tCIbm8rpayyvw==
X-Google-Smtp-Source: APBJJlHQXopX54fvX7CKUl1nWzeJsezc2kAAc7nqyiwzFaW+CH27dFqDPk6GxjU2uLlr/lONGgf7xQ==
X-Received: by 2002:a17:903:22cf:b0:1b3:db56:9ca9 with SMTP id y15-20020a17090322cf00b001b3db569ca9mr24700plg.2.1688415474481;
        Mon, 03 Jul 2023 13:17:54 -0700 (PDT)
Received: from [2620:0:1008:15:17fc:1b56:71df:89b7] ([2620:0:1008:15:17fc:1b56:71df:89b7])
        by smtp.gmail.com with ESMTPSA id q14-20020a170902dace00b001b893b689a0sm2600392plx.84.2023.07.03.13.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 13:17:54 -0700 (PDT)
Date:   Mon, 3 Jul 2023 13:17:53 -0700 (PDT)
From:   David Rientjes <rientjes@google.com>
To:     Julian Pidancet <julian.pidancet@oracle.com>
cc:     Christoph Lameter <cl@linux.com>,
        "Lameter, Christopher" <cl@os.amperecomputing.com>,
        Pekka Enberg <penberg@kernel.org>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-mm@kvack.org,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
        Kees Cook <keescook@chromium.org>,
        Rafael Aquini <aquini@redhat.com>
Subject: Re: [PATCH v2] mm/slub: disable slab merging in the default
 configuration
In-Reply-To: <CTSGWINSM18Q.3HQ1DN27GNA1R@imme>
Message-ID: <8813897d-4a52-37a0-fe44-a9157716be9b@google.com>
References: <20230629221910.359711-1-julian.pidancet@oracle.com> <38083ed2-333b-e245-44e4-2f355e4f9249@google.com> <CTSGWINSM18Q.3HQ1DN27GNA1R@imme>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 3 Jul 2023, Julian Pidancet wrote:

> On Mon Jul 3, 2023 at 02:09, David Rientjes wrote:
> > I think we need more data beyond just kernbench.  Christoph's point about 
> > different page sizes is interesting.  In the above results, I don't know 
> > the page orders for the various slab caches that this workload will 
> > stress.  I think the memory overhead data may be different depending on 
> > how slab_max_order is being used, if at all.
> >
> > We should be able to run this through a variety of different benchmarks 
> > and measure peak slab usage at the same time for due diligence.  I support 
> > the change in the default, I would just prefer to know what the 
> > implications of it is.
> >
> > Is it possible to collect data for other microbenchmarks and real-world 
> > workloads?  And perhaps also with different page sizes where this will 
> > impact memory overhead more?  I can help running more workloads once we 
> > have the next set of data.
> >
> 
> David,
> 
> I agree about the need to perform those tests on hardware using larger
> pages. I will collect data if I have the chance to get my hands on one
> of these systems.
> 

Thanks.  I think arm64 should suffice for things like 64KB pages that 
Christoph was referring to.

We also may want to play around with slub_min_order on the kernel command 
line since that will inflate the size of slab pages and we may see some 
different results because of the increased page size.

> Do you have specific tests or workload in mind ? Compiling the kernel
> with files sitting on an XFS partition is not exhaustive but it is the
> only test I could think of that is both easy to set up and can be 
> reproduced while keeping external interferences as little as possible.
> 

The ones that Binder, cc'd, used to evaluate SLAB vs SLUB memory overhead:

hackbench
netperf
redis
specjbb2015
unixbench
will-it-scale

And Vlastimil had also suggested a few XFS specific benchmarks.

I can try to help run benchmarks that you're not able to run or if you 
can't get your hands on an arm64 system.

Additionally, I wouldn't consider this to be super urgent: slab cache 
merging has been this way for several years, we have some time to do an 
assessment of the implications of changing an important aspect of kernel 
memory allocation that will affect everybody.  I agree with the patch if 
we can make it work, I'd just like to study the effect of it more fully 
beyond some kernbench runs.
