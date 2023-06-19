Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 229E5EB64DC
	for <linux-doc@archiver.kernel.org>; Mon, 19 Jun 2023 18:58:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230088AbjFSS6n (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Jun 2023 14:58:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229703AbjFSS6m (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Jun 2023 14:58:42 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3045B130
        for <linux-doc@vger.kernel.org>; Mon, 19 Jun 2023 11:58:41 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b46773e427so35336101fa.3
        for <linux-doc@vger.kernel.org>; Mon, 19 Jun 2023 11:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1687201119; x=1689793119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UIUqA0rcSlk22wNkCwu8p2OK1XKL+AlvaBKhRl9Deog=;
        b=Df4GXWhRRUFLnOveDK8hfvwd48RBrvQO8w2FAxtEuEwDdipeUoSfZ50kZXGW0h9VSb
         gbEczQ+4zmK62ezKKxFoMO7CM9ActHZjxlk5clXTK7MCLdZJEQbp8Iaj7dO5/H+FZCV7
         haf8zABDvR53HP3z3HjL9X7d20Vjmr6PAMifc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687201119; x=1689793119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UIUqA0rcSlk22wNkCwu8p2OK1XKL+AlvaBKhRl9Deog=;
        b=U16N9igxiDLZC+aInVO4fATFOZTdWBX3R7ackbYwc+Y6atBKh+uGw6+UMmI2vJLZmp
         kqaqSFk1Co+6ljiuqiWQIB+SNUMFiS5rOYMFcbgsC9SEkjrZIXEMKq58ZfnDiLydyoMK
         kOFan3Qi1c2p+mbnJdhZ6KuKJvBWV1W+eQtIqXY3rkSl2tJTssF7Fuvsr2EuAg5GnInM
         1qinM/Pk67W3CNhJPH4GBMsD/yz+zW2SdL0RSxnpv6YOKYwEQ3iHwMKuNsIF6/0gCtbq
         kq9cwn+VFt4gwlH7w/3jGWMMqQXmtgxKaUWf6KXMv4VLq/zMZGftzkW7gesXP0VwLgGj
         4Ylw==
X-Gm-Message-State: AC+VfDzmL258Hm3XFAagLAlIRN9jt5dqgpWR9ZKQ95c8AkCxvWl7hkxI
        oMJUUNfe1kpU5/8R2XvABVfjhoWb/BddXNUwu7YJJpfgnoFhBfdGtQ==
X-Google-Smtp-Source: ACHHUZ6la5UyKR8hrXvI002lIEv1MDyAtdLvfOV6K2EKG0u9ts0sSq+5LA8R8Q0q7PRSIdMI7FtvKjtqtc3ZTgaiRuE=
X-Received: by 2002:a2e:9548:0:b0:2ad:99dd:de07 with SMTP id
 t8-20020a2e9548000000b002ad99ddde07mr5430627ljh.16.1687201119335; Mon, 19 Jun
 2023 11:58:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230619094705.51337-1-alexghiti@rivosinc.com> <20230619094705.51337-2-alexghiti@rivosinc.com>
In-Reply-To: <20230619094705.51337-2-alexghiti@rivosinc.com>
From:   Atish Patra <atishp@atishpatra.org>
Date:   Mon, 19 Jun 2023 11:58:28 -0700
Message-ID: <CAOnJCUJ5BgApWz3=F7f_CwATF0CV8dnZNw6hPYL0=b7-p63TiA@mail.gmail.com>
Subject: Re: [PATCH 2/2] Documentation: riscv: Update boot image header since
 EFI stub is supported
To:     Alexandre Ghiti <alexghiti@rivosinc.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 19, 2023 at 2:48=E2=80=AFAM Alexandre Ghiti <alexghiti@rivosinc=
.com> wrote:
>
> The EFI stub is supported on RISC-V so update the documentation that
> explains how the boot image header was reused to support it.
>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  Documentation/riscv/boot-image-header.rst | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/riscv/boot-image-header.rst b/Documentation/ri=
scv/boot-image-header.rst
> index a4a45310c4c4..df2ffc173e80 100644
> --- a/Documentation/riscv/boot-image-header.rst
> +++ b/Documentation/riscv/boot-image-header.rst
> @@ -28,11 +28,11 @@ header in future.
>  Notes
>  =3D=3D=3D=3D=3D
>
> -- This header can also be reused to support EFI stub for RISC-V in futur=
e. EFI
> -  specification needs PE/COFF image header in the beginning of the kerne=
l image
> -  in order to load it as an EFI application. In order to support EFI stu=
b,
> -  code0 should be replaced with "MZ" magic string and res3(at offset 0x3=
c) should
> -  point to the rest of the PE/COFF header.
> +- This header is also reused to support EFI stub for RISC-V. EFI specifi=
cation
> +  needs PE/COFF image header in the beginning of the kernel image in ord=
er to
> +  load it as an EFI application. In order to support EFI stub, code0 is =
replaced
> +  with "MZ" magic string and res3(at offset 0x3c) points to the rest of =
the
> +  PE/COFF header.
>
>  - version field indicate header version number
>
> --
> 2.39.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


Reviewed-by: Atish Patra <atishp@rivosinc.com>

--=20
Regards,
Atish
