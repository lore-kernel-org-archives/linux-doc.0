Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA91383BF
	for <linux-doc@vger.kernel.org>; Tue, 11 Jun 2024 15:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718121557; cv=none; b=RKv7udqyLeXJYjd+qXhBvfE0XrJbsCLqp/zQNY2iZBdSooCtCB8svYuU2L2+JilC80q3J3QJCpedz563odiRPnY9rUh/NMfC8TVUMF8av80dOMYqZPI4PSNmPGICz65JAZoW9pcvgM9cjGvX9ZMGMvhsrFbqk1+d/rBZdxqP8bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718121557; c=relaxed/simple;
	bh=HsSfwE4c9FKwzt2D18mve0ctqok3simx/c6Sk4d9mD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jyAhTqivANgWULg/+ihxQe+98tW7x1DBQ+XTxS4G6b3HEQQc3tets2G20ZTGjbbdxjmXmNBE3C7yknhX3SaJ9sALzfQgUBPzV4QQ27vOJtOsnfSu6eIur0LgStRhQXCayu6k1HFZYAtF2CEe9OuGhhVucnIRuY4p0vVD8cRvEa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=s/ry5662; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="s/ry5662"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a6f176c5c10so143084366b.2
        for <linux-doc@vger.kernel.org>; Tue, 11 Jun 2024 08:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718121554; x=1718726354; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KeeLnew4Dr2lt2iWiQJB+NWU2kaX728eR1Y/pdt+oA=;
        b=s/ry5662Ge+hWbpEAGorm7hqKMZpZcv4wxPprCcclHLcbNXybxPYxyzYt6SpTbK8lk
         xzj/neGZvGQCCVqomCcHuBX2n2t5Sw/wma4lwmXtiUrCxkHh9ijuHpJwxy/nnyM08uvu
         nhKM77yPVFu9B91OourqJO+UmrDMiajArZkBNTRan+yrSGUAAc4P2UoYeXT+3cn7uLzM
         KrmG64DemnXC017Qhj749vZw5+c3BcaQlR9Lfxct3b1kgWEig7quSDiYXDVBcBPqxK6J
         u94g/GyF0iKyegEROSXhGtbmOi72nRF2tfisVYDw9nFdq7FhW5gS/5i8SlGd0zf3euvD
         WiHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718121554; x=1718726354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7KeeLnew4Dr2lt2iWiQJB+NWU2kaX728eR1Y/pdt+oA=;
        b=Nqt6+w9QOJWm+na4qRE4SYIgYRsQ/yIl64RKGCQJRRB7cRfCK8cX7aHjB0qYKI/mD0
         k2KLBnrd5koVfnfkxl06d/GkCuFtThYCqZHRKisHWPLxne/GtCpQ3gTC4jyn0lbY0Rjx
         h2hScU/PnSZ4KImZEINe9QDiO6ibf1LrTyFhnuarb2a6XCg90bUyg1EaSlep4EKcdtb7
         pY4usH5ACRKoGxdDEwQk0+kS8hetevhESxOtvABlXrjbJuARgLf1OYbDeVJLDyHLUXLZ
         hphAYbRHtCJYm5NyBAAIl/lkLn9VoXvVvsItbY0kMuVWzAVFfclVRpwg7kkC8wToGZjG
         TRLA==
X-Forwarded-Encrypted: i=1; AJvYcCVvecZZL48S+ve1ClXeI5MNU7XviyqxT+lszl1CQwAa5Wu9DtFtQfFKVN/P7y9lu+mWguMrTi2SAP60Ydc5DcZVsGcUXhrFV8Aj
X-Gm-Message-State: AOJu0YxGKpw8dVutH7n9bD0+yMhkbU67Zf+66CYYwB0NWQfyOEK7TdZT
	aCSixfEk/2diTeAotFsyTv45OXhaF40S0z7EV6o74IKMkuozUVveOMVjosmwK5+/w6D+C6ueHWm
	YO2optQMiZLs7wj4kWVx3CnvEcvAMasMMMkpeBA==
X-Google-Smtp-Source: AGHT+IFtN4cYhXjGsiGLi9dtTvtTxex9wzVTtZ32q9gZra1QREy0esNjyQa0xfTpDsvoF9kv8aqdxu0J/DY1HdrDZBE=
X-Received: by 2002:a17:906:2811:b0:a6e:f7bc:dcab with SMTP id
 a640c23a62f3a-a6ef7bcdd76mr607353666b.65.1718121553604; Tue, 11 Jun 2024
 08:59:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610-xtheadvector-v2-0-97a48613ad64@rivosinc.com> <20240610-xtheadvector-v2-11-97a48613ad64@rivosinc.com>
In-Reply-To: <20240610-xtheadvector-v2-11-97a48613ad64@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Tue, 11 Jun 2024 08:58:37 -0700
Message-ID: <CALs-Hsu2jFAfr7H9UfLd9VHEZvpfF7Q6Chxko3XbBZBCU94eSw@mail.gmail.com>
Subject: Re: [PATCH v2 11/13] riscv: hwprobe: Document thead vendor extensions
 and xtheadvector extension
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 3:57=E2=80=AFPM Charlie Jenkins <charlie@rivosinc.c=
om> wrote:
>
> Document support for thead vendor extensions using the key
> RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0 and xtheadvector extension using
> the key RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR.
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Reviewed-by: Evan Green <evan@rivosinc.com>
> ---
>  Documentation/arch/riscv/hwprobe.rst | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/ri=
scv/hwprobe.rst
> index 204cd4433af5..9c0ef8c57228 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -214,3 +214,13 @@ The following keys are defined:
>
>  * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
>    represents the size of the Zicboz block in bytes.
> +
> +* :c:macro:`RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0`: A bitmask containing =
the

Our recent snafoo with CPUPERF_0 popped into my memory
when reading this. Does this work properly with the WHICH_CPUS flag?
Specifically, we need hwprobe_key_is_bitmask() to return true for this
key since it's a bitmask.
