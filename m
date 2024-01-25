Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951B11339A2
	for <linux-doc@vger.kernel.org>; Thu, 25 Jan 2024 18:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706206344; cv=none; b=ue2GpUnnHRpV0KoWUZJExkouqhBlq/YEnLytgflrK2VwAcnI9v82rSWudftrbVs5SVQfcrHi0kzagh1ny3vQNPoPgGiLBaUhZYxkLwldV7hJKqnsBt9yFexYMWU7ofe0Ey0CHKtpuZXGv85IgbjojDQ9FvptGvvEESJRLf9niPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706206344; c=relaxed/simple;
	bh=cw8O2hqO9U01pVygNFVazLWDXfPwaESFBRTWSuf70Mw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i/eVnrGrwvwVdQL80AVCJm1jkCXguBLdqJ+Y2OsuJ658mpF2yC573FOIvz65DVF+2S2oViuxQV/ZWejs6uYwT/6y4AY2XJoawXRjm4GaZ9aS3P6hn2lNvchaH/rcWL0fAjFr0fRk1MqhSA+0W9Rb6S2kjOjGo1Nu+KGaCAdoXZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=PSmPiuhN; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="PSmPiuhN"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1d750660a0aso25701335ad.0
        for <linux-doc@vger.kernel.org>; Thu, 25 Jan 2024 10:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706206341; x=1706811141; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oOQ7PY5RMwdW49c44PeUD39W3uvEolKYcNoKx9tZHuc=;
        b=PSmPiuhN30ywzqBwEXa18j6bNFIJk7vf9IKQb4UwB5mPxikSB6Xr9t1kniyFIFKh6D
         +U5OVWOS7q6VP5w0jxF/2822a1RyoGNob1HK09yoRfl23bf+eZepnUwoNw8ArT8W9mcz
         svuYdYGGShpvNg+qrwugl7uUwqdu43lKdFtDIQJUJEbL6rLVRVuXb7JcW7f0/IGBQe5E
         HuobNgHYb0I75pa8kqAC1f2aJBitzR5r3RIq2L7TqOU7iDBxrgw/jw90lqHkhDoamF5C
         QwfcYIvk+FvvH2HvfUGfQ55nmgttPk8uCTzGYx2CbnHqCo9qX9uDRzy1sVzv1gYzHMkb
         y/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706206341; x=1706811141;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOQ7PY5RMwdW49c44PeUD39W3uvEolKYcNoKx9tZHuc=;
        b=abXlQJ/IAnXaKMVz9rDDQO/22hRBrLPvXIkZkRbt8BsjzE36UyGD/jIicfIJY0KPGP
         EHIMntaNrMP+aWJR+4GAznLcboJQ9OP4WdjkvzyXH7g8O+9EZF6Od65/dFtRdXmwqeHH
         f7RrfibaKBeHOu2bV0UVCZYr4rz6VPd+1P+DdbemlN/U/pq7PpFzi8qkAL3e2sWBy2Th
         QD3P0sY4Caw2ZtbO8iy2wgpJS3N1TWc4NMITzVVnUnBc5Y0Tlf4MkE2EoO6/NwZqTNFg
         o+n2w4qHMolOyKdCygiXx/6kAXCWzq7RhljZWzw8gyPw2lA/IHxyYsx45S9rFcIW05HQ
         dIgg==
X-Gm-Message-State: AOJu0Yw+JuyLTdv+cL/hDJAVW1x0uZrPuQpKfk9ZfCn4S8TNzr+OKmwT
	99Qid41Xfx0eiON3yzjo1/iEb2pHRZYrEDb4mYpYQmm2o8pcub96a1QWvQa0nQ0=
X-Google-Smtp-Source: AGHT+IGPUyyPX5hM1Yrkm5iskfPCqBeEPRsk5d1X3OtxSMKWSiBaRZNyP6s8gkZ7PqF+fErCTpo4Gg==
X-Received: by 2002:a17:902:b284:b0:1d4:2d8d:3536 with SMTP id u4-20020a170902b28400b001d42d8d3536mr91755plr.71.1706206340832;
        Thu, 25 Jan 2024 10:12:20 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id jy13-20020a17090342cd00b001d720fa139fsm10390442plb.70.2024.01.25.10.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 10:12:20 -0800 (PST)
