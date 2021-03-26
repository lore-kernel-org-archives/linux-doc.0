Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75E24C433C1
	for <linux-doc@archiver.kernel.org>; Fri, 26 Mar 2021 15:48:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42E97619FF
	for <linux-doc@archiver.kernel.org>; Fri, 26 Mar 2021 15:48:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230347AbhCZPsZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 26 Mar 2021 11:48:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:56610 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230236AbhCZPsO (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 26 Mar 2021 11:48:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1A9C761A2A
        for <linux-doc@vger.kernel.org>; Fri, 26 Mar 2021 15:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616773694;
        bh=hUxNL6ybc7YIFNd/pslVTNcuJabix3+/29+fjCafdC4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=jBiEuHavH0KHYl53Ar5g3FFA/uoOHVzn08kWTvQhL9UP4KAZOA1PisQGOEtE3eyVW
         26Md+rcRz7UBLkY9UFOlaR3fD2XsDOezmXMmRM3Vkn3TUj7h6P8P5Ju6orZe/IZzre
         dCWl4vaKWk/22dXBg8Z2fUBHNd0WD/3Ppbfus420qW1GICUvdYoYyxOy7wtGFFqtcs
         CqTbtLZefUuDO16pOTZpVUe0FNSffaRPh4uGg+MJsv9ljZ2Ejb87R5GrK+vshJRRoy
         8yrHfFrMslyROwRttMd1hq5KYpIKHPbcIliwLL0ssIShsOgAXbrBxzwAn1EzmO4N32
         uSFVWtSqPhycw==
Received: by mail-ed1-f43.google.com with SMTP id bf3so6838670edb.6
        for <linux-doc@vger.kernel.org>; Fri, 26 Mar 2021 08:48:14 -0700 (PDT)
X-Gm-Message-State: AOAM532p6P5SmTSdIhi4pMmpfU69xcFZAGUTo254lMqNQhSvd8FaCu75
        xyNo0c6mawLEaIC6zPK5+Hm7GHwzxedB3fA5vguYfQ==
X-Google-Smtp-Source: ABdhPJyHWV9B78rY1DpJMMXtlILAn3PmXLaIaZiOMXeA2eUmpRV8xruMrDO9RVF6Yg0xIg3zjhAywS0m8Rgw3DCwz3w=
X-Received: by 2002:aa7:da98:: with SMTP id q24mr16350107eds.84.1616773692708;
 Fri, 26 Mar 2021 08:48:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210221185637.19281-1-chang.seok.bae@intel.com>
 <20210221185637.19281-23-chang.seok.bae@intel.com> <871rc9bl3v.fsf@nanos.tec.linutronix.de>
 <CAJvTdKkOKOgnmvAiPS6mWVoyAggbOB6hBOqb_tcHYDe8+-X+FQ@mail.gmail.com>
 <CALCETrWOc7wwW=KY2dGJGy9k5Ag=KhkdGGTDZMvgRHgyQ5fDjQ@mail.gmail.com> <CAJvTdK=OGALDso0H+asjgkjD_VaPNZzm+LpV+msM_i5aVUm_qw@mail.gmail.com>
In-Reply-To: <CAJvTdK=OGALDso0H+asjgkjD_VaPNZzm+LpV+msM_i5aVUm_qw@mail.gmail.com>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Fri, 26 Mar 2021 08:48:01 -0700
X-Gmail-Original-Message-ID: <CALCETrXky0RuA5WeQ0Mxjs+e4ywk1A7vmpBxqCo=PTSBzUsz-g@mail.gmail.com>
Message-ID: <CALCETrXky0RuA5WeQ0Mxjs+e4ywk1A7vmpBxqCo=PTSBzUsz-g@mail.gmail.com>
Subject: Re: [PATCH v4 22/22] x86/fpu/xstate: Introduce boot-parameters to
 control state component support
To:     Len Brown <lenb@kernel.org>
Cc:     Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Chang S. Bae" <chang.seok.bae@intel.com>,
        Borislav Petkov <bp@suse.de>, Ingo Molnar <mingo@kernel.org>,
        X86 ML <x86@kernel.org>, "Brown, Len" <len.brown@intel.com>,
        Dave Hansen <dave.hansen@intel.com>,
        "Liu, Jing2" <jing2.liu@intel.com>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Documentation List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 26, 2021 at 8:34 AM Len Brown <lenb@kernel.org> wrote:
>
> On Thu, Mar 25, 2021 at 9:42 PM Andy Lutomirski <luto@kernel.org> wrote:
>
> > Regardless of what you call AMX, AMX requires kernel enabling.
>
> I submit, that after the generic XFD support is in place,
> there is exactly 1 bit that needs to be flipped to enable
> user applications to benefit from AMX.

The TILERELEASE opcode itself is rather longer than one bit, and the
supporting code to invoke it at the right time, to avoid corrupting
user state, and avoid causing performance regressions merely by
existing will be orders of magnitude more than 1 bit.  Of course, all
of this is zero bits in the current series because the code is
missing.entirely.

To avoid email thread blowup:

> If there is a new requirement that the kernel cmdline not allow anything
> that a distro didn't explicitly validate, then about 99.9% of the kernel cmdline
> options that exist today would need to be removed.
>
> Does such a requirement exist, or does it not?

This isn't just about validation.  There's also ABI, performance, and
correctness:

ABI: The AVX-512 enablement *already* broke user ABI.  Sadly no one
told anyone in the kernel community until about 5 years after the
fact, and it's a bit late to revert AVX-512.  But we don't want to
enable AMX until the ABI has a reasonable chance of being settled.
Ditto for future features.  As it stands, if you xstate.enable some
16MB feature, the system may well simply fail to boot as too many user
processes explode.

Performance:

We *still* don't know the performance implications of leaving the AMX
features in use inappropriately.  Does it completely destroy idle?
Will it literally operate CPUs out of spec such that Intel's
reliability estimates will be invalidated?  (We had that with NVMe
APST.  Let's not repeat this with XSTATE.)  The performance impacts
and transitions for AVX-512 are, to put it charitably, forthcoming.

Correctness: PKRU via the kernel's normal XSAVE path would simply be
incorrect.  Do we really trust that this won't get repeated?  Also,
frankly, a command line option that may well break lots of userspace
but that we fully expect Intel to recommend setting is not a good
thing.

--Andy
