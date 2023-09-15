Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42CACCD37AD
	for <linux-doc@archiver.kernel.org>; Fri, 15 Sep 2023 21:09:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237481AbjIOVJX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 15 Sep 2023 17:09:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237501AbjIOVIw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 Sep 2023 17:08:52 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D7E5C1
        for <linux-doc@vger.kernel.org>; Fri, 15 Sep 2023 14:08:48 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-68fbb10dec7so2400335b3a.3
        for <linux-doc@vger.kernel.org>; Fri, 15 Sep 2023 14:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694812127; x=1695416927; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1USzWYUGvvuIEVJkYh5wRYXrAoKFGs+D9zdSuXXuGko=;
        b=CHZ4Br4anGAQsDYK2xv2w0WNa+PxFhcQ03z08OEERDJPkjtUDddOwcXa1qvUcwyiBd
         vg6LTimDbaww50419WFegtYr+cH89uLG+2DsIMGnLgGIDaoTfUZYqjShLLNstUNTGueZ
         RpBQk1jHcBV8J7e/EI8PRgWu0Ux513cCOiAYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694812127; x=1695416927;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1USzWYUGvvuIEVJkYh5wRYXrAoKFGs+D9zdSuXXuGko=;
        b=LZXm+m5nPx/2JuMJ1aTPpXZzixXysHoBWcMUqDmtrWF6RhD2g+UVcMWIj+aGiuuCbL
         GBFEzZBBVYMgK+BF/WrXjW4MxQ/tYvULxj4rOuP/9XVIBvr+u8KKr7aZZXGZjGCefSim
         Pj89Mh/A/D6BoRAiuANtKoTg9BsJMVBLBX8W3Jt3ifT7lyngEAwykhJF0IoZsG1j/gYe
         Uus1Lphr2iNLeG3xb8RjFYEX4p/ywqMkZ+hA+qJYlyBERxofP8q4WWRWjaKjWFl4cB0l
         mH/d093ttUcEOqV4t1WebBM8pluWRrz8UfdQoD0bTFldY4Ntno/dOpyNPqxuBQ2FSPnx
         oOdg==
X-Gm-Message-State: AOJu0YyfR8PZt1AMVt+RmqD9gCsBv9LxYZJshNc6V6FOg1Jq5AcDO+mZ
        Uso58Q38+NO6P1H3DUWep65GCQ==
X-Google-Smtp-Source: AGHT+IGdp49LjyrMmSykt/SWt4KND8jRB/On6dOS8iyiloyE00YR/5G95sS67INYP4RtGEqyBEYS7w==
X-Received: by 2002:a17:902:64d6:b0:1c1:fc5c:b330 with SMTP id y22-20020a17090264d600b001c1fc5cb330mr2308796pli.12.1694812127548;
        Fri, 15 Sep 2023 14:08:47 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id y11-20020a1709029b8b00b001b9e86e05b7sm3916537plp.0.2023.09.15.14.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 14:08:47 -0700 (PDT)
Date:   Fri, 15 Sep 2023 14:08:46 -0700
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
Subject: Re: [RFC PATCH 09/14] mm/slub: add the slab freelists to kmem_cache
Message-ID: <202309151408.A419BEAD15@keescook>
References: <20230915105933.495735-1-matteorizzo@google.com>
 <20230915105933.495735-10-matteorizzo@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230915105933.495735-10-matteorizzo@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Sep 15, 2023 at 10:59:28AM +0000, Matteo Rizzo wrote:
> From: Jann Horn <jannh@google.com>
> 
> With SLAB_VIRTUAL enabled, unused slabs which still have virtual memory
> allocated to them but no physical memory are kept in a per-cache list so
> that they can be reused later if the cache needs to grow again.
> 
> Signed-off-by: Jann Horn <jannh@google.com>

Looks appropriately #ifdef'ed...

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
