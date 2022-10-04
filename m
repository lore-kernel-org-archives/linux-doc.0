Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F38E8C433F5
	for <linux-doc@archiver.kernel.org>; Tue,  4 Oct 2022 04:04:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbiJDEEG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 4 Oct 2022 00:04:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbiJDEED (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Oct 2022 00:04:03 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4193D2018A
        for <linux-doc@vger.kernel.org>; Mon,  3 Oct 2022 21:04:02 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id h10so8895919plb.2
        for <linux-doc@vger.kernel.org>; Mon, 03 Oct 2022 21:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=RvEgKxP6T1qxqAkm7Unywj2tbhQw7Pjq7jdmWAsf7To=;
        b=hnk1iBSJ70l817ATL90p2KUf/st5w6VY728N6VYCOyE5NZEV0I5QKKoKHWaibjPaLq
         pZ9gLKLeXx+vt27FliXjO96UKvvr5+sDu4InpI2ML4eAI4ENY/Blyh0fLL7UN+z36Nq2
         zID3qeceqlcQWqa226GaXwdViomNJnxxcfdR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=RvEgKxP6T1qxqAkm7Unywj2tbhQw7Pjq7jdmWAsf7To=;
        b=viBiVZiTSs5z1Spyk62B/yDDZh5Br5gtZyP1UwUH2e5BK9DHH3OhVWH1D/bSR6IHfg
         0qIgIzjWonRuHKV5nYHaZx8TCMNLjmQbUQeFUmKYW8Z0+szNfk+kv9KJsx9pPAAgmsft
         TdlzfhLP8J40tA6K7XdwJ1MX5EsMiDc2DBoBBQ7fZNUqkBFInE4kxEfUhNzDk8FLaDq9
         abAefDz1mVDkxm0sbXembpGuJbSLeS71IKV/eTSmBGaf4Q+q346Qj4VnR700LZ04Onp3
         gSnukQxniyqVomf30/zS96OAlNgH2ZDY6m7pwkT+6J7RUcyP3x5N+EliohUfbtw9Czmx
         OKCg==
X-Gm-Message-State: ACrzQf0NAjC2QfAZldY8ykMWrGORKgFwRLkPRIf1/PwwdyMSnEw33iry
        6dYshJsIBsxTCyDde59EUtZFIw==
X-Google-Smtp-Source: AMsMyM7KdEI59H+iJ47/cAMFWwA0qEn0hsnOiP5znSBXMuB570wDOkrIO5UVg5W1BrAPa62Gu5h5tQ==
X-Received: by 2002:a17:90b:4c41:b0:202:78e9:472b with SMTP id np1-20020a17090b4c4100b0020278e9472bmr15538866pjb.207.1664856241699;
        Mon, 03 Oct 2022 21:04:01 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h8-20020a17090a604800b0020a9f7405aesm2572982pjm.13.2022.10.03.21.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 21:04:01 -0700 (PDT)
Date:   Mon, 3 Oct 2022 21:04:00 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Dave Hansen <dave.hansen@intel.com>
Cc:     Rick Edgecombe <rick.p.edgecombe@intel.com>, x86@kernel.org,
        "H . Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Lutomirski <luto@kernel.org>,
        Balbir Singh <bsingharora@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Eugene Syromiatnikov <esyr@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H . J . Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Ravi V . Shankar" <ravi.v.shankar@intel.com>,
        Weijiang Yang <weijiang.yang@intel.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        joao.moreira@intel.com, John Allen <john.allen@amd.com>,
        kcc@google.com, eranian@google.com, rppt@kernel.org,
        jamorris@linux.microsoft.com, dethoma@microsoft.com,
        Yu-cheng Yu <yu-cheng.yu@intel.com>
Subject: Re: [PATCH v2 24/39] x86/cet/shstk: Add user-mode shadow stack
 support
Message-ID: <202210032101.A33914E4@keescook>
References: <20220929222936.14584-1-rick.p.edgecombe@intel.com>
 <20220929222936.14584-25-rick.p.edgecombe@intel.com>
 <202210031203.EB0DC0B7DD@keescook>
 <474d3aca-0cf0-8962-432b-77ac914cc563@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <474d3aca-0cf0-8962-432b-77ac914cc563@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Oct 03, 2022 at 01:04:37PM -0700, Dave Hansen wrote:
> On 10/3/22 12:43, Kees Cook wrote:
> >> +static inline void set_clr_bits_msrl(u32 msr, u64 set, u64 clear)
> >> +{
> >> +	u64 val, new_val;
> >> +
> >> +	rdmsrl(msr, val);
> >> +	new_val = (val & ~clear) | set;
> >> +
> >> +	if (new_val != val)
> >> +		wrmsrl(msr, new_val);
> >> +}
> > I always get uncomfortable when I see these kinds of generalized helper
> > functions for touching cpu bits, etc. It just begs for future attacker
> > abuse to muck with arbitrary bits -- even marked inline there is a risk
> > the compiler will ignore that in some circumstances (not as currently
> > used in the code, but I'm imagining future changes leading to such a
> > condition). Will you humor me and change this to a macro instead? That'll
> > force it always inline (even __always_inline isn't always inline):
> 
> Oh, are you thinking that this is dangerous because it's so surgical and
> non-intrusive?  It's even more powerful to an attacker than, say
> wrmsrl(), because there they actually have to know what the existing
> value is to update it.  With this helper, it's quite easy to flip an
> individual bit without disturbing the neighboring bits.
> 
> Is that it?

Yeah, it was kind of the combo: both a potential entry point to wrmsrl
for arbitrary values, but also one where all the work is done to mask
stuff out.

> I don't _like_ the #defines, but doing one here doesn't seem too onerous
> considering how critical MSRs are.

I bet there are others, but this just weirded me out. I'll live with a
macro, especially since the chance of it mutating in a non-inline is
very small, but I figured I'd mention the idea.

-- 
Kees Cook
