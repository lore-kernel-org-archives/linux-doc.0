Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B750D1FDA62
	for <linux-doc@vger.kernel.org>; Fri, 14 Feb 2025 23:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739577344; cv=none; b=CttM+PL4xoRE3C2T0SXG4NGRFqf4rruqbisn/x/rv/dFOpjRCN/W5BpcPIhSWqinyqHhiThJdwL9sw/sgyUAuhsl0CHtdBkl5HX9cnNx/Yq9xD/xW9B55hA0CJ8afpf+pi0e6wThZ7ugTEm3+QFJYQZbNkJCN+8BkA3cV1ZvBZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739577344; c=relaxed/simple;
	bh=aSvLc6FH6SDZ6pN6TEN4K6vSV2moCc8rY9KuMBrkPYE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IZHdsonq65WV2RzAf+dhGqmoTo4rfmajZ/6YiIGWxmpj8uBi+/AfqcZTNjADJUJ3q6UOK35iU/yO3peq3Txg2m+wFVr9T8vZjvrS3k4H8uUnWr/lD8uIXluwnJEL7O/wZqaFgTrfDtBCLbyKIrOVd7jJDZLvIOhKNe4Kv5aXWBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fn9X1d/x; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fn9X1d/x"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2fc3035e947so244371a91.1
        for <linux-doc@vger.kernel.org>; Fri, 14 Feb 2025 15:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739577342; x=1740182142; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0RZWssaGK2NTJr+wteejyHIurAC825/BAeqVhi3Ct24=;
        b=Fn9X1d/xhHm6EyavH9WPs0qezpN6XszCDOUmbbKCOO1N8j1y1ujuqcHqrxb0ndtQEb
         kzgzmrODVQgXmvXIh8fq8tJubuoBTl21cKlNZsUrnYpROw3x0ZpaQsE1AOyLY2M+VVNm
         HVe2xyTgbobvey/DiDVZiRZI1sp+OS5gb0ywXay8ZeikGBPQ/5J19AC3g6Ntk3Ub3PO1
         APfc3YQKkB1mK/BU4aIXIOv56LqAm6yHUip0pUzT7INefn8NjidveYrMB8eUChugkHlc
         qUCF91WgDRLzoMXKnzjBiWFVS3dRvrrSwy7z70/wtIRlL/0ROE8RxO/QSyD3YXdCaSeo
         8FEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739577342; x=1740182142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0RZWssaGK2NTJr+wteejyHIurAC825/BAeqVhi3Ct24=;
        b=VmSwAo40IkGYmpvL1C0bVYWwfjzOiAO88oGK3Bh7k2w7n8i9o+Fcu2RrYzepxNTN0K
         esLnHwHTCjo4KtmH75IWFNxpbi+sHAQjKzIcnWoRQEXKC3BZPm+Z4kdiLHvF5djrJtTi
         QOPPmlcWiRRG/Yl1pKjdX3FLf9LYwXIv3+fwn3td2BGSpSSTu0IaFvHKipH2GQzSGEZW
         g8w6i+1du6utp5ZoxkNVscd1S94zM9e3uAWf+gOtQfEDaUikq2PdY5PdIiptVjKH30T/
         sJw1BXRFAPbkf1ehYZQWXtPz+o0D4KCf7Js/3CmX6TsfULPT4YqI1pq5l0LSx/gVWdZw
         Wiqg==
X-Forwarded-Encrypted: i=1; AJvYcCWaTHW6zWhYapMEcATLD/47w6TkI4/eU2hrZKEMBFMUaE0lraTRcNoDMw90aXGSpAMlyyLI7zuog8E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXw3fAIO3D3qUTpvLuoVeGZWFxkZfi1ZKQBDkBf6c7yvaMIvai
	6Xo+kG1J5c/bT5DUXcPHa9tnMSm9KLImf8HV26ZTHXAVOQAXZEE/GfFotquhOB9KtuM9b6jFTGy
	QDGh73LNPpoyyvHzzqcQ5Dq5nuy0=
X-Gm-Gg: ASbGncuSUHgL+N8EkbSS84oVjiyYvomebajCpLnXKishlQ1cGsFqHJ5ESXmzCNMe36O
	oGnthGXZIrpctQL7hJ567upI1G/pnSnbydumR45wGrW8PhMK7BjoNWwb+/Q9uYfalhY1TogRt
X-Google-Smtp-Source: AGHT+IEfXX+QP9LC2AyfnxCgNnxhiEAkU8HrJ3XkmL+aMTqt8JI2i1PjVmvfaIQWrYpE2vJub6jKHPXsgjMgL1Er49U=
X-Received: by 2002:a17:90b:2250:b0:2fc:1370:9c2f with SMTP id
 98e67ed59e1d1-2fc4103cd0dmr593982a91.4.1739577341868; Fri, 14 Feb 2025
 15:55:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250214230011.439163-1-siqueira@igalia.com> <CADnq5_P0BX1VT6F1Bo6Zip+9fsV98Y=XVQDpv-B3NeOKNnDX7w@mail.gmail.com>
 <4rkulwzkqzje6c6yky34fi6jobgpc7ehrktavpswndhfqpjvxt@ivpb2tg5bgbf>
