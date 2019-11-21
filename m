Return-Path: <SRS0=s6Rs=ZN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA47AC432C0
	for <linux-doc@archiver.kernel.org>; Thu, 21 Nov 2019 04:05:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 70F592089D
	for <linux-doc@archiver.kernel.org>; Thu, 21 Nov 2019 04:05:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q04w2aq8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726132AbfKUEFs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 20 Nov 2019 23:05:48 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:38763 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725819AbfKUEFr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Nov 2019 23:05:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574309146;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ddcL9As6t6N2W7FClqz+MM4Vj5YcYH8nBzk/ipEcve0=;
        b=Q04w2aq8zeMNqgoLki+N8zmW6DTN4LRrZ7eu8j4iUgmmHnNFxjgrVDl2NPc1TngDvft2jG
        jXdu8PZD7vkYmy209886kRenZoK35iBkkkAr9GXtLiH27xgW3s4OpvA/M5CGlVbIS8GNoY
        GBwcewe0AyYUhPEUoyu1Et89+faoX3E=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315--4rWMU2GMwqJ5YqkUtsd4Q-1; Wed, 20 Nov 2019 23:05:45 -0500
Received: by mail-lf1-f72.google.com with SMTP id h3so501900lfp.17
        for <linux-doc@vger.kernel.org>; Wed, 20 Nov 2019 20:05:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XAdRIJ2WowQ38gyWjLPpmLE8JvGLeIMdMt69fOJjIH4=;
        b=UZNS1ulPBQjbbRH4b6/J6yy3l9iZGaYuh4fX0u4Duk3CcvfEtGiq2ZZl+TIubNWGGm
         MZDCJ4RJ4V80WJ7mKDhO0Fq53MGmIhr+2qXvn8USn5L5Qr5kydJpPhoEl+ObG+bZFink
         PPwYUHa6iPYUN+0j1Ds6BAjiAyJCAfPCVE/oVDAZncnQqEcY8a5NPRa4x3fxFE0sQTES
         T8SObrB3reQsntg8gqDQvIv1PKbQVmFaIrJAq/uoQ3qz9EfvRwLRjuXvE8VdEuI/r6mw
         BZPin9iYvqul/fsrjvhbkdgXIXAmXe2eruXK9vTZw+RC5qiTrx5GJq6JGtHOcAq3sIGr
         PD+w==
X-Gm-Message-State: APjAAAU4lfBmOCQJLJlEDx2ERxOrYIRpQfj+2D7gdoEGPp5qOXM08oaP
        G3JOWLK3ZKWAAIBZanaQzp+BBflDGsHaFKc4F2UOPwWTq7Xn5aky9gm0m1Za2K6fmfOdArbA+3E
        DO2VQ4CdFpKrcnLJFkfWvqGaPOhofBUS+3Io3
X-Received: by 2002:a19:bec5:: with SMTP id o188mr5652124lff.140.1574309143459;
        Wed, 20 Nov 2019 20:05:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqy5dgsLiGw/+gMUCqCKW9wbveCY62iBIDQZk8TIYLgEUZuvgMt3xbY56NyFoSWIFRlYSXo+FYcMeO7+9TakXnE=
X-Received: by 2002:a19:bec5:: with SMTP id o188mr5652105lff.140.1574309143167;
 Wed, 20 Nov 2019 20:05:43 -0800 (PST)
MIME-Version: 1.0
References: <1573459282-26989-1-git-send-email-bhsharma@redhat.com> <20191121032047.GB23368@dhcp-128-65.nay.redhat.com>
In-Reply-To: <20191121032047.GB23368@dhcp-128-65.nay.redhat.com>
From:   Bhupesh Sharma <bhsharma@redhat.com>
Date:   Thu, 21 Nov 2019 09:35:29 +0530
Message-ID: <CACi5LpOXW+HTsAZfxbwnCnypSdpk4=t8bsS=SRx0crc=4261VA@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Append new variables to vmcoreinfo (TCR_EL1.T1SZ
 for arm64 and MAX_PHYSMEM_BITS for all archs)
To:     Dave Young <dyoung@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Boris Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Bhupesh SHARMA <bhupesh.linux@gmail.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Kazuhito Hagio <k-hagio@ab.jp.nec.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Steve Capper <steve.capper@arm.com>,
        kexec mailing list <kexec@lists.infradead.org>,
        James Morse <james.morse@arm.com>,
        Dave Anderson <anderson@redhat.com>,
        linuxppc-dev@lists.ozlabs.org
X-MC-Unique: -4rWMU2GMwqJ5YqkUtsd4Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Dave,

On Thu, Nov 21, 2019 at 8:51 AM Dave Young <dyoung@redhat.com> wrote:
>
> On 11/11/19 at 01:31pm, Bhupesh Sharma wrote:
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
> > - Protected 'MAX_PHYSMEM_BITS' vmcoreinfo variable under CONFIG_SPARSEM=
EM
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
> >   [PATCH 1/2] appends 'PTRS_PER_PGD' to vmcoreinfo for arm64 arch, wher=
eas
> >   [PATCH 2/2] appends 'MAX_PHYSMEM_BITS' to vmcoreinfo in core kernel c=
ode (all archs)
> >
> > This patchset primarily fixes the regression reported in user-space
> > utilities like 'makedumpfile' and 'crash-utility' on arm64 architecture
> > with the availability of 52-bit address space feature in underlying
> > kernel. These regressions have been reported both on CPUs which don't
> > support ARMv8.2 extensions (i.e. LVA, LPA) and are running newer kernel=
s
> > and also on prototype platforms (like ARMv8 FVP simulator model) which
> > support ARMv8.2 extensions and are running newer kernels.
> >
> > The reason for these regressions is that right now user-space tools
> > have no direct access to these values (since these are not exported
> > from the kernel) and hence need to rely on a best-guess method of
> > determining value of 'vabits_actual' and 'MAX_PHYSMEM_BITS' supported
> > by underlying kernel.
> >
> > Exporting these values via vmcoreinfo will help user-land in such cases=
.
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
> > Cc: x86@kernel.org
> > Cc: linuxppc-dev@lists.ozlabs.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-doc@vger.kernel.org
> > Cc: kexec@lists.infradead.org
> >
> > Bhupesh Sharma (3):
> >   crash_core, vmcoreinfo: Append 'MAX_PHYSMEM_BITS' to vmcoreinfo
> >   arm64/crash_core: Export TCR_EL1.T1SZ in vmcoreinfo
>
> Soft reminder:  the new introduced vmcoreinfo needs documentation
>
> Please check Documentation/admin-guide/kdump/vmcoreinfo.rst

Sure, will send a v5 to address the same.

Thanks,
Bhupesh

