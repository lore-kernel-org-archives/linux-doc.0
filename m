Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1697C155741
	for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 22:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720736597; cv=none; b=n1onmKrf0ixj0L0o958I3eCKVjNrqCe8x7GU6UalbA1sm9kX8hbRdA2akVYFCiN5wxdLj7VzpjQM6LSmkr9nDomkPcqLnM5M6zdtKWmi9wuC6b/ECK3bxyMErxRt6+qApC1FOHUP9rW9HF6QCJYz/DmJ6m6eVGcPS0TdjDzliWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720736597; c=relaxed/simple;
	bh=BOLUoPrByBwDN8/S3VKrljwo8YVxxLGQj2YW218NIWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cbDDDcSwXbRnztBWUhUeYe+gmYqVz7i+d6Sf5lzl4kNgl9m0cVMl39MSrmvJEgTT9asvol3zbc76OV4y801gwujpx04iqvFqCZr7hTjh0f5qjKPEa0CJJRCQtn1dlhNRA8jWRQRLyL0cKP5DvO+ZcUhkCxjVQ/BUWnDZkd8ny6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=gal8xcnV; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="gal8xcnV"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1fa2ea1c443so11572855ad.0
        for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 15:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1720736594; x=1721341394; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wOA6NsFk6L+7Ls7mZsmFkNNQzEFiEdl0CxMpv9bv/Qg=;
        b=gal8xcnVY0ur1eVKluzs+SjRxT4ljMSTrJYEOfnJEXblM7siPbCQHzLQMhNjwaaDWG
         CLR9sOAMwh7UK3FcAiFnYBKaaQNBZjbn6fDqq+iqv6JkwWLNcUfFVm7tYGsdiR9XzZVL
         Orm2D9LwCtccEkke0hbXFbm+iwyGdbD4oZfoXyUhwRn8qPvPWSR32VReOcOMqYbCdqEv
         G6nH0AAMJNpqhaBAoiLcjgMvZra3sfWvNTz8Kg2ZMEegaW/hNcxzz2o6ztfdF6MBzaCA
         oufvXxBL+eGk4tinePQy2CyZ2WUuu1GCK/mCGtjihyq2Tfhn/OqRqK9IoEgm0sCR6dy3
         FlRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720736594; x=1721341394;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wOA6NsFk6L+7Ls7mZsmFkNNQzEFiEdl0CxMpv9bv/Qg=;
        b=FayFhGlo5wd02ZH2q5JRogTBFptv3VM2Lb6Q+XLxXILWJC9z0kkzO8HgZI/KQQrpaL
         CaMdwy/nFR/7BMATo3Dvo6MLd9RxlF/4WCE3p5M9cRktSgnQqUvbFcqbC5Ht8Bi4gDeX
         WUb14Cd1wmd/Slz8HTuovU6TgCxQmEU/Xe7LXdMcXZq99cy19gCzUiSwUmsK0cm0LmcC
         gWIb1DWu6/bHE8rUwDpBO+NyuWqX6ZACFPcQkxPNGk2tRvISET9LDkrA0O4VJ/wfvqHQ
         k459PQHpX1EBQRvnCb1fhLjvEWebffPl8jVpke+RbJ9N8FLZzQHHWk5rq0m5pEkfAtXi
         d5mg==
X-Forwarded-Encrypted: i=1; AJvYcCVHcjM5ppRE/kwOXrjD3M2kzAOnsPTDOrbxw3b5/lF3Z9+mZTtqUhHrudxINOMgWICdGKOkhvFno2OAQziUqgYO5TkgkpjzgBqE
X-Gm-Message-State: AOJu0YzFM3H734mNMwcamAcE8JZi6KGQJzQmor4eRy1dZJq38i6k6nwT
	UnphK8DLAXdYaIUW9BbO2ZVQVRMHcPuZwpCfIYHFMuj9hOx8MOX6OrWnikzO/qQ=
X-Google-Smtp-Source: AGHT+IEVnJzb7O36DPGCsgQl833NWjcEPMaDTTCYgNiB+OKGtg51343xFtMHn6nFNmILVnskS/PwlA==
X-Received: by 2002:a17:902:e745:b0:1f9:ddea:4523 with SMTP id d9443c01a7336-1fbb6cda816mr89697095ad.6.1720736594362;
        Thu, 11 Jul 2024 15:23:14 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6a1083bsm55313555ad.37.2024.07.11.15.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 15:23:13 -0700 (PDT)
Date: Thu, 11 Jul 2024 15:23:11 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 7/7] RISC-V: hwprobe: Document unaligned vector perf
 key
Message-ID: <ZpBbT1OquCCwUTWA@ghost>
References: <20240711215846.834365-1-jesse@rivosinc.com>
 <20240711215846.834365-8-jesse@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240711215846.834365-8-jesse@rivosinc.com>

On Thu, Jul 11, 2024 at 05:58:46PM -0400, Jesse Taube wrote:
> Document key for reporting the speed of unaligned vector accesses.
> The descriptions are the same as the scalar equivalent values.
> 
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> ---
> V1 -> V2:
>   - New patch
> V2 -> V3:
>  - Specify access width
> V3 -> V4:
>  - Clarify we're talking about byte accesses using vector registers
>  - Spell out _VECTOR_ in macros
> ---
>  Documentation/arch/riscv/hwprobe.rst | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> index 78acd37b6477..f83a13dc4cbc 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -238,3 +238,19 @@ The following keys are defined:
>  
>  * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
>    represents the size of the Zicboz block in bytes.
> +
> +* :c:macro:`RISCV_HWPROBE_KEY_VECTOR_MISALIGNED_PERF`: An enum value describing the
> +     performance of misaligned vector accesses on the selected set of processors.
> +
> +  * :c:macro:`RISCV_HWPROBE_VECTOR_MISALIGNED_UNKNOWN`: The performance of misaligned
> +    vector accesses is unknown.
> +
> +  * :c:macro:`RISCV_HWPROBE_VECTOR_MISALIGNED_SLOW`: 32-bit misaligned accesses using vector
> +    registers are slower than the equivalent quantity of byte accesses via vector registers.
> +    Misaligned accesses may be supported directly in hardware, or trapped and emulated by software.
> +
> +  * :c:macro:`RISCV_HWPROBE_VECTOR_MISALIGNED_FAST`: 32-bit misaligned accesses using vector
> +    registers are faster than the equivalent quantity of byte accesses via vector registers.
> +
> +  * :c:macro:`RISCV_HWPROBE_VECTOR_MISALIGNED_UNSUPPORTED`: Misaligned vector accesses are
> +    not supported at all and will generate a misaligned address fault.
> -- 
> 2.45.2
> 

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

