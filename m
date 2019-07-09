Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9AD8D7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Tue,  9 Jul 2019 10:36:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726060AbfGIKgW (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 9 Jul 2019 06:36:22 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41674 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbfGIKgT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Jul 2019 06:36:19 -0400
Received: by mail-lj1-f193.google.com with SMTP id d24so9947789ljg.8
        for <linux-doc@vger.kernel.org>; Tue, 09 Jul 2019 03:36:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2WJ4m/DGadKDJn7LI59T/jmaK1sNDv+NLzWApQUyooQ=;
        b=ncaPw3//bcS2J+S9Sh4X1oKQwyATWRVJaJ6ZFH5oQ4h1FgqXkZbFq1Ginzo96xqAch
         1TU8bDvt2wD1sxninmLMgrT3/bTReOmgSWs29f9buQh1yp3vitNB4wX36QDoYdPJs9/B
         TVtW3+j//vKrcVZRI+b58LCmTA5y9fxK7J6a0jJJaiwB1cnp533crcuvfdGp8YOW/XCR
         gaQQJXdqBn/PuwUT6+lZvSwcr/rW97fQDKSAIbAgByYBCtjt7ktQMma2pG/7Fv/cQOvp
         2ks2zsqUFO9LloB9wjFY5u+Q33AqJvJ0QerUMAZlYgO+zZGW4AXkkRWdJOq7HPdj5nWA
         G94g==
X-Gm-Message-State: APjAAAWUP43XeOolivGsZVo0/bCWie7l19YIH99lRoV2YqogZ9RKGE/C
        SOCuMF8Ks6PdsSf9SuBNlfpXDkkHt9W0b8RFT3SoDg==
X-Google-Smtp-Source: APXvYqxPHBLg8W3ob44pbfsQreCW94qFhPE+cEwluc5uu4+OgXOPXOW4idA52S+Cl1VzOEXfq3Z9ZQKY+KVJgWw/EsE=
X-Received: by 2002:a2e:8945:: with SMTP id b5mr13056704ljk.93.1562668577294;
 Tue, 09 Jul 2019 03:36:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190708211528.12392-1-pasha.tatashin@soleen.com>
In-Reply-To: <20190708211528.12392-1-pasha.tatashin@soleen.com>
From:   Bhupesh Sharma <bhsharma@redhat.com>
Date:   Tue, 9 Jul 2019 16:06:05 +0530
Message-ID: <CACi5LpNGWhTnXyM8gB0Tn=682+08s-ppfDpX2SawfxMvue1GTQ@mail.gmail.com>
Subject: Re: [v1 0/5] allow to reserve memory for normal kexec kernel
To:     Pavel Tatashin <pasha.tatashin@soleen.com>
Cc:     James Morris <jmorris@namei.org>, sashal@kernel.org,
        Eric Biederman <ebiederm@xmission.com>,
        kexec mailing list <kexec@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>, will@kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Pavel,

On Tue, Jul 9, 2019 at 2:46 AM Pavel Tatashin <pasha.tatashin@soleen.com> wrote:
>
> Currently, it is only allowed to reserve memory for crash kernel, because
> it is a requirement in order to be able to boot into crash kernel without
> touching memory of crashed kernel is to have memory reserved.
>
> The second benefit for having memory reserved for kexec kernel is
> that it does not require a relocation after segments are loaded into
> memory.
>
> If kexec functionality is used for a fast system update, with a minimal
> downtime, the relocation of kernel + initramfs might take a significant
> portion of reboot.
>
> In fact, on the machine that we are using, that has ARM64 processor
> it takes 0.35s to relocate during kexec, thus taking 52% of kernel reboot
> time:
>
> kernel shutdown 0.03s
> relocation      0.35s
> kernel startup  0.29s
>
> Image: 13M and initramfs is 24M. If initramfs increases, the relocation
> time increases proportionally.
>
> While, it is possible to add 'kexeckernel=' parameters support to other
> architectures by modifying reserve_crashkernel(), in this series this is
> done for arm64 only.
>
> Pavel Tatashin (5):
>   kexec: quiet down kexec reboot
>   kexec: add resource for normal kexec region
>   kexec: export common crashkernel/kexeckernel parser
>   kexec: use reserved memory for normal kexec reboot
>   arm64, kexec: reserve kexeckernel region
>
>  .../admin-guide/kernel-parameters.txt         |  7 ++
>  arch/arm64/kernel/setup.c                     |  5 ++
>  arch/arm64/mm/init.c                          | 83 ++++++++++++-------
>  include/linux/crash_core.h                    |  6 ++
>  include/linux/ioport.h                        |  1 +
>  include/linux/kexec.h                         |  6 +-
>  kernel/crash_core.c                           | 27 +++---
>  kernel/kexec_core.c                           | 50 +++++++----
>  8 files changed, 127 insertions(+), 58 deletions(-)
>
> --
> 2.22.0

This seems like an issue with time spent while doing sha256
verification while in purgatory.

Can you please try the following two patches which enable D-cache in
purgatory before SHA verification and disable it before switching to
kernel:

http://lists.infradead.org/pipermail/kexec/2017-May/018839.html
http://lists.infradead.org/pipermail/kexec/2017-May/018840.html

Note that these were not accepted upstream but are included in several
distros in some form or the other :)

Thanks,
Bhupesh
