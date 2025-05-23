Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73633171CD
	for <linux-doc@vger.kernel.org>; Fri, 23 May 2025 13:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748005689; cv=none; b=aEKwEEUpFJh+yydpex3KVSiH82K4L2Algmr072+/R/m1yXrTHGvtN225BUDCtAOMvDvF9bBBqadgXQ0T48FMPyXS5pWpGRvOOmof7UI3EubNdDHSERG5Lg7K6rl7sQ5eTEa8K4PC//sTykg+jhzjGDSkacip1Uu2BxgiJLH6jDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748005689; c=relaxed/simple;
	bh=KARpSC0ktVs2EmfgMj89WaDgPQ701M83Nyx3KMNRgAE=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=SyqdTUlLMTMTI/kIiy9SneCp5OQOlDbgJcG80hnLZpP6czF+M+zyFhMyhg6O38wARWrchw6uQDw1IgWQrKHbLXHhO57Jo0ljLtvWcZWZVWgh+4OZgR4upaYcufc/mtyiSJLd06YK97pFHfFovKPbLOQP1YkxqFh4Qrdi8lgIQWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=fV7qpTZ4; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="fV7qpTZ4"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a367226ad2so709399f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 23 May 2025 06:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748005686; x=1748610486; darn=vger.kernel.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KARpSC0ktVs2EmfgMj89WaDgPQ701M83Nyx3KMNRgAE=;
        b=fV7qpTZ4UxFQBj3YWufiN5mpRDqPv8PzhvMY8SEiki4+pSAX7jbxwvH6LWJWPSs7LX
         Gaz+uf5qdoGROv8NPDwWKWdSaBH/I8TWkaHOypbz9NmgcfgEELldZB++EuNIyvbk71cA
         MmD2ekJ9fbRh1hUeO8WwDjBffvAbMKnUELxI/SwAzq8f/oXwJvKlIbfwwFj2iuoP+XrN
         GV3ecTdwt544Idb9InFWGlQAbaQRd30nPZTraSu614qdVsY/YWSwvwE6t6R1wpq89QSo
         ZqmwW55d3jfk2J8x6K9Z9WJh96bnDNsa9xTuHDcd1Rv2C0srQZxmnRbUi6FDVhEGWVfW
         nwFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748005686; x=1748610486;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KARpSC0ktVs2EmfgMj89WaDgPQ701M83Nyx3KMNRgAE=;
        b=DpkuZo5S+FKxworCP38uHLjh7kqTS8FjJrkFvoFBvWXsMcUHpiuF5jCrPEQ9KI/rnn
         I7soKMY5NBw49x91dEzfxDCKYJ5yExQ3ElUMjyohjlnBWlfvuLrv128/p2cVoASxiNb3
         R10N3Jcj9L+cR2laiFKjKyZgyzIfRcm9e9+jM5DLe6e8WWNxYHlFf3cpKrs5MakxSqcx
         uJ4bFduNBUpXI0jkOUtOie73wdrreyueG2owGR7oKnV6r+7mAf2hkwBPLTeK+LgOqY+D
         S47yzG8EYcv6jodGitW+VGQ562wTIn5FmDy9vIU8v1YEQ1Ycutar7+qogn/5n9Bg6Ug7
         pdYw==
X-Forwarded-Encrypted: i=1; AJvYcCWQS73LoH94pIoYDK91rmdwFwYiv5kpg+a76KbJlWrHxlI1BwdRyRoBsiYHYjGFwvJW42LCFswAiFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+pW3giTE+HPRksqszTq7GQZ9BxDEXn3rdltP0mdt8j0+FY2eN
	Y8YC9wBSK4br+QGMkVGB0Et8fpo4wg9uBH5wvHk89GwCpJCMC5jpkJaaASDTjpBAzNE=
X-Gm-Gg: ASbGncstdpWHIyFkZhF8XQNAndODSLcYVpurKBICgX2IFHzJhgWulF1quAuev8rCq87
	WlDUg2kXbKQ8vRn25DurL/DxS9uLa8um6AV3CksSU42Vlu2APpme9YKFfutErD2GZt88HvmRDvB
	VXWYlwXlJ5t6qCBXx+8MasXwj+HmLaN30NLqzzdzMcigY79lKwck1lcy3Hu8zotYihnjU0Y9DE3
	uVBWpBZgLYWR0bAiLcqRJb1XxIxK8zBaiQT4GOE5ZA2PBsT+uAEpnhxib94h/2mJ3vMWUTQ+gEF
	piwyUI1Bu3VIxSRP/r6fYNWl3DI/lxqg2rPzuxGCX6ytON7T3AEctdPFNnfuFAYOtR0t9A==
X-Google-Smtp-Source: AGHT+IEQlpZ+MHYlhIdSbIKkOQ9vfMtZ42DEnpA7EqlzBwx2H4tZNz3AtELJClLMWV4vaH5ju8V/Tg==
X-Received: by 2002:a05:6000:184d:b0:39f:728:4324 with SMTP id ffacd0b85a97d-3a4c2d327a9mr972266f8f.9.1748005685763;
        Fri, 23 May 2025 06:08:05 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:be84:d9ad:e5e6:f60b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca8874bsm26894531f8f.67.2025.05.23.06.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:08:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 May 2025 15:08:04 +0200
Message-Id: <DA3KATTIZQ99.2M1SWQ64M9WX8@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH v8 14/14] RISC-V: KVM: add support for
 SBI_FWFT_MISALIGNED_DELEG
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
References: <20250523101932.1594077-1-cleger@rivosinc.com>
 <20250523101932.1594077-15-cleger@rivosinc.com>
In-Reply-To: <20250523101932.1594077-15-cleger@rivosinc.com>

2025-05-23T12:19:31+02:00, Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>:
> SBI_FWFT_MISALIGNED_DELEG needs hedeleg to be modified to delegate
> misaligned load/store exceptions. Save and restore it during CPU
> load/put.

How do you plan to access the value of hedeleg & MIS_DELEG from
userspace?

(I think that modeling medeleg in ONE_REG is a clean solution.)

Thanks.
