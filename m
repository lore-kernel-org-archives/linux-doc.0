Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3B9387D2EF
	for <lwn-linux-doc@archive.lwn.net>; Thu, 30 May 2019 13:08:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726399AbfE3NIC (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 30 May 2019 09:08:02 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:33174 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726328AbfE3NIB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 May 2019 09:08:01 -0400
Received: by mail-lf1-f66.google.com with SMTP id y17so4987175lfe.0
        for <linux-doc@vger.kernel.org>; Thu, 30 May 2019 06:08:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lo8Pf5qQPzDgv3LbnRe5hAmhzj8l8zc5AuLXNn3lbXo=;
        b=tJXbcDUI6uXa4wiQvb2dJKNDhigRLA/uo/QHo44h32Ufgb3SfUINYWqAXn4jzF74ai
         tpC6+dTq5KXAqjgIaVOoJUG4QINPAcHy+uCGwxYLg6c/P62J2bPJ6M6AZN1sHKvWM3sX
         3xJGaNKxvTFXf206B+qQc2jNJWl+amqJUqlu7oSUCH/NESGCKRFx0ZsUm5QaebfyeabB
         HaSQpUqdPi/RQXxpwguIkjMI7xNFlkKiJqpsP4Url8y62+XEbz5oIY8xx/Rl9EwBX3EA
         9Xk8c/8NwgTwrMqqeQ3BuY2K7hFrgkq1s7208SvDmKSCQDIalygSoRK2zde26Do3vOdH
         Qixg==
X-Gm-Message-State: APjAAAVLV7GyGtE8/o/PMXJFNMC8zQmGhtoH3aQOM5BFS14GyUNSrayS
        /E1V8tXGc3rf37WMg6wb4qD+Zak7mkQqtBSp4m3slg==
X-Google-Smtp-Source: APXvYqyavwnJULw4Wz7Yg0S3xURZgWHWuSrHKVYFeYqBmDka5ggDKKE/RR5194S1GfsiIfocaRV06vuTWRje8VGjYSQ=
X-Received: by 2002:a19:ec12:: with SMTP id b18mr2020933lfa.149.1559221680444;
 Thu, 30 May 2019 06:08:00 -0700 (PDT)
MIME-Version: 1.0
References: <1559212177-7072-1-git-send-email-bhsharma@redhat.com> <87v9xsnlu9.fsf@concordia.ellerman.id.au>
In-Reply-To: <87v9xsnlu9.fsf@concordia.ellerman.id.au>
From:   Bhupesh Sharma <bhsharma@redhat.com>
Date:   Thu, 30 May 2019 18:37:46 +0530
Message-ID: <CACi5LpM9v1YC_6HhA-uKghawzkEu=TTPVkomMmv2i-LGi8X7+g@mail.gmail.com>
Subject: Re: [PATCH] Documentation/stackprotector: powerpc supports stack protector
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     linuxppc-dev@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>,
        Bhupesh SHARMA <bhupesh.linux@gmail.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        corbet@lwn.net, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 30, 2019 at 6:25 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Bhupesh Sharma <bhsharma@redhat.com> writes:
> > powerpc architecture (both 64-bit and 32-bit) supports stack protector
> > mechanism since some time now [see commit 06ec27aea9fc ("powerpc/64:
> > add stack protector support")].
> >
> > Update stackprotector arch support documentation to reflect the same.
> >
> > Signed-off-by: Bhupesh Sharma <bhsharma@redhat.com>
> > ---
> >  Documentation/features/debug/stackprotector/arch-support.txt | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/features/debug/stackprotector/arch-support.txt b/Documentation/features/debug/stackprotector/arch-support.txt
> > index 9999ea521f3e..32bbdfc64c32 100644
> > --- a/Documentation/features/debug/stackprotector/arch-support.txt
> > +++ b/Documentation/features/debug/stackprotector/arch-support.txt
> > @@ -22,7 +22,7 @@
> >      |       nios2: | TODO |
> >      |    openrisc: | TODO |
> >      |      parisc: | TODO |
> > -    |     powerpc: | TODO |
> > +    |     powerpc: |  ok  |
> >      |       riscv: | TODO |
> >      |        s390: | TODO |
> >      |          sh: |  ok  |
> > --
> > 2.7.4
>
> Thanks.
>
> This should probably go via the documentation tree?
>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au>

Thanks for the review Michael.
I am ok with this going through the documentation tree as well.

Regards,
Bhupesh
