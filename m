Return-Path: <SRS0=BeNN=4V=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44944C3F2D1
	for <linux-doc@archiver.kernel.org>; Wed,  4 Mar 2020 02:33:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 19F44208C3
	for <linux-doc@archiver.kernel.org>; Wed,  4 Mar 2020 02:33:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=cs.washington.edu header.i=@cs.washington.edu header.b="YA+26ZyP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387594AbgCDCd3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Mar 2020 21:33:29 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:37634 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387592AbgCDCd3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Mar 2020 21:33:29 -0500
Received: by mail-io1-f65.google.com with SMTP id c17so695754ioc.4
        for <linux-doc@vger.kernel.org>; Tue, 03 Mar 2020 18:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.washington.edu; s=goo201206;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=z8i39F29uItXrQ0Vm+/tnYAlpVrh5Zrfz37MFCt4wqg=;
        b=YA+26ZyPPsXhtvsAfcQdDGKF76soF525p7XOyeC2g3fWKaRu7Nchx0JivsPHU9+mVx
         L2n+BpbDPm4VZ0rdcng/wCTI7pmzhvs1BTt5zoXCYUBmigd7w6CB7jsBLqS/tRZ3sBra
         ttxpQ4mYrMFxanwRq3ExFUcoGdLn+TstWEZGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=z8i39F29uItXrQ0Vm+/tnYAlpVrh5Zrfz37MFCt4wqg=;
        b=nwkuE5/ghCpsl7lj8F/BCK4G++X5YFFRXpZHZSVZoe6G9Ndhj4sGk9xNECeUDKdlD2
         G95S9jG4SewmEOlGgyp/0BR4TOHnUvxwOeJbJEs5BmxXltnJ42tRNyG0EJWC4LYEw1V2
         7zfPQC+UhOa1tMBGZpn8Ij1aRbmJS9wct6qdQ0JrTES5rHdka1Zhc5QMNwoVCZLUv3J+
         XQfPg3HW8EJMF9CJf83sE1MIcTikMy45dV2gUyHvjY3VzwEp+Jc7DqEPyxoQwlZojwQH
         KMioPUO7E0qbDwVdrTKvuT1q+3mrSzGMENARBwtzzVfUi2Aqs3JRi7XXfyrBXWUbk7rg
         Cnbg==
X-Gm-Message-State: ANhLgQ2+5d66DFvddYyvJFIbLbjdAP12CmeVJCw6wGNUgyqUZa/JuOUC
        qf3i3a/I7daVxEDfr/L6V0mCmdalSO7yxqjM4MBsjw==
X-Google-Smtp-Source: ADFU+vtdbhJTXt1bRm93LupwhvNWTGVMBaqbP4QMYe4hxwp7dnVdENhAaLm/Y73xWVIRUbZJWq6Ns+B//0CejhYYfa0=
X-Received: by 2002:a6b:e310:: with SMTP id u16mr451066ioc.43.1583289208493;
 Tue, 03 Mar 2020 18:33:28 -0800 (PST)
MIME-Version: 1.0
References: <20200303005035.13814-1-luke.r.nels@gmail.com> <20200303005035.13814-5-luke.r.nels@gmail.com>
 <20200303100228.GJ1224808@smile.fi.intel.com>
In-Reply-To: <20200303100228.GJ1224808@smile.fi.intel.com>
From:   Luke Nelson <lukenels@cs.washington.edu>
Date:   Tue, 3 Mar 2020 18:33:17 -0800
Message-ID: <CADasFoCq7S2KRYg+ghAKt1e+hELzEMJaNH74sGdjM7E=z3KcnQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 4/4] MAINTAINERS: Add entry for RV32G BPF JIT
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     bpf <bpf@vger.kernel.org>, Luke Nelson <luke.r.nels@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Martin KaFai Lau <kafai@fb.com>,
        Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
        Andrii Nakryiko <andriin@fb.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
        Xi Wang <xi.wang@gmail.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Stephen Hemminger <stephen@networkplumber.org>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Netdev <netdev@vger.kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 3, 2020 at 2:02 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> > -BPF JIT for RISC-V (RV64G)
> > +BPF JIT for 32-bit RISC-V (RV32G)
> > +M:   Luke Nelson <luke.r.nels@gmail.com>
> > +M:   Xi Wang <xi.wang@gmail.com>
> > +L:   bpf@vger.kernel.org
> > +S:   Maintained
> > +F:   arch/riscv/net/
> > +X:   arch/riscv/net/bpf_jit_comp.c
> > +
> > +BPF JIT for 64-bit RISC-V (RV64G)
> >  M:   Bj=C3=B6rn T=C3=B6pel <bjorn.topel@gmail.com>
> > -L:   netdev@vger.kernel.org
> > +L:   bpf@vger.kernel.org
> >  S:   Maintained
> >  F:   arch/riscv/net/
> > +X:   arch/riscv/net/bpf_jit_comp32.c
>
> Obviously this breaks an order. Please, fix.
> Hint: run parse-maintainers.pl after the change.

Hi,

Thanks for the comment!

I'll change the entry names in v5 to be "BPF JIT for RISC-V (32-bit)"
and "BPF JIT for RISC-V (64-bit)", similar to the x86 JIT entries.
This will pass parse-maintainers.pl and the entries are still in
order.

Thanks again,

Luke
