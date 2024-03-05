Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA9C7E56F
	for <linux-doc@vger.kernel.org>; Tue,  5 Mar 2024 23:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709680950; cv=none; b=uPDUFFzROqBGh0imcj02cvj5aYOAzHRa6E4HuoCC+A2CU4ONVxpcOOCyrYnn5zGqQrWGXLg7rlRLPzB9ZV+jUYUFhTaaXcPaUPii2uYb/0J67Zxx4AsS1sZN5EHMaG2p5C12B5MUrRhQ8Lo8FeAGV57cssOUVqSKbLCjjvm6rT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709680950; c=relaxed/simple;
	bh=nB0c8ZCUZVh6m8hPNG/qr4fknYOuarbIGMPfm8HZWTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=izXusRMUqGf5U7Av0ngWuBfl0+6msCcQ4nxY9x8+qC7G863ailm1XcfRFb6jTnmcHmVkCFyY99U4UPAiLxgyBoRCtK2FogCpq56/noTR+8zx3IpUVmIIi9eZKYGXWzl68ICRzE0MoSrUPc3fbXayG3cswK+dpLeSLYMyA9fHbOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=LOpEqzox; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="LOpEqzox"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6e5b1c6daa3so4593991b3a.1
        for <linux-doc@vger.kernel.org>; Tue, 05 Mar 2024 15:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709680948; x=1710285748; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R4U2Xkw/IBgvoNoGeIYqYiemkRY93cmWxyD/xaF/gu4=;
        b=LOpEqzox1ON75m7M5ECBMnosegkTZadNr9ixzOIQop5IFa083hxO4Q6Jc3U7dK6FAn
         a+YrMqBFyT5jnU9FwfVg6zpCYQswvY9GhbBT5xnqZPS8WYhbrFSFO/G9U+Q9W8FGItEV
         AKk+rgdGlFwlnjVWlK5GiCg42vjAACHYEHxnbPAUtNLiVFtnovJu4sXSyfs016ajmt1U
         jYzRLeEfIGhiwDCBpUd+gZO02RcIDS1gCig4IyGd+EgAcFtNcuS8GFp0SgKPYNkm6yCf
         xtBjuBhvVlA2U4wxT5UEP0sbwxbtNiQyR+QipJS9oK8bQ0GiDMWhAKM027j8kRGSHvIR
         1g3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709680948; x=1710285748;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R4U2Xkw/IBgvoNoGeIYqYiemkRY93cmWxyD/xaF/gu4=;
        b=iChrygl1JHObWzH0IXFZru4BMqKihlGc1GNBQJYMU3qTnA9kGN4Pkqm43owzgSQg+V
         /f5N4Yg8Y8eO6bXZdUL/Yvv9vXGAGfhdPd0p41Ss/MyXhg5Qd7recu2dWE0sZGPRYMSd
         gn2E3+RlgiJ99SFM3sdwHwPjHh24BF0lrRzQPyGAWRpx8/RaFyxvPyolelyypm6+9ps4
         FCEr7kNbsjZ1gbcRqas9KDl5vaMbnMhVrk1XK5SDvtPNi88/zYO5uxMyQtRSPfPM21PQ
         itl7jX7L4qFYEZDhZnbfP5heqRL7YeHuq0SMd3KqF8bct2DPEVeeZjy67PsslygvKxWY
         MRzw==
X-Forwarded-Encrypted: i=1; AJvYcCU/bkeTBzn93mifY5llfvNo3U8q2qXvy3BeM3RgS+HnLrhq0EsBj2xqFzx2IYJQf9s5hOGv1W7Wdyhgyr/hWRq9GUc9jFy0YcrL
X-Gm-Message-State: AOJu0YxJ7ihitWc9ddkMzYhGsGFH+KqwLTi+RzXrqLT3de+fDdgJb40Q
	uxWQgg9HeJxapcjvodP5JcKvXGnNjZ/KNTJ9oTWCAP8Eu/psVyrcZ2MnxGZxXUo=
X-Google-Smtp-Source: AGHT+IHMRmxHiMb/Kmx0F2hLj8iRRMjaNRQUVODlVPukYARpd+a2KaUJJPnOKWnaEIr+cFIgSRnr7w==
X-Received: by 2002:a05:6a20:9381:b0:1a1:4d85:5d73 with SMTP id x1-20020a056a20938100b001a14d855d73mr3830127pzh.25.1709680948217;
        Tue, 05 Mar 2024 15:22:28 -0800 (PST)
Received: from ghost ([50.213.54.97])
        by smtp.gmail.com with ESMTPSA id p12-20020aa7860c000000b006e50e79f155sm9469415pfn.60.2024.03.05.15.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 15:22:27 -0800 (PST)
Date: Tue, 5 Mar 2024 15:22:21 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Atish Patra <atishp@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v11 0/4] riscv: Create and document
 PR_RISCV_SET_ICACHE_FLUSH_CTX prctl
