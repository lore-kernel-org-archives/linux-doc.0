Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE0622ACC5
	for <linux-doc@vger.kernel.org>; Wed, 19 Feb 2025 19:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739992995; cv=none; b=KS002u3eq//kVa+UlUfd3scxCM92QO+0MuvwILiUzJ1IVMMnsabnxl8PimsGipgoquU+ZpG5tsGaiO1i9fj2eIs47JdEgUSnJOhrbLr/GpXFAetUdiVu4rtHZkkIKVw/tjLJUmg8tkjnqKMxpIQeffnvUkY/fFJQnOuJF1O0Ji8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739992995; c=relaxed/simple;
	bh=JHEYgoG1KH1S3UQHmBQlyX6BsKlDZ13ITQH81hjLv+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=njZ3r+bKnOYLG6yYzPaI9rFmbNm6Zf/UaTT0AgPwI8tdhvN7yyTuQjIS5zUxHS9AkXr5GZEc6hqfKHDPQDCmI4GGWR33ON/+3YTAf4MoJP6NhRCerbhjmZIDjgLIlK0J1m+QzpbIWwQM7FwU1ympIPTV6IRQ8GIdqmLL0AnKJRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lFD3WiLl; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lFD3WiLl"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2f2f5e91393so36925a91.0
        for <linux-doc@vger.kernel.org>; Wed, 19 Feb 2025 11:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739992993; x=1740597793; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRAjz95NI3rbyQapsiIwvuE0ET1X08y61NLMUyCeAq4=;
        b=lFD3WiLlGkoAX7amjA0mgRbcynRd3RHyg+oMQ4b2yqtBsumFJBwRWRuuiSlJcP27KU
         H6ACCPzDKnanRB+wrLTtBud6sheqBu5RklrCrOUEfGXgUhYmkMr81LQqezKGECukhQnH
         mDwYVg6V4bjXtwdGDOnls702IW68VV22sWucPww3yEVJgbHmW+eTu/4W6bFYcxhismYy
         AsAvPAv3L/i9oAIz0dXpAdsZ38yQ9UDK4KRi9Ao5jpi/Bg39VBQoEkMWb+gQo4qgSsNo
         53Ag4AXrrFr/dpjJqK7lwwaAADt0/xoey6gujjCtUWixJWq116NRYPXcysO/AxbexsSF
         DEFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739992993; x=1740597793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hRAjz95NI3rbyQapsiIwvuE0ET1X08y61NLMUyCeAq4=;
        b=MZwLYgsahlIcKSDZMtjKenbcjOFzbOLA2ZpMDXR+W4HuoIaFx898+z+oI8RN5PTvuk
         HrdfmtTiaIXNwORVwKxRwGZkatJOwzr7a4lV3/YDK2zv6vVzYs4A5a7UOrD0g+G4I9JT
         4THqbWMepSlsDhOAehtnMS/hHNCG2IGHcC8TbicwaiXQ/AQTLCriQ/TBksy/aSsrxwDk
         YeRUlhYeAiGRXAUvfeLYNVLZTXPQcOeEYKsrqmPMZaM45bDvDZuich4mLM8et8QnMFwR
         4xXIdo2DpsYkFQpqn/2xm9IM/YWU8iAfWLAlaaJDQwMhU2qNvxTzDWC/3I3cIhO45eQX
         Y5UA==
X-Forwarded-Encrypted: i=1; AJvYcCVEHOO9fEUUdZ0dloMLSfSU+hcrDmbUahDwXhQk2b91gtIM9Nv+ma/2cUUqmYQmbQjlAAL5ojrdYWo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlnT+V9l4n6bsUcqknlg8P36fxQPU9jsCFIoodmhF5USkpRICH
	phLrtlGZHtLvNQ30dj8Ekx6Tg7QI/PmzoSwcHTeRtp+f76gkD5CLprcJ7QmsjSUeGHgXYQW/YQd
	biO2SpK71/AtIofNEfbqjxX5Kbo0=
