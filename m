Return-Path: <SRS0=MgSu=DW=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC646C43467
	for <linux-doc@archiver.kernel.org>; Thu, 15 Oct 2020 14:15:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 508172225B
	for <linux-doc@archiver.kernel.org>; Thu, 15 Oct 2020 14:15:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ENts0Dm6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730674AbgJOOPQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 15 Oct 2020 10:15:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729760AbgJOOPP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Oct 2020 10:15:15 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDA61C0613D2
        for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2020 07:15:15 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id s21so3293498oij.0
        for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2020 07:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=myXCOQxC7yXdiZx9nG9HTWtecWE6QzVgfe61cEeMHyM=;
        b=ENts0Dm6VGl7JCrVX9DHKihoOjKWkL7zveAIJ88O1VvyEPa+oWNJrNnTUWLffpC6YL
         TKZfpXNJbyP7fOMAXYpJ0KmJMck477GzDbGvCHaRGkgeHkHFOsBsY/s6bxT9DLFL20Wg
         Lp9tAvWitbNSqAceLGVBs2lBdVwx4XkdZ63C6gQF6eEnSWbzQiJmzL8b0lQnxlxxHsjn
         2SbT8k3vEXKhH9Fcm8pjPRq8G6g4Y8Ss/j2S4HlSy1iO2NEchpEGTtl13KO8zAtQPtjj
         oL0+DzHoIHfHbQeV7XLjRxB12RnVxxOZsxBn8uVVr9NnNtMqM/Aih4wmRUg22V6JXiEA
         aL/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=myXCOQxC7yXdiZx9nG9HTWtecWE6QzVgfe61cEeMHyM=;
        b=E8urMWObMUx3gSWH0vLpE1sX+t0100Wp07+ePLkIAqKpZhd/lEDIBwd6evtfBdFegm
         TYEi7cFwwXBbJLSe/xcyoP78zLsSJqQViohDP0kQ5mZyOsmx4/TQIvgkRbNWwAtikSfj
         xlyEB27svwX+IFe/LNvqq0NgIkPV9FR7mB3fq/GXfK8SDgsSc8RsWhaZ6ut1aG91FCGh
         bf+BQ07UsRwCNst2B+zl0vxgjLYpNb6/FKoN7tP+vhQ7DTUW9+9+WJOfwIVQJBDpgZxg
         WpPZ3pDUzOsK6sbyLOtfERG3v5/a7qtIgza67n5n9H4tL3s6NfY3XUS+Vz4c8WAML5JV
         +Iyg==
X-Gm-Message-State: AOAM530YFuZ/I/sd/GdJC6pLDGQDeuJeuIpKnq3ADCR5nBfMuNeEH5Ax
        SwHR1S3TvCfc+LQM3K8xX3Yu5CP52TioN2Zz8vHPbA==
X-Google-Smtp-Source: ABdhPJyiZVTec8MGhfwjgMdcqomFj34Th7O68O0hMU5cub02dKvyPgALRpq80Lcmzr7NhCURFgEzH/D3O13q6ca6pFI=
X-Received: by 2002:aca:6206:: with SMTP id w6mr1155830oib.121.1602771314808;
 Thu, 15 Oct 2020 07:15:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200921132611.1700350-1-elver@google.com> <20200921132611.1700350-4-elver@google.com>
 <20200921143059.GO2139@willie-the-truck> <CAG_fn=WXknUnNmyniy_UE7daivSNmy0Da2KzNmX4wcmXC2Z_Mg@mail.gmail.com>
 <20200929140226.GB53442@C02TD0UTHF1T.local> <CAG_fn=VOR-3LgmLY-T2Fy6K_VYFgCHK0Hv+Y-atrvrVZ4mQE=Q@mail.gmail.com>
 <20201001175716.GA89689@C02TD0UTHF1T.local> <CANpmjNMFrMZybOebFwJ1GRXpt8v39AN016UDgPZzE8J3zKh9RA@mail.gmail.com>
 <20201008104501.GB72325@C02TD0UTHF1T.local> <CANpmjNOg2OeWpXn57_ikqv4KR0xVEooCDECUyRijgr0tt4+Ncw@mail.gmail.com>
 <20201015133948.GB50416@C02TD0UTHF1T.local>
In-Reply-To: <20201015133948.GB50416@C02TD0UTHF1T.local>
From:   Marco Elver <elver@google.com>
Date:   Thu, 15 Oct 2020 16:15:03 +0200
Message-ID: <CANpmjNO9Gw0-U+QynFWPPZYEVgnZA84VHi_XrXfa5aiAq3kPuQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/10] arm64, kfence: enable KFENCE for ARM64
To:     Mark Rutland <mark.rutland@arm.com>
Cc:     Alexander Potapenko <glider@google.com>,
        Will Deacon <will@kernel.org>,
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

On Thu, 15 Oct 2020 at 15:39, Mark Rutland <mark.rutland@arm.com> wrote:
> On Wed, Oct 14, 2020 at 09:12:37PM +0200, Marco Elver wrote:
> > On Thu, 8 Oct 2020 at 12:45, Mark Rutland <mark.rutland@arm.com> wrote:
> > > On Thu, Oct 08, 2020 at 11:40:52AM +0200, Marco Elver wrote:
> > > > On Thu, 1 Oct 2020 at 19:58, Mark Rutland <mark.rutland@arm.com> wrote:
>
> > > > > > > If you need virt_to_page() to work, the address has to be part of the
> > > > > > > linear/direct map.
>
> > > > We're going with dynamically allocating the pool (for both x86 and
> > > > arm64),
>
> [...]
>
> > We've got most of this sorted now for v5 -- thank you!
> >
> > The only thing we're wondering now, is if there are any corner cases
> > with using memblock_alloc'd memory for the KFENCE pool? (We'd like to
> > avoid page alloc's MAX_ORDER limit.) We have a version that passes
> > tests on x86 and arm64, but checking just in case. :-)
>
> AFAICT otherwise the only noticeable difference might be PageSlab(), if
> that's clear for KFENCE allocated pages? A few helpers appear to check
> that to determine how something was allocated (e.g. in the scatterlist
> and hwpoison code), and I suspect that needs to behave the same.

We had to take care of setting PageSlab before, too. We do this during
kfence_init().

> Otherwise, I *think* using memblock_alloc should be fine on arm64; I'm
> not entirely sure for x86 (but suspect it's similar). On arm64:
>
> * All memory is given a struct page via memblocks_present() adding all
>   memory memblocks. This includes memory allocated by memblock_alloc().
>
> * All memory is mapped into the linear map via arm64's map_mem() adding
>   all (non-nomap) memory memblocks. This includes memory allocated by
>   memblock_alloc().

Very good, thank you. We'll send v5 with these changes rebased on
5.10-rc1 (in ~2 weeks).

Thanks,
-- Marco
