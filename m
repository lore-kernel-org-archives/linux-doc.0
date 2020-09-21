Return-Path: <SRS0=TOdD=C6=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA220C43466
	for <linux-doc@archiver.kernel.org>; Mon, 21 Sep 2020 15:37:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F5B820EDD
	for <linux-doc@archiver.kernel.org>; Mon, 21 Sep 2020 15:37:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BYc74rVc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727557AbgIUPhY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Sep 2020 11:37:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726611AbgIUPhX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Sep 2020 11:37:23 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8183CC061755
        for <linux-doc@vger.kernel.org>; Mon, 21 Sep 2020 08:37:23 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id a9so13242746wmm.2
        for <linux-doc@vger.kernel.org>; Mon, 21 Sep 2020 08:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kVxfXE34UyHx4a9aedDaVHUi6pKMiF4098HvY7EGT4c=;
        b=BYc74rVcObsxY5RoY7FBMvjUz7I+HJaB7IhAMx9FrV1rganW2S1g6KUoFgpgpnqRys
         SMWPacFyEdfqMPAw5HLCbJQmqVoKTUYfmyOBS5OBxGnpGhFWTsvJUDm8nnbfIdQAnRtP
         aWeprctyWDcO0WTV0CPMaJuFaew74ic3MENre4wcGr/Tr9AA0Es0vAnGTQmPqQQH9S+o
         +AkdKBo++MoypREVKrTr/WFM2sS3+L4CeJ6HVm2xZY0709ol4d7QVZZEDV8tRX6B77wj
         ZTn0MrnZ2DI7QIXulRGzqTFj1m6iSSKzHv/qCHZXxt2ZHklgUOXHUQGCBfgHNiYtlCCe
         vWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kVxfXE34UyHx4a9aedDaVHUi6pKMiF4098HvY7EGT4c=;
        b=OJfHUXA8RYH37aZQoVNvImKNu3TbK8cI3Av9s88rmMlf3T3HEMurK0VtkIenHFAVJV
         V15EazSmQ57mQlek8MbSyZiEKJ0JviYvA0DHOTilJwO3d3UWGhQhZJxiFkyQtyodauur
         qFyzB2kF6xxW5XHPAqt9meGhRJyaV+d3si7MGIGdXafWXedBPSM27QTSr5PI8Oobi576
         QfNw1kEUstIet0lAgFC+s6RfVxHmUtfZkivb86FLwmpVg5qm3Wdt9VHvgSAfg0ls5vRi
         cAz0/WejVspncB8MD5WVOe9UkpVoxF05RcpkUc2edTRZdOHq5U4u+d5qU5Ad2uVwqq5E
         is6A==
X-Gm-Message-State: AOAM532wRGJuzwZke788NRx9eEgQTW24FIBJq45LjwD8/W1KDWpCF+GK
        Hsren9Vg3gRmunb+MMSzxVARvnJ4IthWGKkp5OqEqg==
X-Google-Smtp-Source: ABdhPJxOztNZkizJnsXhj3wk+nWXFKqGPJsuyIzMb4d7s9SxqbYZ2lfULvl21tc0mzpAWLEjISHQ1AcbURiGb5k8xgg=
X-Received: by 2002:a7b:c4d3:: with SMTP id g19mr199189wmk.165.1600702641972;
 Mon, 21 Sep 2020 08:37:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200921132611.1700350-1-elver@google.com> <20200921132611.1700350-4-elver@google.com>
 <20200921143059.GO2139@willie-the-truck> <CAG_fn=WKaY9MVmbpkgoN4vaJYD_T_A3z2Lgqn+2o8-irmCKywg@mail.gmail.com>
In-Reply-To: <CAG_fn=WKaY9MVmbpkgoN4vaJYD_T_A3z2Lgqn+2o8-irmCKywg@mail.gmail.com>
From:   Alexander Potapenko <glider@google.com>
Date:   Mon, 21 Sep 2020 17:37:10 +0200
Message-ID: <CAG_fn=XV7JfJDK+t1X6bnV6gRoiogNXsHfww0jvcEtJ2WZpR7Q@mail.gmail.com>
Subject: Re: [PATCH v3 03/10] arm64, kfence: enable KFENCE for ARM64
To:     Will Deacon <will@kernel.org>
Cc:     Marco Elver <elver@google.com>,
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
        Jonathan.Cameron@huawei.com, Jonathan Corbet <corbet@lwn.net>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Kees Cook <keescook@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Pekka Enberg <penberg@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, sjpark@amazon.com,
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

On Mon, Sep 21, 2020 at 4:58 PM Alexander Potapenko <glider@google.com> wrote:
>
> On Mon, Sep 21, 2020 at 4:31 PM Will Deacon <will@kernel.org> wrote:
> >
> > On Mon, Sep 21, 2020 at 03:26:04PM +0200, Marco Elver wrote:
> > > Add architecture specific implementation details for KFENCE and enable
> > > KFENCE for the arm64 architecture. In particular, this implements the
> > > required interface in <asm/kfence.h>. Currently, the arm64 version does
> > > not yet use a statically allocated memory pool, at the cost of a pointer
> > > load for each is_kfence_address().
> > >
> > > Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
> > > Co-developed-by: Alexander Potapenko <glider@google.com>
> > > Signed-off-by: Alexander Potapenko <glider@google.com>
> > > Signed-off-by: Marco Elver <elver@google.com>
> > > ---
> > > For ARM64, we would like to solicit feedback on what the best option is
> > > to obtain a constant address for __kfence_pool. One option is to declare
> > > a memory range in the memory layout to be dedicated to KFENCE (like is
> > > done for KASAN), however, it is unclear if this is the best available
> > > option. We would like to avoid touching the memory layout.
> >
> > Sorry for the delay on this.
>
> NP, thanks for looking!
>
> > Given that the pool is relatively small (i.e. when compared with our virtual
> > address space), dedicating an area of virtual space sounds like it makes
> > the most sense here. How early do you need it to be available?
>
> Yes, having a dedicated address sounds good.
> We're inserting kfence_init() into start_kernel() after timekeeping_init().
> So way after mm_init(), if that matters.

The question is though, how big should that dedicated area be?
Right now KFENCE_NUM_OBJECTS can be up to 16383 (which makes the pool
size 64MB), but this number actually comes from the limitation on
static objects, so we might want to increase that number on arm64.
