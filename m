Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350461FC7FE
	for <linux-doc@vger.kernel.org>; Wed,  5 Mar 2025 22:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741214945; cv=none; b=AsiIoI3aE1Wizzrt86P1yoFSBgkM9a2fxDX2ORAjH8lf25ButsyVvNvtrtM5VLA6nqZcxiN8wJM0qTORRj0NPDqXRfgIQfsy0/Qy/rQoq5uEs6yyBcJXqswSs4pI7x40wInfkDeYO3P3l7uAwCvv8pX9gGY4j7Ap870Hg5/5zBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741214945; c=relaxed/simple;
	bh=A6BmkDj+eOCUYDQS1sJ3VnSgss8h/ftymUYqrfrJTgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l+y5/Nr5I9e2XMwsSC82y+ZYR65mPPeu35NmZmOfEcT71jsBQKGDDrkHCmvjh535beqvnofrlOVfHMLnzmFm1Gumi22C6+d6XS7plfpAb0V0wJjCwi5OPlLqWx97uLtYo6xxJweHc7B/wZFDnc+bP05PR2FFBm4S7pvGSu0uiSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=zrxSVQIg; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="zrxSVQIg"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2234e4b079cso136796115ad.1
        for <linux-doc@vger.kernel.org>; Wed, 05 Mar 2025 14:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741214942; x=1741819742; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uFYybP/h8fOOv7x6T0mDjGnjs7SO3QwCZI7Q4LRb824=;
        b=zrxSVQIgf3LKppNSOEpX3XgQA7spHxaeGCywkO34XMaK3Sn/zhBbCb4XBrfjdzFPsi
         wGERfEtIp4zCvOK12qtUdsV8lU3wUF4bw+kJoXKZIHWHo2q3N37oQOGOQlnXgL1oqpNV
         qmcHTus3ZZiZwfdnKUUgp/H0L78ry0mnF3G4Ip/n6lpT5gR6pj+SP2PZ3ePA+I47lyPI
         VA9mRNriR2+iAaas/0WbyuvkI79UG+WEJMlI8ICKxf9yG7CHiEnwnyan1sTIM7EXooe2
         5XIKJgCcmJ/Jk5lLoMJEc7Bb44DDDLoiRV9vXsD0V12EKbXUyWa1tNvAMM7zaw9cfCtc
         WhZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741214942; x=1741819742;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFYybP/h8fOOv7x6T0mDjGnjs7SO3QwCZI7Q4LRb824=;
        b=KssgqMlBcbOeHcnpIyMy6P5vBAMMNWc6S2GJolIoQ0G5FPG5GlKNMgKw1lF45GyYpN
         vlOrx2FS0lDCMCp+L8lKDK9kHfcX5kiGhYs8lLOv+4dd6r++IcI9NgQAtdH74qV74MK7
         755Oe1mpmmbDtrOsIbexCO6db5k/W6URMMvpUWNYqQ2v3M45sgto+zxci8SOj0fHvF6G
         hGYCqImirPsET6H+LnLrLnBfgSV3z7hfLnuZb13s05hWCDdVa5uUFXHdsfkqRH1BnfGh
         5Zaz9DMJ1iyapLAQNv2/sXRu9/V/U/GAcHhHs27pX0XGXK+l4xf7MVMVghZ/krtKYQV+
         vxGg==
X-Forwarded-Encrypted: i=1; AJvYcCW7wbRjv4I7nPecJnnc3I4jPFeXq31NsGyvdwQEbPJEuttw9ee1552upNeCZqzkxj+IIEspfc91KMg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6VSkZUAnSb7boMh0zNVSJg0l6/QBt+cw8i0fxC7kyTVRpzxPp
	TNkFe+0GDBCH0ZgPi9afgSWuzEUTM9hwH0vJC+64iakOUF1xegO88yXID5M8g43kx4WydOoW/5x
	W
