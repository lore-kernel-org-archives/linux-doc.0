Return-Path: <SRS0=p3aP=EF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C959C4363A
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 02:49:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0014320791
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 02:49:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZzFLUcJs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725831AbgJ3Ctd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Oct 2020 22:49:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725797AbgJ3Ctc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Oct 2020 22:49:32 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A614C0613CF
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2020 19:49:32 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id x16so5385622ljh.2
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2020 19:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fnNcEaVlmZ1zwBSm6iv/h6d4SZP4svNibhnGn9WMLZQ=;
        b=ZzFLUcJsP78IqMGf1UPTImO/GIWxluLHjWL08uA0kJgFPvyHdkLU3YsuAawcL3Kb/S
         8x1yf9XVuuJNX+R6p+BBLhq/COLE5NUqTnm01vdSYQCmGWI8CNUMcU/K9AB5mL34CYsV
         U0Rx/gOiFDe/OV3oY+b8FKTRHSUsgPKAH9LwEsFPKFTGxK+Bf9MzcrncK7+QFdNFIQ5I
         PdC3K43ieeFOSKouXW2Dt/T2B086TZdeXWey91Dk9t3+vg0QkY1pXZdNrMTYeutNBxXx
         ohGczaoXjo0bxJKoJCA9yXrvz/v0SkHbtLLXDAmxCLBjfrEa4f2cfYYI4o+gv14K/nFP
         hJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fnNcEaVlmZ1zwBSm6iv/h6d4SZP4svNibhnGn9WMLZQ=;
        b=pB50uEMg+48j/Y2FdVK7kgUXINzU8iyY26jTx01Qiuy5n6GZOYsG6V/RNvNsPIQHWl
         BH7/96laUBXwwz0f/gR5efHxoXZ0qdfFghblS0giHnsOfawQpPn+L2OLOIMvhe8/ercS
         tI8gPGix/WF+yFeoaVQbCcxV9Cm/qByxlmuu1CjqHblmlahiUqhd5PGuBzIpTA7mPNPK
         g254aeP02QHOyWq9fdhCw/y4XCjZ3ukDcTNuh4BouD1lzkEPATaeS1T0cVmLeVKq0cPj
         oAmW9HtAp8AwXgpr5YRpnIq43NcPM0VUKQZQK8GxpYDDdu7XqVmOcnYgvZa+dM23Dr3K
         CP/g==
X-Gm-Message-State: AOAM530sMdeZ99ISTX7sptFLAtyzXyyd3RTg5FeTF3NHyPqvXdIJnkm9
        lqSVOYU2WgvNArbwU3jm9hlIwJ90rCqv1JzJsECpVA==
X-Google-Smtp-Source: ABdhPJxZ95Sl9a5nUjnr+zYQtfZedRy4PnTye/1nduOsAc2xLJZa5W80HAyqv6tzrVPMWEy/LeyxuqQT0TAnTiINPNI=
X-Received: by 2002:a2e:9a17:: with SMTP id o23mr110783lji.242.1604026170432;
 Thu, 29 Oct 2020 19:49:30 -0700 (PDT)
MIME-Version: 1.0
References: <20201029131649.182037-1-elver@google.com>
In-Reply-To: <20201029131649.182037-1-elver@google.com>
From:   Jann Horn <jannh@google.com>
Date:   Fri, 30 Oct 2020 03:49:04 +0100
Message-ID: <CAG48ez1xg0uRV6LqYOO-ibVqOO7jNRJGLVLrQfGW=s8TcbPGoQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/9] KFENCE: A low-overhead sampling-based memory
 safety error detector
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

On Thu, Oct 29, 2020 at 2:16 PM Marco Elver <elver@google.com> wrote:
> This adds the Kernel Electric-Fence (KFENCE) infrastructure. KFENCE is a
> low-overhead sampling-based memory safety error detector of heap
> use-after-free, invalid-free, and out-of-bounds access errors.  This
> series enables KFENCE for the x86 and arm64 architectures, and adds
> KFENCE hooks to the SLAB and SLUB allocators.

I think this is getting close to a good state, just a couple minor issues left.

Now that the magic "embed the memory pool in the BSS section" stuff is
gone, this series looks fairly straightforward.
