Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0016EC2D0E4
	for <linux-doc@archiver.kernel.org>; Fri, 18 Dec 2020 17:00:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C6E4B23B74
	for <linux-doc@archiver.kernel.org>; Fri, 18 Dec 2020 17:00:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728300AbgLRRAJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Dec 2020 12:00:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725949AbgLRRAI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Dec 2020 12:00:08 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F70CC0617B0
        for <linux-doc@vger.kernel.org>; Fri, 18 Dec 2020 08:59:28 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id b2so3070991edm.3
        for <linux-doc@vger.kernel.org>; Fri, 18 Dec 2020 08:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l2IQ6TE/rhYWCk2P0BT6shtYVSJjLwqOvjZqkUrg3hg=;
        b=x0bdaXnT2B4JXcqIt4PJy6h+bXPGtd8toCsOgNdWIJa1nPBCH5WTS5rerVO30HHHv+
         0mEXFdRjcKh4IwU/rzCLurT6prPOAZRgSMIqzb+6RHbn47F53bE4mnZw4nfnwKqzLt9O
         y2s6lpJCJeivzJE/dzH1mAeUqmd6PsLFZpksfWbC5s5r/QUjZboSHmr84aZIE5P0LJzo
         X7gN+dmAo5f5vnJ+NP5gpsL6toXTlaOai1neElJ2mwb0KuuQoEZyD/SwUgY9jIhveiWf
         ANrkYt1dOrFDv6aPQb04TGSt5QVD0JKHk4L6JLZ7vVZPZsgr5RluZpOmVL9LdFpgPmDm
         3uJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l2IQ6TE/rhYWCk2P0BT6shtYVSJjLwqOvjZqkUrg3hg=;
        b=f9whprrI3BwpzT/gTklKy0hL8F82UmprWlgb3H4dDLnwwv5WO+vucrHWYCLGWxYhu0
         TPvsNbgswowkBwbnoEETMbV/GG4DJCosyqqQU4zYqxSr2bS49xspFNZq64OJ1DUPAyhq
         MsfHG90BJT/YiEIDUZT1aharHS3rKM6XVQaIDB8gwPpgmfoj6b7CrZjk+lDdQtOjVo7q
         om5sW9rXkajJ90NNxLDLRvqa+TgZnJlFG7EOKJvR7O02H/ViBTRogtx/sdx5wuX5gf5D
         4WFa6WdDakdhorcE3TXAsqFdU1CQHsTXRSJ21lZ6qZlgNHoIE4PO+Zu6en7f68KOyvCK
         2RkA==
X-Gm-Message-State: AOAM530xS51ABIpNg6qsCQIEu3FDrn7YLRZfevaHWd/oKGA34L/wJ1B9
        DqJykSZlDFFuoqSCTkfHkmvLYojEZqluKgu9InFMVg==
X-Google-Smtp-Source: ABdhPJzi8p93x3vt5BPfkyWakXSFrE3q9YiaTjtJjD9XWTCVmH/VzLNltbu680O+caKH/UqiktjQd9bnfrMv9AkR1X4=
X-Received: by 2002:aa7:c3cd:: with SMTP id l13mr5242794edr.97.1608310766755;
 Fri, 18 Dec 2020 08:59:26 -0800 (PST)
MIME-Version: 1.0
References: <20201106232908.364581-1-ira.weiny@intel.com> <20201106232908.364581-11-ira.weiny@intel.com>
 <570ead2a-ff41-e730-d61d-0f59c67b1903@intel.com> <20201218040509.GD1563847@iweiny-DESK2.sc.intel.com>
In-Reply-To: <20201218040509.GD1563847@iweiny-DESK2.sc.intel.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Fri, 18 Dec 2020 08:59:16 -0800
Message-ID: <CAPcyv4hixbKqkkh4DsRgAF7fARH2n2zzHnqQa1cNrXDrH9PekA@mail.gmail.com>
Subject: Re: [PATCH V3 10/10] x86/pks: Add PKS test code
To:     Ira Weiny <ira.weiny@intel.com>
Cc:     Dave Hansen <dave.hansen@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>, X86 ML <x86@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-nvdimm <linux-nvdimm@lists.01.org>,
        Linux MM <linux-mm@kvack.org>, linux-kselftest@vger.kernel.org,
        Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Dec 17, 2020 at 8:05 PM Ira Weiny <ira.weiny@intel.com> wrote:
>
> On Thu, Dec 17, 2020 at 12:55:39PM -0800, Dave Hansen wrote:
> > On 11/6/20 3:29 PM, ira.weiny@intel.com wrote:
> > > +           /* Arm for context switch test */
> > > +           write(fd, "1", 1);
> > > +
> > > +           /* Context switch out... */
> > > +           sleep(4);
> > > +
> > > +           /* Check msr restored */
> > > +           write(fd, "2", 1);
> >
> > These are always tricky.  What you ideally want here is:
> >
> > 1. Switch away from this task to a non-PKS task, or
> > 2. Switch from this task to a PKS-using task, but one which has a
> >    different PKS value
>
> Or both...
>
> >
> > then, switch back to this task and make sure PKS maintained its value.
> >
> > *But*, there's no absolute guarantee that another task will run.  It
> > would not be totally unreasonable to have the kernel just sit in a loop
> > without context switching here if no other tasks can run.
> >
> > The only way you *know* there is a context switch is by having two tasks
> > bound to the same logical CPU and make sure they run one after another.
>
> Ah...  We do that.
>
> ...
> +       CPU_ZERO(&cpuset);
> +       CPU_SET(0, &cpuset);
> +       /* Two processes run on CPU 0 so that they go through context switch.  */
> +       sched_setaffinity(getpid(), sizeof(cpu_set_t), &cpuset);
> ...
>
> I think this should be ensuring that both the parent and the child are
> running on CPU 0.  At least according to the man page they should be.
>
> <man>
>         A child created via fork(2) inherits its parent's CPU affinity mask.
> </man>
>
> Perhaps a better method would be to synchronize the 2 threads more to ensure
> that we are really running at the 'same time' and forcing the context switch.
>
> >  This just gets itself into a state where it *CAN* context switch and
> > prays that one will happen.
>
> Not sure what you mean by 'This'?  Do you mean that running on the same CPU
> will sometimes not force a context switch?  Or do you mean that the sleeps
> could be badly timed and the 2 threads could run 1 after the other on the same
> CPU?  The latter is AFAICT the most likely case.
>

One way to guarantee that both threads run is to just pass a message
between them over a pipe and wait for the submitter to receive an ack
from the other end.
