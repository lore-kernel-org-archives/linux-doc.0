Return-Path: <SRS0=MgSu=DW=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90309C433E7
	for <linux-doc@archiver.kernel.org>; Thu, 15 Oct 2020 22:03:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D36E20795
	for <linux-doc@archiver.kernel.org>; Thu, 15 Oct 2020 22:03:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bPocx/iv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731574AbgJOWDq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 15 Oct 2020 18:03:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729340AbgJOWDq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Oct 2020 18:03:46 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9215C0613CF
        for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2020 15:03:45 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id hk7so240713pjb.2
        for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2020 15:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tX6balWi3xF1R0xBEBJ7Br9SGLdyst5WwjhX9DaAUSw=;
        b=bPocx/ivNrOzUwfCAeSqdKyrLvYAhK62fL3kdjmfVNF1Bb+bxToGO+GBArR5xQf+MF
         db9H1aXyQub4Ugfb/JVOdu0qN9Ln3H9utp3jWgzzq7j5vH+im7uIm/YTIJMP3Gu5CX3O
         ssih9rclSiehki2Ke3psOISIWCUMhjGguJor4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tX6balWi3xF1R0xBEBJ7Br9SGLdyst5WwjhX9DaAUSw=;
        b=FLmtxOPF8EOhpMkBURAFGvjOmdI4dWGout8WyoElnTsXgtvPc+ADfgxRXBLGrzNq58
         J9KYAlGHw6mWa+7srVndyGfcEHRroMgkG+DL5E0Fr3K5aub/SZYQXhii8HRgukZiXOpq
         LWLmVHR3f2tHi/XHVilOyURDU9H/313T+wDlgKonh3DWoS4kDYLQ/h5wlnAj6OcKp2R8
         39W4PXtbwKvhSErm2DTkZQ4OcWSe1r269DpXzo3Je686lTq6hchkoJj8V9Uk/+vjiol1
         UFgsSEBOKEXc6fguRrm3wcY2MF0miMhFVBRHYsVT4hZrAJvqogsDUNeL3saSN4ETGtHp
         0GRg==
X-Gm-Message-State: AOAM530xuc3ntZSYfYxKH65JH1zD9ROuccLIqz0sPYmPTrzafU+7pGVq
        JWqCQ39AFB2tAT2GVqip0zmLZA==
X-Google-Smtp-Source: ABdhPJw8dCQgBOF92fJvUcvuyhCSRRzgnAoAQXQu74ak3em59f2h6fMejlXmC83RFodfUMkK/TR25Q==
X-Received: by 2002:a17:902:7c8d:b029:d2:80bd:2f30 with SMTP id y13-20020a1709027c8db02900d280bd2f30mr632565pll.22.1602799425445;
        Thu, 15 Oct 2020 15:03:45 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id x10sm257583pfc.88.2020.10.15.15.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 15:03:44 -0700 (PDT)
Date:   Thu, 15 Oct 2020 15:03:43 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Vlastimil Babka <vbabka@suse.cz>
Cc:     Christopher Lameter <cl@linux.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Waiman Long <longman@redhat.com>,
        Marco Elver <elver@google.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Roman Gushchin <guro@fb.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v3 0/3] Actually fix freelist pointer vs redzoning
Message-ID: <202010151501.C9F9D2ACF@keescook>
References: <20201015033712.1491731-1-keescook@chromium.org>
 <alpine.DEB.2.22.394.2010150822260.184556@www.lameter.com>
 <1e43fd23-e9f1-9c5d-3ee2-17171642877f@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e43fd23-e9f1-9c5d-3ee2-17171642877f@suse.cz>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 15, 2020 at 11:44:15AM +0200, Vlastimil Babka wrote:
> On 10/15/20 10:23 AM, Christopher Lameter wrote:
> > On Wed, 14 Oct 2020, Kees Cook wrote:
> > 
> > > Note on patch 2: Christopher NAKed it, but I actually think this is a
> > > reasonable thing to add -- the "too small" check is only made when built
> > > with CONFIG_DEBUG_VM, so it *is* actually possible for someone to trip
> > > over this directly, even if it would never make it into a released
> > > kernel. I see no reason to just leave this foot-gun in place, though, so
> > > we might as well just fix it too. (Which seems to be what Longman was
> > > similarly supporting, IIUC.)
> > 
> > Well then remove the duplication of checks. The NAK was there because it
> > seems that you were not aware of the existing checks.
> > 
> > > Anyway, if patch 2 stays NAKed, that's fine. It's entirely separable,
> > > and the other 2 can land. :)
> > 
> > Just deal with the old checks too and it will be fine.
> 
> Yeah, the existing check is under CONFIG_DEBUG_VM, which means it's not
> active on some configurations. Creating a cache is not exactly fast path
> operation, so I would remove this guard.
> As for the minimum size check, I would probably remove it (but watch out if
> SLAB/SLOB can handle it). It's not effective to use slab cache for 4-byte
> objects, but why make it an error.

Err, why did the check exist to begin with? If the check isn't wanted,
that's one thing, but I was just trying to fix what I saw in the redzone
handling. What is preferred here?

1) drop patch 2
2) keep patch 2, but also:
	a) validate slab/slob can handle < word-sized allocations
	b) remove check in kmem_cache_sanity_check

option 2a seems like it could be fragile if I miss something. I think
I'd rather just take option 1.

-- 
Kees Cook
