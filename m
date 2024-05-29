Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB2315CD59
	for <linux-doc@vger.kernel.org>; Wed, 29 May 2024 18:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717007662; cv=none; b=LpCXJOCQWQgAYOkCm4bXaHY30J6EIILtMMqgGPMDcvEz3LdGDW/EHpG6Vx4tfR4b0Gln7IXyQbF/JhDqCLUfomeLEDjZ9fztd4mPKzuJjn8AYlvbQoGijeMPtTfucxDcZCNJzMl27yG33ZVSbzMLatmS73AMKEyXlv/fiHypLdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717007662; c=relaxed/simple;
	bh=/LUGPZ8sRhOa4AmLVDY/nkUbCDAoK3NG9aCU9NfcpLI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=njbylkTkwb4UHKJiY+0VY+rvo64Q3XgtINvT01YPOBVqzIgOU5MzoyJVUyMAKXmA0oG2yZDj7T6P/CRTRTxEjmUpHtIKuIz+ck2H8y1YBv+aqtuJ8VxnLY5z//qcsV+Mo4XbRbcXBAJoXLeNHx8wBWLwLESpwZF3vRq+eGpo0p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=OgZhJ1v3; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="OgZhJ1v3"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a6269885572so46753266b.1
        for <linux-doc@vger.kernel.org>; Wed, 29 May 2024 11:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717007659; x=1717612459; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hD6ZFR8cVhkF2jyWECX8kqG1Td4lUwUC/HVkt49WWDc=;
        b=OgZhJ1v3llbSl+P7ybHZpo77dFkoRJCUzreIynVyMlYFmB8JN1xCZfZtq4+H3R3kLf
         Q87UWZtausi4A9hi4rPQ4LeW628vpUkJznLoo8zp5g2ZdlB1iZSdPnGlFxY6CuSTVkIG
         VHnASZeLtUDC+eAqzVcx012e+3s5fLzgAmJLJeN7sNHJX8To3hLQeu0brJ9UwKgrA0E1
         ZOx6gAs23Q6hzFNNPu+VkNNipJ7f5gNwinK9kZxKyxLTDXHDVcxjsjSMtUOGr9SdQuWq
         VfvSda0Z3ccvlOPOp1qO22lickpvUPkjtjeZYy6r643JqSE2KET1gJ03R3hLsUYuWyH1
         cqcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717007659; x=1717612459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hD6ZFR8cVhkF2jyWECX8kqG1Td4lUwUC/HVkt49WWDc=;
        b=nK8d8rjQxPA1mWL4DBNOFjseBDNq7wjCaRfpo2GeAO2yDEHvUSa797QGEp3pK+22RM
         twayWgZVfnml7f9olMUwKLemgGsJMkgai4GJWKT//8J9qC2QCG+UGXvEfV4s5eh9S8RH
         ERHlTDP6s2HA9hxwqJ64kKtHh/YPX6q/zQjLki9UXTCK+VPdHKitJkC/MNVlzR1NwdoC
         O7wpnDus7GqKo//Y1Aics73vPo5RTkcEhZRitjGMYpEF07ANnF18Vjf88qFR7ba94TVY
         jAPhSU+zp9ddoPP9QpI+V41oJvxoLTQesIs4RZuKhgC4A+CLDHdHVQEjnqzsjSZ7nMtw
         cxQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLScN6KAqpGnm4u41aJq4AW0bJl+4lRGzVtCSnVBot4TGeqUGTbeg0EsU9NWXY4VscUd2gCX/bBMNTZngexXtT0fzRephHV7bA
X-Gm-Message-State: AOJu0Yw8z2TugRZ7I0VPhTHnPdZD2Ph67Wp23WZ9lYYjaCF48TgA3PU/
	L/IbHxgigAyCe1ac2yKPh88/0PrlhPH8YVkqN+k6km5afzScRn30NhK6SiVkzgHhV1ypy3u+XQX
	m5dDttN7wFnAy/GYMY4sSvtydcn+3Kg16oWrJzFla09FxfPjj5Ivyxw==
X-Google-Smtp-Source: AGHT+IFfrfi+FZNye+Mi5cT1d9Y5frgn3oR/psuzmdDX57yFj6cbdF7CKYfEIUYsI39iYQu9pPkVIxjamQlqxGS+pZo=
X-Received: by 2002:a17:906:66d0:b0:a59:be21:3587 with SMTP id
 a640c23a62f3a-a642d2780fbmr270278866b.8.1717007658800; Wed, 29 May 2024
 11:34:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_1E3506F09D08066B8F3BAEE136C4F887540A@qq.com> <tencent_01F8E0050FB4B11CC170C3639E43F41A1709@qq.com>
In-Reply-To: <tencent_01F8E0050FB4B11CC170C3639E43F41A1709@qq.com>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 29 May 2024 11:33:42 -0700
Message-ID: <CALs-Hst_TpjuQw0t-p9GbcCY4FAwXSjWziHJJuToi3rWXo7mJw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] RISC-V: hwprobe: not treat KEY_CPUPERF_0 as bitmask
To: Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, Elliott Hughes <enh@google.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Andrew Jones <ajones@ventanamicro.com>, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 23, 2024 at 8:36=E2=80=AFPM Yangyu Chen <cyy@cyyself.name> wrot=
e:
>
> Since the value in KEY_CPUPERF_0 is not bitmask, remove the wrong code
> in hwprobe.h.
>
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>

I'd expect a Fixes tag, and ideally some discussion on the reasoning
and ramifications of this change.

I posted the other possible fix, declaring a new key, at [1], mostly
so we could see the two options and discuss. I'm okay with either
patch.
-Evan

[1] https://lore.kernel.org/lkml/20240529182649.2635123-1-evan@rivosinc.com=
/T/#u

> ---
>  arch/riscv/include/asm/hwprobe.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hw=
probe.h
> index 630507dff5ea..f24cad22bbe1 100644
> --- a/arch/riscv/include/asm/hwprobe.h
> +++ b/arch/riscv/include/asm/hwprobe.h
> @@ -20,7 +20,6 @@ static inline bool hwprobe_key_is_bitmask(__s64 key)
>         switch (key) {
>         case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
>         case RISCV_HWPROBE_KEY_IMA_EXT_0:
> -       case RISCV_HWPROBE_KEY_CPUPERF_0:
>                 return true;
>         }
>
> --
> 2.45.1
>
