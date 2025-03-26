Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0161A2564
	for <linux-doc@vger.kernel.org>; Wed, 26 Mar 2025 08:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742976517; cv=none; b=cELllmKhQwR+8Ndjb9WP0K5QQA2mi5z2rkv/GCypSOdCQOF157Hb1ZkplGtRq7Prt+k03V4EE/kKWCFrFKIRI4J2qqdxoJ7SwBuqjizgj6RQUcaCtE1l12FtXxNSuVkVqw2OQRD5ZhnS0pJ872xgYxA11l6PExgdON4N6HT/xcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742976517; c=relaxed/simple;
	bh=/wDxtZtYm3n2Y+qU6xfgiJDRhUyHuWRxRdyMfePcnXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jtyiTLqWQeSZCo6X0h5AriwOvXAu//yveu8O0HNEyQqrROqy5HUOlzDxfIf/BV/luJMK3Ftkkuit1HOSIm3kvv6qX7bWmS/tJ1RGripN9kFkKonEpjI0btLpG1lpAMS6NXNgfuUyjvQa0iP/E4AkEZ3IAWWcU3ALGZO2yZ3eWtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XcSd6uii; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XcSd6uii"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so3429039f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 26 Mar 2025 01:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742976514; x=1743581314; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=75+q2z/puc5KEiBDalUbsTlKlpmxGTpxbd7S5/o5YWY=;
        b=XcSd6uiiiz6rl1KAN3a86QzcRYZl9l/EJEWiLKNnU8wpNn4RUfRLgZF3neR985Kn09
         VHYCAwz99hYgWMS9oMJtyEzP4kf39YHAQJiGyc4Xc8LJgRcgaCJyVG1Jqn40bNOKF76u
         RJIs+aVwWRKwB1RRmRwXmfleHBk39oLIEfyu2ZffYi9zjRdNgIri/IP6//q5GV8DfQXL
         ulkFXoxHFvqoqYkj2p8L+EjuX3FCw6xASOODArC9aI3T1VfVFA8FdODGs3B9fA3s8Nhk
         NC+t07ajGRiEaqrrbtm8tcbhCcPu+TjwWMpEgJAWk7CaKCfEbjX0QJc66HfDQsvV+xw7
         zRfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742976514; x=1743581314;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=75+q2z/puc5KEiBDalUbsTlKlpmxGTpxbd7S5/o5YWY=;
        b=hR4RGuWjH1VuhibsVIA6h6QmG2Kv0d3R1Jtgx4oTs+NQlhBXoraOsLQ309wmMQpi/t
         hcUySOijq9NsmwktmzEJakMiXTA8ehD5791K6EXS/Vk2g8Yc4Z2Q0SPOqSCu+b3YmaHB
         g4JvAAdmiLvgpetEG5bwXujGkJtQmyd7iz5SRjIFRN2hRzyV92tM3AIZBFJjhj6g4/qB
         0qCpIPYHfkBA4sUDG9urjaJaLAxSf0cZi2GeL4KZIzSmhvOu9z7DVzYeFxNvXyWa9OXZ
         8SbnQw+FOMeHM3MeS8kdclesKFu0rCsyJS0cyF56xWLiLapv2ioaze9Fya+O3UK7DWLS
         hNWg==
X-Forwarded-Encrypted: i=1; AJvYcCUe1agOk+KYoll9UgaQ2KQCAOfdyhvmA0FVGpBAB0sla8M7Wq9CGF0f6XmOMdINlWJFyHPjM/zlhoE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn02wdt6OFtjWyNGI8O8gqsB8/0dZYreTYa0Y+0wA+oOrwvPza
	4WsXYh9se7xLRce2xKRMGrDE0oVTlb6FQpJiYLEw798IlZ58rwqd
X-Gm-Gg: ASbGncuurrRJdqhcv4D6j+t9OYTUq7yXYcYn3BvS28mQjpVgiS+Vk3/ar2mzFLFmrUO
	LDj4YYKXldPpRoyENTqNOAp74BIe9MkmBCT20EE1liNpBs3vc94e+gv8mxgGhzwPBJ/HBxtsDFO
	XWeEqeTX03fYD4zIMw4mkYT5zRrxrBDfQ6UPrke1yrhTP6bNzfaQAObxQOLhf1jKkDeKCl/iSSz
	w9W8kssoI3DJif9IViAgDSs5yVpFRsLG7DXFetzAHLF9ru3Yb9jdHnJpEzn+eYmnyCRuP5daZYk
	znPMBeYsD8xh/K6J2CFosXLAQx11eB/5ftOAhZ/y6ao6FDTJpciffw80p+igQTUYVOdy/ByXrQ=
	=
