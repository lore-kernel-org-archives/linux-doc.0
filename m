Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 836027D2F0
	for <lwn-linux-doc@archive.lwn.net>; Wed, 10 Jul 2019 15:53:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727263AbfGJPxN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 10 Jul 2019 11:53:13 -0400
Received: from mail-ed1-f45.google.com ([209.85.208.45]:37261 "EHLO
        mail-ed1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbfGJPxN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Jul 2019 11:53:13 -0400
Received: by mail-ed1-f45.google.com with SMTP id w13so2675524eds.4
        for <linux-doc@vger.kernel.org>; Wed, 10 Jul 2019 08:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OooCPJ+TfmCiIkPVCQN9rBe4Zl+T7uS7oe42m2m8dO8=;
        b=NDu1fs3Jx5NnJxsIJXbuNNaTY9DeNvY++yCZH2Aqe/HCWCLe0jW0MSpBbjrkQ3HVdh
         uxtulPIk/CNjS0NRv1JMzmYodopKY/+CANbJ9grsV8q3Sn48x93g5QYRcjv6aOZ7sxUN
         99tk+HQN99ShqhLlvW4RAYTOM8pl+1SCJtKjilRR5H1lijlbXBbReR/YgW3ifQCsFIlV
         znzAj3ymqFOeEuooUCLRv9BhhsUSrftPWhTW9SKEzhoTFv3JdKPwXjDmopcHpA9ABmb9
         M+1GSzxxVDUtgogYv358LkymKGrRnRIgU61uxTZHbwe2dMH2ljUmEAlx5upSYZZnSaeE
         mchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OooCPJ+TfmCiIkPVCQN9rBe4Zl+T7uS7oe42m2m8dO8=;
        b=iVSAYETLMFEseUCGV1bpFty1vjh09N7lll00dLBCt+xLDSNuRU1jiCmZwphk1i2B4a
         8FV04OEH4DPEtiQGTWhHSqBN6bdh8OP++ZW+8C4+J14vdRjhqTwlLYUpNwlCK3oLSLeh
         Kb/+EyA8PeFetdtmZCTqzsCIYmhVPmVN1m0xujNfpgFCIdJ112ybTFH4RsfGIxFFFg4y
         pGeyb3jLPjhdPRCXcdUp9AocOcVpwabfeLTUJ+hBUXeJJSyfypTpUpBB1xQQnz5urWvD
         7+uzrYLu11nb8ZCQ0nyhnvzx3jeLrzdCnglOG4/BMpewR8ldDWdQlr07sk7fq3+TBMPf
         QQtg==
X-Gm-Message-State: APjAAAWT4W5dRu7RaF1I39G9UNOSEKI5O+1PtWnK6PeSc6Q8sWTJjiLd
        RnI6i3cIDaBxVRuGI6RMmEe8rgQ+V2rqvNVpiORSyg==
X-Google-Smtp-Source: APXvYqwRyg+PK6CmK98TU5RngQ5JLVQLW1ax1AQSLUknwWFZptyHZ0BZxbGoMORI2mU52aMjJ96sVgompk4jkkn7/ao=
X-Received: by 2002:a17:906:b203:: with SMTP id p3mr27035845ejz.223.1562773991171;
 Wed, 10 Jul 2019 08:53:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190709182014.16052-1-pasha.tatashin@soleen.com> <20190710065953.GA4744@localhost.localdomain>
In-Reply-To: <20190710065953.GA4744@localhost.localdomain>
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
Date:   Wed, 10 Jul 2019 11:53:00 -0400
Message-ID: <CA+CK2bAC2371999HMMCv6TCf1351u_nV4R1gBLc=79dpLakhHA@mail.gmail.com>
Subject: Re: [v2 0/5] arm64: allow to reserve memory for normal kexec kernel
To:     Dave Young <dyoung@redhat.com>
Cc:     James Morris <jmorris@namei.org>, Sasha Levin <sashal@kernel.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        kexec mailing list <kexec@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>, will@kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> The crashkernel reservation for kdump is a must, there are already a lot
> of different problems need to consider, for example the low and high
> memory issues, and a lot of other things.  I'm not convinced to enable
> this for kexec reboot.
>
> This really looks to workaround the arm64 issue and move the
> complication to kernel.

I will be working on MMU arm64 kernel relocation solution.

Pasha

>
> > On, the other hand hibernate does something similar already, but there
> > MMU never needs to be disabled, and also by the time machine_kexec()
> > is called, allocator is not available, as we can't fail to do reboot,
> > so page table must be pre-allocated during kernel load time.
> >
> > Note: the above time is relocation time only. Purgatory usually also
> > computes checksum, but that is skipped, because --no-check is used when
> > kernel image is loaded via kexec.
> >
> > Pavel Tatashin (5):
> >   kexec: quiet down kexec reboot
> >   kexec: add resource for normal kexec region
> >   kexec: export common crashkernel/kexeckernel parser
> >   kexec: use reserved memory for normal kexec reboot
> >   arm64, kexec: reserve kexeckernel region
> >
> >  .../admin-guide/kernel-parameters.txt         |  7 ++
> >  arch/arm64/kernel/setup.c                     |  5 ++
> >  arch/arm64/mm/init.c                          | 83 ++++++++++++-------
> >  include/linux/crash_core.h                    |  6 ++
> >  include/linux/ioport.h                        |  1 +
> >  include/linux/kexec.h                         |  6 +-
> >  kernel/crash_core.c                           | 27 +++---
> >  kernel/kexec_core.c                           | 50 +++++++----
> >  8 files changed, 127 insertions(+), 58 deletions(-)
> >
> > --
> > 2.22.0
> >
> >
> > _______________________________________________
> > kexec mailing list
> > kexec@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/kexec
>
> Thanks
> Dave