X-Gm-Gg: ASbGncvT2j/uRxb/69Lu5AIjmw8VPIiERszG+6OZ5O44M8ASOXeBoSWFo52kUWzKtqE
	qVH5ULix9n/g1DLvNUUk0bT/2ZZoC9SF0htCU6Euniw+fCX513Yb4ET1cxllLW6Sa3sOVE+cq
X-Google-Smtp-Source: AGHT+IE1ISuTDXhZ9Y/67eBad6giWuhN/qICM4dTnI5Us9GDw58KYuvgo1GF/ber62sWolWZoZpThcwzPF9Bz5dT5Po=
X-Received: by 2002:a17:90b:3c4e:b0:2fc:15e8:b499 with SMTP id
 98e67ed59e1d1-2fc41175957mr11528476a91.8.1739992992760; Wed, 19 Feb 2025
 11:23:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250219185415.243896-1-siqueira@igalia.com>
In-Reply-To: <20250219185415.243896-1-siqueira@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 19 Feb 2025 14:23:00 -0500
X-Gm-Features: AWEUYZkJXLydwfQaksWZ4JpKDqM7EYnX3WdKK3w3ScR9Hw7bc2y3LD5GOwWaR4Q
Message-ID: <CADnq5_MUPph86+JiTZ7PY6_BuDcrc-Kjxmp6Fvp9b+XdSMQb7A@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation/gpu: Add acronyms for some firmware components
To: Rodrigo Siqueira <siqueira@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	amd-gfx@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	kernel-dev@igalia.com, Mario Limonciello <mario.limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2025 at 1:55=E2=80=AFPM Rodrigo Siqueira <siqueira@igalia.c=
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
> Changes since v1:
> - Expand acronym meanings based on Alex Deucher suggestions.
>
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Rodrigo Siqueira <siqueira@igalia.com>

Applied.  Thanks!

Alex

> ---
>  Documentation/gpu/amdgpu/amdgpu-glossary.rst | 45 ++++++++++++++++++--
>  1 file changed, 42 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/gpu/amdgpu/amdgpu-glossary.rst b/Documentation=
/gpu/amdgpu/amdgpu-glossary.rst
> index 00a47ebb0b0f..1e9283e076ba 100644
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
> @@ -68,6 +71,9 @@ we have a dedicated glossary for Display Core at
>      IB
>        Indirect Buffer
>
> +    IMU
> +      Integrated Management Unit (Power Management support)
> +
>      IP
>          Intellectual Property blocks
>
> @@ -80,6 +86,12 @@ we have a dedicated glossary for Display Core at
>      KIQ
>        Kernel Interface Queue
>
> +    MC
> +      Memory Controller
> +
> +    ME
> +      MicroEngine (Graphics)
> +
>      MEC
>        MicroEngine Compute
>
> @@ -92,6 +104,9 @@ we have a dedicated glossary for Display Core at
>      MQD
>        Memory Queue Descriptor
>
> +    PFP
> +      Pre-Fetch Parser (Graphics)
> +
>      PPLib
>        PowerPlay Library - PowerPlay is the power management component.
>
> @@ -99,7 +114,10 @@ we have a dedicated glossary for Display Core at
>          Platform Security Processor
>
>      RLC
> -      RunList Controller
> +      RunList Controller. This name is a remnant of past ages and doesn'=
t have
> +      much meaning today. It's a group of general-purpose helper engines=
 for
> +      the GFX block. It's involved in GFX power management and SR-IOV, a=
mong
> +      other things.
>
>      SDMA
>        System DMA
> @@ -110,14 +128,35 @@ we have a dedicated glossary for Display Core at
>      SH
>        SHader array
>
> -    SMU
> -      System Management Unit
> +    SMU/SMC
> +      System Management Unit / System Management Controller
> +
> +    SRLC
> +      Save/Restore List Control
> +
> +    SRLG
> +      Save/Restore List GPM_MEM
> +
> +    SRLS
> +      Save/Restore List SRM_MEM
>
>      SS
>        Spread Spectrum
>
> +    TA
> +      Trusted Application
> +
> +    TOC
> +      Table of Contents
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
