Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 692E6C433F5
	for <linux-doc@archiver.kernel.org>; Tue, 16 Nov 2021 14:02:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5372463213
	for <linux-doc@archiver.kernel.org>; Tue, 16 Nov 2021 14:02:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236885AbhKPOFI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 16 Nov 2021 09:05:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237046AbhKPOE7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 Nov 2021 09:04:59 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 608C6C061746
        for <linux-doc@vger.kernel.org>; Tue, 16 Nov 2021 06:02:02 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id f7-20020a1c1f07000000b0032ee11917ceso2508769wmf.0
        for <linux-doc@vger.kernel.org>; Tue, 16 Nov 2021 06:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xJGGjf3T+PZQTjojKZjYUj8YP2BjQYLRmzoH80vh2D4=;
        b=HGu9J9unVEfaFzrS1inJxtPCHbq+4e7eG5GGS70QWjR2etpwCAYB+f+ciwX9R4GY5w
         HtPMoGdHvirMix0SV2Y5OuosDTtzuQTNm1W9qOUtM4xVGWRh1guUaf0FvxC+Cr7vZwbX
         Mwzy2bPjgIuxg+UApKvdQZ0ad3Hfrk16sXb67CKMEQxf7vKMTXK1xoPsNuRmZoRA8ni4
         U+VFSSWEfTLtUzmb6/ZyJlRefUTbOnqxUJEshlul5IMTHGa4MVQ6BkOWd4f1m1DqKo4y
         BXR4A8VDq+RkbGncMzLzTjA3LpMjBI8HFjvyvg78asjnHekNZeQpdpz6sDMw5KDt+F6N
         5Arg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xJGGjf3T+PZQTjojKZjYUj8YP2BjQYLRmzoH80vh2D4=;
        b=xZdowKewrDJtoxQxSU3e8Heza2m+1UgfeupSdj9/RfJFq42tPqfYm/RPvn4kC9/Agt
         ok/Ju9txDrb3bPoR3JdgJ0wREgcYx3WnUpKBMqjOlLZyd6slqgpByYQCUyARDZ9+uJJ9
         /sDuzqPe449TuKOPrujoTGozjRYFN6wVXnml3dJIP7s7VrFfQIQoHItRaBtE1g0fwes4
         1fpBRHNfj+ANhXvN0BlJEMUJdjI7uZF8fZNLkjwofOsontq4YvP7EXIOl7M29pFjDl0C
         0L2KZLfD+Ey/5s/7OKqbExMlgkbTmTZpVKNLEPIIbz7vIi1hQyEoDJ430bp7cppYcEfr
         oONg==
X-Gm-Message-State: AOAM532k0kzS7pO0JdwR/2a7SSSZwftOXbXXvbM1LgEbwMFw5eTvtcRc
        AjOeXVL179P3dcb4S4AJE2oiWAEtXuPkfxHp2yMEmw==
X-Google-Smtp-Source: ABdhPJwXP7n5uxNvnq5f4cCWx2AEFTHhYlXt1jDKuL8pqxOWNU2kElA9mxGgQrMUZUrxev9XFvBmrQNsueDq+5IDYp4=
X-Received: by 2002:a1c:20cc:: with SMTP id g195mr8125788wmg.137.1637071320789;
 Tue, 16 Nov 2021 06:02:00 -0800 (PST)
MIME-Version: 1.0
References: <cover.1637064577.git.mchehab+huawei@kernel.org>
 <32b3693314f3914f10a42dea97ad6e06292fcd4a.1637064577.git.mchehab+huawei@kernel.org>
 <34e691ec-a58d-c86b-a2ef-6fa4f0385b69@redhat.com>
In-Reply-To: <34e691ec-a58d-c86b-a2ef-6fa4f0385b69@redhat.com>
From:   Anup Patel <anup@brainfault.org>
Date:   Tue, 16 Nov 2021 19:31:48 +0530
Message-ID: <CAAhSdy0JRTwmr+EdSEr3ng1gfDpqnF7m3ejC2AydjAgu0mEQLw@mail.gmail.com>
Subject: Re: [PATCH 3/4] Documentation: update vcpu-requests.rst reference
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        kvm-riscv@lists.infradead.org, KVM General <kvm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 16, 2021 at 6:24 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 11/16/21 13:11, Mauro Carvalho Chehab wrote:
> > Changeset 2f5947dfcaec ("Documentation: move Documentation/virtual to Documentation/virt")
> > renamed: Documentation/virtual/kvm/vcpu-requests.rst
> > to: Documentation/virt/kvm/vcpu-requests.rst.
> >
> > Update its cross-reference accordingly.
> >
> > Fixes: 2f5947dfcaec ("Documentation: move Documentation/virtual to Documentation/virt")
> > Reviewed-by: Anup Patel <anup.patel@wdc.com>
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >
> > To mailbombing on a large number of people, only mailing lists were C/C on the cover.
> > See [PATCH 0/4] at: https://lore.kernel.org/all/cover.1637064577.git.mchehab+huawei@kernel.org/
> >
> >   arch/riscv/kvm/vcpu.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> > index e3d3aed46184..fb84619df012 100644
> > --- a/arch/riscv/kvm/vcpu.c
> > +++ b/arch/riscv/kvm/vcpu.c
> > @@ -740,7 +740,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
> >                * Ensure we set mode to IN_GUEST_MODE after we disable
> >                * interrupts and before the final VCPU requests check.
> >                * See the comment in kvm_vcpu_exiting_guest_mode() and
> > -              * Documentation/virtual/kvm/vcpu-requests.rst
> > +              * Documentation/virt/kvm/vcpu-requests.rst
> >                */
> >               vcpu->mode = IN_GUEST_MODE;
> >
> >
>
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Thanks Paolo, let me know if you want me to include this patch
as part of the fixes I have collected.

Regards,
Anup

>
> Thanks,
>
> Paolo
>
>
> --
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv
