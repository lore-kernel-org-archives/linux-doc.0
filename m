Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D05228F3
	for <linux-doc@vger.kernel.org>; Fri, 10 May 2024 22:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715380424; cv=none; b=KCj/wZWJgzhuwoqPKm4CExvOzEUeI/gk4DOTltv1h7ElSETkwdyTwHcZ7/RxCqtlP5rw0Lvv/4o8BNsEFxTS63jN/vSYqu+2nf1nVbRloZhAP6Dxu+tsFN4Se0fkvZg0/yUMjBNiaq1rocPA1+zHxSmZEb746Sxr5oqweJaxvLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715380424; c=relaxed/simple;
	bh=cFsqolC03whbOXne5XKlbHEqaO9KmgRG1wEiBKh9mPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YTrIKiZoR7kvcRyK0IVz7J+89jupXIVCeByuVcC72D1i057Z+9bs7yGs6bLTsN3q3b7eyIzgEuLPX1KhQd/AoAQ72IhcoERQQn+rO0qs0gzY3M97ibTCG9nIxQgNTsXF3plviW6M/tjl6imAmz5G16pnj00CVWOcgQxoLYaBduQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=o8hi3s3l; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="o8hi3s3l"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1e3c3aa8938so18450925ad.1
        for <linux-doc@vger.kernel.org>; Fri, 10 May 2024 15:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715380421; x=1715985221; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rx86BKf20oqqJvvyTkwVjgHBFBglkui4kaaauK5EOTw=;
        b=o8hi3s3lmX2YqQnd9C/rkwE38e0hHuJfKp8+ForFPhNh+16MvZrxNZyMWKWUzl9QrB
         qlM2my0i+vefxi2fxXAVQoi4gWsYKvYDmT5fAB+SGucJSMbN1UluiHj9pUcBpXgy33+X
         qu9dvsIF8CyhUcZAYtkEAiydou6AoPPlrY5W4+RnREg1kl0L9O2V43w+yFFYlU4ECd02
         WS4SdsP5pB3hlxXuMMdwyycHVavdp9uXnIMc66BPCJ3ksWiSHr4xm4WqYCAcT2HvCYWG
         5WCWKybQQtsyp5j3rQ3xRwEIQbZahlYP1htzOFpK/TTIifibLzJseyY+oZi+asW3gRb4
         dyvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715380421; x=1715985221;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rx86BKf20oqqJvvyTkwVjgHBFBglkui4kaaauK5EOTw=;
        b=mmYUEBav2CbwkjNR2dncBJgppINqsvkeFANeH8RlWFd773XGIY7x6VOCX/M3tPlqFb
         47pjZ81gwOwV2c7TUO7aNME+wxEzJh8gRiMPggeIas73mB079M4+aAL2vGYdWjLanKyq
         pgKA/AEzdOsKpflsj5W8BSYapdRxXeiAm2W8DQMR71xjcKRiHBh60J/uWTcnHwe0VuR4
         MGzYbO/MfguTUsX+H4BYvDo9Wbs29EStKqiI41K8Tpnsr6/F8KlNF0aIaequPXsjKh8d
         prZvLjcl5OFnMCpK8GGGf3MJAB7f0t6D74EShUqX2DsheIJg1ulE+g6CBqfBnNcpwE6S
         367A==
X-Forwarded-Encrypted: i=1; AJvYcCV5dU9CgYuyMq5uHbBFukT9J+96xMDZJIIKwT/ZKF/O6ZRqCIY7ZIe1ozoJ6ugc/sR8wGJYDr02FPbTPR5kraHqYZ/70li3aeQh
X-Gm-Message-State: AOJu0YztZ++1ysORMpBm+zXOVxZX8Mphc4CFRB2uVy8+EOES1HzMUjpy
	E+LyR7cXQ4WR7z1jpXyLwQ6AwcYfU3pO3cY9qC87GEjlqxlgo5CNiBkAlkO/tus=