In-Reply-To: <4rkulwzkqzje6c6yky34fi6jobgpc7ehrktavpswndhfqpjvxt@ivpb2tg5bgbf>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 14 Feb 2025 18:55:29 -0500
X-Gm-Features: AWEUYZnPSiTiOl0BMujHcCu06padZuUXzozlxnUKBKIOXfjg3_OafBr09OHAbog
Message-ID: <CADnq5_M3zs+fOsXUxeAc=pcBVpQAw=e0aoNdEQ_Rv1uQXWcXxg@mail.gmail.com>
Subject: Re: [PATCH] Documentation/gpu: Add acronyms for some firmware components
To: Rodrigo Siqueira <siqueira@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	amd-gfx@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	kernel-dev@igalia.com, Mario Limonciello <mario.limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 14, 2025 at 6:38=E2=80=AFPM Rodrigo Siqueira <siqueira@igalia.c=
om> wrote:
>
> On 02/14, Alex Deucher wrote:
> > On Fri, Feb 14, 2025 at 6:00=E2=80=AFPM Rodrigo Siqueira <siqueira@igal=
ia.com> wrote:
> > >
> > > Users can check the file "/sys/kernel/debug/dri/0/amdgpu_firmware_inf=
o"
> > > to get information on the firmware loaded in the system. This file ha=
s
> > > multiple acronyms that are not documented in the glossary. This commi=
t
> > > introduces some missing acronyms to the AMD glossary documentation. T=
he
> > > meaning of each acronym in this commit was extracted from code
> > > documentation available in the following files:
> > >
> > > - drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
> > > - drivers/gpu/drm/amd/include/amd_shared.h
> > >
> > > Cc: Mario Limonciello <mario.limonciello@amd.com>
> > > Signed-off-by: Rodrigo Siqueira <siqueira@igalia.com>
> > > ---
> > >  Documentation/gpu/amdgpu/amdgpu-glossary.rst | 21 ++++++++++++++++++=
++
> > >  1 file changed, 21 insertions(+)
> > >
> > > diff --git a/Documentation/gpu/amdgpu/amdgpu-glossary.rst b/Documenta=
tion/gpu/amdgpu/amdgpu-glossary.rst
> > > index 00a47ebb0b0f..3242db32b020 100644
> > > --- a/Documentation/gpu/amdgpu/amdgpu-glossary.rst
> > > +++ b/Documentation/gpu/amdgpu/amdgpu-glossary.rst
> > > @@ -12,6 +12,9 @@ we have a dedicated glossary for Display Core at
> > >        The number of CUs that are active on the system.  The number o=
f active
> > >        CUs may be less than SE * SH * CU depending on the board confi=
guration.
> > >
> > > +    CE
> > > +      Constant Engine
> > > +
> > >      CP
> > >        Command Processor
> > >
> > > @@ -80,6 +83,9 @@ we have a dedicated glossary for Display Core at
> > >      KIQ
> > >        Kernel Interface Queue
> > >
> > > +    ME
> > > +      Micro Engine
> >
> > This is part of Graphics so maybe something like:
> >
> > ME
> >     MicroEngine (Graphics)
> >
> > > +
> > >      MEC
> > >        MicroEngine Compute
> > >
> > > @@ -92,6 +98,9 @@ we have a dedicated glossary for Display Core at
> > >      MQD
> > >        Memory Queue Descriptor
> > >
> > > +    PFP
> > > +      Pre-Fetch Parser
> >
> > This is also part of GFX.
> >
> > PFP
> > Pre-Fetch Parser (Graphics)
> >
> > > +
> > >      PPLib
> > >        PowerPlay Library - PowerPlay is the power management componen=
t.
> > >
> > > @@ -110,14 +119,26 @@ we have a dedicated glossary for Display Core a=
t
> > >      SH
> > >        SHader array
> > >
> > > +    SMC
> > > +      System Management Controller
> > > +
> > >      SMU
> > >        System Management Unit
> >
> > These two are synonyms.
> >
> > How about
> > SMU / SMC
> > System Management Unit / System Management Controller
> >
> > Other than that, looks good.
> >
>
> Thanks a lot for all the suggestions; I'll make those changes for the
> V2.
>
> btw, from the amdgpu_firmware_info, I did not find the meaning of the
> below acronyms, could you help me with that?
>
> MC

Memory Controller

> SRL(C|G|S)

RLC =3D RunList Controller
The name is a remnant of ages past and doesn't really have much
meaning today.  It's a group of general purpose helper engines for the
GFX block.  It's involved in GFX power management and SR-IOV among
other things.

SRLC =3D SAVE/RESTORE LIST CNTL
SRLG =3D SAVE/RESTORE LIST GPM_MEM
SRLS =3D SAVE/RESTORE LIST SRM_MEM


> IMU

Integrated Management Unit

Another engine which helps with power management tasks.

> ASD

I can't remember what this stands for off hand.  Will need to look it up.

> TOC

Table of Contents

>
> Thanks
> Siqueira
>
> > Alex
> >
> > >
> > >      SS
> > >        Spread Spectrum
> > >
> > > +    TA
> > > +      Trusted Application
> > > +
> > > +    UVD
> > > +      Unified Video Decoder
> > > +
> > >      VCE
> > >        Video Compression Engine
> > >
> > >      VCN
> > >        Video Codec Next
> > > +
> > > +    VPE
> > > +      Video Processing Engine
> > > --
> > > 2.48.1
> > >
