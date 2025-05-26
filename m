Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B77D1E104E
	for <linux-doc@vger.kernel.org>; Mon, 26 May 2025 08:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748249931; cv=none; b=VcdpHrV2Ntn3Neotpt0Y1kW0qTyj3QtBvul7LUBrDpEYoVZCJsJCT5sn2pZc8oazz04Dvdi0HCXs7HD5NVIcKzUbU+2sCrpud6ha5ZuAVm5jhR4rWZ9ZdKHU/mNAsm1ncTyvss074Ys1BL4yYdLhYzoNASDHVyWaklZaoT4qKII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748249931; c=relaxed/simple;
	bh=A07uMUlAiHODBnye6U6+ZYgmI+z5BqjupTHEKb1apD0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=WN6TlWrBi2cB2mLW2ptcaoxxeBHfUUxW4wyvMu0C2skmD3hJWf7wuhf6IcyDfkASJtFAIw14MJ288rWUDxEoh3k763qfwYfoV2txVkfjb0KG2mbAjdWicN+poDtP9VULOm0Zp5KyTo+mUTREMQhGzqzXwvRUxHS4QVll9OfW6f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=nBfqjNff; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="nBfqjNff"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-442ea0f72f4so366635e9.0
        for <linux-doc@vger.kernel.org>; Mon, 26 May 2025 01:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748249928; x=1748854728; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7XUa5QDzySuu6U8WB9K8OF+ZIZj9kEnHYCZp+dCaCR0=;
        b=nBfqjNffw48hNkVyyQHtfWhCWLtfYgFnYlWzQxkgwUg1QVgDUfH9XpKxk+cOUvnn3g
         IO4NuFbH15/FllezFedzKyq6v4jZkTFrzMIVGMorT1c/7reVH0HMY8Nz0YuVR5bcVmbb
         2cYsdaUWh1i8uj+KivWANTASq1cxKAOyKd9hA6RY0Yh0COw9BO2AN9tbP4tIXopmWdOr
         vd8Md2mx+PAJyt+XKTBrUa4maEOyVzugxAHU1ZQ8PjDSXzn4RTmGYVmL2OPWbec3tK7s
         dOhESPB4+SQSYcav2M8frCWMcUsa5so2Kxplu5y0B8Tw/fsgpHC44Bnf6Ce9Gec8edEn
         UqSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748249928; x=1748854728;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7XUa5QDzySuu6U8WB9K8OF+ZIZj9kEnHYCZp+dCaCR0=;
        b=qrpgJPrhDY8GVzCnkCV3q61pAVtK43bGF/BibeqScU9UkNiPXbI/FapSzbKmQOFnJ4
         qk+F0odlggfFuLMNLXiH3waEl7VtV5s9Jovg8mHWgQTPXXQ9P6QbUDT/fLrS80CrZp7w
         HB9VyIRGOQZ0gqygigrnsh7zx3apPW+GdZ0czaixiJlhI0tOa8S1JLsgIh3+M1kH26O1
         Afy4gQ/tviJglr/CwKvVY+xHG8JGHQ/ReGDdtO0ZkbvHzQcl/tNLL8MYOIjAQZT0aNmm
         dABwlGEkZqQJzKZ0E8PLOIF6MkVGYO6at1XIEVi1Vb7Msr8bif5vFZJXo77Rdk/zuwME
         4wAw==
X-Forwarded-Encrypted: i=1; AJvYcCV6NYINSciwM4mn3av638wS5twHdw0CNLWpILIJeYZ9uxHdD5OZTWkoa1bBz4DO1Of7qEqsXPh2cbg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwK2M60FLAOiGhz4s+xDj5SR2DFx8AtxIsy+Qt+98C06LD74ijs
	/P3T31ksgzSRVjkEUe9csyGhxm0qUp6fsDpOyqqEeHv7zsnS43hYPKftAXmxeVp8FSc=
