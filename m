Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7B7309EF7
	for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 23:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761348188; cv=none; b=YvWPvhy95uqet0C6sxhDfS01/zv9qREn7/t1GHydvJnWD8IglGcJuv9z5LADEIJmk3fvSJ9fnguQvPecCvjf/XBlacxN3PvGh54Kf0mGviA13bm8mHVEZLJEiR4s4ptSGLPx8at0LjEVzge9A00K1JwCnU5BB5N/yQGm8+gsVx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761348188; c=relaxed/simple;
	bh=+NEftr7VWmliQcXUqkaO9sJG2DgzF/Yaw8WY6cHdu/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CruEAfpubFSh/ZvvYq2yveTNm4ba02KddWK1B6gvtGSCp9mm6sApDIXa+sUpGdmh4CbDQglHfHD+mYBMkeyupg5PiBvBwwK9RKNdfkngos29caMWevAhfm3DBTlpTnOmlvPEmMZoZJNuzrpD9tBvYpjnM7FzM2CdscdJtmhgnf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=js72ZsQ6; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="js72ZsQ6"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-637e9f9f9fbso4615791a12.0
        for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 16:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761348183; x=1761952983; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4qshgmZlkIM4+vcn2er+R5ZwtdRF9Gko5Hx8ZyCDhMI=;
        b=js72ZsQ62XI0/FyekbMawO85+oPBWcSgkkp5IJ4JDcfsvD9WH3ipuNhDGOyglbM0yr
         riVTrEUtTNTYqHfhc5Mpwok7SnVv4eClte2E2t2FmYAev/Xnac1TPvqVXNNuHJUN4CP+
         UQ2guDuI8jdZYV7ApIu7GFV517aIfeZr0j63eLpewPSSkGE5IXT76vjXiSBQntNYReri
         WKH4lDNslise3akkbDoTNgcMuBTVqEY4v94aT2AGzxPfcZ7ApGDZ5NwIji1FdNW9iXMA
         S0DN2+jl6T+vgA0WAqa+XH3Om3ZYNFGAX0BBxIHA9h7U3fF3k5/8+E290/6zvrwNOJwy
         SGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761348183; x=1761952983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4qshgmZlkIM4+vcn2er+R5ZwtdRF9Gko5Hx8ZyCDhMI=;
        b=Vo+rYOJ+4URjEaL4yBjCx2Fo9KpqjVh9cMMhOJYMnaFZGVrps5pd+BXip3RD4V042l
         D9jCFzLvMz6fUedLLi7UbtRjNjd3yM1HY3LllRjuTT5jZ+BiufUwEsgWFNul3pG1TqrI
         XNneV4wcjgsaaHH8PPSqFSHkJiJW+u8ufGWoMouujL1cb3oKU/cIqxohresdU4KZ0068
         lt1IFo1cIICKT+RnOVBhocXrdUaelNSDi1sDWvHnBVn3H/MmSOBL98SSr1Qd00Kgqeed
         RcwqeTV2+Xjx1FrYQHDDuGzqTcsks7dWjomqYMicsm8uYNTXpDDPOyRujvxi2kA6pVsu
         vqyg==
X-Forwarded-Encrypted: i=1; AJvYcCWAPaxTIVOJUp1LvQg7S+xl1UQ9lDYQGgtQy/Yz8ZgW8u7Hq/mZ1NAHiO7oh75zv9aIji25w/xhSIE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXje6qtI2YxfLqwoDPYWYNlEklXo93Dpza7ykvIxeCnz9Ml0Aw
	udoiOBYU7lPHYHVnytUeOk+pvZdL77tTG9rFJjltHvjIfGs0XLpmAvlwPFULBw==
X-Gm-Gg: ASbGncsdtzWojKwDX9wt1Md1SfijAkcV4vKMDbRvjCfu1PqeCzh2cgSmTAYldv4Rn84
	ZgePhDn1D5XyI9X7U4pw4ruWCME8ALHoqeZC9US8JhqUZaYQp1U1JjaNnl06+3qUNzlItqCwlIe
	oYmger90XRVMZyy7NVMHW/nnLbmBAmyqIB+K2TDmUDv7jD9VeYyacNesC0808dyzeCnYAhYD5ht
	wQ/1oKEOevlArgCYF6eAiPIgT0HA85qgvTwnDFUOha7Mmi8v/RIlioGvj5+BHymvgP9gFkYBE2Q
	+oRHx4WXJjA0oFyDxCx5LQuvee5rLACNTwAxBDOZJ0E/LZdssVW2ENNt1LmDl0fWQJcsdDHQlfz
	ihtz4oyM3rP1sOLIassSpqYqguHZX5AREZv/0Nxruno241A6uXneg59uCUBgXi0OjXQcSNdl1Q1
	ssa8+Bow==
X-Google-Smtp-Source: AGHT+IEQw0TA1CC7no4fMAMA9oQRoUt9Lgbn+Uft1azRKrTnyGz7lCiyNuO6p2GHKFOC05VVJ/iKvw==
X-Received: by 2002:a05:600c:4f89:b0:471:a98:99a6 with SMTP id 5b1f17b1804b1-475cafae164mr64272055e9.11.1761342429974;
        Fri, 24 Oct 2025 14:47:09 -0700 (PDT)