Message-ID: <ZeepLbzqeQbGRWNm@ghost>
References: <20240212-fencei-v11-0-e1327f25fe10@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240212-fencei-v11-0-e1327f25fe10@rivosinc.com>

On Mon, Feb 12, 2024 at 03:36:25PM -0800, Charlie Jenkins wrote:
> Improve the performance of icache flushing by creating a new prctl flag
> PR_RISCV_SET_ICACHE_FLUSH_CTX. The interface is left generic to allow
> for future expansions such as with the proposed J extension [1].
> 
> Documentation is also provided to explain the use case.
> 
> Patch sent to add PR_RISCV_SET_ICACHE_FLUSH_CTX to man-pages [2].
> 
> [1] https://github.com/riscv/riscv-j-extension
> [2] https://lore.kernel.org/linux-man/20240124-fencei_prctl-v1-1-0bddafcef331@rivosinc.com
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
> Changes in v11:
> - Add back PR_RISCV_CTX_SW_FENCEI_OFF (Samuel)
> - Fix under nosmp (Samuel)
> - Change set_prev_cpu (Samuel)
> - Fixup example testcase in docs
> - Change wording of documentation slightly (Alejandor Colomar)
> - Link to v10: https://lore.kernel.org/r/20240124-fencei-v10-0-a25971f4301d@rivosinc.com
> 
> Changes in v10:
> - Fix fence.i condition to properly only flush on migration (Alex)
> - Fix documentation wording (Alex)
> - Link to v9: https://lore.kernel.org/r/20240123-fencei-v9-0-71411bfe8d71@rivosinc.com
> 
> Changes in v9:
> - Remove prev_cpu from mm (Alex)
> - Link to v8: https://lore.kernel.org/r/20240116-fencei-v8-0-43a42134f021@rivosinc.com
> 
> Changes in v8:
> - Only flush icache if migrated to different cpu (Alex)
> - Move flushing to switch_to to catch per-thread flushing properly
> - Link to v7: https://lore.kernel.org/r/20240112-fencei-v7-0-78f0614e1db0@rivosinc.com
> 
> Changes in v7:
> - Change "per_thread" parameter to "scope" and provide constants for the
>   parameter.
> - Link to v6: https://lore.kernel.org/r/20240109-fencei-v6-0-04116e51445c@rivosinc.com
> 
> Changes in v6:
> - Fixup documentation formatting
> - Link to v5: https://lore.kernel.org/r/20240108-fencei-v5-0-aa1e51d7222f@rivosinc.com
> 
> Changes in v5:
> - Minor documentation changes (Randy)
> - Link to v4: https://lore.kernel.org/r/20240107-fencei-v4-0-d4cf2fb905d3@rivosinc.com
> 
> Changes in v4:
> - Add OFF flag to disallow fence.i in userspace (Atish)
> - Fix documentation issues (Atish)
> - Link to v3: https://lore.kernel.org/r/20231213-fencei-v3-0-b75158238eb7@rivosinc.com
> 
> Changes in v3:
> - Check if value force_icache_flush set on thread, rather than in mm
>   twice (Clément)
> - Link to v2: https://lore.kernel.org/r/20231130-fencei-v2-0-2cb623ab1b1f@rivosinc.com
> 
> Changes in v2:
> - Fix kernel-doc comment (Conor)
> - Link to v1: https://lore.kernel.org/r/20231122-fencei-v1-0-bec0811cb212@rivosinc.com
> 
> ---
> Charlie Jenkins (4):
>       riscv: Remove unnecessary irqflags processor.h include
>       riscv: Include riscv_set_icache_flush_ctx prctl
>       documentation: Document PR_RISCV_SET_ICACHE_FLUSH_CTX prctl
>       cpumask: Add assign cpu
> 
>  Documentation/arch/riscv/cmodx.rst |  98 ++++++++++++++++++++++++++++++++++
>  Documentation/arch/riscv/index.rst |   1 +
>  arch/riscv/include/asm/irqflags.h  |   1 -
>  arch/riscv/include/asm/mmu.h       |   2 +
>  arch/riscv/include/asm/processor.h |  12 +++++
>  arch/riscv/include/asm/switch_to.h |  23 ++++++++
>  arch/riscv/mm/cacheflush.c         | 105 +++++++++++++++++++++++++++++++++++++
>  arch/riscv/mm/context.c            |  18 +++++--
>  include/linux/cpumask.h            |  16 ++++++
>  include/uapi/linux/prctl.h         |   6 +++
>  kernel/sys.c                       |   6 +++
>  11 files changed, 282 insertions(+), 6 deletions(-)
> ---
> base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
> change-id: 20231117-fencei-f9f60d784fa0
> -- 
> - Charlie
> 

Copy Samuel Holland on this patch.

- Charlie

