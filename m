Return-Path: <SRS0=jz+U=74=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84E27C433E0
	for <linux-doc@archiver.kernel.org>; Mon, 15 Jun 2020 19:12:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5994120739
	for <linux-doc@archiver.kernel.org>; Mon, 15 Jun 2020 19:12:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UgISKDd4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729354AbgFOTMH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 15 Jun 2020 15:12:07 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:53046 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731282AbgFOTMG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 Jun 2020 15:12:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592248324;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=gBDypd72AayeylkkdmJfk3R+s+aCIKax33JorcXAteU=;
        b=UgISKDd48XzOfK5Na/MKWgFNfFPb2eDn2kZmSxkrJtg45CJTSfrSeXaEZdEK/z3ySvFXeT
        r4kjb7xQR0WV6MDcQhhhW+3u0uQpdsLq62d2oS81RiqukPVKZ32s5rMplmw7mssWwS8OY9
        dQPb8fICmUTVV0mVxRiFhrRH0ejsSpI=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-7nCzOdZ0N0ygJkFHfHjhxQ-1; Mon, 15 Jun 2020 15:11:51 -0400
X-MC-Unique: 7nCzOdZ0N0ygJkFHfHjhxQ-1
Received: by mail-qv1-f70.google.com with SMTP id p18so13777133qvy.11
        for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2020 12:11:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gBDypd72AayeylkkdmJfk3R+s+aCIKax33JorcXAteU=;
        b=NWnA7/fubWH/IKPMYzGTXRHMZaC4RF9MI+vlnoQXZwzwrGgXhpwBeD7ih1OLKTzxmD
         83DmqYwSceJnY4Uj79OaDi/QygyHR//i0bQQ/Ce7mdfus/u+qU5fvpfqHXT/yewrrLXH
         TRHfzYy66pJ5c2cKEU1+CdBwQU3jfTPjVY2/Us/SPbhRhPsCLrU6+ZmWzbGNp0jK4qxQ
         pZQFxausaJ653MXaVpe/SOFL6pAC3yY2v3dyB67uOI2iQbA3PS4mymvQmuaf3SsuU87D
         59dBiTElBXWFwbzYLtEAnBpIuq7cXvLh/JHqKqZgQ1ccSu1g+cEpxEGEIhHRxTz7doSN
         Ce9A==
X-Gm-Message-State: AOAM531ujTRo4wrRw1O/wcQVtbrvor5WTpiP6l4DKsqgwki5IbK5+5ts
        Q89SHh3orXLtTqpqOPOprEM3XfXjTIVwQxOn+PPPg6T3e0ZFOsmsXeVpl9B2CEHHCJBNURAQHUt
        b3bzzRJu2NE3MWJrntX5A9fLr+AT3rYyGSEe1
X-Received: by 2002:a0c:e254:: with SMTP id x20mr25376410qvl.153.1592248310812;
        Mon, 15 Jun 2020 12:11:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwj+hvBQAKPt+byrNt/W/RfLxG8oA1B0DgJCFqfYRYBqVFrGbuH2lT9c3kQXLnUlruGJeek3QiU4rpm8VmJsTc=
X-Received: by 2002:a0c:e254:: with SMTP id x20mr25376377qvl.153.1592248310457;
 Mon, 15 Jun 2020 12:11:50 -0700 (PDT)
MIME-Version: 1.0
References: <1589395957-24628-1-git-send-email-bhsharma@redhat.com> <CACi5LpMKSNz=_OQWmEQ2kaswbjAONjn2pXQiu=jCA=wMt3wGCQ@mail.gmail.com>
In-Reply-To: <CACi5LpMKSNz=_OQWmEQ2kaswbjAONjn2pXQiu=jCA=wMt3wGCQ@mail.gmail.com>
From:   Bhupesh Sharma <bhsharma@redhat.com>
Date:   Tue, 16 Jun 2020 00:41:37 +0530
Message-ID: <CACi5LpNYtAFq6PYjsYArViz+gzuh5-_CKZLBqo826oWhERrx8A@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] Append new variables to vmcoreinfo (TCR_EL1.T1SZ
 for arm64 and MAX_PHYSMEM_BITS for all archs)
To:     linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Bhupesh SHARMA <bhupesh.linux@gmail.com>,
        Boris Petkov <bp@alien8.de>, Ingo Molnar <mingo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        James Morse <james.morse@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Steve Capper <steve.capper@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Dave Anderson <anderson@redhat.com>,
        Kazuhito Hagio <k-hagio@ab.jp.nec.com>,
        John Donnelly <john.p.donnelly@oracle.com>,
        Scott Branden <scott.branden@broadcom.com>,
        Amit Kachhap <amit.kachhap@arm.com>,
        linuxppc-dev@lists.ozlabs.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        kexec mailing list <kexec@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello Catalin, Will,

