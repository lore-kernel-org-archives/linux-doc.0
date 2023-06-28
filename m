Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4B3FEB64DA
	for <linux-doc@archiver.kernel.org>; Wed, 28 Jun 2023 20:59:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231751AbjF1U7i (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Jun 2023 16:59:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231500AbjF1U7h (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Jun 2023 16:59:37 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20DF019B6
        for <linux-doc@vger.kernel.org>; Wed, 28 Jun 2023 13:59:36 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-666eba6f3d6so159852b3a.3
        for <linux-doc@vger.kernel.org>; Wed, 28 Jun 2023 13:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687985975; x=1690577975;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p5EAwO68zepmlB4DZ7YeQCN7tx9mqPakWLHiXEndXTk=;
        b=lqW3ouyNx7hW2mqTtqZkWWLZkqi91e+OzqynvHrRmoI+fFXMrHqi7+vOlxnIV/s3RB
         jfaDcgTVeM2rtOKSDntGBOqnjK1QK0I9bWtkAyJPAS67ACxO8MdHkkDm1/TMHV4ZiOlU
         Jzso/vrdbQt9Q3QjyeWHNBVwjD2c7FPLrT7bQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687985975; x=1690577975;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p5EAwO68zepmlB4DZ7YeQCN7tx9mqPakWLHiXEndXTk=;
        b=kc6rDc0K8Srkpw9kCeptUUID/f3J5DBzwdCTquQba3gyXFB1Z5uUGmTXljyl3AkuEY
         sI49kAAjSXIbdBlQ7N0ciFBhBTEUk/xNRAIU+SZdDuq7e4pNJ6yFF2GVTZc3RwZjXON3
         aBDnr44nH80tS2vJGTszhV/cpasi6m739uMLu7oXfJ7mfqnhfMTOATy6PiecewqwhdQk
         sZ2BtOoS57dOHqabM3K2IfrOD/oZugn0+Qw+ioWPmJ+KLi/5dUDSsnbcailQulnJTFHF
         ntpceqpGrWlKHGFoBwbgPhqbicsmdYcSsva/l0YwASTpZzlbw8rDGptk4wz0zPA8+IaK
         YfKA==
X-Gm-Message-State: AC+VfDzyhTd81GG7bvP713z3aW7K62sUJeZBxJTNXiZ5sfRRUC/Rgixq
        +XHaS33Yp9HcFDqMcXua7toKlQ==
X-Google-Smtp-Source: ACHHUZ4b34bw7rZc9L7px3h6EUsiEBtUzLuZldpOt5NSLbXfKgtYiPS99hwUcfBulL/R+vof/etEuQ==
X-Received: by 2002:a05:6a00:3a14:b0:668:82fe:16e2 with SMTP id fj20-20020a056a003a1400b0066882fe16e2mr22096409pfb.16.1687985975628;
        Wed, 28 Jun 2023 13:59:35 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id u23-20020aa78497000000b0067aa2a70179sm4146384pfn.46.2023.06.28.13.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 13:59:34 -0700 (PDT)
Date:   Wed, 28 Jun 2023 13:59:34 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Julian Pidancet <julian.pidancet@oracle.com>
Cc:     Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-mm@kvack.org,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
        Rafael Aquini <aquini@redhat.com>
Subject: Re: [PATCH] mm/slub: disable slab merging in the default
 configuration
Message-ID: <202306281358.E6E6C2759@keescook>
References: <20230627132131.214475-1-julian.pidancet@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230627132131.214475-1-julian.pidancet@oracle.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jun 27, 2023 at 03:21:31PM +0200, Julian Pidancet wrote:
> Make CONFIG_SLAB_MERGE_DEFAULT default to n unless CONFIG_SLUB_TINY is
> enabled. Benefits of slab merging is limited on systems that are not
> memory constrained: the overhead is negligible and evidence of its
> effect on cache hotness is hard to come by.
> 
> On the other hand, distinguishing allocations into different slabs will
> make attacks that rely on "heap spraying" more difficult to carry out
> with success.
> 
> Take sides with security in the default kernel configuration over
> questionnable performance benefits/memory efficiency.
> 
> Signed-off-by: Julian Pidancet <julian.pidancet@oracle.com>
> ---
> In an attempt to assess the performance impact of disabling slab
> merging, a timed linux kernel compilation test has been conducted first
> using slab_merge, then using slab_nomerge. Both tests started in an
> identical state.  Commodity hardware was used: a laptop with an AMD Ryzen
> 5 3500U CPU, and 16GiB of RAM. The kernel source files were placed on
> an XFS partition because of the extensive use of slab caches in XFS.
> 
> The results are as follows:
> 
>       | slab_merge       | slab_nomerge     |
> ------+------------------+------------------|
> Time  | 489.074 ± 10.334 | 489.975 ± 10.350 |
> Min   |          459.688 |          460.554 |
> Max   |          493.126 |          494.282 |
> 
> The benchmark favors the configuration where merging is disabled, but the
> difference is only ~0.18%, well under statistical significance.

As mentioned, please include these kinds of perf notes in the commit
log; it's useful to see later. :)

Regardless, yes, please. I have been running slab_nomerge on all my
systems for years and years now.

With the typo fixed and commit log updated, please consider this:

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

-- 
Kees Cook
