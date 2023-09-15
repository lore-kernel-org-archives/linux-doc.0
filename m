Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25FFECD37AC
	for <linux-doc@archiver.kernel.org>; Fri, 15 Sep 2023 21:04:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237464AbjIOVED (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 15 Sep 2023 17:04:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237742AbjIOVDj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 Sep 2023 17:03:39 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9B3419F
        for <linux-doc@vger.kernel.org>; Fri, 15 Sep 2023 14:03:23 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-68fba57030fso2451426b3a.3
        for <linux-doc@vger.kernel.org>; Fri, 15 Sep 2023 14:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694811803; x=1695416603; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=APHJKdyAi/Un1XPHZn1Z1pQZW4vCCHalitDLmyiouTQ=;
        b=dx8DPTvbuSlh9TpzZol3/Gyx4GRxRBcPwEjUuOrFdZrrcIkqYUyXgAfBmgY4WsF03M
         hPSwrZPbIXM6+8W2CTfEJ/r3EcWQ8DnB2VTdZ8+5HDZ62Fj5w4nHKOruLoJ9uNXREkya
         nkJnIDPHkznSwrax0w/JCkGyXb1kCiTaYYts4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694811803; x=1695416603;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APHJKdyAi/Un1XPHZn1Z1pQZW4vCCHalitDLmyiouTQ=;
        b=b3cuDcY5e+pbI2YXt/YGyKeAJu7Um18nJgT6kh8qUr2D9edYhKRbuHx9SQDVvZ0Ulp
         OzSG3YsFQH0Rg7urOShDt7I72MBgn7jJJnyXGSsBpn3tohR1qdWxMdMOWqZKGaUn9hYc
         rJcASLSNK6XvcuOxz8mxbbLQ4fC11dyGkdJPk9zPZkI5TlgBV+Fp/JCJRIMq1HPQOn8z
         e97Gcnj0/V5bTQzGevHczYX3CmFtAEA4j/bbgFJOQxN8Or+TN0qKvMa7eUENuWLJjll5
         b7plbKKhlW5ixfEgDA8U8CZ5gZarPRvcYgXGTW0KmqlTxH33tUETBZSov5H5TTPkfAMW
         tPbw==
X-Gm-Message-State: AOJu0Yw0h4qg91EorpwX+5RlH8j54pxE2yqbfpYwzkAxkTIweJ+zVers
        dr7w0rg0mZK7YwqJhFBpyVNCBQ==
X-Google-Smtp-Source: AGHT+IH9giN0oiNJip6NSPrpp8FYJe9UYAjCNYEhPQYuBGuLm0ngXdsbwkHYQMIrzQrQbvKrNld2xQ==
X-Received: by 2002:a05:6a20:320d:b0:14b:8023:33c8 with SMTP id hl13-20020a056a20320d00b0014b802333c8mr2834160pzc.2.1694811803227;
        Fri, 15 Sep 2023 14:03:23 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id bv6-20020a632e06000000b0056001f43726sm3098867pgb.92.2023.09.15.14.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 14:03:22 -0700 (PDT)
Date:   Fri, 15 Sep 2023 14:03:22 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Matteo Rizzo <matteorizzo@google.com>
Cc:     cl@linux.com, penberg@kernel.org, rientjes@google.com,
        iamjoonsoo.kim@lge.com, akpm@linux-foundation.org, vbabka@suse.cz,
        roman.gushchin@linux.dev, 42.hyeyoo@gmail.com,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, linux-hardening@vger.kernel.org,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        corbet@lwn.net, luto@kernel.org, peterz@infradead.org,
        jannh@google.com, evn@google.com, poprdi@google.com,
        jordyzomer@google.com
Subject: Re: [RFC PATCH 06/14] mm/slub: pass additional args to
 alloc_slab_page
Message-ID: <202309151403.49D5C3CB@keescook>
References: <20230915105933.495735-1-matteorizzo@google.com>
 <20230915105933.495735-7-matteorizzo@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230915105933.495735-7-matteorizzo@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Sep 15, 2023 at 10:59:25AM +0000, Matteo Rizzo wrote:
> From: Jann Horn <jannh@google.com>
> 
> This is refactoring in preparation for SLAB_VIRTUAL.
> 
> The implementation of SLAB_VIRTUAL needs access to struct kmem_cache in
> alloc_slab_page in order to take unused slabs from the slab freelist,
> which is per-cache.
> 
> In addition to that it passes two different sets of GFP flags.
> meta_gfp_flags is used for the memory backing the metadata region and
> page tables, and gfp_flags for the data memory.
> 
> Signed-off-by: Jann Horn <jannh@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
