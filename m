Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C081FCFD3
	for <linux-doc@vger.kernel.org>; Fri, 14 Feb 2025 23:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739575625; cv=none; b=S+I9wAUvCcp+JslWWBAktwuLM8/XbpbGNQSbO73Xg4/O6eQO2rmTN3cNcWMXvYGpOdomCFpw9J3OOGzkZHbrWP0ihSLF26eVZ27VeB6riD0ciOEiC8RMmgHNRPpjz5BUDdUDeJBMTGMpe8n1UsugTR9H8ob57ae4V0YyO/nJ5As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739575625; c=relaxed/simple;
	bh=Jg7GZyeAr0ZItPlBFmIE9IcbVtezJoYMP4nP1B6V2Lw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m+/HyCUpEeSwmybVFpqyl6Ex1cN7kYXfi5gGAtWx7yLPuUp38b2/D7CFyGhkz+mYo+toi1BQDRX9R4ZKLP+3ZvNC7OgGpwJ7Y5fYJ5wzsFfBQgqKBI7fic5GP/8jfOBsCbrQm8pufWt94DaD3qGwvsK2pPo4b6GkV8DMtTu8JbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QLz4+vTx; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QLz4+vTx"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2fc0ab102e2so563075a91.1
        for <linux-doc@vger.kernel.org>; Fri, 14 Feb 2025 15:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739575623; x=1740180423; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFzSHm9eoEhtoxQNqPwszvlIslybTi8OxJYunJkNKpA=;
        b=QLz4+vTxl7L0Nei2xM98etMtkzKFU6e6ryj+0yqmYGAjxSBrDIvzPwfBXfcb9aVh1O
         nFIURcc6TF1aFa+BwtJhYpDiVNN9H9dQVfzrAhCBdyyksqZmByAVZ84jyWj9ol7ji7kA
         K9LZZzYjzt3qx+cJO9KLGhRzymESIEh8huOoBVrgl30my5mN4BbPIN3WIkGdGErd44Dd
         ZcN4sqefjy2MyvgmxjDFIW8moyzhdXPyyiN7bsdskmrwCgTqKZJ9Q9twS7jSusN/Z70H
         rrye6PJGUmtgXRP/GFnBrlWoWjRMGFN8EdjajllzuBQ+HPai4a4MZ3odvyr2361bokwU
         pIbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739575623; x=1740180423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OFzSHm9eoEhtoxQNqPwszvlIslybTi8OxJYunJkNKpA=;
        b=n+6HXzCr1a4x4vcjk/9+4b758HU4zf2WK1zMn4bf9ChLq7WpMhg2zOTIVesWER1wmh
         /cxJR4Z+tc7MXsKRkS5jSAuOAyky0bQjSJYhGH40/K430DMny5pa76OgcljkPk51f6bQ
         jL9eDCAHfGmf6/reARTps1YPBKZvlawHHsnQYtRGxU1ySYnxACY5wLwvacKiN9oEQxO6
         DTauaClieGCK6zkyyC6Q6zo1yha/uGGfze6573NfOeVUBCSLq7bU1/MOfGojXL2U5R+T
         2s58qtx5T+p666GrXvuvw3EXrBQoZaqBhI1wqQ6BnsH433uQOONHyaMFCmQk6yhlhiHe
         QVhw==
X-Forwarded-Encrypted: i=1; AJvYcCURsiBuDku2EFWI1PO8FAU+wp/zqHJUUuIW/yOoxFYUqVZIaoDOSVfrqgJ0bNP72azaM9jbxpodBao=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuYecH+bgfxvapKu52Lmv4wJHvGICjzAqN0BQU7/BwDpg8f6n+
	qtGi/K8v/jqMy6BjTWN1Uja58vCdLWe+PJgTslsOOc+HOZgWHEer975bByGVIi3lJpnxsl7Ib5X
	73OyjMyU9F3usS1jGCdjWtMQR1cpvADU4
X-Gm-Gg: ASbGncsA9L41oyheqi4uOHKF4OIreydykodTdHF7uPmwGUvQpLQqkD1/1HFBcRtawtg
	L8pQVOWV7zB+tAt85USARxgEm//2I2sOLDh9wBW8MIrEqLssxjBMgiVm5lUU1cnRXZPCAMFrL
