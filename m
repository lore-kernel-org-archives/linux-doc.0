Return-Path: <SRS0=24Yb=2X=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 639BCC2D0DD
	for <linux-doc@archiver.kernel.org>; Thu,  2 Jan 2020 03:47:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2B1AF21655
	for <linux-doc@archiver.kernel.org>; Thu,  2 Jan 2020 03:47:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="lkrN6Y3s"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727526AbgABDro (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 1 Jan 2020 22:47:44 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:42066 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727509AbgABDro (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Jan 2020 22:47:44 -0500
Received: by mail-ot1-f66.google.com with SMTP id 66so55281669otd.9
        for <linux-doc@vger.kernel.org>; Wed, 01 Jan 2020 19:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/rh9q6153m34prHm4tORWlNz9EKvypr1EIdcld9Y+es=;
        b=lkrN6Y3s6jYVS82ZyE0DHMRUjNhpHd1g2b6oJ4zb7XIx/c8X4Kvv6x2brkCBdUVrgR
         rnDOWe0iuGuf7mMnFEmT2ZF3vHDl6PvOMLXaoSHaTxlrYL7sn809stmYwGhsCDrVzK28
         5/SOIKVsUpUOggXVsP2nBlg0C4lHYdSU1hjP1ncezHYsN99gNaupvSxKr7w3J4djzIBz
         fHjsqsn7BNL526ptCgpRX3O7NEUrGNdw5Dbpgnu3JCKirG1GrWP86Tb0rsPGm7eEqwIK
         NFvrNNgB/x0c0PJDt/fdwWpGAVPperNbSOCmhr+nCTjZ0x+Nc3gSsCT+/uXdSYk0nvMJ
         qarg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/rh9q6153m34prHm4tORWlNz9EKvypr1EIdcld9Y+es=;
        b=WoFMnZ1LAPDzlPQlyb5ODUu+tltXRFyAwih5aT1SBFp6PczPnQIbg+k9UbQ4vhIM4t
         dTTCqIF033+8fBqxpQJF8KSqCsnoN/yo7kyf+EY0rXQyJyxhz5S6KRohV933HCm1dvyx
         Bv0Y+pIKEQP1psA2cJvffuwbNhsma+37QxHNkQ+e7MSWMot5UfAJB+nxvGGcLFHLMS1L
         Hvt/kIKV9EiOEHVsZQ0odk+lNfrAkCIvFtombasz5nzKmeqCWpBA+fBm56VD3uJ8xBgq
         6iize1ajeOFfOLprg+sOmmaPLSiZvovCXW9xSA4VaL1qBmmO6OXbukuW+6SCKHX9KU9h
         i+GA==
X-Gm-Message-State: APjAAAWZUKuK9bRgcRhUelFMXoU5/FAwIghBabB5jOHaet/6Tvscb0cI
        yK07f+5D4CVhEU8Nvtjb7BU4iKgANL7CPSKYp7cfeQ==
X-Google-Smtp-Source: APXvYqxJ1al3wj1gg8p8+6+WCfuZGLWekGcYeGb8eiGZqGbKRPhALLO2kxgQQjiss4qQ9EcTNN0X4O4sj2Q3Ht7FHMk=
X-Received: by 2002:a9d:2028:: with SMTP id n37mr93593953ota.127.1577936863434;
 Wed, 01 Jan 2020 19:47:43 -0800 (PST)
MIME-Version: 1.0
References: <20200102030954.41225-1-zong.li@sifive.com> <CAAhSdy0NW9OTGOGoyZ7QmAOVbR_iF2ZM7b9eKDW0U1L+as-oaA@mail.gmail.com>
In-Reply-To: <CAAhSdy0NW9OTGOGoyZ7QmAOVbR_iF2ZM7b9eKDW0U1L+as-oaA@mail.gmail.com>
From:   Zong Li <zong.li@sifive.com>
Date:   Thu, 2 Jan 2020 11:47:33 +0800
Message-ID: <CANXhq0qP1hq9gBr19iHSmtSrfs=V4wKjjTXQGiqZ140i+eH+Lg@mail.gmail.com>
Subject: Re: [PATCH] riscv: gcov: enable gcov for RISC-V
To:     Anup Patel <anup@brainfault.org>
Cc:     corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, linux-doc@vger.kernel.org,
        "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jan 2, 2020 at 11:37 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Thu, Jan 2, 2020 at 8:40 AM Zong Li <zong.li@sifive.com> wrote:
> >
> > This patch enables GCOV code coverage measurement on RISC-V.
> > Lightly tested on QEMU and Hifive Unleashed board, seems to work as
> > expected.
> >
> > Signed-off-by: Zong Li <zong.li@sifive.com>
> > ---
> >  Documentation/features/debug/gcov-profile-all/arch-support.txt | 2 +-
> >  arch/riscv/Kconfig                                             | 1 +
> >  2 files changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/features/debug/gcov-profile-all/arch-support.txt b/Documentation/features/debug/gcov-profile-all/arch-support.txt
> > index 059d58a549c7..6fb2b0671994 100644
> > --- a/Documentation/features/debug/gcov-profile-all/arch-support.txt
> > +++ b/Documentation/features/debug/gcov-profile-all/arch-support.txt
> > @@ -23,7 +23,7 @@
> >      |    openrisc: | TODO |
> >      |      parisc: | TODO |
> >      |     powerpc: |  ok  |
> > -    |       riscv: | TODO |
> > +    |       riscv: |  ok  |
> >      |        s390: |  ok  |
> >      |          sh: |  ok  |
> >      |       sparc: | TODO |
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index d8efbaa78d67..a31169b02ec0 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -64,6 +64,7 @@ config RISCV
> >         select SPARSEMEM_STATIC if 32BIT
> >         select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
> >         select HAVE_ARCH_MMAP_RND_BITS if MMU
> > +       select ARCH_HAS_GCOV_PROFILE_ALL
> >
> >  config ARCH_MMAP_RND_BITS_MIN
> >         default 18 if 64BIT
> > --
> > 2.24.1
> >
>
> Looks good to me.
>
> Reviewed-by: Anup Patel <anup@brainfault.org>
>
> May be (not 100% sure) split this into two patches so that
> Documentation patch can be taken by Jonathan.

OK, let me split this patch in next version.

>
> Regards,
> Anup
