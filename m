Return-Path: <SRS0=tD+q=DG=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA9DC4727C
	for <linux-doc@archiver.kernel.org>; Tue, 29 Sep 2020 13:49:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A8B4321924
	for <linux-doc@archiver.kernel.org>; Tue, 29 Sep 2020 13:49:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YWvZewRv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730387AbgI2Nth (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 29 Sep 2020 09:49:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730341AbgI2Nth (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Sep 2020 09:49:37 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE35DC0613D0
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 06:49:36 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id u126so5472115oif.13
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 06:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uf55h5Im87Thv0CvH7P0y872ufq4n52JjgwdZSbMlsE=;
        b=YWvZewRv9EPKGFMnrlX58gFAN4LNRwvpGbFM90qagfwzOhq0xOTQNlNS+0+/UZRUXl
         Q7O5w9O42x2fVh6uUAi4MXMRUBrKtvPQ47jSBSlQYgk1VuwO5B/SEVy9ORLiy61AlAHw
         +UzixFrJbSnGdRS8QXuZuySULzOKUs/8R3kIgIbvZ7ebPA5UfZeQv1RFr0FfPnXMg0bL
         bHxh0w1kGfiqwbe9bqgEIcuhrl3d1BBCkFUWfqeddsGe8Bze8qiCFcdUboFW+w1ha7Ek
         Y7rSAQOzrp/Pjaj+giqaZMqJIQ8LErSJVTTUhTPFN5cmDq27q8qtmhYOLdO+wydX+nS0
         zYfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uf55h5Im87Thv0CvH7P0y872ufq4n52JjgwdZSbMlsE=;
        b=H9FL5UYB6Rj0WK4lP/h0vrWQFejYwZ6KvfB8fI3GWqBe/UQfF2fXMeg2YPCkkaolje
         7Gv1FBNHhIM7OHoJryBiVKwcJy2c4Z9hdxf29eQISSqxzWy43+1CHJ9kf2kk+3fott1w
         uSN6jxkac07XgTw6Khye2KfoTtaUVT2Lv2QyJnPETXhUqtSnaJlaeIL6ajXY+hL7MmUp
         935BwuZ+QjxWvh+HTH48mvme6vm35qPqCfx7mDVdAeyVA196x8KRVumKCrwjzeCU1boS
         YHPPH1oVd/VABD1WzCVb7+iemvbxh3BeqJczs5QMjF2pbIbcrPZT6bEr39i/tPLDnV0W
         EtEQ==
X-Gm-Message-State: AOAM530n0RTA1gAJKvstuddqCKbeWkH6KCBbE3U3MGA6SDYgKG399GLi
        NypHXCwtzpEYQ+RHzRqqq6jDkhaBRwUWq+COR+dEqg==
X-Google-Smtp-Source: ABdhPJxiJi8hWBBZVcllFLyB/VLfKmBGpjW01B6eYyc4+D70if0keiWc+WE0jU5wtu+kUc8X4oTDsf54W+9c0iy9kFM=
X-Received: by 2002:aca:5158:: with SMTP id f85mr2718140oib.121.1601387375957;
 Tue, 29 Sep 2020 06:49:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200921132611.1700350-1-elver@google.com> <20200921132611.1700350-2-elver@google.com>
 <CAAeHK+zYP6xhAEcv75zdSt03V2wAOTed6vNBYReV_U7EsRmUBw@mail.gmail.com>
 <20200929131135.GA2822082@elver.google.com> <CAAeHK+y0aPAZ8zheD5vWFDR-9YCTR251i0F1pZ9QfXuiaW0r8w@mail.gmail.com>
In-Reply-To: <CAAeHK+y0aPAZ8zheD5vWFDR-9YCTR251i0F1pZ9QfXuiaW0r8w@mail.gmail.com>
From:   Marco Elver <elver@google.com>
Date:   Tue, 29 Sep 2020 15:49:24 +0200
Message-ID: <CANpmjNOFpFkrSMFezcBFJODwBK5vRi8sSEzS3AvyFu3Y0ZqgVA@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] mm: add Kernel Electric-Fence infrastructure
To:     Andrey Konovalov <andreyknvl@google.com>
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

On Tue, 29 Sep 2020 at 15:48, Andrey Konovalov <andreyknvl@google.com> wrote:
> On Tue, Sep 29, 2020 at 3:11 PM Marco Elver <elver@google.com> wrote:
> >
> > On Tue, Sep 29, 2020 at 02:42PM +0200, Andrey Konovalov wrote:
> > [...]
> > > > +        */
> > > > +       index = (addr - (unsigned long)__kfence_pool) / (PAGE_SIZE * 2) - 1;
> > >
> > > Why do we subtract 1 here? We do have the metadata entry reserved for something?
> >
> > Above the declaration of __kfence_pool it says:
> >
> >         * We allocate an even number of pages, as it simplifies calculations to map
> >         * address to metadata indices; effectively, the very first page serves as an
> >         * extended guard page, but otherwise has no special purpose.
> >
> > Hopefully that clarifies the `- 1` here.
>
> So there are two guard pages at the beginning and only then a page
> that holds an object?

Yes, correct.