X-Google-Smtp-Source: AGHT+IEsmyFl9902Sw64uSHGmFMugCDjef098RzrQDd2x9CwbfePTG9SHWWNkAjXSFsIjegulfSfvV2O0JSkhBQ1Aig=
X-Received: by 2002:a17:90b:1e05:b0:2ee:6563:20b5 with SMTP id
 98e67ed59e1d1-2fc407909c6mr551323a91.0.1739575622822; Fri, 14 Feb 2025
 15:27:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250214230011.439163-1-siqueira@igalia.com>
In-Reply-To: <20250214230011.439163-1-siqueira@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 14 Feb 2025 18:26:51 -0500
X-Gm-Features: AWEUYZm_3C3ScBYYXalbDOFMjEEr48IkWl1qEVpoAcaoFrbVzDXbMp8gF3DNTbE
Message-ID: <CADnq5_P0BX1VT6F1Bo6Zip+9fsV98Y=XVQDpv-B3NeOKNnDX7w@mail.gmail.com>
Subject: Re: [PATCH] Documentation/gpu: Add acronyms for some firmware components
To: Rodrigo Siqueira <siqueira@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	amd-gfx@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	kernel-dev@igalia.com, Mario Limonciello <mario.limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 14, 2025 at 6:00=E2=80=AFPM Rodrigo Siqueira <siqueira@igalia.c=
om> wrote:
>
> Users can check the file "/sys/kernel/debug/dri/0/amdgpu_firmware_info"
> to get information on the firmware loaded in the system. This file has
> multiple acronyms that are not documented in the glossary. This commit
> introduces some missing acronyms to the AMD glossary documentation. The
> meaning of each acronym in this commit was extracted from code
> documentation available in the following files:
>
> - drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
> - drivers/gpu/drm/amd/include/amd_shared.h
>
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Rodrigo Siqueira <siqueira@igalia.com>
> ---
>  Documentation/gpu/amdgpu/amdgpu-glossary.rst | 21 ++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/Documentation/gpu/amdgpu/amdgpu-glossary.rst b/Documentation=
/gpu/amdgpu/amdgpu-glossary.rst
> index 00a47ebb0b0f..3242db32b020 100644
> --- a/Documentation/gpu/amdgpu/amdgpu-glossary.rst
> +++ b/Documentation/gpu/amdgpu/amdgpu-glossary.rst
> @@ -12,6 +12,9 @@ we have a dedicated glossary for Display Core at
>        The number of CUs that are active on the system.  The number of ac=
tive
>        CUs may be less than SE * SH * CU depending on the board configura=
tion.
>
> +    CE
> +      Constant Engine
> +
>      CP
>        Command Processor
>
> @@ -80,6 +83,9 @@ we have a dedicated glossary for Display Core at
>      KIQ
>        Kernel Interface Queue
>
> +    ME
> +      Micro Engine

This is part of Graphics so maybe something like:

ME
    MicroEngine (Graphics)

> +
>      MEC
>        MicroEngine Compute
>
> @@ -92,6 +98,9 @@ we have a dedicated glossary for Display Core at
>      MQD
>        Memory Queue Descriptor
>
> +    PFP
> +      Pre-Fetch Parser

This is also part of GFX.

PFP
Pre-Fetch Parser (Graphics)

> +
>      PPLib
>        PowerPlay Library - PowerPlay is the power management component.
>
> @@ -110,14 +119,26 @@ we have a dedicated glossary for Display Core at
>      SH
>        SHader array
>
> +    SMC
> +      System Management Controller
> +
>      SMU
>        System Management Unit

These two are synonyms.

How about
SMU / SMC
System Management Unit / System Management Controller

Other than that, looks good.

Alex

>
>      SS
>        Spread Spectrum
>
> +    TA
> +      Trusted Application
> +
> +    UVD
> +      Unified Video Decoder
> +
>      VCE
>        Video Compression Engine
>
>      VCN
>        Video Codec Next
> +
> +    VPE
> +      Video Processing Engine
> --
> 2.48.1
>
