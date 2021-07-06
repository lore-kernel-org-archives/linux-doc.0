Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 980A6C07E96
	for <linux-doc@archiver.kernel.org>; Tue,  6 Jul 2021 21:20:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 729EB61CAA
	for <linux-doc@archiver.kernel.org>; Tue,  6 Jul 2021 21:20:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbhGFVWl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Jul 2021 17:22:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56742 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229984AbhGFVWl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Jul 2021 17:22:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1625606401;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=dmeFiaZKysTgf+CZ3J794gocPBdvCL0/vBhDrnYH448=;
        b=Qn1H3xRwzPNV0r6tMEwWEUuxkWCJ6hCSq2Ee2XvER7xr/FCVik/PVJZctJtmcmlL+3V5TE
        8o3ujJJKnkzzq18N/pXY6+ruLnulKBiSt7O1tocX+ELfl/OO0ObkPQ93h6FigmK0AzmwXh
        4KArJy50sFdMiFeAFeztfv6rvYvYe2E=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-_ITOEm-qOni_Up5ta9TRIg-1; Tue, 06 Jul 2021 17:20:00 -0400
X-MC-Unique: _ITOEm-qOni_Up5ta9TRIg-1
Received: by mail-lf1-f71.google.com with SMTP id e20-20020a1967540000b029035492aaea8dso31483lfj.16
        for <linux-doc@vger.kernel.org>; Tue, 06 Jul 2021 14:20:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dmeFiaZKysTgf+CZ3J794gocPBdvCL0/vBhDrnYH448=;
        b=ZsvKdutojfxv7ssSFhAw3Zvs5sK3YqNh9Lvi1A4HWulVgZCgg8gwq8klEqS724ypg/
         l+nW50Mqe3wWcPX5254HdKCG1kqX9YyJki19q0vssslvrEqvIDC62Dj8xkEJtr4bstd5
         EZ13T+axXuVx1cxYW2KgtMh3U7Uloj1wSrla0ZEC+wv4kMJcqO7ng6aZsaZ0GtBKoegp
         Q7O2ixC0gdlKOi4McG14OjV6pxpMPD2INGGYYzjVZCxLvaqRQ2ewu2FLrnQx2XMIqecI
         jsqPVwoiHQCvZfV5E0S6FDKhgtLQpXnW1OJs3mcja/8OkAVkh7cZRUfGORf/H9FmIBQf
         pXEw==
X-Gm-Message-State: AOAM530oZRDWdGZKsIFWjmv5oFKBXlqt+NH86C00eCcHNw26a67f6DLx
        zmfH+2YaehcuDl88+o8pbFj6N60JStmNrW6PNimNYcwITdJHvfx4pWxRoKSfmfbqq6DX6AZRiyT
        hIlGDZOttmHicujjFRb9pjUWujKwBafwmFbtp
X-Received: by 2002:a2e:824e:: with SMTP id j14mr16683935ljh.445.1625606398831;
        Tue, 06 Jul 2021 14:19:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxW1KUFvviqSIX9ybFpfYQB8YCF3zlN9GVqt+Ig/bfFAdV1I2nDVs4KZ3vbqWPOqBB1I015X7N8QOX4EbicEzg=
X-Received: by 2002:a2e:824e:: with SMTP id j14mr16683903ljh.445.1625606398404;
 Tue, 06 Jul 2021 14:19:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.2d906c322f72ec1420955136ebaa7a4c5073917c.1623272033.git-series.pawan.kumar.gupta@linux.intel.com>
 <de6b97a567e273adff1f5268998692bad548aa10.1623272033.git-series.pawan.kumar.gupta@linux.intel.com>
 <20210706195233.h6w4cm73oktfqpgz@habkost.net> <20210706211606.ezme3xvwztagbjqy@gupta-dev2.localdomain>
In-Reply-To: <20210706211606.ezme3xvwztagbjqy@gupta-dev2.localdomain>
From:   Eduardo Habkost <ehabkost@redhat.com>
Date:   Tue, 6 Jul 2021 17:19:42 -0400
Message-ID: <CAOpTY_pmNah_OCzk3XRyTsgkCPdJD1tp2RxKHMieFQM1s-tQNA@mail.gmail.com>
Subject: Re: [PATCH 4/4] x86/tsx: Add cmdline tsx=fake to not clear CPUID bits
 RTM and HLE
To:     Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@alien8.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Tony Luck <tony.luck@intel.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Kyung Min Park <kyung.min.park@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Juergen Gross <jgross@suse.com>,
        Krish Sadhukhan <krish.sadhukhan@oracle.com>,
        Kan Liang <kan.liang@linux.intel.com>,
        Joerg Roedel <jroedel@suse.de>,
        Victor Ding <victording@google.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Brijesh Singh <brijesh.singh@amd.com>,
        Dave Hansen <dave.hansen@intel.com>,
        Mike Rapoport <rppt@kernel.org>,
        Anthony Steinhauser <asteinhauser@google.com>,
        Anand K Mistry <amistry@google.com>,
        Andi Kleen <ak@linux.intel.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Joe Perches <joe@perches.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jul 6, 2021 at 5:15 PM Pawan Gupta
<pawan.kumar.gupta@linux.intel.com> wrote:
>
> On 06.07.2021 15:52, Eduardo Habkost wrote:
> >On Wed, Jun 09, 2021 at 02:14:39PM -0700, Pawan Gupta wrote:
> >> On CPUs that deprecated TSX, clearing the enumeration bits CPUID.RTM and
> >> CPUID.HLE may not be desirable in some corner cases. Like a saved guest
> >> would refuse to resume if it was saved before the microcode update
> >> that deprecated TSX.
> >
> >Why is a global option necessary to allow those guests to be
> >resumed?  Why can't KVM_GET_SUPPORTED_CPUID always return the HLE
> >and RTM bits as supported when the host CPU has them?
>
> Yes, the global option is unnecessary and this patch was dropped in v2.

Was the behaviour this patch originally tried to fix changed in v2 as
well? Is it going to be possible to resume a HLE=1,RTM=1 VM on a
TSX_FORCE_ABORT=1 host with no extra kernel command line options
needed?

-- 
Eduardo