On Tue, Jun 2, 2020 at 10:54 AM Bhupesh Sharma <bhsharma@redhat.com> wrote:
>
> Hello,
>
> On Thu, May 14, 2020 at 12:22 AM Bhupesh Sharma <bhsharma@redhat.com> wrote:
> >
> > Apologies for the delayed update. Its been quite some time since I
> > posted the last version (v5), but I have been really caught up in some
> > other critical issues.
> >
> > Changes since v5:
> > ----------------
> > - v5 can be viewed here:
> >   http://lists.infradead.org/pipermail/kexec/2019-November/024055.html
> > - Addressed review comments from James Morse and Boris.
> > - Added Tested-by received from John on v5 patchset.
> > - Rebased against arm64 (for-next/ptr-auth) branch which has Amit's
> >   patchset for ARMv8.3-A Pointer Authentication feature vmcoreinfo
> >   applied.
> >
> > Changes since v4:
> > ----------------
> > - v4 can be seen here:
> >   http://lists.infradead.org/pipermail/kexec/2019-November/023961.html
> > - Addressed comments from Dave and added patches for documenting
> >   new variables appended to vmcoreinfo documentation.
> > - Added testing report shared by Akashi for PATCH 2/5.
> >
> > Changes since v3:
> > ----------------
> > - v3 can be seen here:
> >   http://lists.infradead.org/pipermail/kexec/2019-March/022590.html
> > - Addressed comments from James and exported TCR_EL1.T1SZ in vmcoreinfo
> >   instead of PTRS_PER_PGD.
> > - Added a new patch (via [PATCH 3/3]), which fixes a simple typo in
> >   'Documentation/arm64/memory.rst'
> >
> > Changes since v2:
> > ----------------
> > - v2 can be seen here:
> >   http://lists.infradead.org/pipermail/kexec/2019-March/022531.html
> > - Protected 'MAX_PHYSMEM_BITS' vmcoreinfo variable under CONFIG_SPARSEMEM
> >   ifdef sections, as suggested by Kazu.
> > - Updated vmcoreinfo documentation to add description about
> >   'MAX_PHYSMEM_BITS' variable (via [PATCH 3/3]).
> >
> > Changes since v1:
> > ----------------
> > - v1 was sent out as a single patch which can be seen here:
> >   http://lists.infradead.org/pipermail/kexec/2019-February/022411.html
> >
> > - v2 breaks the single patch into two independent patches:
> >   [PATCH 1/2] appends 'PTRS_PER_PGD' to vmcoreinfo for arm64 arch, whereas
> >   [PATCH 2/2] appends 'MAX_PHYSMEM_BITS' to vmcoreinfo in core kernel code (all archs)
> >
> > This patchset primarily fixes the regression reported in user-space
> > utilities like 'makedumpfile' and 'crash-utility' on arm64 architecture
> > with the availability of 52-bit address space feature in underlying
> > kernel. These regressions have been reported both on CPUs which don't
> > support ARMv8.2 extensions (i.e. LVA, LPA) and are running newer kernels
> > and also on prototype platforms (like ARMv8 FVP simulator model) which
> > support ARMv8.2 extensions and are running newer kernels.
> >
> > The reason for these regressions is that right now user-space tools
> > have no direct access to these values (since these are not exported
> > from the kernel) and hence need to rely on a best-guess method of
> > determining value of 'vabits_actual' and 'MAX_PHYSMEM_BITS' supported
> > by underlying kernel.
> >
> > Exporting these values via vmcoreinfo will help user-land in such cases.
> > In addition, as per suggestion from makedumpfile maintainer (Kazu),
> > it makes more sense to append 'MAX_PHYSMEM_BITS' to
> > vmcoreinfo in the core code itself rather than in arm64 arch-specific
> > code, so that the user-space code for other archs can also benefit from
> > this addition to the vmcoreinfo and use it as a standard way of
> > determining 'SECTIONS_SHIFT' value in user-land.
> >
> > Cc: Boris Petkov <bp@alien8.de>
> > Cc: Ingo Molnar <mingo@kernel.org>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Jonathan Corbet <corbet@lwn.net>
> > Cc: James Morse <james.morse@arm.com>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Steve Capper <steve.capper@arm.com>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Paul Mackerras <paulus@samba.org>
> > Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > Cc: Dave Anderson <anderson@redhat.com>
> > Cc: Kazuhito Hagio <k-hagio@ab.jp.nec.com>
> > Cc: John Donnelly <john.p.donnelly@oracle.com>
> > Cc: scott.branden@broadcom.com
> > Cc: Amit Kachhap <amit.kachhap@arm.com>
> > Cc: x86@kernel.org
> > Cc: linuxppc-dev@lists.ozlabs.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-doc@vger.kernel.org
> > Cc: kexec@lists.infradead.org
> >
> > Bhupesh Sharma (2):
> >   crash_core, vmcoreinfo: Append 'MAX_PHYSMEM_BITS' to vmcoreinfo
> >   arm64/crash_core: Export TCR_EL1.T1SZ in vmcoreinfo
> >
> >  Documentation/admin-guide/kdump/vmcoreinfo.rst | 16 ++++++++++++++++
> >  arch/arm64/include/asm/pgtable-hwdef.h         |  1 +
> >  arch/arm64/kernel/crash_core.c                 | 10 ++++++++++
> >  kernel/crash_core.c                            |  1 +
> >  4 files changed, 28 insertions(+)
>
> Ping. @James Morse , Others
>
> Please share if you have some comments regarding this patchset.

Ping. I think we have two Tested-by available from Oracle and Marvell
folks on this patchset and no further review-comments.
Can you please help review/pick this patchset via the arm64 tree?

User-space utilities like makedumpfile and crash have been broken
since 52-bit VA addressing was enabled on arm64 kernel, so distros are
obliged to carry downstream-only fixes for these user-space utilities
to make them work with the kernel which support 52-bit VA addressing
on arm64.

Thanks,
Bhupesh

