Return-Path: <SRS0=tD+q=DG=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F75BC4727C
	for <linux-doc@archiver.kernel.org>; Tue, 29 Sep 2020 14:02:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 24094216C4
	for <linux-doc@archiver.kernel.org>; Tue, 29 Sep 2020 14:02:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ICA6SzbA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729122AbgI2OCF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 29 Sep 2020 10:02:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729018AbgI2OCF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Sep 2020 10:02:05 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89DC2C061755
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 07:02:05 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id x16so3970222pgj.3
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 07:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uOc+wQKeR9iMQFVgCW+E9/Ju05nBU+r7vf7w3Aw84Jc=;
        b=ICA6SzbAiu6VABJCQFScgh79U4MndSkcqDW3g5W5hWg3zZokeLmgN1DikCyg1zZpuc
         ytzuCdUvwHamWYeHnB++JMh5g3TlQxrV/o/8xZF/xHIwZySNAAwzdoQIzy5De9LHWo6U
         BMBfxboBQWHt8uZNoYvhOfNxfSjML6dkbjweM/JdvSQvyOt6F6JQX8/KiCJEGndxMJFA
         4+cfN9CU+CxIeSOyl35ohMsasFdUfxsmkZKg5S+SNx5y1fpGWSTHdLDWYkz7PssrOt5s
         4uCyqU1ZHQYUksoC9BAI8IXErDlGxckP+s4vR/WVG8QzgT3+9WCTvU5sS083UFeNorbC
         Cjqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uOc+wQKeR9iMQFVgCW+E9/Ju05nBU+r7vf7w3Aw84Jc=;
        b=XzEbMLEf/zl9kJC6RZPu/iWMcGm+UAMG1KPC5AaFUTY7W1jqzKcelmk/svqZGU42+o
         /6hh2pnEGsZhCAy2VGmx9wHTTBFldwk+Ix/1+S6pCEcW+lxnqZAF5NvvuXQ8fElxusRc
         Zb8ZGbetKdAUC6bHsObCPtrdOXf1HAY8obN+AR4BdpzcB1dBeTTnizQk3QREBrgJtXXT
         AeUqhf+xmWux+Ag/hratwkniFtnhkcE8K0zK7MP47Ijo3TE8Xg6IA4cCJ5XRiPN8Ifs0
         c8FR5ZXTWAQPnYGIYh0/QFKnCEgz/bFHdfk08J5PvBnpd++j669khSZepe9/AAWEOGhd
         z/HA==
X-Gm-Message-State: AOAM533gjuN8fCx9iODS1kOXwger4AErSkMAoBfmUVJArAWTn9e9rwNk
        0qugJonXuCfls8PBN2EKRt42j2Pd5qu7Zzfw8j5G3g==
X-Google-Smtp-Source: ABdhPJwm1SXbN9WMtge+tP0QBzrJvVif3aI8JVZkATFmqRV0dQwnUblP4/Bf6oL5wqW897E/yTrBLlA/qlbEAG5OBIA=
X-Received: by 2002:a62:1d51:0:b029:13e:d13d:a0fc with SMTP id
 d78-20020a621d510000b029013ed13da0fcmr4462384pfd.24.1601388124642; Tue, 29
 Sep 2020 07:02:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200921132611.1700350-1-elver@google.com> <20200921132611.1700350-2-elver@google.com>
 <CAAeHK+zYP6xhAEcv75zdSt03V2wAOTed6vNBYReV_U7EsRmUBw@mail.gmail.com>
 <20200929131135.GA2822082@elver.google.com> <CAAeHK+y0aPAZ8zheD5vWFDR-9YCTR251i0F1pZ9QfXuiaW0r8w@mail.gmail.com>
 <CANpmjNOFpFkrSMFezcBFJODwBK5vRi8sSEzS3AvyFu3Y0ZqgVA@mail.gmail.com>
In-Reply-To: <CANpmjNOFpFkrSMFezcBFJODwBK5vRi8sSEzS3AvyFu3Y0ZqgVA@mail.gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 29 Sep 2020 16:01:52 +0200
Message-ID: <CAAeHK+ycOZ1E1P8PGbZizYUE7EGkj90tJ8et0Ki79LZMAkJWXA@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] mm: add Kernel Electric-Fence infrastructure
To:     Marco Elver <elver@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Alexander Potapenko <glider@google.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "Paul E . McKenney" <paulmck@kernel.org>,
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
        Will Deacon <will@kernel.org>,
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

On Tue, Sep 29, 2020 at 3:49 PM Marco Elver <elver@google.com> wrote:
>
> On Tue, 29 Sep 2020 at 15:48, Andrey Konovalov <andreyknvl@google.com> wrote:
> > On Tue, Sep 29, 2020 at 3:11 PM Marco Elver <elver@google.com> wrote:
> > >
> > > On Tue, Sep 29, 2020 at 02:42PM +0200, Andrey Konovalov wrote:
> > > [...]
> > > > > +        */
> > > > > +       index = (addr - (unsigned long)__kfence_pool) / (PAGE_SIZE * 2) - 1;
> > > >
> > > > Why do we subtract 1 here? We do have the metadata entry reserved for something?
> > >
> > > Above the declaration of __kfence_pool it says:
> > >
> > >         * We allocate an even number of pages, as it simplifies calculations to map
> > >         * address to metadata indices; effectively, the very first page serves as an
> > >         * extended guard page, but otherwise has no special purpose.
> > >
> > > Hopefully that clarifies the `- 1` here.
> >
> > So there are two guard pages at the beginning and only then a page
> > that holds an object?
>
> Yes, correct.

OK, I see. This isn't directly clear from the comment though, at least for me :)
