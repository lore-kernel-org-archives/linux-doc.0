Return-Path: <SRS0=p3aP=EF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 932EFC4741F
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 02:50:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 371F42087E
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 02:50:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="etxHYnTq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbgJ3CuB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Oct 2020 22:50:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726117AbgJ3CuA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Oct 2020 22:50:00 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14AACC0613CF
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2020 19:50:00 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id d24so5305925ljg.10
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2020 19:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z9WOxdh6RCpZm8X6kMwbW3XPGG0WSUUUAze88LfZLdE=;
        b=etxHYnTqjwBUbwtfAT9j7VihFyCPL/m5eoH6lV63Jwf/ogaS8IKuC/qJ0F2t2aJCTu
         YcXfkY8v4/Ze8lP8pZWLnoMm5+afhhjmu2kX8tx4XUTc2g3+taqkP5iw5O/XxbrXeokh
         /Z4gZPHmELyAamNnAVQZEPpF1z6I7AvobWo9rXIWQ4W9PVyMLUg7pHsdscCI4vcHhut2
         KDKv2h0XeSjZIlzeLYggI3qsLbeEI5HKczEYovWFfTlfU5RcMT5lRZ2+Xe9rQ1O/YFlY
         Bjdk2siK5slwbxSG7EkMj23241i3jE2SX9x0CZ83wo0uv4SrDXzDA4uTA7PNluOo5tQY
         TYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z9WOxdh6RCpZm8X6kMwbW3XPGG0WSUUUAze88LfZLdE=;
        b=A7w3mhbYi5rFlW2XTp58lPnOZz7CnCKBalU61YpExUEIfee0xghh7Sh4HpF+aFNI0b
         1sMXlc9Cc7St259fu2+IVvh1b2eSqruiuGm3Jq6clrXHhnXnoYAjcSxHkT3S5JKETlPE
         J6Bxz9Dvtj6vjep+yKprs6Q3dXNc1y/FZsWrmml6MuqurkRYXGRFtMEcYnh3sEZDGddE
         euuobLJNoW51fQCwSerfR3tTRI50skGCJtTtnwFzcapymBwfqfJB7h7hU3yHmpy6a09U
         YP4JbXMUCY4T1CAncFhqlQrwuCvfuqX6Mi9qKR8b1HlxRhLEjh9sfX82w20H3xHjm5pM
         j4hg==
X-Gm-Message-State: AOAM532BfL+yyEqv8pv6e12b2GiGXu4u89VQlOBHVvU5SLXpSMq3gaBf
        WL5VJV2Rkts+FVv0yE926UHukZCZm/zqpp5w8ETd4g==
X-Google-Smtp-Source: ABdhPJwE/Q8Xn7eqLDDiYpTHlTjaaBJjfas81RL+GS05oC24gJGCW+LBgod9ZKVq7Rn7XWiNj/59sO4G5qgTD6gJ5JY=
X-Received: by 2002:a05:651c:1313:: with SMTP id u19mr95728lja.47.1604026198405;
 Thu, 29 Oct 2020 19:49:58 -0700 (PDT)
MIME-Version: 1.0
References: <20201029131649.182037-1-elver@google.com> <20201029131649.182037-5-elver@google.com>
In-Reply-To: <20201029131649.182037-5-elver@google.com>
From:   Jann Horn <jannh@google.com>
Date:   Fri, 30 Oct 2020 03:49:31 +0100
Message-ID: <CAG48ez1DxttDs6vj61c0jSGSbhoUmAW9_OSBSENrC-=hz-d+HA@mail.gmail.com>
Subject: Re: [PATCH v6 4/9] mm, kfence: insert KFENCE hooks for SLAB
To:     Marco Elver <elver@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Alexander Potapenko <glider@google.com>,
        "H . Peter Anvin" <hpa@zytor.com>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        Andrey Konovalov <andreyknvl@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Andy Lutomirski <luto@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Lameter <cl@linux.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Rientjes <rientjes@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Eric Dumazet <edumazet@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hillf Danton <hdanton@sina.com>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>, joern@purestorage.com,
        Kees Cook <keescook@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Pekka Enberg <penberg@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        SeongJae Park <sjpark@amazon.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-MM <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 29, 2020 at 2:17 PM Marco Elver <elver@google.com> wrote:
> Inserts KFENCE hooks into the SLAB allocator.
[...]
> diff --git a/mm/slab.c b/mm/slab.c
[...]
> @@ -3416,6 +3427,11 @@ static void cache_flusharray(struct kmem_cache *cachep, struct array_cache *ac)
>  static __always_inline void __cache_free(struct kmem_cache *cachep, void *objp,
>                                          unsigned long caller)
>  {
> +       if (kfence_free(objp)) {
> +               kmemleak_free_recursive(objp, cachep->flags);
> +               return;
> +       }

This looks dodgy. Normally kmemleak is told that an object is being
freed *before* the object is actually released. I think that if this
races really badly, we'll make kmemleak stumble over this bit in
create_object():

kmemleak_stop("Cannot insert 0x%lx into the object search tree
(overlaps existing)\n",
      ptr);


> +
>         /* Put the object into the quarantine, don't touch it for now. */
>         if (kasan_slab_free(cachep, objp, _RET_IP_))
>                 return;
