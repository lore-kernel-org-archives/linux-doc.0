Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECE90C4332F
	for <linux-doc@archiver.kernel.org>; Fri, 21 Oct 2022 02:11:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbiJUCLT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 Oct 2022 22:11:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbiJUCLS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Oct 2022 22:11:18 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F7791EEA02
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 19:11:17 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id o2so1186300qkk.10
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 19:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ASIrxtSBDsxk4HGQqbLDireIOxv7TbGHiig0CHntdSI=;
        b=d0RcTWc1MKBOhhT5dKEG1Usy/aOhsV4HKs+lZmjbd5YXaVGizlNl0Eie/W1sistU3G
         5sKn7isal7vO0hl/3+xRKCOlZ1eBybkH73NcCluO/7XBbtsmJ6Fw5Wjx2PKGV4IR35QH
         +YloN2juFf0i7OOlQFZH+/wfTO9SBo0yFEw6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ASIrxtSBDsxk4HGQqbLDireIOxv7TbGHiig0CHntdSI=;
        b=GNMWKNr1UY/VfsuqnRtiARD4rmALuoJDsyFGYQ95MfxbqnIhbVWUBnuHVqUC8TAyQv
         0diQR0HTIMtTUPTBsg53qWoa3Y3qhAkODoXRecEIAa6XXDR82vsPnjMvpjKDCo8tKAzw
         EskZ+Pjuc2JsicKmZpGg4CwrYpwomAaE0WuGV6CYp8PsT+XktfaT0+cW7/CX17cGxZg8
         KQ4NgvWKUFYs0we76xOHopIlwBIIiAes3hgACfaJcAFvt/Ua4BWuC5MO/kDsRgxUtcvv
         rGTjlGPKzs7SdJqYoeOqz0M2IlFvuDnFHVa/+gbv2IMpGkGuAYYEZibCFI9z3U94MSqT
         9ymw==
X-Gm-Message-State: ACrzQf10rihRfQxTt4HLb9fm8RIh7g3ammkiaAHWwYQpSWuUINevF0Y+
        9lBMRCstn2BLsuoQWQGDkEWmlQEiFXE+rg==
X-Google-Smtp-Source: AMsMyM50bdFy7/EXNyi1BlRdT0WBZ79LyZaNdYoSkAOGogJDygLNRvsXibM9Iyu2T5g+9QIqfhjRww==
X-Received: by 2002:a05:620a:258f:b0:6cf:663b:9751 with SMTP id x15-20020a05620a258f00b006cf663b9751mr11592040qko.367.1666318276458;
        Thu, 20 Oct 2022 19:11:16 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id g5-20020ac80705000000b00398ed306034sm7098723qth.81.2022.10.20.19.11.14
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Oct 2022 19:11:15 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-35befab86a4so10729797b3.8
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 19:11:14 -0700 (PDT)
X-Received: by 2002:a05:6902:1352:b0:6bb:3f4b:9666 with SMTP id
 g18-20020a056902135200b006bb3f4b9666mr13522092ybu.101.1666318263133; Thu, 20
 Oct 2022 19:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220815071332.627393-1-yuzhao@google.com> <20220815071332.627393-9-yuzhao@google.com>
 <Y0go8wWtdcyH1+Ch@hirez.programming.kicks-ass.net> <CAOUHufa9+FTO3Pv-5jC-e3S5goPsUGu-5KcPVHa4bWb0X+d2ug@mail.gmail.com>
 <CAHk-=wj1rc2t5noMtVOgu8XXeTM4KiggEub9PdcexxeQrYPZvA@mail.gmail.com>
 <Y1FXpHdyvXjrjbLw@hirez.programming.kicks-ass.net> <CAHk-=whQchubuDpRGFabhmcZuzdt13OOF8wznXb+Dbi3GzBQhQ@mail.gmail.com>
 <Y1GZjPO+szk7X0wP@hirez.programming.kicks-ass.net>
In-Reply-To: <Y1GZjPO+szk7X0wP@hirez.programming.kicks-ass.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 20 Oct 2022 19:10:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=wikUaRM5H_y1Bc+QyvGi40dKDL8fnCTyz7ECbwK7aHNPQ@mail.gmail.com>
Message-ID: <CAHk-=wikUaRM5H_y1Bc+QyvGi40dKDL8fnCTyz7ECbwK7aHNPQ@mail.gmail.com>
Subject: Re: [PATCH v14 08/14] mm: multi-gen LRU: support page table walks
To:     Peter Zijlstra <peterz@infradead.org>,
        "the arch/x86 maintainers" <x86@kernel.org>
Cc:     Yu Zhao <yuzhao@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andi Kleen <ak@linux.intel.com>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Michael Larabel <Michael@michaellarabel.com>,
        Michal Hocko <mhocko@kernel.org>,
        Mike Rapoport <rppt@kernel.org>, Tejun Heo <tj@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        page-reclaim@google.com, Brian Geffon <bgeffon@google.com>,
        Jan Alexander Steffens <heftig@archlinux.org>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        Steven Barrett <steven@liquorix.net>,
        Suleiman Souhlal <suleiman@google.com>,
        Daniel Byrne <djbyrne@mtu.edu>,
        Donald Carr <d@chaos-reins.com>,
        =?UTF-8?Q?Holger_Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>,
        Konstantin Kharlamov <Hi-Angel@yandex.ru>,
        Shuang Zhai <szhai2@cs.rochester.edu>,
        Sofia Trinh <sofia.trinh@edi.works>,
        Vaibhav Jain <vaibhav@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 20, 2022 at 11:55 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Thu, Oct 20, 2022 at 10:35:28AM -0700, Linus Torvalds wrote:
> > That said, I reacted to that cmpxchg loop:
> >
> >         } while (cmpxchg64(&pmdp->pmd, old.pmd, 0ULL) != old.pmd);
> >
> > is this series just so old (but rebased) that it doesn't use "try_cmpxchg64()"?
>
> Yep -- it's *that* old :-/ You're not in fact the first to point that
> out.
>
> I'll make time tomorrow to fix it up and respin and send out. This is as
> good a time as any to get rid of carrying these patches myself.

Hmm. Thinking some more about it, even if you do it as a
try_cmpxchg64() loop, it ends up being duplicated twice.

Maybe we should just bite the bullet, and say that we only support
x86-32 with 'cmpxchg8b' (ie Pentium and later).

Get rid of all the "emulate 64-bit atomics with cli/sti, knowing that
nobody has SMP on those CPU's anyway", and implement a generic x86-32
xchg() setup using that try_cmpxchg64 loop.

I think most (all?) distros already enable X86_PAE anyway, which makes
that X86_CMPXCHG64 be part of the base requirement.

Not that I'm convinced most distros even do 32-bit development anyway
these days.

(Of course, if we require X86_CMPXCHG64, we'll also hit some of the
odd clone CPU's that actually *do* support the instruction, but do not
report it in cpuid due to an odd old Windows NT bug. IOW, things like
the Cyrix and Transmeta CPU's did support the instruction, but had the
CX8 bit clear because otherwise NT wouldn't boot. We may or may not
get those cases right, but I doubt anybody really has any of those old
CPUs).

We got rid of i386 support back in 2012. Maybe it's time to get rid of
i486 support in 2022?

That way we could finally get rid of CONFIG_MATH_EMULATION too.

               Linus
