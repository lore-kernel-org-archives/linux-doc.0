Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B06C1A8BF6
	for <linux-doc@vger.kernel.org>; Wed, 31 Jul 2024 09:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722418029; cv=none; b=h6dqryhQNCsuxG9lh6vHneNz1L+I05B/BrCtymJ5QXfRTu/AXZmVS5iFRT505uytNE3E1xc2+ykP0wqc31Vpte7gbiukxhRMWKWwLhaqKYYYrlnKi1/BBUNebdamu6YU2Tlbx1bERgwo0dpvmSs1apKkzz9pTvtmEz8/MBYGGJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722418029; c=relaxed/simple;
	bh=4txZO0NyiZJsXzMrfPzPDzAvVuqnEJKl3zlQlZLsFJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sWabQSOzYKnP6X/7gzE2udvtem49ElZCUb2mfs+cdaecT8yos862w5ST99nQ9UdAiXeh0k3w5AdorIO3+NzfA8L2UB1GsEA6+jpYp0wyPxMQ2QF3wih02wA/we6nwPtRSJtZxu+9Z/IoeNi3q2BhSOT4UNZki0VonnQYv8ve3RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=W4AalDwo; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="W4AalDwo"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52fc4388a64so9323398e87.1
        for <linux-doc@vger.kernel.org>; Wed, 31 Jul 2024 02:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1722418026; x=1723022826; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p7SJK2WN3L6uZyaEdLNNOcGfMCG9Ym2ay5t0xgYijf0=;
        b=W4AalDwovk4V7gdaoc2MugPS6Z/vioPnBrEO6wr9Mf54juxGGOcwZSiCsEEzypEQT0
         FiERaZqx6tXqC3Pw2nhiXPmSE7enBLGnkow9I44AJR5COqbpz7jMbeh2vhDojUqVT2Am
         UFF6X9m6ZlMOkugSE0iYwD0CnA+mtwgwaFSr1kX++ItNdVP/TMkXVveu/485kbYaT/il
         +atBNxSlSbXXpfP2N4e4cTh0fGqfE1Yk5gg1dECOvDP4GxEcArC1Kxz6GaXJhJ4TDTB4
         2KGeNPAj88ePdyINgc0uUWOmYk/1W7bbSh4tZWGaFaqEL2mWckSPjfP1TngcchRQVg1s
         9qKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722418026; x=1723022826;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7SJK2WN3L6uZyaEdLNNOcGfMCG9Ym2ay5t0xgYijf0=;
        b=YclrBCiaIY5xVHDQh8M6QbaksCfI9A60ql/0/MpuU6FxQUiQL5RzFqINW6CLbSSKZk
         MNiqI/tLImpGV38cb2KPtTKYe/bho2I2eG2WUTcZZBCWKBaNR6XRuHSD8UjM2j0TXWeb
         oP2dm421oOUre81a73FdbmjBLK8EU4jbEESF/atkLOZLMyfFRwFzQRQ/TD28GYyxfADA
         G9VV1BM9XjmYIqI2dVEH7Oe6nP5Omnh4negagnSgAhQ5VrG/TTZmi74Xh7/ioBBpSknl
         2ncF+yT9hK0vWaq2mJ1OS2f6ciOjoyznM/gR8ip8bdwTJmGcoL4px1a/W8oaaSnr8MGv
         4neA==
X-Forwarded-Encrypted: i=1; AJvYcCX9MkEpQLnm29KlvVvFKgXIityZDJ67trXHpMgZRp+4SO/ITFN4G5vWFCpmx5MuvOUzl5OG7qswBZWgrfDzyAqiwLIjGJZBMOiW
X-Gm-Message-State: AOJu0YynCq2THY0dGU9CXErRs2bOsgmblhLfoalDVIpn62KXO8lz3Hr6
	jahQIIP0uixj4RRyzezRn8okU+y2vA7ERAbwAkx16CO1KaoHOEc54dljy6p9tgo5yKKp3XgkA4p
	VumE=
X-Google-Smtp-Source: AGHT+IG3JIOtJ24DzWq2AbHse04McdP7VjBbSLZOo3eV9EeDpYpgjlKyfa2GCIpAnxuCqpt5LCi3OQ==
X-Received: by 2002:a05:6512:292:b0:52f:c13f:23d2 with SMTP id 2adb3069b0e04-5309b2803e4mr8247308e87.25.1722418025413;
        Wed, 31 Jul 2024 02:27:05 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ac64eb3c1esm8451687a12.78.2024.07.31.02.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 02:27:04 -0700 (PDT)
Date: Wed, 31 Jul 2024 11:27:04 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org
Subject: Re: [PATCH v4 05/13] riscv: Implement cmpxchg8/16() using Zabha
Message-ID: <20240731-da4a7d7790e88a6b8960ad3e@orel>
References: <20240731072405.197046-1-alexghiti@rivosinc.com>
 <20240731072405.197046-6-alexghiti@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731072405.197046-6-alexghiti@rivosinc.com>

On Wed, Jul 31, 2024 at 09:23:57AM GMT, Alexandre Ghiti wrote:
> This adds runtime support for Zabha in cmpxchg8/16() operations.
> 
> Note that in the absence of Zacas support in the toolchain, CAS
> instructions from Zabha won't be used.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/Kconfig               | 18 ++++++++
>  arch/riscv/Makefile              |  3 ++
>  arch/riscv/include/asm/cmpxchg.h | 78 ++++++++++++++++++++------------
>  arch/riscv/include/asm/hwcap.h   |  1 +
>  arch/riscv/kernel/cpufeature.c   |  1 +
>  5 files changed, 72 insertions(+), 29 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
