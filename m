Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36731C433F5
	for <linux-doc@archiver.kernel.org>; Tue, 23 Nov 2021 13:37:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229939AbhKWNko (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 23 Nov 2021 08:40:44 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:33892
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236151AbhKWNkn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 23 Nov 2021 08:40:43 -0500
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C7AE73FFF1
        for <linux-doc@vger.kernel.org>; Tue, 23 Nov 2021 13:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1637674654;
        bh=sQ/aKUx6TD41nvQIdvI6z2IwbCTpDn9sO75YCG3lse0=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=vYFwPxvvb2Sfb+grppc+CrgcGwuAlBWa22sm2vbVdODglPV3IwutkqtWiuxRn8OQC
         CrI0jZgeFWLEqqI8zYAGQ849/ff95E4Dfv4nBoBggwqs5j4fHqAved2tQIcQLYOYBg
         +equk0RgfniSwIJktmEJ+bIPDupOv1WesgiaKPqc6VezUX3TYqiMIItQ6S9Ob4SOLF
         dEZR4QufVxD7ixP6lC78oZ/ouOGnFoF5g8hDM7MyF/r3eRMMuJ3qULFmzDabgHqLZf
         l0oPNnTX4tnzLP4YYbzSWf9J8lnqndJt6Z3RlG/X9hIk838bqyX8vYSfOz6ejZpsXy
         ZoHUZ/wUm620A==
Received: by mail-ed1-f69.google.com with SMTP id r16-20020a056402019000b003e6cbb77ed2so17821692edv.10
        for <linux-doc@vger.kernel.org>; Tue, 23 Nov 2021 05:37:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sQ/aKUx6TD41nvQIdvI6z2IwbCTpDn9sO75YCG3lse0=;
        b=RiLbqFxXipX//bHAz0HbxwJ6wQypqLFKt6pqkesjtc7t9bmUPxTp1XyBSryRzjY6Qh
         e8JWHIj80x9aF7Q8ni9Yk3uDsVJbwZHl3u17tddtG3amBijmxa3wdFYzaSOreH8AMJkP
         SLFpLioyrk2rqeaBh1k/duq12vnHZMBtQaRjkvvH8pCmYoSV+W5YnUXjUf5KJv0Ebkvc
         7UrYqAUwuHZ6kSFT+XEAYDWq8CVTn7Q6W0SANPiykPOXCgUHFqAxf6SLiNBuCJNRa8Ft
         oUCIqm0VTYXS5wYXKfb8sHAPYV0iYGddJCeX7jtaOKZAfyj7rb8Bhx+acFrefBFyvyzl
         ZZsw==
X-Gm-Message-State: AOAM532+DNGzq1oJFlshPOmjWCbZ53jTiGoLbx2FFLgaOmFH/uMYtlQT
        IyfWaKgxPeAhwGp5+WAOILzx3+SQqzC6TLe0CVFxhrkJJwC0MvyAmkjppcoTNJfUVRXh8h4wF5x
        H40XQjRkqLzJ8mmCTctY08xmgujt0mjKeNDYzabQrYIBL0vkvb5dmOQ==
X-Received: by 2002:a05:6402:44c:: with SMTP id p12mr9319533edw.234.1637674654382;
        Tue, 23 Nov 2021 05:37:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxrrCzppU4wLLvhdliEWCPVhjPtH1WE5HhdkoKCbHQLQrIYyujzENmBboX3fRsWoSSk0IO8CtpixcYxbw3vU1A=
X-Received: by 2002:a05:6402:44c:: with SMTP id p12mr9319503edw.234.1637674654238;
 Tue, 23 Nov 2021 05:37:34 -0800 (PST)
MIME-Version: 1.0
References: <20211123015717.542631-1-guoren@kernel.org> <20211123015717.542631-3-guoren@kernel.org>
 <CAAhSdy0LLu4o6uOB8t_Wv6jsOrrrSMx0pv1E1B5F679gan3i6g@mail.gmail.com> <07AD2CEA-3C9B-48FA-8E67-3B60448A08F0@jrtc27.com>
In-Reply-To: <07AD2CEA-3C9B-48FA-8E67-3B60448A08F0@jrtc27.com>
From:   Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date:   Tue, 23 Nov 2021 14:37:23 +0100
Message-ID: <CA+zEjCuKJBWy36kZhEn-E3BNXAPMnw-+Dty5xfO3_6ex0Q6LWg@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] riscv: Add early_param to decrease firmware region
To:     Jessica Clarke <jrtc27@jrtc27.com>
Cc:     Anup Patel <anup@brainfault.org>, Guo Ren <guoren@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, atishp@rivosinc.com,
        "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Guo Ren <guoren@linux.alibaba.com>,
        Anup Patel <anup.patel@wdc.com>,
        Alexandre Ghiti <alex@ghiti.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 23, 2021 at 12:53 PM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> On 23 Nov 2021, at 03:44, Anup Patel <anup@brainfault.org> wrote:
