Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E6D3019CE
	for <linux-doc@vger.kernel.org>; Wed,  3 Dec 2025 17:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764784641; cv=none; b=ZyUuZowHfxHo5Gv4ODcExpsCd6ab7soNNG5nl/DgxPddpJQ+x+9GVs5khpD2/5CO4bc7L2RbLSKYzzLBJKTPxANqNYUjhzRwhEnM82nQcX6cptkPX4gyftNb/XF8b+Q0tsMM/5EHY7YXUYz5nwaMIdVkRGN5/rPnICkmhby450Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764784641; c=relaxed/simple;
	bh=rj3QvZrvvrIbJ5/wLiMNjpxmiA/CbFjLX3oTRE30FBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YzK9Z8wlmzr8uX2sD1AH6z3YW0EwU1lLN3ek8mUTUIa9Q5PjJ48DYTVpqRnzmLaRDQ4V47PAFWZgPI+imFBSACcgNMNHvkRxCYM7G2/O0QRTiKu9JDGMhn35nOuKZWnzrkDl9A9JSgu5EALvbAr66EnT1XleZwTLsEnv3TubB7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BztuTuOr; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BztuTuOr"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b739ef3f739so2183166b.1
        for <linux-doc@vger.kernel.org>; Wed, 03 Dec 2025 09:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764784638; x=1765389438; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+I9vBbVnFNZx3QCSTq1xIAOnL+dBiPfyZ1uzxKTwupA=;
        b=BztuTuOruRw3DpP4ggP/aYfBzsdrslTbEjWx5fDnkqeo72djUBClcLqqwTdLyc7vBK
         tG24OQLYfa6mvEUYPAthIhyrzzi5s4B2Z09ONWwrMcIH5mo7QwyZt/D8VZks+0cN4yq/
         i4JrGhE6Y+89cN+VyMHLMDna7/6R71DIPAYUoGfQzn1aTizM6XW3bNm906G2le7M4uSo
         kc3U/wSABwNsDqljW3yAOGdl2pHhRI65TaFzHBJzlVj7g+801CC6fY6MYirtlY86KS1P
         oIA3PfJaWXryhK5VR4UUbi0sHPAvS9t4M+T6ItQjLYUPCL6XZvqWKYC7nXzBvevEdBsx
         PNxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764784638; x=1765389438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+I9vBbVnFNZx3QCSTq1xIAOnL+dBiPfyZ1uzxKTwupA=;
        b=We7YME9z2oeSecflxTNN/Fy8CZDNPenpx+bhms2VIQTG5Nye8a4DnELH1dMJRwTq/X
         FN9c3Mvnc1VmsdR+m3GWEflbYbVH7LflMfnkrlFsAN3hOvtKBSJeuViheyYG4DO+b6G5
         eYo8eljwbxj0PP7AgB+qbvIjDwQksmF4jsrRPvdQQD3ewoOEKst731x7K3rlkrmHB7qa
         NX/EvTdB7jG/LN1XjHVceOXzCVj3h/4uSApNZXsadEZ4upPLj83jjWTK+aOXolczYUMc
         HWTwGiCNBko3k08iMl9vharMDb4fMGnuawTLaRyCvIr6Q6C/WkjMOkWEojYDC7tSRcTn
         3Hrg==
X-Forwarded-Encrypted: i=1; AJvYcCV53qLsDiKOIfNGEH9kRQS4JPLwyjylcb9ggKFwHJyZsuhEOKGa0MUy0AQsuT+AiN7jtD4gwa+0nxs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw22l44qLBciwD/12mnefZsJivI4n+Moac0YM+8/4tFkEntrni0
	D30PtW0UGmVTROX9xrj91BY9j3BB9RgY6OKd2EAaCknnrEjTXNnG4EA8Gwz7rhkTcpl1MLA4UQl
	4/4Gk+YOVHrjOMzpU4NeuMD9MlSytgqk=
X-Gm-Gg: ASbGncvuZenxKda070lseReBtKXVmjYcis9rSbK+Kkmn+GG82uIK1oPZ7WVXj0ALOoO
	WUN2BQ/8Pdxx7Wmvgp2v7Law0AZF7fgEQUPrUc+gpVyww/3QneScOfspIlKyPM6pd42uku8D36i
	0KWnVRWmRV1bJPI1L+1iA0Ar4HmY/AFZYt9pbbtJDrpeR0rgQt0RxbZfABiYe0xN4k9/8ZDyhBJ
	XR1xqduEBpBIocYm30917Ne8Ib0sLUc+/oyeZhjpkM3CNwrkHE6RzHCDekx6cZFnk5m