Date: Thu, 25 Jan 2024 10:12:16 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: rick.p.edgecombe@intel.com, broonie@kernel.org, Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com, keescook@chromium.org,
	ajones@ventanamicro.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, conor.dooley@microchip.com, cleger@rivosinc.com,
	atishp@atishpatra.org, alex@ghiti.fr, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, corbet@lwn.net, aou@eecs.berkeley.edu,
	oleg@redhat.com, akpm@linux-foundation.org, arnd@arndb.de,
	ebiederm@xmission.com, shuah@kernel.org, brauner@kernel.org,
	guoren@kernel.org, samitolvanen@google.com, evan@rivosinc.com,
	xiao.w.wang@intel.com, apatel@ventanamicro.com,
	mchitale@ventanamicro.com, waylingii@gmail.com,
	greentime.hu@sifive.com, heiko@sntech.de, jszhang@kernel.org,
	shikemeng@huaweicloud.com, david@redhat.com, charlie@rivosinc.com,
	panqinglin2020@iscas.ac.cn, willy@infradead.org,
	vincent.chen@sifive.com, andy.chiu@sifive.com, gerg@kernel.org,
	jeeheng.sia@starfivetech.com, mason.huo@starfivetech.com,
	ancientmodern4@gmail.com, mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com, bhe@redhat.com, chenjiahao16@huawei.com,
	ruscur@russell.cc, bgray@linux.ibm.com, alx@kernel.org,
	baruch@tkos.co.il, zhangqing@loongson.cn, catalin.marinas@arm.com,
	revest@chromium.org, josh@joshtriplett.org, joey.gouly@arm.com,
	shr@devkernel.io, omosnace@redhat.com, ojeda@kernel.org,
	jhubbard@nvidia.com, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH v1 24/28] riscv: select config for shadow stack and
 landing pad instr support
Message-ID: <ZbKkgNX7xfU5KO8X@debug.ba.rivosinc.com>
References: <20240125062739.1339782-1-debug@rivosinc.com>
 <20240125062739.1339782-25-debug@rivosinc.com>
 <20240125-snitch-boogieman-5b4a0b142e61@spud>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20240125-snitch-boogieman-5b4a0b142e61@spud>

On Thu, Jan 25, 2024 at 06:04:26PM +0000, Conor Dooley wrote:
>On Wed, Jan 24, 2024 at 10:21:49PM -0800, debug@rivosinc.com wrote:
>> From: Deepak Gupta <debug@rivosinc.com>
>>
>> This patch selects config shadow stack support and landing pad instr
>> support. Shadow stack support and landing instr support is hidden behind
>> `CONFIG_RISCV_USER_CFI`. Selecting `CONFIG_RISCV_USER_CFI` wires up path
>> to enumerate CPU support and if cpu support exists, kernel will support
>> cpu assisted user mode cfi.
>>
>> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>> ---
>>  arch/riscv/Kconfig | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index 9d386e9edc45..437b2f9abf3e 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -163,6 +163,7 @@ config RISCV
>>  	select SYSCTL_EXCEPTION_TRACE
>>  	select THREAD_INFO_IN_TASK
>>  	select TRACE_IRQFLAGS_SUPPORT
>> +	select RISCV_USER_CFI
>
>This select makes no sense to me, it will unconditionally enable
>RISCV_USER_CFI. I don't think that that is your intent, since you have a
>detailed option below that allows the user to turn it on or off.
>
>If you remove it, the commit message will need to change too FYI.
>

Selecting this config puts support in Kernel so that it can run tasks who wants
to enable hardware assisted control flow integrity for themselves. But apps still
always need to optin using `prctls`. Those prctls are stubs and return EINVAL when
this config is not selected. Not selecting this config means, kernel will not support
enabling this feature for user mode.

I'll edit commit message to better reflect this.

>Thanks,
>Conor.
>
>>  	select UACCESS_MEMCPY if !MMU
>>  	select ZONE_DMA32 if 64BIT
>>
>> @@ -182,6 +183,20 @@ config HAVE_SHADOW_CALL_STACK
>>  	# https://github.com/riscv-non-isa/riscv-elf-psabi-doc/commit/a484e843e6eeb51f0cb7b8819e50da6d2444d769
>>  	depends on $(ld-option,--no-relax-gp)
>>
>> +config RISCV_USER_CFI
>> +	bool "riscv userspace control flow integrity"
>> +	help
>> +	  Provides CPU assisted control flow integrity to userspace tasks.
>> +	  Control flow integrity is provided by implementing shadow stack for
>> +	  backward edge and indirect branch tracking for forward edge in program.
>> +	  Shadow stack protection is a hardware feature that detects function
>> +	  return address corruption. This helps mitigate ROP attacks.
>> +	  Indirect branch tracking enforces that all indirect branches must land
>> +	  on a landing pad instruction else CPU will fault. This mitigates against
>> +	  JOP / COP attacks. Applications must be enabled to use it, and old user-
>> +	  space does not get protection "for free".
>> +	  default y
>> +
>>  config ARCH_MMAP_RND_BITS_MIN
>>  	default 18 if 64BIT
>>  	default 8
>> --
>> 2.43.0
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv


