Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58CBBC46CA1
	for <linux-doc@archiver.kernel.org>; Fri, 15 Sep 2023 21:08:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237423AbjIOVHr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 15 Sep 2023 17:07:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237637AbjIOVHR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 Sep 2023 17:07:17 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71488C7
        for <linux-doc@vger.kernel.org>; Fri, 15 Sep 2023 14:07:11 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1c0db66af1bso20393985ad.2
        for <linux-doc@vger.kernel.org>; Fri, 15 Sep 2023 14:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694812031; x=1695416831; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gpm6l2zbYEP+V6IdYZx55UZQF+is/o4lwglBKgVrZz0=;
        b=fDH01NjiO2bMTMbSUOKhTrBeyBJCZ+IXCSijkAE3a+rPlYYAQZOjn19HId8V+9B6BY
         ITxKj9wmAvlb70AWIhoHExt0c6VfPpV5FGlL0LS29ZHhsTeeTS5aRXmvN8QvL95PsgKI
         D3YQgn5y497iv/wxpNZLrA9sNKsj8C2qj1jdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694812031; x=1695416831;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gpm6l2zbYEP+V6IdYZx55UZQF+is/o4lwglBKgVrZz0=;
        b=nW1owucw2wjsj8Vy/BWlGqGDegoDJPooIBpB5M27dWYHUVM9fZcsPAy46Bwxyx2557
         iawoJpib2zVcvDxNpig0brc4Lp6pSMAIgamfqxSKSEyRuiTqCBqdT5tkTrY8BRpKCfVG
         B06RDJnk+umHgwyPvc9NjS0tfQUB95Z0TLISCa1+VhSOF6PUryDLRTL7/5e5tbM9RJi9
         YLmvC4XJ23spv+lPY8i/ZgEi4NEjhbj1MuINwC8V+SxdsNeTw6wfODXZJ8v7vlo6Pi7d
         xP+6J2K4Z6RPNqfli50kC+j1YrUUtBTHaQPAAIP025zp2oBlW4kEZLFSR1I2PKQuuBIF
         1Kog==
X-Gm-Message-State: AOJu0YwzHjWg6o+o1Pzzm231J6yrUiZbL6/EjFNo6FcObTf/bBYFFcWw
        mvd6aAKN1ArutPZerPKko7njoA==
X-Google-Smtp-Source: AGHT+IEG2bCBbADESOrcfwhEKDiH90vpRH4uBGBmGx+GTX8gOEqkcnRXiWFTKwkpE3Lhi3WQISqwLg==
X-Received: by 2002:a17:903:2783:b0:1b8:b382:f6c3 with SMTP id jw3-20020a170903278300b001b8b382f6c3mr2890153plb.13.1694812030972;
        Fri, 15 Sep 2023 14:07:10 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 5-20020a170902c24500b001bdc208ab82sm3788343plg.97.2023.09.15.14.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 14:07:10 -0700 (PDT)
Date:   Fri, 15 Sep 2023 14:07:10 -0700
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
Subject: Re: [RFC PATCH 08/14] security: introduce CONFIG_SLAB_VIRTUAL
Message-ID: <202309151407.2FD7F80B@keescook>
References: <20230915105933.495735-1-matteorizzo@google.com>
 <20230915105933.495735-9-matteorizzo@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230915105933.495735-9-matteorizzo@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Sep 15, 2023 at 10:59:27AM +0000, Matteo Rizzo wrote:
> From: Jann Horn <jannh@google.com>
> 
> SLAB_VIRTUAL is a mitigation for the SLUB allocator which prevents reuse
> of virtual addresses across different slab caches and therefore makes
> some types of use-after-free bugs unexploitable.
> 
> SLAB_VIRTUAL is incompatible with KASAN and we believe it's not worth
> adding support for it. This is because SLAB_VIRTUAL and KASAN are aimed
> at two different use cases: KASAN is meant for catching bugs as early as
> possible in debug/fuzz/testing builds, and it's not meant to be used in
> production. SLAB_VIRTUAL on the other hand is an exploit mitigation that
> doesn't attempt to highlight bugs but instead tries to make them
> unexploitable. It doesn't make sense to enable it in debugging builds or
> during fuzzing, and instead we expect that it will be enabled in
> production kernels.
> 
> SLAB_VIRTUAL is not currently compatible with KFENCE, removing this
> limitation is future work.
> 
> Signed-off-by: Jann Horn <jannh@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