> >
> > +Alex
> >
> > On Tue, Nov 23, 2021 at 7:27 AM <guoren@kernel.org> wrote:
> >>
> >> From: Guo Ren <guoren@linux.alibaba.com>
> >>
> >> Using riscv.fw_size in cmdline to tell the kernel what the
> >> firmware (opensbi) size is. Then reserve the proper size of
> >> firmware to save memory instead of the whole 2MB. It's helpful
> >> to satisfy a small memory system (D1s/F133 from Allwinner).
> >>
> >> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> >> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> >> Cc: Anup Patel <anup.patel@wdc.com>
> >> Cc: Atish Patra <atishp@rivosinc.com>
> >> ---
> >> arch/riscv/mm/init.c | 14 +++++++++++++-
> >> 1 file changed, 13 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> >> index 920e78f8c3e4..f7db6d40213d 100644
> >> --- a/arch/riscv/mm/init.c
> >> +++ b/arch/riscv/mm/init.c
> >> @@ -159,6 +159,15 @@ static int __init early_mem(char *p)
> >> }
> >> early_param("mem", early_mem);
> >>
> >> +static phys_addr_t firmware_size __initdata;
> >> +static int __init early_get_firmware_size(char *arg)
> >> +{
> >> +       firmware_size =3D memparse(arg, &arg);
> >> +
> >> +       return 0;
> >> +}
> >> +early_param("riscv.fwsz", early_get_firmware_size);
> >> +
> >
> > We have avoided any RISC-V specific kernel parameter till now
> > and I don't think adding "riscv.fwsz" is the right approach.
> >
> > OpenSBI adds a reserved memory node (mmode_resv@8000000)
> > to mark the memory where it is running as reserved. In fact, all
> > M-mode runtime firmware should be adding a reserved memory
> > node just like OpenSBI.

Yes I agree that this should be in the device tree, IMO there is no
need to introduce a new kernel parameter.

>
> BBL does not do this and, even if it=E2=80=99s modified today, older vers=
ions
> will still need to be supported for quite a while longer.

It's fair to expect the firmware to advertise its existence: we
briefly discussed that last year with Atish [1] and he proposed to
introduce a document that describes what the kernel expects from the
'platform' when it boots, that would be a way to drop those old legacy
bootloaders.

[1] https://lkml.org/lkml/2020/6/3/696



>
> In FreeBSD[1] we only reserve the first 2 MiB of DRAM (we don=E2=80=99t c=
are
> about RV32) if there is no reserved memory node covering the DRAM base
> address, which avoids this issue. The only downside with that approach
> is that if firmware occupies a different region than the beginning of
> DRAM (or there is no firmware resident in the supervisor=E2=80=99s physic=
al
> address space, as is the case for a virtualised guest) then it
> unnecessarily reserves that first 2 MiB, but that=E2=80=99s not a huge de=
al,
> and can=E2=80=99t be avoided so long as BBL continues to exist (well, I g=
uess
> you could probe the SBI implementation ID if you really cared about
> that, but I=E2=80=99ve yet to hear of a platform where the SBI implementa=
tion,
> if it exists, isn=E2=80=99t at the start of DRAM, and if you=E2=80=99re v=
irtualising
> then you probably have enough DRAM that you don=E2=80=99t notice 2 MiB go=
ing
> missing).
>
> Jess
>
> [1] https://github.com/freebsd/freebsd-src/blob/main/sys/riscv/riscv/mach=
dep.c#L554-L568
>
