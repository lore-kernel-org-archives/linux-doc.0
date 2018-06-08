Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DE58D7D043
	for <lwn-linux-doc@archive.lwn.net>; Fri,  8 Jun 2018 00:59:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752156AbeFHA7x (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Jun 2018 20:59:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:49694 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751752AbeFHA7w (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 7 Jun 2018 20:59:52 -0400
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6D5EE208B4
        for <linux-doc@vger.kernel.org>; Fri,  8 Jun 2018 00:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1528419591;
        bh=54cyx0txs+H+Cvzvz58YOSX9iyPM5ukTrpI28aaQMaU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Kj2RhG9LwmQ50T349iZnpRg8TOjFQ5tXEy9rRAXlp/HXw4lC+kjv0WloHD8w/s7ni
         3uv+09lKSQ2qnQdHdTn63Ggm2NPygIf6HswoHmN2zkYom6m+ymEDeSCKzp/sLnl82C
         7fpXRt45yzc2wGmbp1hq7sAbWl44PS/EfJSyDgPc=
Received: by mail-wm0-f41.google.com with SMTP id n5-v6so444040wmc.5
        for <linux-doc@vger.kernel.org>; Thu, 07 Jun 2018 17:59:51 -0700 (PDT)
X-Gm-Message-State: APt69E0gCLZJ5pQ29tb6+y8yiTNvsZJ/JdTeDeyS7se4DND/7nc7ChJc
        CWB0d7hL4hj5CO8u21KE/R4GPGkJHwzlWoXwzM7beA==
X-Google-Smtp-Source: ADUXVKJD5GXnJVN58JWvgSWotfmX6RjeZ5OhWrvmWU6+BTmP3Ztbc1Bg79waP62cjK3+b0MR03SgRIkJ9tCVpEOmYYc=
X-Received: by 2002:a1c:4a9d:: with SMTP id n29-v6mr26925wmi.46.1528419589754;
 Thu, 07 Jun 2018 17:59:49 -0700 (PDT)
MIME-Version: 1.0
References: <20180607143705.3531-1-yu-cheng.yu@intel.com> <20180607143705.3531-7-yu-cheng.yu@intel.com>
 <CALCETrVa8MtxP9iqYkZLnetaQiN4UaWb=jGz1+rLsCuETHKydg@mail.gmail.com> <5c39caf1-2198-3c2b-b590-8c38a525747f@linux.intel.com>
In-Reply-To: <5c39caf1-2198-3c2b-b590-8c38a525747f@linux.intel.com>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Thu, 7 Jun 2018 17:59:37 -0700
X-Gmail-Original-Message-ID: <CALCETrU7uNpSp8DWKnpH28wHE3JOeXkmp-H97n2nWHJEu4pDEA@mail.gmail.com>
Message-ID: <CALCETrU7uNpSp8DWKnpH28wHE3JOeXkmp-H97n2nWHJEu4pDEA@mail.gmail.com>
Subject: Re: [PATCH 6/9] x86/mm: Introduce ptep_set_wrprotect_flush and
 related functions
To:     Dave Hansen <dave.hansen@linux.intel.com>
Cc:     Yu-cheng Yu <yu-cheng.yu@intel.com>,
        LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org,
        Linux-MM <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>, X86 ML <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. J. Lu" <hjl.tools@gmail.com>,
        "Shanbhogue, Vedvyas" <vedvyas.shanbhogue@intel.com>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Oleg Nesterov <oleg@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
        mike.kravetz@oracle.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 7, 2018 at 1:30 PM Dave Hansen <dave.hansen@linux.intel.com> wrote:
>
> On 06/07/2018 09:24 AM, Andy Lutomirski wrote:
>
> >> +static inline void ptep_set_wrprotect_flush(struct vm_area_struct *vma,
> >> +                                           unsigned long addr, pte_t *ptep)
> >> +{
> >> +       bool rw;
> >> +
> >> +       rw = test_and_clear_bit(_PAGE_BIT_RW, (unsigned long *)&ptep->pte);
> >> +       if (IS_ENABLED(CONFIG_X86_INTEL_SHADOW_STACK_USER)) {
> >> +               struct mm_struct *mm = vma->vm_mm;
> >> +               pte_t pte;
> >> +
> >> +               if (rw && (atomic_read(&mm->mm_users) > 1))
> >> +                       pte = ptep_clear_flush(vma, addr, ptep);
> > Why are you clearing the pte?
>
> I found my notes on the subject. :)
>
> Here's the sequence that causes the problem.  This could happen any time
> we try to take a PTE from read-write to read-only.  P==Present, W=Write,
> D=Dirty:
>
> CPU0 does a write, sees PTE with P=1,W=1,D=0
> CPU0 decides to set D=1
> CPU1 comes in and sets W=0
> CPU0 does locked operation to set D=1
>         CPU0 sees P=1,W=0,D=0
>         CPU0 sets back P=1,W=0,D=1
> CPU0 loads P=1,W=0,D=1 into the TLB
> CPU0 attempts to continue the write, but sees W=0 in the TLB and a #PF
> is generated because of the write fault.
>
> The problem with this is that we end up with a shadowstack-PTE
> (Write=0,Dirty=1) where we didn't want one.  This, unfortunately,
> imposes extra TLB flushing overhead on the R/W->R/O transitions that
> does not exist before shadowstack enabling.
>

So what exactly do the architects want the OS to do?  AFAICS the only
valid ways to clear the dirty bit are:

--- Choice 1 ---
a) Set P=0.
b) Flush using an IPI
c) Read D (so we know if the page was actually dirty)
d) Set P=1,W=0,D=0

and we need to handle spurious faults that happen between steps (a)
and (c).  This isn't so easy because the straightforward "is the fault
spurious" check is going to think it's *not* spurious.

--- Choice 2 ---
a) Set W=0
b) flush
c) Test and clear D

and we need to handle the spurious fault between b and c.  At least
this particular spurious fault is easier to handle since we can check
the error code.

But surely the right solution is to get the architecture team to see
if they can fix the dirty-bit-setting algorithm or, even better, to
look and see if the dirty-bit-setting algorithm is *already* better
and just document it.  If the cpu does a locked set-bit on D in your
example, the CPU is just being silly.  The CPU should make the whole
operation fully atomic: when trying to write to a page that's D=0 in
the TLB, it should re-walk the page tables and, atomically, load the
PTE and, if it's W=1,D=0, set D=1.  I'd honestly be a bit surprised if
modern CPUs don't already do this.

(Hmm.  If the CPUs were that smart, then we wouldn't need a flush at
all in some cases.  If we lock cmpxchg to change W=1,D=0 to W=0,D=0,
then we know that no other CPU can subsequently write the page without
re-walking, and we don't need to flush.)

Can you ask the architecture folks to clarify the situation?  And, if
your notes are indeed correct, don't we need code to handle spurious
faults?

--Andy
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