X-Google-Smtp-Source: AGHT+IHCbIPqYj/CMVX+dpcmx2/ThEVPaXPHBWvK+JEhPYkGjzop6fsJUs8nt4PjI1Rtz6v88FXlIQ==
X-Received: by 2002:a17:902:d483:b0:1eb:57cb:4c69 with SMTP id d9443c01a7336-1ef43f4d1ebmr53974765ad.45.1715380420958;
        Fri, 10 May 2024 15:33:40 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:629e:3f2:f321:6c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c16093fsm37221825ad.281.2024.05.10.15.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 15:33:40 -0700 (PDT)
Date: Fri, 10 May 2024 15:33:36 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Deepak Gupta <debug@rivosinc.com>
Cc: paul.walmsley@sifive.com, rick.p.edgecombe@intel.com,
	broonie@kernel.org, Szabolcs.Nagy@arm.com, kito.cheng@sifive.com,
	keescook@chromium.org, ajones@ventanamicro.com,
	conor.dooley@microchip.com, cleger@rivosinc.com,
	atishp@atishpatra.org, alex@ghiti.fr, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, samuel.holland@sifive.com, conor@kernel.org,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mm@kvack.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org, corbet@lwn.net, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, oleg@redhat.com,
	akpm@linux-foundation.org, arnd@arndb.de, ebiederm@xmission.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, lstoakes@gmail.com,
	shuah@kernel.org, brauner@kernel.org, andy.chiu@sifive.com,
	jerry.shih@sifive.com, hankuan.chen@sifive.com,
	greentime.hu@sifive.com, evan@rivosinc.com, xiao.w.wang@intel.com,
	apatel@ventanamicro.com, mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com, sameo@rivosinc.com,
	shikemeng@huaweicloud.com, willy@infradead.org,
	vincent.chen@sifive.com, guoren@kernel.org, samitolvanen@google.com,
	songshuaishuai@tinylab.org, gerg@kernel.org, heiko@sntech.de,
	bhe@redhat.com, jeeheng.sia@starfivetech.com, cyy@cyyself.name,
	maskray@google.com, ancientmodern4@gmail.com,
	mathis.salmen@matsal.de, cuiyunhui@bytedance.com,
	bgray@linux.ibm.com, mpe@ellerman.id.au, baruch@tkos.co.il,
	alx@kernel.org, david@redhat.com, catalin.marinas@arm.com,
	revest@chromium.org, josh@joshtriplett.org, shr@devkernel.io,
	deller@gmx.de, omosnace@redhat.com, ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: Re: [PATCH v3 02/29] riscv: define default value for envcfg for task
Message-ID: <Zj6gwFvj2gA04NJq@ghost>
References: <20240403234054.2020347-1-debug@rivosinc.com>
 <20240403234054.2020347-3-debug@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240403234054.2020347-3-debug@rivosinc.com>

On Wed, Apr 03, 2024 at 04:34:50PM -0700, Deepak Gupta wrote:
> Defines a base default value for envcfg per task. By default all tasks
> should have cache zeroing capability. Any future base capabilities that
> apply to all tasks can be turned on same way.
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  arch/riscv/include/asm/csr.h | 2 ++
>  arch/riscv/kernel/process.c  | 6 ++++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 2468c55933cd..bbd2207adb39 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -202,6 +202,8 @@
>  #define ENVCFG_CBIE_FLUSH		_AC(0x1, UL)
>  #define ENVCFG_CBIE_INV			_AC(0x3, UL)
>  #define ENVCFG_FIOM			_AC(0x1, UL)
> +/* by default all threads should be able to zero cache */
> +#define ENVCFG_BASE			ENVCFG_CBZE
>  
>  /* Smstateen bits */
>  #define SMSTATEEN0_AIA_IMSIC_SHIFT	58
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index 92922dbd5b5c..d3109557f951 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -152,6 +152,12 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
>  	else
>  		regs->status |= SR_UXL_64;
>  #endif
> +	/*
> +	 * read current envcfg settings, AND it with base settings applicable
> +	 * for all the tasks. Base settings should've been set up during CPU
> +	 * bring up.
> +	 */
> +	current->thread_info.envcfg = csr_read(CSR_ENVCFG) & ENVCFG_BASE;

This needs to be gated on xlinuxenvcfg.

- Charlie

>  }
>  
>  void flush_thread(void)
> -- 
> 2.43.2
> 
