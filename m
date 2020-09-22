Return-Path: <SRS0=bcQJ=C7=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2C7EC2D0E2
	for <linux-doc@archiver.kernel.org>; Tue, 22 Sep 2020 09:56:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7EC66238A1
	for <linux-doc@archiver.kernel.org>; Tue, 22 Sep 2020 09:56:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Js+n82cx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbgIVJ4k (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 22 Sep 2020 05:56:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726419AbgIVJ4k (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Sep 2020 05:56:40 -0400
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com [IPv6:2607:f8b0:4864:20::c42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E052DC0613CF
        for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2020 02:56:39 -0700 (PDT)
Received: by mail-oo1-xc42.google.com with SMTP id g26so3989293ooa.9
        for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2020 02:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eVKPH13bJ8Pw64uEwVW7kgXl7zM95RCC9p4HQ/Nmkxc=;
        b=Js+n82cxs9o4HmRZr9CSN2h8XlIXga5zCjRQQqMjoMjBNYDb9Zk1jyZ/cWAe9CjE6T
         wtxq2Eg6Yuo97NcCeFMioAuTWhT5+Vn7v1Iky4fQzsqDx/VwqbybIZT2ofCISFETGzSF
         ysY/mG8RLF+R81492AgLpvFlPxr5OSr8vPEeR8W7MXuxpJAWHVmYJQzldLfS0R7qo0rS
         5cZu+Bun3id+qqZurrj34eezcYweU4EgKGbOwAiAotGHH02K20iOkWoX186rRX+a+p+g
         cdljiEoHs66HEloUBJQnjppqiT6zv7DKeo07APPIzhwfxtBW+mF1MNo3tWRlcFHka7KJ
         Lang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eVKPH13bJ8Pw64uEwVW7kgXl7zM95RCC9p4HQ/Nmkxc=;
        b=HSugULdBMtFzTKinsrFUG38u0Qe6G7829JdaFTf2F/6zKk5LL0NLsEkaJGQukpLioa
         dFRTCyM/U1Ek6/A22C1IMQ9/LjMpiUlS1mDkZUkzJReJvpZehdeKVsuZ7mlZ+QYKw9Y8
         a0RFt4Qa1T10Jut26EUlsChJzs1GQCxbw4RxHX5VW0GoSjU2uNLy8AKQFQkTT2yO7Jzl
         dSZx16r+59XeMWB7KeahSIJ9Fe+aL6e0QNI0YzMvu4Ia3djIjmjspZdsCu+ogC9z22Zm
         SLfhmhDO9yYgS2mMowjQe4Vt5y64iE+gB0GCq57pJpIyVRZP7goS5amHc/Xsuf5Sam2i
         dvwg==
X-Gm-Message-State: AOAM530Mj8zHAXJaqKRx0v4EgSizDcl9YrIz5zWknjm+PRz+zcdspnLZ
        gxYS4EW4Dwd/8Y71odo/NG64L83vzQjNWESRVaokqQ==
X-Google-Smtp-Source: ABdhPJwyNa5JtDrCrL0QwPn23WFV/NR0ScwfP8QbZgi9Zt8Jb/woYIWrdbvxRI7qVPb4gUafwyyuYw+LMdkuNVRKTIU=
X-Received: by 2002:a4a:751a:: with SMTP id j26mr2423028ooc.14.1600768599083;
 Tue, 22 Sep 2020 02:56:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200921132611.1700350-1-elver@google.com> <20200921132611.1700350-4-elver@google.com>
 <20200921143059.GO2139@willie-the-truck> <CAG_fn=WKaY9MVmbpkgoN4vaJYD_T_A3z2Lgqn+2o8-irmCKywg@mail.gmail.com>
 <CAG_fn=XV7JfJDK+t1X6bnV6gRoiogNXsHfww0jvcEtJ2WZpR7Q@mail.gmail.com> <20200921174357.GB3141@willie-the-truck>
In-Reply-To: <20200921174357.GB3141@willie-the-truck>
From:   Marco Elver <elver@google.com>
Date:   Tue, 22 Sep 2020 11:56:26 +0200
Message-ID: <CANpmjNNdGWoY_FcqUDUZ2vXy840H2+LGzN3WWrK8iERTKntSTw@mail.gmail.com>
Subject: Re: [PATCH v3 03/10] arm64, kfence: enable KFENCE for ARM64
To:     Will Deacon <will@kernel.org>
Cc:     Alexander Potapenko <glider@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Andrey Konovalov <andreyknvl@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Andy Lutomirski <luto@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Lameter <cl@linux.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Rientjes <rientjes@google.com>,
        Dmitriy Vyukov <dvyukov@google.com>,
        Eric Dumazet <edumazet@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hillf Danton <hdanton@sina.com>,
        Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Kees Cook <keescook@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Pekka Enberg <penberg@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        SeongJae Park <sjpark@amazon.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vlastimil Babka <vbabka@suse.cz>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 21 Sep 2020 at 19:44, Will Deacon <will@kernel.org> wrote:
[...]
> > > > > For ARM64, we would like to solicit feedback on what the best option is
> > > > > to obtain a constant address for __kfence_pool. One option is to declare
> > > > > a memory range in the memory layout to be dedicated to KFENCE (like is
> > > > > done for KASAN), however, it is unclear if this is the best available
> > > > > option. We would like to avoid touching the memory layout.
> > > >
> > > > Sorry for the delay on this.
> > >
> > > NP, thanks for looking!
> > >
> > > > Given that the pool is relatively small (i.e. when compared with our virtual
> > > > address space), dedicating an area of virtual space sounds like it makes
> > > > the most sense here. How early do you need it to be available?
> > >
> > > Yes, having a dedicated address sounds good.
> > > We're inserting kfence_init() into start_kernel() after timekeeping_init().
> > > So way after mm_init(), if that matters.
> >
> > The question is though, how big should that dedicated area be?
> > Right now KFENCE_NUM_OBJECTS can be up to 16383 (which makes the pool
> > size 64MB), but this number actually comes from the limitation on
> > static objects, so we might want to increase that number on arm64.
>
> What happens on x86 and why would we do something different?

On x86 we just do `char __kfence_pool[KFENCE_POOL_SIZE] ...;` to
statically allocate the pool. On arm64 this doesn't seem to work
because static memory doesn't have struct pages?

Thanks,
-- Marco
