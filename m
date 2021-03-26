Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A8BC433DB
	for <linux-doc@archiver.kernel.org>; Fri, 26 Mar 2021 18:13:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC5E761A26
	for <linux-doc@archiver.kernel.org>; Fri, 26 Mar 2021 18:13:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbhCZSNL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 26 Mar 2021 14:13:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:59988 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230139AbhCZSNE (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 26 Mar 2021 14:13:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A481D61A43
        for <linux-doc@vger.kernel.org>; Fri, 26 Mar 2021 18:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616782384;
        bh=Uq/AgFY34xJVilYudroh0xuth7d+ideY25PIsoXjK74=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=YpAp42isxsZEIafCiWqXNcg+iJEsANXU/QoLiPFAscP9kN9SxGwXVf2gVH54UM68G
         +Hdvy7q9hY9ZHEfclOVL4Gy9HUoGVJdRSwWaITpqN2TZngDLMGl4QNkNocJ8/u/MB4
         yH8s41hXUBtgPewPCs029AVh3nsfHuf4Q+p/IPgqReMsffAGFz/2cIw76h5ikfD9wy
         sarXnBNdWjaaYkwyQ5/Xa0aM89E58zGNOTcT4ZytjY4TiuF2k7aROz7lS4AvempSPd
         M+lNkjEMpsxy0o+8nlz3R35FoZecU981NvVK0c189en/+d16wwbWqMkiBaudk9v/D2
         Moum5QvFqAfYw==
Received: by mail-ej1-f54.google.com with SMTP id r12so9767493ejr.5
        for <linux-doc@vger.kernel.org>; Fri, 26 Mar 2021 11:13:03 -0700 (PDT)
X-Gm-Message-State: AOAM5317fwfF4zUDenyP5HNYrR+TtHmPOlnplq+Ir5lI0Xrv+JFGqkcm
        C9bJSHK6rOfh0OUONCMPGnc9KdkEv/Pcby2+CY9HMw==
X-Google-Smtp-Source: ABdhPJzWXISLN56kzZVOeyUhydNGRddfNFVOIu67Tzib/Q7Q7ad9QHtoSsg7TUfp5nvtCJ5SDiOLfj3XS6W1HVHYRPg=
X-Received: by 2002:a17:907:e88:: with SMTP id ho8mr17355824ejc.199.1616782381875;
 Fri, 26 Mar 2021 11:13:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210221185637.19281-1-chang.seok.bae@intel.com>
 <20210221185637.19281-23-chang.seok.bae@intel.com> <871rc9bl3v.fsf@nanos.tec.linutronix.de>
 <CAJvTdKkOKOgnmvAiPS6mWVoyAggbOB6hBOqb_tcHYDe8+-X+FQ@mail.gmail.com>
 <CALCETrWOc7wwW=KY2dGJGy9k5Ag=KhkdGGTDZMvgRHgyQ5fDjQ@mail.gmail.com>
 <CAJvTdK=OGALDso0H+asjgkjD_VaPNZzm+LpV+msM_i5aVUm_qw@mail.gmail.com>
 <CALCETrXky0RuA5WeQ0Mxjs+e4ywk1A7vmpBxqCo=PTSBzUsz-g@mail.gmail.com> <CAJvTdK=_G11phL6=9Ri41fJQvhRNopok_oktgvRjTM0v6ojcbg@mail.gmail.com>
In-Reply-To: <CAJvTdK=_G11phL6=9Ri41fJQvhRNopok_oktgvRjTM0v6ojcbg@mail.gmail.com>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Fri, 26 Mar 2021 11:12:50 -0700
X-Gmail-Original-Message-ID: <CALCETrX-34QqeVLjX39ZAD+4Y6XkZ3=bPEtEPxTi0YHvLgBKig@mail.gmail.com>
Message-ID: <CALCETrX-34QqeVLjX39ZAD+4Y6XkZ3=bPEtEPxTi0YHvLgBKig@mail.gmail.com>
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

On Fri, Mar 26, 2021 at 10:54 AM Len Brown <lenb@kernel.org> wrote:
>
> On Fri, Mar 26, 2021 at 11:48 AM Andy Lutomirski <luto@kernel.org> wrote:
>
> > > I submit, that after the generic XFD support is in place,
> > > there is exactly 1 bit that needs to be flipped to enable
> > > user applications to benefit from AMX.
> >
> > The TILERELEASE opcode itself is rather longer than one bit, and the
> > supporting code to invoke it at the right time, to avoid corrupting
> > user state, and avoid causing performance regressions merely by
> > existing will be orders of magnitude more than 1 bit.  Of course, all
> > of this is zero bits in the current series because the code is
> > missing.entirely.
>
> Please explain why the kernel must know about the TILERELEASE
> instruction in order for an AMX application to run properly.

I'm just repeating things already said, and this is getting
ridiculous.  TILERELEASE isn't needed for an AMX application to run
properly -- it's needed for the rest of the system to run properly, at
least according to Intel's published docs.  Quoting the current ISE
document:

3.3 RECOMMENDATIONS FOR SYSTEM SOFTWARE

System software may disable use of Intel AMX by clearing XCR0[18:17],
by clearing CR4.OSXSAVE, or by setting
IA32_XFD[18]. It is recommended that system software initialize AMX
state (e.g., by executing TILERELEASE)
before doing so. This is because maintaining AMX state in a
non-initialized state may have negative power and
performance implications.

Since you reviewed the patch set, I assume you are familiar with how
Linux manages XSTATE.  Linux does *not* eagerly load XSTATE on context
switch.  Instead, Linux loads XSTATE when the kernel needs it loaded
or before executing user code.  This means that the kernel can (and
does, and it's a performance win) execute kernel thread code and/or go
idle, *including long-term deep idle*, with user XSTATE loaded.


>
> > This isn't just about validation.  There's also ABI, performance, and
> > correctness.
>
> Thank you for agreeing that this is not about unvalidated features.
>
> > ABI: The AVX-512 enablement *already* broke user ABI.  Sadly no one
> > told anyone in the kernel community until about 5 years after the
> > fact, and it's a bit late to revert AVX-512.  But we don't want to
> > enable AMX until the ABI has a reasonable chance of being settled.
> > Ditto for future features.  As it stands, if you xstate.enable some
> > 16MB feature, the system may well simply fail to boot as too many user
> > processes explode.
>
> At Dave's suggestion, we had a 64 *KB* sanity check on this path.
> Boris forced us to remove it, because we could not tell him
> how we chose the number 64.
>
> I would be delighted to see a check for 64 KB restored, and that
> it be a rejection, rather than warning.  At this point, as there is no way
> go down that path without manually modifying the kernel, it would
> devolve into a sanity check for a hardware (CPUID) bug.

This is nuts.  The ABI is ALREADY BROKEN.  How does picking a random
number quantifying additional breakage help?  We do not have a good
design for AVX-512 in Linux, we don't have a good design for AMX in
Linux, and we absolutely don't have a good design for the secret
feature we don't know about yet in Linux.
