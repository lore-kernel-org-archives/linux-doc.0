Return-Path: <SRS0=p3aP=EF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C7DC4363A
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 02:50:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 637EC2087E
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 02:50:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="faQ03KFX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726306AbgJ3CuQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Oct 2020 22:50:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726300AbgJ3CuQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Oct 2020 22:50:16 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8264C0613D2
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2020 19:50:15 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id d25so5309340ljc.11
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2020 19:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=29/mvfnx5ijMJBRqUvdSEy/Y/vTbwUpvdNL7Ey86vSQ=;
        b=faQ03KFXKTqcZsL9fNFS449tMLuSCnxgJhFtKnocwN9b8EWh6TdCML+T98o4vgW7Bu
         XCQiDVChwaKfpII7QJ2X4N5GwQ1TPBeAjfsX/8MLjFClRaQq+OqOOfP+roZR/UGlXVbb
         4YgxL9/KNeIMCBpTL8YLMVECSbAzn3aDvGoLs04L1RJZGeLUvrTQRykq5sSoL1e+g9wg
         h7UL/N4Xs7ifr6BQXsfIqsuv9NA8kAuUtAe3XL1FrrBskNV6jNxlegPBEkzQoyGx4ZGK
         XDJ6FzSnZVFU10lqVIb2wCF7ByrUQ9rGD6xhdqwFvzrziUaCOySrO9CoTcPqUBJKDnBT
         MNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=29/mvfnx5ijMJBRqUvdSEy/Y/vTbwUpvdNL7Ey86vSQ=;
        b=GO2WQVz0jRSqxXiuVg+B3a7AcvPh/jdMM5MSDCMkQ7vsGeRZ202bcqSJeYZUYJnn5t
         ZHYwNGiWZ1cXr5ix2oMKgoyEqihZjAeiNTTywyqaMX2v/2sVgtgUjbo6+dKaMMGSicS5
         3yIFvna5Vu8+oCIL5s1C8SZME+4NV0z2BVnzBXi1NfyBbgF98wBbwWvX2q+vfc7q4kI7
         BULG9TYiRLj6sD5oBENSFJvOQHE8fltVoEgeXLIl9H52XRTkj+PRR1OV8m+BUMHEdrWe
         0XblVbd31huIueHC9K5O1g5PExPvJHXHpTzS1NUnzlRZ7GCM3KCSL9S01y22PWFgiE6i
         J4lQ==
X-Gm-Message-State: AOAM533eZVsHE19toaj8EsDUr1vl12YDm5vNAC41PpJPihmUug2sRdlt
        f8ev6Kb6IZh1rGwdLeefGgVL+dF72b818oAEeMfW5Q==
X-Google-Smtp-Source: ABdhPJy0sA1WwM3kiKvHJaFMz/TR3IbjqMOlo5/1P3W63q7nS9+CEqGgFqxqrIzS0II1dZBsMQzuyhJLO08x8Y27c1k=
X-Received: by 2002:a2e:9f13:: with SMTP id u19mr101336ljk.160.1604026214056;
 Thu, 29 Oct 2020 19:50:14 -0700 (PDT)
MIME-Version: 1.0
References: <20201029131649.182037-1-elver@google.com> <20201029131649.182037-7-elver@google.com>
In-Reply-To: <20201029131649.182037-7-elver@google.com>
From:   Jann Horn <jannh@google.com>
Date:   Fri, 30 Oct 2020 03:49:47 +0100
Message-ID: <CAG48ez0N5iKCmg-JEwZ2oKw3zUA=5EdsL0CMi6biwLbtqFXqCA@mail.gmail.com>
Subject: Re: [PATCH v6 6/9] kfence, kasan: make KFENCE compatible with KASAN
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
> We make KFENCE compatible with KASAN for testing KFENCE itself. In
> particular, KASAN helps to catch any potential corruptions to KFENCE
> state, or other corruptions that may be a result of freepointer
> corruptions in the main allocators.
>
> To indicate that the combination of the two is generally discouraged,
> CONFIG_EXPERT=y should be set. It also gives us the nice property that
> KFENCE will be build-tested by allyesconfig builds.
>
> Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
> Co-developed-by: Marco Elver <elver@google.com>
> Signed-off-by: Marco Elver <elver@google.com>
> Signed-off-by: Alexander Potapenko <glider@google.com>

Reviewed-by: Jann Horn <jannh@google.com>

with one nit:

[...]
> diff --git a/mm/kasan/common.c b/mm/kasan/common.c
[...]
> @@ -141,6 +142,14 @@ void kasan_unpoison_shadow(const void *address, size_t size)
>          */
>         address = reset_tag(address);
>
> +       /*
> +        * We may be called from SL*B internals, such as ksize(): with a size
> +        * not a multiple of machine-word size, avoid poisoning the invalid
> +        * portion of the word for KFENCE memory.
> +        */
> +       if (is_kfence_address(address))
> +               return;

It might be helpful if you could add a comment that explains that
kasan_poison_object_data() does not need a similar guard because
kasan_poison_object_data() is always paired with
kasan_unpoison_object_data() - that threw me off a bit at first.
