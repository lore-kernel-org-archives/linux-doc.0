Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D63CAC433B4
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 21:22:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B581361246
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 21:22:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232775AbhDGVXA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Apr 2021 17:23:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232170AbhDGVXA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Apr 2021 17:23:00 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B67CC061760
        for <linux-doc@vger.kernel.org>; Wed,  7 Apr 2021 14:22:49 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id k8so14023134pgf.4
        for <linux-doc@vger.kernel.org>; Wed, 07 Apr 2021 14:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Zupj7uPahNplY1UQVoMGkmaTQjWt4OgWRC3KsLSujrc=;
        b=M9YSVBjfkZmUSxtRGAEOxpmgFxdTViW/Siw3rNeLMFHDSM6e3hN8ysP/2240zDxxDi
         T39zUKyY0vtGxkZkCB4+bVGjB1JAVYTKNRcUTK6MJPCXyrOzKqsAcJlHnP7Y1ova1y0O
         st/zEdrQliXXXomA7KmkLKClIcIhYnk+UrSJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Zupj7uPahNplY1UQVoMGkmaTQjWt4OgWRC3KsLSujrc=;
        b=cmuJ/G+cjUsqoSSe/woz9iuq4jR8Qa/t+LO2MN+8+bkmzzcCAougDWe0tlGbZVsX69
         WdkaUJ+qfgzGDLlJy7tk0atIEzF6bbOzSW+l7wJUKRb1xSH6cULo53/nNN9d+mZzWnRa
         y31UdafzwYQntWmrS+pUxtaAOt12uIi2L6d48kTU9hEUVacj3+6l3VLfiEFtpbiYObf2
         Ntykbp2ipLl9hfwu2r4BeyGs+u9gi4WB5BSPa+Sylo4yXN0hHfjCMj/XSOAohAiaxL0N
         3lMqUpOLTsCRysu0xuaQH8KAXYsrwLbQp5VuDDRDGxHL7Cj15pT4tp8rcntOexI9GY2P
         9Kfg==
X-Gm-Message-State: AOAM533vyRe10DFClvDYgAi9D6RKOn5J4V2fEPNhK8k9rAkGfO5rRy3P
        G65opLuCjtDHC9CRUTU1mz4x2sapSdds3w==
X-Google-Smtp-Source: ABdhPJxmQh7Kdjw0Jc6nIS2cPCnS5zmtBW3pIu0KoBmLegBViWu9iAOndw2MizR2wLYNxurOsLzrcw==
X-Received: by 2002:a63:df56:: with SMTP id h22mr5123694pgj.84.1617830568995;
        Wed, 07 Apr 2021 14:22:48 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id l191sm6209304pfd.36.2021.04.07.14.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 14:22:48 -0700 (PDT)
Date:   Wed, 7 Apr 2021 14:22:47 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Bill Wendling <morbo@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Fangrui Song <maskray@google.com>
Subject: Re: [PATCH v9] pgo: add clang's Profile Guided Optimization
 infrastructure
Message-ID: <202104071419.AA35EEAF@keescook>
References: <20210111081821.3041587-1-morbo@google.com>
 <20210407211704.367039-1-morbo@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210407211704.367039-1-morbo@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 07, 2021 at 02:17:04PM -0700, 'Bill Wendling' via Clang Built Linux wrote:
> From: Sami Tolvanen <samitolvanen@google.com>
> 
> Enable the use of clang's Profile-Guided Optimization[1]. To generate a
> profile, the kernel is instrumented with PGO counters, a representative
> workload is run, and the raw profile data is collected from
> /sys/kernel/debug/pgo/profraw.
> 
> The raw profile data must be processed by clang's "llvm-profdata" tool
> before it can be used during recompilation:
> 
>   $ cp /sys/kernel/debug/pgo/profraw vmlinux.profraw
>   $ llvm-profdata merge --output=vmlinux.profdata vmlinux.profraw
> 
> Multiple raw profiles may be merged during this step.
> 
> The data can now be used by the compiler:
> 
>   $ make LLVM=1 KCFLAGS=-fprofile-use=vmlinux.profdata ...
> 
> This initial submission is restricted to x86, as that's the platform we
> know works. This restriction can be lifted once other platforms have
> been verified to work with PGO.
> 
> Note that this method of profiling the kernel is clang-native, unlike
> the clang support in kernel/gcov.
> 
> [1] https://clang.llvm.org/docs/UsersManual.html#profile-guided-optimization
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Co-developed-by: Bill Wendling <morbo@google.com>
> Signed-off-by: Bill Wendling <morbo@google.com>
> Tested-by: Nick Desaulniers <ndesaulniers@google.com>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Reviewed-by: Fangrui Song <maskray@google.com>

Thanks for sending this again! I'm looking forward to using it.

Masahiro and Andrew, unless one of you would prefer to take this in your
tree, I figure I can snag it to send to Linus.

Anyone else have feedback?

Thanks!

-Kees

-- 
Kees Cook
