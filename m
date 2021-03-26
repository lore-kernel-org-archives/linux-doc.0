Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1E34C433C1
	for <linux-doc@archiver.kernel.org>; Fri, 26 Mar 2021 01:42:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BCE4B619F3
	for <linux-doc@archiver.kernel.org>; Fri, 26 Mar 2021 01:42:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbhCZBmZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Mar 2021 21:42:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:46282 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230298AbhCZBmE (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 25 Mar 2021 21:42:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A87F761A3E
        for <linux-doc@vger.kernel.org>; Fri, 26 Mar 2021 01:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616722923;
        bh=lhdlrdc+hU3vE/LlyJ7AsGL023uH4DfKolrpWa1GkuI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=IQP5gU6eEk/LsjqI4eUtnZa9SR94HEoEXKJIWFlhwJlKZfrHcJNUIIe82SdzD5C1M
         mEkSlsIUaMYxnoKGEYp7JzDKMlM6+aQcvRHrP1fGjHCVx+VlF8L4L3pYUFrfcgdR6q
         MeDDgio5j4owvGT03LpW6ieChOHCk1bxo2Lq8v3aCWKvrCHlQ5+/fZJgyrprR0nLdw
         iufe3pPP5fIv+7sVfoDucjPgJ2rHfAhKcUjn1QPQMG8riHFfPr3RPVtm3qm9G/MXTl
         FxZZpmPySGNdx/t7rjzLmu/sawSS9v/+kRCp3GTjfAdMCyMS4k3mh9aDUCuAziS7Wk
         7NgPuLDhFj94Q==
Received: by mail-ed1-f46.google.com with SMTP id e7so4509084edu.10
        for <linux-doc@vger.kernel.org>; Thu, 25 Mar 2021 18:42:03 -0700 (PDT)
X-Gm-Message-State: AOAM533vRFvUCnnqqEgejjUif9hZG4G/eUZmwy4Iie0IadWXTGrAhvdb
        184fVDd7u705lFthbCt2S6zDJJwu1x08E1BgIAbKnA==
X-Google-Smtp-Source: ABdhPJygA+5j0KJiNr1EBUuEILB/N9Hp862NXj+2pj8H/C07x3CZtacifmeVLDvAa6JYVNaX5ZxEXO9BGoqCcVDAgLQ=
X-Received: by 2002:a05:6402:382:: with SMTP id o2mr12604595edv.238.1616722922221;
 Thu, 25 Mar 2021 18:42:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210221185637.19281-1-chang.seok.bae@intel.com>
 <20210221185637.19281-23-chang.seok.bae@intel.com> <871rc9bl3v.fsf@nanos.tec.linutronix.de>
 <CAJvTdKkOKOgnmvAiPS6mWVoyAggbOB6hBOqb_tcHYDe8+-X+FQ@mail.gmail.com>
In-Reply-To: <CAJvTdKkOKOgnmvAiPS6mWVoyAggbOB6hBOqb_tcHYDe8+-X+FQ@mail.gmail.com>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Thu, 25 Mar 2021 18:41:50 -0700
X-Gmail-Original-Message-ID: <CALCETrWOc7wwW=KY2dGJGy9k5Ag=KhkdGGTDZMvgRHgyQ5fDjQ@mail.gmail.com>
Message-ID: <CALCETrWOc7wwW=KY2dGJGy9k5Ag=KhkdGGTDZMvgRHgyQ5fDjQ@mail.gmail.com>
Subject: Re: [PATCH v4 22/22] x86/fpu/xstate: Introduce boot-parameters to
 control state component support
To:     Len Brown <lenb@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        "Chang S. Bae" <chang.seok.bae@intel.com>,
        Borislav Petkov <bp@suse.de>,
        Andy Lutomirski <luto@kernel.org>,
        Ingo Molnar <mingo@kernel.org>, X86 ML <x86@kernel.org>,
        "Brown, Len" <len.brown@intel.com>,
        Dave Hansen <dave.hansen@intel.com>,
        "Liu, Jing2" <jing2.liu@intel.com>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Documentation List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 25, 2021 at 3:59 PM Len Brown <lenb@kernel.org> wrote:
>
> On Sat, Mar 20, 2021 at 4:57 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> > We won't enable features which are unknown ever. Keep that presilicon
> > test gunk where it belongs: In the Intel poison cabinet along with the
> > rest of the code which nobody ever want's to see.
>
> I agree, it would be irresponsible to enable unvalidated features by default,
> and pre-silicon "test gunk" should be kept out of the upstream kernel.
>
> This patch series is intended solely to enable fully validated
> hardware features,
> with product quality kernel support.
>
> The reason that the actual AMX feature isn't mentioned until the 16th
> patch in this series
> is because all of the patches before it are generic state save/restore patches,
> that are not actually specific to AMX.
>
> We call AMX a "simple state feature" -- it actually requires NO KERNEL ENABLING
> above the generic state save/restore to fully support userspace AMX
> applications.

Regardless of what you call AMX, AMX requires kernel enabling.
Specifically, it appears that leaving AMX in use in the XINUSE sense
degrades system performance and/or power.  And the way to handle that
in kernel (TILERELEASE) cannot possibly be construed as generic.
Here's a little summary of XSTATE features that have failed to be
simple:

 - XMM: seemed simple, but the performance issues switching between
legacy and VEX are still unresolved.  And they affect the kernel, and
people have noticed and complained.

 - ZMM and the high parts of X/YMM: Intel *still* hasn't documented
the actual performance rules.  Reports from people trying to reverse
engineer it suggest that it's horrible on all but the very newest
chips.  For some reason, glibc uses it.  And it broke sigaltstack.  I
have NAKked in-kernel AVX-512 usage until Intel answers a long list of
questions.  No progress yet.

 - PKRU: makes no sense as an XSAVE feature.

 - AMX: XFD, as I understand it, has virtualization problems.  And the
TILERELEASE issue is unresolved.

Intel's track record here is poor.  If you want the kernel to trust
Intel going forward, Intel needs to build trust first.

> So after the generic state management support, the kernel enabling of AMX
> is not actually required to run applications.  Just like when a new instruction
> is added that re-uses existing state -- the application or library can check
> CPUID and just use it.  It is a formality (perhaps an obsolete one), that
> we add every feature flag to /proc/cpuid for the "benefit" of userspace.

Even this isn't true.  AVX-512 already Broke ABI (tm).  Sorry for the
big evil words, but existing programs that worked on Linux stopped
working due to kernel enablement of AVX-512.  AMX has the same
problem, except more than an order of magnitude worse.  No credible
resolution has shown up, and the only remotely credible idea anyone
has mentioned is to actually mask AMX in XCR0 until an application
opts in to an as-yet-undetermined new ABI.

--Andy