X-Google-Smtp-Source: AGHT+IGolAUq66Sf1/v3NSKzalmQQj7kPl02udnk7U4Xo9OP2JjIo8pInOmeNbraJNNQ0vDWM/mFH0y3xhNP06Dh6nA=
X-Received: by 2002:a17:907:7b87:b0:b76:74b6:da78 with SMTP id
 a640c23a62f3a-b79ec6743f4mr6955266b.35.1764784637530; Wed, 03 Dec 2025
 09:57:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251121193524.1813200-1-geomatsi@gmail.com>
In-Reply-To: <20251121193524.1813200-1-geomatsi@gmail.com>
From: Andy Chiu <andybnac@gmail.com>
Date: Wed, 3 Dec 2025 11:57:06 -0600
X-Gm-Features: AWmQ_bkrrlk_PDPxAzDGug-3rsg4IwNXffMJGvryJ06Fa4-F8x1hOmGxYgQgfX8
Message-ID: <CAFTtA3NVd8HMomd60i=T_S34TSL18==aYRFhg2AH-PbsM=hggw@mail.gmail.com>
Subject: Re: [PATCH] riscv: hwprobe: expose vector register length in bytes
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Charlie Jenkins <charlie@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sergey,

On Fri, Nov 21, 2025 at 1:37=E2=80=AFPM Sergey Matyukevich <geomatsi@gmail.=
com> wrote:
>
> The vector register length can be obtained from the read-only CSR vlenb.
> However reading this CSR may be undesirable in some cases. XTheadVector
> extension is one example: existing implementations may not provide this
> register. On such platforms, vlenb is specified as device-tree property.

I wonder why a hwprobe entry is needed even in this context. If vlenb
is not available, we can always use a vsetvli and read the destination
register to infer register length. Isn't that also true for Vector
0.7, or are you considering anything else?

> Reading vlenb also initializes the application=E2=80=99s vector context, =
even
> though the application may decide not to use the vector extension based
> on the reported length.
>
> Meanwhile the kernel already determines vlenb at boot, either from the
> CSR or from the device tree. So add RISCV_HWPROBE_KEY_VECTOR_REG_LENGTH
> to expose the vector register length already known to the kernel.
>
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> ---
>  Documentation/arch/riscv/hwprobe.rst  | 3 +++
>  arch/riscv/include/asm/hwprobe.h      | 2 +-
>  arch/riscv/include/uapi/asm/hwprobe.h | 1 +
>  arch/riscv/kernel/sys_hwprobe.c       | 6 ++++++
>  4 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/ri=
scv/hwprobe.rst
> index 06c5280b728a..14437fe79276 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -379,3 +379,6 @@ The following keys are defined:
>
>  * :c:macro:`RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE`: An unsigned int which
>    represents the size of the Zicbop block in bytes.
> +
> +* :c:macro:`RISCV_HWPROBE_KEY_VECTOR_REG_LENGTH`: An unsigned int which
> +  represents the vector registers length in bytes.
> diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hw=
probe.h
> index 8c572a464719..b10311c9a44c 100644
> --- a/arch/riscv/include/asm/hwprobe.h
> +++ b/arch/riscv/include/asm/hwprobe.h
> @@ -8,7 +8,7 @@
>
>  #include <uapi/asm/hwprobe.h>
>
> -#define RISCV_HWPROBE_MAX_KEY 15
> +#define RISCV_HWPROBE_MAX_KEY 16
>
>  static inline bool riscv_hwprobe_key_is_valid(__s64 key)
>  {
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/u=
api/asm/hwprobe.h
> index 1edea2331b8b..bd6cd97c81f9 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -110,6 +110,7 @@ struct riscv_hwprobe {
>  #define RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0  13
>  #define RISCV_HWPROBE_KEY_VENDOR_EXT_MIPS_0    14
>  #define RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE    15
> +#define RISCV_HWPROBE_KEY_VECTOR_REG_LENGTH    16
>  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
>
>  /* Flags */
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwpr=
obe.c
> index 0f701ace3bb9..3007432fbdf1 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -328,6 +328,12 @@ static void hwprobe_one_pair(struct riscv_hwprobe *p=
air,
>                 hwprobe_isa_vendor_ext_mips_0(pair, cpus);
>                 break;
>
> +       case RISCV_HWPROBE_KEY_VECTOR_REG_LENGTH:
> +               pair->value =3D 0;
> +               if (has_vector() || has_xtheadvector())
> +                       pair->value =3D riscv_v_vsize / 32;
> +               break;
> +
>         /*
>          * For forward compatibility, unknown keys don't fail the whole
>          * call, but get their element key set to -1 and value set to 0
> --
> 2.51.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Thanks,
Andy