X-Google-Smtp-Source: AGHT+IFQ0rsiaEJrRfldwBhpsceViTdVtxyi/rqnT/4yIOz4p8+qmeWYt/oc663uVzw+h51bM1vvzA==
X-Received: by 2002:a05:6000:1a8d:b0:390:f394:6271 with SMTP id ffacd0b85a97d-3997f94db40mr16451725f8f.43.1742976513718;
        Wed, 26 Mar 2025 01:08:33 -0700 (PDT)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a3b83sm16328676f8f.33.2025.03.26.01.08.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 01:08:33 -0700 (PDT)
Message-ID: <f3d24ce3-9e0f-4bc8-9433-2af9ffe7f306@gmail.com>
Date: Wed, 26 Mar 2025 09:08:29 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] Documentation/gpu: Add new acronyms
To: Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?B?J0NocmlzdGlhbiBLw7ZuaWcn?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Melissa Wen
 <mwen@igalia.com>, =?UTF-8?Q?=27Andr=C3=A9_Almeida=27?=
 <andrealmeid@igalia.com>, =?UTF-8?Q?=27Timur_Krist=C3=B3f=27?=
 <timur.kristof@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, linux-doc@vger.kernel.org,
 kernel-dev@igalia.com
References: <20250325172623.225901-1-siqueira@igalia.com>
 <20250325172623.225901-2-siqueira@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20250325172623.225901-2-siqueira@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Am 25.03.25 um 18:18 schrieb Rodrigo Siqueira:
> This commit introduces some new acronyms extracted from the source code
> and found on some web pages around the internet (most of them came from
> ArchLinux, Gentoo, and Wikipedia links).
>
> Signed-off-by: Rodrigo Siqueira <siqueira@igalia.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  Documentation/gpu/amdgpu/amdgpu-glossary.rst | 36 ++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>
> diff --git a/Documentation/gpu/amdgpu/amdgpu-glossary.rst b/Documentation/gpu/amdgpu/amdgpu-glossary.rst
> index 1e9283e076ba..080c3f2250d1 100644
> --- a/Documentation/gpu/amdgpu/amdgpu-glossary.rst
> +++ b/Documentation/gpu/amdgpu/amdgpu-glossary.rst
> @@ -12,15 +12,27 @@ we have a dedicated glossary for Display Core at
>        The number of CUs that are active on the system.  The number of active
>        CUs may be less than SE * SH * CU depending on the board configuration.
>  
> +    BACO
> +      Bus Alive, Chip Off
> +
> +    BOCO
> +      Bus Off, Chip Off
> +
>      CE
>        Constant Engine
>  
> +    CIK
> +      Sea Islands
> +
>      CP
>        Command Processor
>  
>      CPLIB
>        Content Protection Library
>  
> +    CS
> +      Command Submission
> +
>      CU
>        Compute Unit
>  
> @@ -33,6 +45,9 @@ we have a dedicated glossary for Display Core at
>      EOP
>        End Of Pipe/Pipeline
>  
> +    FLR
> +      Function Level Reset
> +
>      GART
>        Graphics Address Remapping Table.  This is the name we use for the GPUVM
>        page table used by the GPU kernel driver.  It remaps system resources
> @@ -80,6 +95,9 @@ we have a dedicated glossary for Display Core at
>      KCQ
>        Kernel Compute Queue
>  
> +    KFD
> +      Kernel Fusion Driver
> +
>      KGQ
>        Kernel Graphics Queue
>  
> @@ -89,6 +107,9 @@ we have a dedicated glossary for Display Core at
>      MC
>        Memory Controller
>  
> +    MCBP
> +      Mid Command Buffer Preemption
> +
>      ME
>        MicroEngine (Graphics)
>  
> @@ -125,9 +146,15 @@ we have a dedicated glossary for Display Core at
>      SE
>        Shader Engine
>  
> +    SGPR
> +      Scalar General-Purpose Registers
> +
>      SH
>        SHader array
>  
> +    SI
> +      Southern Islands
> +
>      SMU/SMC
>        System Management Unit / System Management Controller
>  
> @@ -146,6 +173,9 @@ we have a dedicated glossary for Display Core at
>      TA
>        Trusted Application
>  
> +    TC
> +      Texture Cache
> +
>      TOC
>        Table of Contents
>  
> @@ -158,5 +188,11 @@ we have a dedicated glossary for Display Core at
>      VCN
>        Video Codec Next
>  
> +    VGPR
> +      Vector General-Purpose Registers
> +
> +    VMID
> +      Virtual Memory ID
> +
>      VPE
>        Video Processing Engine

