Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 57EE67D062
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Jun 2018 20:57:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933178AbeFGU53 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Jun 2018 16:57:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:41480 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933044AbeFGU5W (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 7 Jun 2018 16:57:22 -0400
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com [209.85.128.179])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 62E45208B1
        for <linux-doc@vger.kernel.org>; Thu,  7 Jun 2018 20:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1528405036;
        bh=wQ17FDLYtNka0RhI4z8H8Sf+ZZ7xe/5gI0D7GKp659M=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=nh9WlCmNEEeRNt0Z61dRG4ibhoHXhfgKUh/eLdxMar9q0q8CQfkPLoC01v5bl0Ato
         7EV2uYQAoUEt59pqcsDow94ID1IhBd57/7g81wNbCtpGwQGUAHtpTM6c47WhCWAzQ3
         FKBaMig67nD776ylOLCvMpH3PoWmuBReNnDoM3KI=
Received: by mail-wr0-f179.google.com with SMTP id o12-v6so11181030wrm.12
        for <linux-doc@vger.kernel.org>; Thu, 07 Jun 2018 13:57:16 -0700 (PDT)
X-Gm-Message-State: APt69E0d8KqrYgc5sChw5aQvcI2fHFBExvf9xbr/jiqEbRgK47VVui0f
        yoWMHkc0G6g7w5elAO3uDyBiolkeYdO5DwOxDCBBeQ==
X-Google-Smtp-Source: ADUXVKIrychLOtP7/QzH5MGxP3n2teQOKye/aMNSQ3UbTU49znGLRY8fIyvHKqedZXPO6n+wb0ktpLiuCpc2puNMd48=
X-Received: by 2002:adf:85ec:: with SMTP id 41-v6mr2909360wru.120.1528405034780;
 Thu, 07 Jun 2018 13:57:14 -0700 (PDT)
MIME-Version: 1.0
References: <20180607143807.3611-1-yu-cheng.yu@intel.com> <20180607143807.3611-4-yu-cheng.yu@intel.com>
 <CALCETrWo77RS_wOzskw5OG-LdC1S-b_NY=uPWUmPbQEnNwANgQ@mail.gmail.com> <20180607200714.GA2525@uranus>
In-Reply-To: <20180607200714.GA2525@uranus>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Thu, 7 Jun 2018 13:57:03 -0700
X-Gmail-Original-Message-ID: <CALCETrXAoPsHK49c1Dpa8N0ccsxjwnVOTktKVaY++xjHxdmUzg@mail.gmail.com>
Message-ID: <CALCETrXAoPsHK49c1Dpa8N0ccsxjwnVOTktKVaY++xjHxdmUzg@mail.gmail.com>
Subject: Re: [PATCH 03/10] x86/cet: Signal handling for shadow stack
To:     Cyrill Gorcunov <gorcunov@gmail.com>
Cc:     Yu-cheng Yu <yu-cheng.yu@intel.com>,
        Florian Weimer <fweimer@redhat.com>,
        Dmitry Safonov <dsafonov@virtuozzo.com>,
        LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org,
        Linux-MM <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>, X86 ML <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. J. Lu" <hjl.tools@gmail.com>,
        "Shanbhogue, Vedvyas" <vedvyas.shanbhogue@intel.com>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Oleg Nesterov <oleg@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
        mike.kravetz@oracle.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 7, 2018 at 1:07 PM Cyrill Gorcunov <gorcunov@gmail.com> wrote:
>
> On Thu, Jun 07, 2018 at 11:30:34AM -0700, Andy Lutomirski wrote:
> > On Thu, Jun 7, 2018 at 7:41 AM Yu-cheng Yu <yu-cheng.yu@intel.com> wrote:
> > >
> > > Set and restore shadow stack pointer for signals.
> >
> > How does this interact with siglongjmp()?
> >
> > This patch makes me extremely nervous due to the possibility of ABI
> > issues and CRIU breakage.
> >
> > > diff --git a/arch/x86/include/uapi/asm/sigcontext.h b/arch/x86/include/uapi/asm/sigcontext.h
> > > index 844d60eb1882..6c8997a0156a 100644
> > > --- a/arch/x86/include/uapi/asm/sigcontext.h
> > > +++ b/arch/x86/include/uapi/asm/sigcontext.h
> > > @@ -230,6 +230,7 @@ struct sigcontext_32 {
> > >         __u32                           fpstate; /* Zero when no FPU/extended context */
> > >         __u32                           oldmask;
> > >         __u32                           cr2;
> > > +       __u32                           ssp;
> > >  };
> > >
> > >  /*
> > > @@ -262,6 +263,7 @@ struct sigcontext_64 {
> > >         __u64                           trapno;
> > >         __u64                           oldmask;
> > >         __u64                           cr2;
> > > +       __u64                           ssp;
> > >
> > >         /*
> > >          * fpstate is really (struct _fpstate *) or (struct _xstate *)
> > > @@ -320,6 +322,7 @@ struct sigcontext {
> > >         struct _fpstate __user          *fpstate;
> > >         __u32                           oldmask;
> > >         __u32                           cr2;
> > > +       __u32                           ssp;
> >
> > Is it actually okay to modify these structures like this?  They're
> > part of the user ABI, and I don't know whether any user code relies on
> > the size being constant.
>
> For sure it might cause problems for CRIU since we have
> similar definitions for this structure inside our code.
> That said if kernel is about to modify the structures it
> should keep backward compatibility at least if a user
> passes previous version of a structure @ssp should be
> set to something safe by the kernel itself.
>
> I didn't read the whole series of patches in details
> yet, hopefully will be able tomorrow. Thanks Andy for
> CC'ing!

We have uc_flags.  It might be useful to carve out some of the flag
space (24 bits?) to indicate something like the *size* of sigcontext
and teach the kernel that new sigcontext fields should only be parsed
on sigreturn() if the size is large enough.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
