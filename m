Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B806E446C1C
	for <linux-doc@vger.kernel.org>; Wed, 29 Jul 2026 11:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785325192; cv=none; b=Kk1HBsrz0vqfHw6LWBOfiyaS2qMu9U07AhFq/dRGhEw5lSTVgeMm8M0Pp1eKbZ6UYjEukDAnZDEgTNem665UboU4m4bySBHBpdGQAM5p6oXPouQ0jWLTRKSaS2Nzdb71y0SBUVUFuP9wFhECGCYSS4M058Kdhxu0aw/h8vASoJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785325192; c=relaxed/simple;
	bh=TdIA0C+hvWbuO2z/X3tRH27TnhL//kWqbhu9cqVNunU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MjUEggG556j36ovr0ekhQLF9yxa9pQiF5NoFm7DKZ6zbXUBoQGQz0BxWNzGE+Oni6Ew9IsJU1rH0nVlP4UQZKVhv3iFQdS7S+10VgaVe15bn4IuXOf2Kr4Y5VTtsAhPS4J6ybsel2ctNoHcgbX0JbxxNCy8pSv9W16ojlAuO9mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=W87qtfKG; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="W87qtfKG"
X-Forwarded-Encrypted: i=1; AHgh+RomFZrAxQDzELPXP82kx/uzBVg3n7/jUVv8MpR8zqe4xQE8gGvRwHo3P3hE2H5EGK2c2QvUcL7Sd2U=@vger.kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785325188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MgvBuiLRj24R5eL34h27DbmmXIsCnSbcavTOpGhYHMk=;
	b=W87qtfKG5TuVGbhSaY/a/PwqZJV11adh8O9Mg1psqT8NXMqys77nlKUdJOgGqveDFl8KqB
	mvQhp3F8Ni78TtrmA/AHA7Ur8w26MK/8ResUa16Pj1mFaBVaBHJ+r4NLGYW7qlLw+au9fm
	1SBhDs8vLG/AUAm+bpIASyrS+Hau6aY=
X-Gm-Message-State: AOJu0YwSFUEdwlBehHjcGcx/MkSLGggZuSQOlRiXwxm3oMUhTDdLFMZs
	o+cId5fPR/gIAW2P8dQ/OuZmonAMRPNYcCTAd0qdxIZpZsZpZ/dV1hfe6uHslKk3EjSo8eQbQyI
	Au+RXnHuyl9gJifDbpxQtynl1sAAEY/qlZzzA36fP
X-Received: by 2002:a05:622a:8359:b0:516:ccc0:ee38 with SMTP id
 d75a77b69052e-52b2cc84a3emr5917821cf.9.1785325173789; Wed, 29 Jul 2026
 04:39:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722202702.4165917-1-congkai@amazon.com>
In-Reply-To: <20260722202702.4165917-1-congkai@amazon.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 29 Jul 2026 12:38:56 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyMjsF6jp98TQhc+xBm3+p7wykeK-JMvybU+mjyu5gveA@mail.gmail.com>
X-Gm-Features: AUfX_myrOBKJjGr1oQQJhjpP2gtOW_slUtGnIubwUV7eVBsMrgW-SzxzJTTjCds
Message-ID: <CA+EHjTyMjsF6jp98TQhc+xBm3+p7wykeK-JMvybU+mjyu5gveA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] KVM: arm64: Expose PMMIR_EL1.SLOTS to guests
To: Congkai Tan <congkai@amazon.com>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Haris Okanovic <harisokn@amazon.com>, 
	Geoff Blake <blakgeof@amazon.com>, Stanislav Spassov <stanspas@amazon.de>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT

On Wed, 22 Jul 2026 at 21:27, Congkai Tan <congkai@amazon.com> wrote:
...
>
> Congkai Tan (3):
>   KVM: arm64: Expose PMMIR_EL1.SLOTS under strict PMUv3 UAPI
>   KVM: arm64: Advertise STALL_SLOT* in PMCEID1 under strict PMUv3 UAPI
>   KVM: arm64: Add KVM_ARM_VCPU_PMU_V3_STRICT vCPU feature
>
> Oliver Upton (1):
>   KVM: arm64: Ignore writes to PMCR_EL0.N when using strict UAPI

Tested on QEMU: boot, get-reg-list, and vpmu_counter_access pass. This
doesn't exercise the KVM_ARM_VCPU_PMU_V3_STRICT runtime path, and the
series adds no functional selftest for the flag.

For the series:
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba < fuad.tabba@linux.dev>

Cheers,
/fuad
