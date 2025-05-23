Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900C1433A8
	for <linux-doc@vger.kernel.org>; Fri, 23 May 2025 13:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748005559; cv=none; b=XGTGZxTkMDm6lKivwRwmRSqfhWh27k5m3Mq+ylmzP7dOvG1stWeAq+SgSMhjs3ZBx2t5Uqb3VNXlJQ9b/q/C6WL+XTn3CmWd/87VbzvPoYJlEd46mlNFZHFE5Kaz35IFzZMqaZE1dr4hFudVU2kV5lYGGUpL5CcabzV8DdJUrR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748005559; c=relaxed/simple;
	bh=xcdAazkrufWuzaju7No3ced2/sH583+qifVFJh+ynvw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Z2vzQ1wdJvQxvfiW1+GzdfoD4rgC/a40J/twUZd+CVWktnSJoGZU3S5ctbdI5yYBr6OzosVecKGyj6V08DvdzoS0uviK1x8cbpT3G0E0Zw6mpviu4sHf7JVGOw9tbrEGmA6Cvuc7lMSNV7NITuz1O+DsdfvnJBiarTeLDloI71A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=mOZoM7C6; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="mOZoM7C6"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a374754e03so426844f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 23 May 2025 06:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748005556; x=1748610356; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFewfZjNIOlnKjbSqghMjET5KPXnaKP3RNtWcft+NNM=;
        b=mOZoM7C6z57lpCL4aUH3bkfyDirbWMGziUkqBUGZNEmBdfhrSVnKTutiuzGlefah5u
         1FACWiwN6mjq5orq25WvIFHmes4LOUGwBVQXhe+Ri+e7BG+ToZIbYg862ajC4xo7vFsG
         67TUV2ek5whv0r4Ul28LxmFXXJIgmwW+pSJu+RbeRGtCUI/TnJ+TZ41DGyEv8f6avqOW
         kiw5AhtyVDHhQtfXVhzvc6zEP9kEum2GPVLICFXNq9+dpWXwQMMFBamMa14qEL3Nck2g
         +B6oneJmhRji4i1WWSRzX8o6P9HimpoHC8xTzTjOHzTbv3RdTagJ5SAZUB1aO8uogpaa
         YaYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748005556; x=1748610356;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gFewfZjNIOlnKjbSqghMjET5KPXnaKP3RNtWcft+NNM=;
        b=r6ImmuSz7FtQQURuMhrrbYGrF30mXn3qm8LHrZfncc5pRGOTyLj9GX1o+dDinCXbTY
         VBWTAJmgOSeNSvHxYzHNsu4xHtys1DhdTKDwjoQow+DMlwBNFXqk1czCM7+nG6RFKMzE
         D4Z6FPLEavYnXciNXcOXmxgO2MeWWZ0O0jMJ01GYAjxzW5+lhH7Zpnc/1AvtXwdpe44F
         TXopRlm5heAcul4qvduWmQOI6j9NhMxdurHt6zar20Jqp159cFKwMkW8+6ujZ5NdzV1q
         OUJJ/edoRiuBM6ZnjfxY4df3PTfnjyuTiHxeuxnhk4m0uUW2CiYVtR5W5AB0XHu2uFnf
         W+fg==
X-Forwarded-Encrypted: i=1; AJvYcCXy91ZgxsyLlKHqaxga5TNoWA8BVOQpdbKH7rRnKw4qmxC0NVFW6qbzccCxLlXvD/o8GtpEI+raX6E=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo+L6hdADE4Zw79uX3sM5/7CivryNXnp3wApDlD1oAoGrextsZ
	AVUSEC7/Lqspv2mmMsp1kKo7kEE4rLgPCxRBO4S2cQwdrmBhmCh1vo3FYjamFAPEHX0=
X-Gm-Gg: ASbGncvKBErIILmwX0guG9KoeGNS5YsLcdAH+PBDAG2d15bBI9ISsLu/BZv69isX0Je
	VJNALwiT/HKmgn6eR+PSjjxmwBTYYiwkf3Gb1zfyGkPDbYhf3VYa4K+tekEsss9Hl07Sbra3tSk
	7No6WM/RMWd1EcKBjoX8zm3II/uQCW0FdYQVIFp5kBsLpLbQS133PeoUd9uyDG7SsO/cx3plxqL
	FfbO+pgsz79YYeVAw+jojPQ0a0N+m8N2xNtMxU7GUFkNKOODybOIzFTWmdaJQNAFWM/wreaaOJ/
	5/L3HN3f/Aa6EBSQdGyfrJW/arnGvjN580AgXWnqseG6F8GPK6LmuCilGbM=
X-Google-Smtp-Source: AGHT+IEYIo39joB/0uuiMCLZj0X9kGxap7PQ8MzBUGOeMKLVyBYJHZJSgGJhoZMNlP15r1mU9RPZpQ==
X-Received: by 2002:a05:6000:4285:b0:3a3:5c97:70c with SMTP id ffacd0b85a97d-3a4c2e5707cmr874240f8f.14.1748005555660;
        Fri, 23 May 2025 06:05:55 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:be84:d9ad:e5e6:f60b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca8899bsm26390515f8f.62.2025.05.23.06.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:05:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 May 2025 15:05:54 +0200
Message-Id: <DA3K95ZYJ52S.1K6O3LN6WEI0N@ventanamicro.com>
Subject: Re: [PATCH v8 13/14] RISC-V: KVM: add support for FWFT SBI
 extension
Cc: "Samuel Holland" <samuel.holland@sifive.com>, "Andrew Jones"
 <ajones@ventanamicro.com>, "Deepak Gupta" <debug@rivosinc.com>, "Charlie
 Jenkins" <charlie@rivosinc.com>, "Atish Patra" <atishp@rivosinc.com>,
 "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Anup Patel" <anup@brainfault.org>, "Atish Patra"
 <atishp@atishpatra.org>, "Shuah Khan" <shuah@kernel.org>, "Jonathan Corbet"
 <corbet@lwn.net>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-kselftest@vger.kernel.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
 <20250523101932.1594077-14-cleger@rivosinc.com>
In-Reply-To: <20250523101932.1594077-14-cleger@rivosinc.com>

2025-05-23T12:19:30+02:00, Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>:
> +++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
> +static const enum sbi_fwft_feature_t kvm_fwft_defined_features[] =3D {
> +	SBI_FWFT_MISALIGNED_EXC_DELEG,
> +	SBI_FWFT_LANDING_PAD,
> +	SBI_FWFT_SHADOW_STACK,
> +	SBI_FWFT_DOUBLE_TRAP,
> +	SBI_FWFT_PTE_AD_HW_UPDATING,
> +	SBI_FWFT_POINTER_MASKING_PMLEN,
> +};

How will userspace control which subset of these features is allowed in
the guest?

(We can reuse the KVM SBI extension interface if we don't want to add a
 FWFT specific ONE_REG.)

Thanks.