Received: from andrea ([31.189.53.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47496d4b923sm89676705e9.14.2025.10.24.14.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 14:47:09 -0700 (PDT)
Date: Fri, 24 Oct 2025 23:47:04 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: corbet@lwn.net, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, will@kernel.org,
	peterz@infradead.org, boqun.feng@gmail.com, mark.rutland@arm.com,
	anup@brainfault.org, atish.patra@linux.dev, pbonzini@redhat.com,
	shuah@kernel.org, ajones@ventanamicro.com, brs@rivosinc.com,
	guoren@kernel.org, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org,
	apw@canonical.com, joe@perches.com, lukas.bulwahn@gmail.com
Subject: Re: [PATCH v4 00/10] riscv: Add Zalasr ISA extension support
Message-ID: <aPvz2Pb6RuWnw9Ht@andrea>
References: <20251020042056.30283-1-luxu.kernel@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020042056.30283-1-luxu.kernel@bytedance.com>

On Mon, Oct 20, 2025 at 12:20:46PM +0800, Xu Lu wrote:
> This patch adds support for the Zalasr ISA extension, which supplies the
> real load acquire/store release instructions.
> 
> The specification can be found here:
> https://github.com/riscv/riscv-zalasr/blob/main/chapter2.adoc
> 
> This patch seires has been tested with ltp on Qemu with Brensan's zalasr
> support patch[1].
> 
> Some false positive spacing error happens during patch checking. Thus I
> CCed maintainers of checkpatch.pl as well.
> 
> [1] https://lore.kernel.org/all/CAGPSXwJEdtqW=nx71oufZp64nK6tK=0rytVEcz4F-gfvCOXk2w@mail.gmail.com/
> 
> v4:
>  - Apply acquire/release semantics to arch_atomic operations. Thanks
>  to Andrea.

Perhaps I wasn't clear enough, sorry, but I did mean my suggestion
(specifically, the use of .aq/.rl annotations) to be conditional on
zalasr.  Same observation for xchg/cmpxchg below.  IOW, I really
expected this series to introduce _no changes_ to our lowerings when
!zalasr.  If any !zalasr-changes are needed, I'd suggest isolating
/submitting them in dedicated patches.

But other than that, this looks pretty good to me.  Perhaps something
else to consider for zalasr is our lowering of smp_cond_load_acquire()
(can't spot an actual bug now, but recall the principle "zalasr -> use
.aq/.rl annotations ..."): riscv currently uses the "generic", fence-
based implementation from include/asm-generic/barrier.h; compare that
with e.g. the implementation from arch/arm64/include/asm/barrier.h .

  Andrea


> v3:
>  - Apply acquire/release semantics to arch_xchg/arch_cmpxchg operations
>  so as to ensure FENCE.TSO ordering between operations which precede the
>  UNLOCK+LOCK sequence and operations which follow the sequence. Thanks
>  to Andrea.
>  - Support hwprobe of Zalasr.
>  - Allow Zalasr extensions for Guest/VM.
> 
> v2:
>  - Adjust the order of Zalasr and Zalrsc in dt-bindings. Thanks to
>  Conor.
> 
> Xu Lu (10):
>   riscv: Add ISA extension parsing for Zalasr
>   dt-bindings: riscv: Add Zalasr ISA extension description
>   riscv: hwprobe: Export Zalasr extension
>   riscv: Introduce Zalasr instructions
>   riscv: Apply Zalasr to smp_load_acquire/smp_store_release
>   riscv: Apply acquire/release semantics to arch_xchg/arch_cmpxchg
>     operations
>   riscv: Apply acquire/release semantics to arch_atomic operations
>   riscv: Remove arch specific __atomic_acquire/release_fence
>   RISC-V: KVM: Allow Zalasr extensions for Guest/VM
>   RISC-V: KVM: selftests: Add Zalasr extensions to get-reg-list test
> 
>  Documentation/arch/riscv/hwprobe.rst          |   5 +-
>  .../devicetree/bindings/riscv/extensions.yaml |   5 +
>  arch/riscv/include/asm/atomic.h               |  70 ++++++++-
>  arch/riscv/include/asm/barrier.h              |  91 +++++++++--
>  arch/riscv/include/asm/cmpxchg.h              | 144 +++++++++---------
>  arch/riscv/include/asm/fence.h                |   4 -
>  arch/riscv/include/asm/hwcap.h                |   1 +
>  arch/riscv/include/asm/insn-def.h             |  79 ++++++++++
>  arch/riscv/include/uapi/asm/hwprobe.h         |   1 +
>  arch/riscv/include/uapi/asm/kvm.h             |   1 +
>  arch/riscv/kernel/cpufeature.c                |   1 +
>  arch/riscv/kernel/sys_hwprobe.c               |   1 +
>  arch/riscv/kvm/vcpu_onereg.c                  |   2 +
>  .../selftests/kvm/riscv/get-reg-list.c        |   4 +
>  14 files changed, 314 insertions(+), 95 deletions(-)
> 
> -- 
> 2.20.1
> 
