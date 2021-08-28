Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8314BC43214
	for <linux-doc@archiver.kernel.org>; Sat, 28 Aug 2021 05:28:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D69E60EBC
	for <linux-doc@archiver.kernel.org>; Sat, 28 Aug 2021 05:28:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231617AbhH1F3g (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 28 Aug 2021 01:29:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231189AbhH1F3e (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 28 Aug 2021 01:29:34 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3D9FC061796
        for <linux-doc@vger.kernel.org>; Fri, 27 Aug 2021 22:28:44 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id w7so6793764pgk.13
        for <linux-doc@vger.kernel.org>; Fri, 27 Aug 2021 22:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=stWDJ7pxROB/EYFBbI7ThyH/rSYnoU9WnqG7bRnPt18=;
        b=bt25+nM3eSC/BvfoTicc0kvU8X0ALlSypYs6nMG+ihBxWlZaCFTdELOgHd4ypV3SQF
         bNmfO7MJWL23KdE8b6R633QbGHj6wsYkr8qI4bQIAjy/oem5n+xTmj1AvXlQVcFUHF+r
         KxLKNJshPsF238Mfaa8vML8FvFyRRVbeIlieg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=stWDJ7pxROB/EYFBbI7ThyH/rSYnoU9WnqG7bRnPt18=;
        b=RXja/E4P/36wusNZlRYmnWMZEjvaohAzBbZvHe+KxqCxdgtpuBQTjg1HcSYsV7QgK3
         Uizzjd19X7qXSe6N8Ck2ZgWr/2uGbVDiNIWgn2oUnJcq7B9S8IDzK6ZARiq+ifN7+MKD
         yNVbLfmH8sGLw36Rj5cLUSw5w1epcU1lauLEqF/90zTDyNXFAzUBw00s4BOQ3jbyWW7H
         IissQmWuQsXeWJ8TqlmuoBRhVwz6gT+waDWAh5icQUTXSQ+0Z3NA7rkVQcAWoHgfEX1b
         /X68UjDL57xaM67t3oSjRBoEMHBabxwqwUvQRk8ohIaZPLPTspsG/ZwV7bd9dtnvDfcg
         nhuw==
X-Gm-Message-State: AOAM533P9IjmyUyADWhXehFYU0Y9W7US2doDTwKeXC4xdaoSCyEbOub5
        XmdRVPJTs5pNGXELgguvE3jFww==
X-Google-Smtp-Source: ABdhPJyRblUvU4gbCZ7vv2bulSDNoJ7Vp3Z6WWqczImBz1dyvqqdk84ObtLecw4DydDVqpr9htn1SQ==
X-Received: by 2002:a05:6a00:2142:b029:3b9:e5df:77ab with SMTP id o2-20020a056a002142b02903b9e5df77abmr12703170pfk.52.1630128524423;
        Fri, 27 Aug 2021 22:28:44 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d18sm8883397pgk.24.2021.08.27.22.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 22:28:43 -0700 (PDT)
Date:   Fri, 27 Aug 2021 22:28:41 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Suren Baghdasaryan <surenb@google.com>
Cc:     akpm@linux-foundation.org, ccross@google.com,
        sumit.semwal@linaro.org, mhocko@suse.com, dave.hansen@intel.com,
        willy@infradead.org, kirill.shutemov@linux.intel.com,
        vbabka@suse.cz, hannes@cmpxchg.org, corbet@lwn.net,
        viro@zeniv.linux.org.uk, rdunlap@infradead.org,
        kaleshsingh@google.com, peterx@redhat.com, rppt@kernel.org,
        peterz@infradead.org, catalin.marinas@arm.com,
        vincenzo.frascino@arm.com, chinwen.chang@mediatek.com,
        axelrasmussen@google.com, aarcange@redhat.com, jannh@google.com,
        apopple@nvidia.com, jhubbard@nvidia.com, yuzhao@google.com,
        will@kernel.org, fenghua.yu@intel.com, thunder.leizhen@huawei.com,
        hughd@google.com, feng.tang@intel.com, jgg@ziepe.ca, guro@fb.com,
        tglx@linutronix.de, krisman@collabora.com, chris.hyser@oracle.com,
        pcc@google.com, ebiederm@xmission.com, axboe@kernel.dk,
        legion@kernel.org, eb@emlix.com, songmuchun@bytedance.com,
        viresh.kumar@linaro.org, thomascedeno@google.com,
        sashal@kernel.org, cxfcosmos@gmail.com, linux@rasmusvillemoes.dk,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        kernel-team@android.com
Subject: Re: [PATCH v8 3/3] mm: add anonymous vma name refcounting
Message-ID: <202108271746.F444DA6C9@keescook>
References: <20210827191858.2037087-1-surenb@google.com>
 <20210827191858.2037087-4-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210827191858.2037087-4-surenb@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Aug 27, 2021 at 12:18:58PM -0700, Suren Baghdasaryan wrote:
> While forking a process with high number (64K) of named anonymous vmas the
> overhead caused by strdup() is noticeable. Experiments with ARM64 Android
> device show up to 40% performance regression when forking a process with
> 64k unpopulated anonymous vmas using the max name lengths vs the same
> process with the same number of anonymous vmas having no name.
> Introduce anon_vma_name refcounted structure to avoid the overhead of
> copying vma names during fork() and when splitting named anonymous vmas.
> When a vma is duplicated, instead of copying the name we increment the
> refcount of this structure. Multiple vmas can point to the same
> anon_vma_name as long as they increment the refcount. The name member of
> anon_vma_name structure is assigned at structure allocation time and is
> never changed. If vma name changes then the refcount of the original
> structure is dropped, a new anon_vma_name structure is allocated
> to hold the new name and the vma pointer is updated to point to the new
> structure.
> With this approach the fork() performance regressions is reduced 3-4x
> times and with usecases using more reasonable number of VMAs (a few
> thousand) the regressions is not measurable.

I like the refcounting; thank you!

Since patch2 adds a lot of things that are changed by patch3; maybe
combine them?

-- 
Kees Cook
