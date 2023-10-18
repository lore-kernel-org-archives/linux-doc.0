Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE256199CE
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 17:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ssIAHBd6"
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A94E4490
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 10:24:53 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2c514cbbe7eso62600661fa.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 10:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697649892; x=1698254692; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGr+wt8mibKQk7V/xmPHf9oID5HtJ6aKoUQCNWyJYkI=;
        b=ssIAHBd6c/4fTV2H6cqWVl4JvFRuctqTiihxcorkMy6+Gnq2FKGTWRMMgB6SLzTj09
         umOucqfIiNFYTVL8DJyWye2AGcDKPNzN7isZPIflFdmSIWyrtTXravm6OkVgGH7myDwE
         hAzQcYycD2CojE8wwGxmQfmcnztTME+OzHf9m1XEd6hASlvCG1Ryme9J1g8WW5faCNMl
         HtddF0/Vdk1l2V/YsXJXkQnbVBPYnE76/jKGrrDwFsk0kT/URJipZpMbw3afvoZkQ1JV
         tWXI05ziWsTen0ftM3GB5QQH84U8FXQCmkTpX4u1SWjT2nC51jR2rLMX8R7ShQS6ykE4
         FHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697649892; x=1698254692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JGr+wt8mibKQk7V/xmPHf9oID5HtJ6aKoUQCNWyJYkI=;
        b=XSJ7KGPd8aqM6s4X7OB3ERKELKtfzOqCjFw3AztzUNrfgQhcB0v6d/8orNpKIwdC33
         dnppoM7CePIbG5G2Gcvk5yAl46BOVeVvN3EnTeHBh3AVf7lrZIqt6a0aVd3TDZs+gooU
         5E7lQnyeXEgA7kk+3IhkwCuj5xthnXTp7r/nV4SaB3Isr9nepDL4rKzZg2/DWOY1eNmy
         hSJ60ZjsQHMDcI+iHuUHx9c+w7eWGWC7gNjUdHnzQ9AM59cmUbgkaE0wQbvBRm/ZWQiO
         HyJ0HtTRPSHFbU62boezZuBxkBLNJ0SLDo/gj4/LqsifO/vdEExZgmaLPhgge/V7U7HW
         fUxg==
X-Gm-Message-State: AOJu0Yxq/zapOHIsRUeC4YROfsZQqOQ56GfxtyHfTyQFUu3qD99MY7GL
	6BrOoDZ6RodZwJCGT7sEY1Ab13aJ0a5LlUfD7ghPpA==
X-Google-Smtp-Source: AGHT+IHn5JoyDBx4hQ6moyifBlTpJE2HspdWaEwiTdR7052+Lklyunc7KFWvmABqPETQ6/Rlz2A1G6dGqOcAJlNQXXc=
X-Received: by 2002:a2e:9b13:0:b0:2c5:3492:5d96 with SMTP id
 u19-20020a2e9b13000000b002c534925d96mr4576190lji.12.1697649891740; Wed, 18
 Oct 2023 10:24:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231017131456.2053396-1-cleger@rivosinc.com> <20231017131456.2053396-2-cleger@rivosinc.com>
In-Reply-To: <20231017131456.2053396-2-cleger@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 18 Oct 2023 10:24:15 -0700
Message-ID: <CALs-HssL=wNwj9nRuZwpZhy1CB9p9-X=OqgwBw9zvgA7hA4fEg@mail.gmail.com>
Subject: Re: [PATCH v2 01/19] riscv: hwprobe: factorize hwprobe ISA extension reporting
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Jones <ajones@ventanamicro.com>, 
	Conor Dooley <conor@kernel.org>, Samuel Ortiz <sameo@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Oct 17, 2023 at 6:15=E2=80=AFAM Cl=C3=A9ment L=C3=A9ger <cleger@riv=
osinc.com> wrote:
>
> Factorize ISA extension reporting by using a macro rather than
> copy/pasting extension names. This will allow adding new extensions more
> easily.
>
> Signed-off-by: Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>
> ---
>  arch/riscv/kernel/sys_riscv.c | 32 ++++++++++++++++++--------------
>  1 file changed, 18 insertions(+), 14 deletions(-)
>
> diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.=
c
> index 473159b5f303..e207874e686e 100644
> --- a/arch/riscv/kernel/sys_riscv.c
> +++ b/arch/riscv/kernel/sys_riscv.c
> @@ -145,20 +145,24 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *=
pair,
>         for_each_cpu(cpu, cpus) {
>                 struct riscv_isainfo *isainfo =3D &hart_isa[cpu];
>
> -               if (riscv_isa_extension_available(isainfo->isa, ZBA))
> -                       pair->value |=3D RISCV_HWPROBE_EXT_ZBA;
> -               else
> -                       missing |=3D RISCV_HWPROBE_EXT_ZBA;
> -
> -               if (riscv_isa_extension_available(isainfo->isa, ZBB))
> -                       pair->value |=3D RISCV_HWPROBE_EXT_ZBB;
> -               else
> -                       missing |=3D RISCV_HWPROBE_EXT_ZBB;
> -
> -               if (riscv_isa_extension_available(isainfo->isa, ZBS))
> -                       pair->value |=3D RISCV_HWPROBE_EXT_ZBS;
> -               else
> -                       missing |=3D RISCV_HWPROBE_EXT_ZBS;
> +#define CHECK_ISA_EXT(__ext)                                            =
       \
> +               do {                                                     =
       \
> +                       if (riscv_isa_extension_available(isainfo->isa, _=
_ext)) \
> +                               pair->value |=3D RISCV_HWPROBE_EXT_##__ex=
t;       \
> +                       else                                             =
       \
> +                               missing |=3D RISCV_HWPROBE_EXT_##__ext;  =
         \
> +               } while (false)
> +
> +               /*
> +                * Only use CHECK_ISA_EXT() for extensions which can be e=
xposed
> +                * to userspace, regardless of the kernel's configuration=
, as no
> +                * other checks, besides presence in the hart_isa bitmap,=
 are
> +                * made.

This comment alludes to a dangerous trap, but I'm having trouble
understanding what it is. Perhaps some rewording to more explicitly
state the danger would be appropriate. Other than that:

Reviewed-by: Evan Green <evan@rivosinc.com>