X-Gm-Gg: ASbGnctFzfUAyIC1fp31YItEPofkBdy5Rs2OPbamUfJuFRlsubm+S37eBzRFh+4vBX/
	uzpMI/+jcm11Ny9Da0AkmeZQ3eSv5b7I8KQVdptCIPOH+y5BEsLOsr5Tt8bKSfwvQxXsKqIE3hz
	tLULDc9ebyUM8NBtR8gvdRGL2F74l0N84ZitUJIE4Tz6Ew7Ssr0H/9NijVoQ5v91mv1xyHlwqLy
	50gUml/1AIMKQkWrJHTCKrvh4z7DRisX7uESXKj3Y3OqrL88tnwBft/hv8dMnK4mORPR6USVhSo
	2LMvLvVqrI4pct6PLssTOcn2Qf0fA77TmmDsXy02
X-Google-Smtp-Source: AGHT+IHiF4FAqIjjn8/McPnIJdhPqPvuWE18WrtWy0zWz8b5lpOyHcNGEy/W0q+2+Lsw8Yldhi9I3w==
X-Received: by 2002:a05:6a00:148a:b0:736:491b:536d with SMTP id d2e1a72fcca58-73682cc4155mr7884057b3a.20.1741214942068;
        Wed, 05 Mar 2025 14:49:02 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:9b3c:3246:a388:fe44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73643eb9abdsm7837155b3a.84.2025.03.05.14.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 14:49:01 -0800 (PST)
Date: Wed, 5 Mar 2025 14:48:58 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, cleger@rivosinc.com, alex@ghiti.fr,
	Anup Patel <apatel@ventanamicro.com>, corbet@lwn.net
Subject: Re: [PATCH v3 0/8] riscv: Unaligned access speed probing fixes and
 skipping
Message-ID: <Z8jU2i5d3e4Dv4vk@ghost>
References: <20250304120014.143628-10-ajones@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304120014.143628-10-ajones@ventanamicro.com>

On Tue, Mar 04, 2025 at 01:00:15PM +0100, Andrew Jones wrote:
> The first six patches of this series are fixes and cleanups of the
> unaligned access speed probing code. The next patch introduces a
> kernel command line option that allows the probing to be skipped.
> This command line option is a different approach than Jesse's [1].
> [1] takes a cpu-list for a particular speed, supporting heterogeneous
> platforms. With this approach, the kernel command line should only
> be used for homogeneous platforms. [1] also only allowed 'fast' and
> 'slow' to be selected. This parameter also supports 'unsupported',
> which could be useful for testing code paths gated on that. The final
> patch adds the documentation.

Why constrain the command line option to homogeneous platforms?

- Charlie

> 
> (I'd be happy to split the fixes from the new skip support if we want to
> discuss the skip support independently, but I want to base on the fixes
> and I'm not sure if patchwork supports Based-on: $MESSAGE_ID/$LORE_URL
> or not at the moment, so I'm just posting together for now in order to
> be able to check for my patchwork green lights!)
> 
> [1] https://lore.kernel.org/linux-riscv/20240805173816.3722002-1-jesse@rivosinc.com/
> 
> Thanks,
> drew
> 
> ---
> v3:
>  - Fix compile when RISCV_PROBE_UNALIGNED_ACCESS is not selected
> 
> v2:
>  - Change to command line option from table
> 
> 
> Andrew Jones (8):
>   riscv: Annotate unaligned access init functions
>   riscv: Fix riscv_online_cpu_vec
>   riscv: Fix check_unaligned_access_all_cpus
>   riscv: Change check_unaligned_access_speed_all_cpus to void
>   riscv: Fix set up of cpu hotplug callbacks
>   riscv: Fix set up of vector cpu hotplug callback
>   riscv: Add parameter for skipping access speed tests
>   Documentation/kernel-parameters: Add riscv unaligned speed parameters
> 
>  .../admin-guide/kernel-parameters.txt         |  16 ++
>  arch/riscv/include/asm/cpufeature.h           |   4 +-
>  arch/riscv/kernel/traps_misaligned.c          |  14 +-
>  arch/riscv/kernel/unaligned_access_speed.c    | 237 +++++++++++-------
>  4 files changed, 168 insertions(+), 103 deletions(-)
> 
> -- 
> 2.48.1
> 
