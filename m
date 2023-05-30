Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B24C4C77B73
	for <linux-doc@archiver.kernel.org>; Tue, 30 May 2023 20:07:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230176AbjE3UHi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 30 May 2023 16:07:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231428AbjE3UHh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 May 2023 16:07:37 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C110107
        for <linux-doc@vger.kernel.org>; Tue, 30 May 2023 13:07:33 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-3f6a6e9d90dso57931cf.0
        for <linux-doc@vger.kernel.org>; Tue, 30 May 2023 13:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685477252; x=1688069252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tnJw+gna055xgPY4k/D+ZQZ+/+poCudJDicda2AGR3k=;
        b=DtfynU88O3z0/4oFgDiYM7qy14b7RLg4yomBzxL0dog8TFdWbHyo2tpb/B1SOYXfmp
         NSRsIG+eVwPFOobh1xJCt8kwErPgylGUweOcutP0ywct+6P+S2IjeaikfhAUmhYPV+uH
         Mv+j09gZh5WjQDA3Z/2Gy9TgffLJonGspryTqmY7mSq0d2Id3AeV0HEZ5ulNgRW7LXMq
         4JCJAWgEwKAWSjc16VpDrPx50NJw92bJUlL+d9zw+H+Lfu/l9dON3ftxIU/zENGgXs4K
         1cHj3nLx36gvePguvMtotajaF04WFwISrYvt1J6cDwX3ikwzIPGkd33waRKuVJi8J5gu
         uXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685477252; x=1688069252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tnJw+gna055xgPY4k/D+ZQZ+/+poCudJDicda2AGR3k=;
        b=dIQx8mtvMQJYNs5o4iH5ngZCOan/04f36nca/Qk2kD/UOJnhx6N3Y3ECde+bN8PEVP
         w9VV6qeL8rFb4RiNFlovhVGjKfe4JinOn5x9nXcjIM29CeXbbX0OLSB8Tgia6T2MrpcH
         nCJFqdZR4ZJg6+am9C9Wgk22ixZAre8D9xrYSxUWXwmv0EgDVDGfeDHsFuNyHp4FlCxT
         SAFKu7ciobKgPFIHSs77qKN4J9dfG8nyLeXunNazwc1AKT4sSfnP1ApMAmL18/dpiXmF
         c4AGmhv1arolXWu395soTP/G1rT5jIADcGP926Z3DJVBwKLrpHfaW2S38hDh7FiTjgkI
         9DNw==
X-Gm-Message-State: AC+VfDyqCaPAL0bHbolAGVssJ78PaAtvcal/djcNmphVQzBAVpepdVEV
        /5Bq8PSTj2vi0newcleKjHFmILSEItDuG7O+V1yE+g==
X-Google-Smtp-Source: ACHHUZ6GXKZ8JX2tTyi2dAoKnrLtSo8EMFYdPNZnbJmbRABrmf7MX05SzfLq0yw9C6unlnFwzm3TaQimSQte4R7XEoY=
X-Received: by 2002:a05:622a:1012:b0:3ef:2f55:2204 with SMTP id
 d18-20020a05622a101200b003ef2f552204mr6506qte.6.1685477252408; Tue, 30 May
 2023 13:07:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230526234435.662652-1-yuzhao@google.com> <20230526234435.662652-5-yuzhao@google.com>
 <ZHJHJPBF6euzOFdw@linux.dev> <CAOUHufa74CufHziHSquO5bZwbFXz2MNssBzW+AH7=Xo5RCnQ0A@mail.gmail.com>
 <ZHZQdQAApIrw6fBu@linux.dev>
In-Reply-To: <ZHZQdQAApIrw6fBu@linux.dev>
From:   Yu Zhao <yuzhao@google.com>
Date:   Tue, 30 May 2023 14:06:55 -0600
Message-ID: <CAOUHufZOkBmZJgCU2xW2B8S3P3TWERHezy0xKWY9_TeyV9K7Rg@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v2 04/10] kvm/arm64: make stage2 page tables
 RCU safe
To:     Oliver Upton <oliver.upton@linux.dev>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Alistair Popple <apopple@nvidia.com>,
        Anup Patel <anup@brainfault.org>,
        Ben Gardon <bgardon@google.com>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Chao Peng <chao.p.peng@linux.intel.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Fabiano Rosas <farosas@linux.ibm.com>,
        Gaosheng Cui <cuigaosheng1@huawei.com>,
        Gavin Shan <gshan@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        James Morse <james.morse@arm.com>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Jonathan Corbet <corbet@lwn.net>,
        Marc Zyngier <maz@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michael Larabel <michael@michaellarabel.com>,
        Mike Rapoport <rppt@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>,
        Peter Xu <peterx@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Thomas Huth <thuth@redhat.com>, Will Deacon <will@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev,
        kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
        linux-trace-kernel@vger.kernel.org, x86@kernel.org,
        linux-mm@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 30, 2023 at 1:37=E2=80=AFPM Oliver Upton <oliver.upton@linux.de=
v> wrote:
>
> Hi Yu,
>
> On Sat, May 27, 2023 at 02:13:07PM -0600, Yu Zhao wrote:
> > On Sat, May 27, 2023 at 12:08=E2=80=AFPM Oliver Upton <oliver.upton@lin=
ux.dev> wrote:
> > > diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtabl=
e.c
> > > index 3d61bd3e591d..bfbebdcb4ef0 100644
> > > --- a/arch/arm64/kvm/hyp/pgtable.c
> > > +++ b/arch/arm64/kvm/hyp/pgtable.c
> > > @@ -1019,7 +1019,7 @@ static int stage2_unmap_walker(const struct kvm=
_pgtable_visit_ctx *ctx,
> > >                                                kvm_granule_size(ctx->=
level));
> > >
> > >         if (childp)
> > > -               mm_ops->put_page(childp);
> > > +               mm_ops->free_removed_table(childp, ctx->level);
> >
> > Thanks, Oliver.
> >
> > A couple of things I haven't had the chance to verify -- I'm hoping
> > you could help clarify:
> > 1. For unmapping, with free_removed_table(), wouldn't we have to look
> > into the table we know it's empty unnecessarily?
>
> As it is currently implemented, yes. But, there's potential to fast-path
> the implementation by checking page_count() before starting the walk.

Do you mind posting another patch? I'd be happy to ack it, as well as
the one you suggested above.

> > 2. For remapping and unmapping, how does free_removed_table() put the
> > final refcnt on the table passed in? (Previously we had
> > put_page(childp) in stage2_map_walk_table_post(). So I'm assuming we'd
> > have to do something equivalent with free_removed_table().)
>
> Heh, that's a bug, and an embarrassing one at that!
>
> Sent out a fix for that, since it would appear we leak memory on
> table->block transitions. PTAL if you have a chance.
>
> https://lore.kernel.org/all/20230530193213.1663411-1-oliver.upton@linux.d=
ev/

Awesome.