X-Gm-Gg: ASbGncvV7yNI7W7OZ2gdVW0My1kIhvIN4exrztewNiKN2+qfejzTGfwkpHVak2a3NYq
	tgEmKlQ7RwHn1NsdpFzB4MWeyrJcHm+Vkz6PRK9JocBlPRoeaGNn2YCBmqDiwb9yJ1G1WWO3ZJP
	u5piRfgh2H32aScSTBCwtsyp8SIS6q9aYxroakT7NDZW3aOwkNZAk/uc24qWq2zFOUIBsddVm9+
	biHMSSlRTvkNCiCztLLQSrlfjmceGhh3AFXnhlctE8OfQiIRGRzHtV2kC768u1eQnsBE/ObJaVE
	+Lk/g2OJsmcPnuPkyvBE0vSgkIx/vcpaUroQGbvPO0KH91PxiJPDgQDKB0E=
X-Google-Smtp-Source: AGHT+IEdx9Lxmxr6Jj4a/VtrbY6n55+AjozaESSFCcKKfyGvvRTO9hEvIbHH5Dnsj/C495VBfSOibw==
X-Received: by 2002:a05:600c:1c24:b0:439:9ec5:dfa with SMTP id 5b1f17b1804b1-44c938cb1e6mr27073595e9.7.1748249927727;
        Mon, 26 May 2025 01:58:47 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:b85a:a7d4:fa4e:bb11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d007bbccsm5654781f8f.89.2025.05.26.01.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 01:58:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 May 2025 10:58:46 +0200
Message-Id: <DA5YVKW682V3.2DODRY4EDL3IW@ventanamicro.com>
Subject: Re: [PATCH v8 13/14] RISC-V: KVM: add support for FWFT SBI
 extension
Cc: "Samuel Holland" <samuel.holland@sifive.com>, "Andrew Jones"
 <ajones@ventanamicro.com>, "Deepak Gupta" <debug@rivosinc.com>, "Charlie
 Jenkins" <charlie@rivosinc.com>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Atish Patra" <atish.patra@linux.dev>,
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Anup
 Patel" <anup@brainfault.org>, "Atish Patra" <atishp@atishpatra.org>, "Shuah
 Khan" <shuah@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <kvm@vger.kernel.org>,
 <kvm-riscv@lists.infradead.org>, <linux-kselftest@vger.kernel.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
 <20250523101932.1594077-14-cleger@rivosinc.com>
 <DA3K95ZYJ52S.1K6O3LN6WEI0N@ventanamicro.com>
 <9f9e2869-725d-4590-887a-9b0ef091472e@rivosinc.com>
 <DA3OJ7WWUGLT.35AVP0QQDJRZV@ventanamicro.com>
 <5dd587b3-8c04-41d1-b677-5b07266cfec5@linux.dev>
In-Reply-To: <5dd587b3-8c04-41d1-b677-5b07266cfec5@linux.dev>

2025-05-23T11:02:11-07:00, Atish Patra <atish.patra@linux.dev>:
> On 5/23/25 9:27 AM, Radim Kr=C3=84m=C3=83=C2=A1=C3=85 wrote:
>> 2025-05-23T17:29:49+02:00, Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>=
:
>>> Is this something blocking though ? We'd like to merge FWFT once SBI 3.=
0
>>> is ratified so that would be nice not delaying it too much. I'll take a
>>> look at it to see if it isn't too long to implement.
>>=20
>> Not blocking, but I would at least default FWFT to disabled, because
>> current userspace cannot handle [14/14].  (Well... save/restore was
>> probably broken even before, but let's try to not make it worse. :])
>>=20
>
> User space can not enable or disable misaligned access delegation as=20
> there is no interface for now rightly pointed by you.

I mean setting default_disabled=3Dtrue and just disabling FWFT for the
guest unless userspace explicitly enables the incomplete extension.
We would blame the user for wanting mutually exclusive features.

>                                                       I guess supporting=
=20
> that would be quicker than fixing the broader guest save/restore=20
> anyways. Isn't it ?

Yes.  The save/restore for FWFT is simple (if we disregard the
discussions), but definitely more than a single line.
