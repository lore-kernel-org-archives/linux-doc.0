Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA86265CCB
	for <linux-doc@vger.kernel.org>; Fri, 19 Sep 2025 10:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758276256; cv=none; b=J1dnktud/fX4gAdTecrnl9i1XFUjM0V/XHqnafQOzcn9yF1MhNpnPq4SOajYnqZhbCzEcs+auUHz2VNdde/M9OOfDqHoYgYHVRHbajq3y9CZIML5xrmtUd7L+1O508yvga8z+9Hc2TIWDMC3azvbrvmp/71nVRG7OrQVDBo5Um8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758276256; c=relaxed/simple;
	bh=MIxBc+wC/cmWNfba7NJKwLPOOs4c9e3k+S+2+58b6Og=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TyoQMXFw3YaObf3aOFhMlyc3kuZtplzokYYlJSfDb/6sx2tfymf6CLfrNdlYkFkDYvA4+SumgMIMaeQTBF9XHvTbWZUY3y1bNNGi/ooImLRQ1/+37uWgYapur+/b2NlOk1sZBfSUenLfNy3cM1LVHL/pmzGiNzu4RgMn8IujMZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g7o6dHTX; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g7o6dHTX"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45f2c5ef00fso15143885e9.1
        for <linux-doc@vger.kernel.org>; Fri, 19 Sep 2025 03:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758276253; x=1758881053; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cwSJqMLbkr+n3h9atzHQFhMdHOFSLWWZIBI6hzjzDlU=;
        b=g7o6dHTX/jKHUK07jvyCoY6ajcxb8/0bRLC2sulEeTiYYmsNUrN/qQ/Kx+x8TGrH09
         xXtmOl/GW/IoqmUA5L8WmpnY/Ry4Mac8F62gy298XaBuGkf30NMiGOVgxuDU0wMvEgog
         9fICTRwDWsQqioLOic49O/qJycH1rVfrSrPZTNghHMFyjkvgtcfZAArPlykxj6LRAgIn
         /z+2cdKAoSMYYHGcHTJUF11WeWwvX1KLS9ZNV0FO83Q74Nm2sLgb/jDzNEhIoab1YNJW
         mPjeFOktVP7AS7KpiFHPoxoBQ7ou9utiKL5FYJ9mpyFQ+LBfTNx7acGRLaPFBHksBDK+
         /N9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758276253; x=1758881053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cwSJqMLbkr+n3h9atzHQFhMdHOFSLWWZIBI6hzjzDlU=;
        b=wwwKcSn4QfYqF+SLmr4Ygk9f12II4r415NGqETcujsiJTTTC8K8kTK9asvwJUlUOes
         ww4FTV2//CmPNi4QTwYXt6DnVl3BqheyMlzIBGt5zctSKH8a5s/x31lX5DMv/vDD4Uft
         TLAEgrIowvLiJveieNmDOGZGPIeWu04PDkS25xxBmQWi8xhGClJUo9/IGbp1oJsYMaqB
         f9YNf9C3GxWoU/N21fs0uY2nLFtMonaVYsBqOkUMcDNzB4jqHaBR1XDfJjFWEWr5l1jv
         /5SZ0LiRyHxpb+axI7r2WwaORvOHCgUP3L+ouPTA6SMV85/Ixk+r3Jy7u2ZaI9UNiwdd
         PVPw==
X-Forwarded-Encrypted: i=1; AJvYcCX6jHyEgtsxbVSMKoV2AMH3UI4BbyAbdplzUathNP0/XZmzlQSMuVIQfJMzm9Bc82/8xhLJFFoUHsc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhP/UovmZlFdr0ixsaaF8JpDOX7+YD7m7aL0oGf0TiucvqvFJy
	9602I5pcMOO2toEvi1k1ZzKMHIFR6XPCup7tdLtI2+pX4U1EzYBsf0kp
X-Gm-Gg: ASbGnctoLB3bf5bzGwLaqWshEncI9RCo+lkkOBdl1t1eOgvGjHnNDoEc4/Tkugxf2Hd
	DWeHWg/wjWgdIasiIdnfdSIeSrgSFjBkV8QZ5lh4IAnyLoGg/xEWJDZONHb1vqpm/N8WqpmFrtm
	5cua9gsH2CfHxOafKjlRhYIjyUxYbxIv3JkHKLb7957HKWaoagsuIxuqJ0Np7ly47JvNiBpE9nE
	Z0UQzaDgQwA7sw4aqN35pUwrqNv3p0CKhh4FDmJulSU3HK+t/7p0ui/JsUhlRXzGVHH7Gw4CBTA
	XF8Qa9g7FBTC+F5pnkVQ6jcthqDpfIVyQsyexhEPFJ/LqOGIQfE28DKuUUOxrJ27yPAqSxYN5Ot
	MWtNKQ3ItqMcBlDvj2nOY
X-Google-Smtp-Source: AGHT+IHvZMGRRNi+u2pMIpVVRpaJCUA/81PZdTy1q3wdlCcos410V3il5VvXKBDg1PnvbPEV8rv3lQ==
X-Received: by 2002:a05:600c:6305:b0:45b:868e:7f7f with SMTP id 5b1f17b1804b1-467ee8c56d6mr28084075e9.17.1758276252440;
        Fri, 19 Sep 2025 03:04:12 -0700 (PDT)
Received: from andrea ([176.201.192.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f5a286edsm90295055e9.16.2025.09.19.03.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 03:04:12 -0700 (PDT)
Date: Fri, 19 Sep 2025 12:04:05 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: corbet@lwn.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, will@kernel.org,
	peterz@infradead.org, boqun.feng@gmail.com, mark.rutland@arm.com,
	ajones@ventanamicro.com, brs@rivosinc.com, anup@brainfault.org,
	atish.patra@linux.dev, pbonzini@redhat.com, shuah@kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, apw@canonical.com, joe@perches.com,
	linux-doc@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 0/8] riscv: Add Zalasr ISA extension support
Message-ID: <aM0qlTNPiaQRY2Nv@andrea>
References: <20250919073714.83063-1-luxu.kernel@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919073714.83063-1-luxu.kernel@bytedance.com>

On Fri, Sep 19, 2025 at 03:37:06PM +0800, Xu Lu wrote:
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
> Xu Lu (8):
>   riscv: add ISA extension parsing for Zalasr
>   dt-bindings: riscv: Add Zalasr ISA extension description
>   riscv: hwprobe: Export Zalasr extension
>   riscv: Introduce Zalasr instructions
>   riscv: Use Zalasr for smp_load_acquire/smp_store_release
>   riscv: Apply acquire/release semantics to arch_xchg/arch_cmpxchg
>     operations
>   RISC-V: KVM: Allow Zalasr extensions for Guest/VM
>   KVM: riscv: selftests: Add Zalasr extensions to get-reg-list test
> 
>  Documentation/arch/riscv/hwprobe.rst          |   5 +-
>  .../devicetree/bindings/riscv/extensions.yaml |   5 +
>  arch/riscv/include/asm/atomic.h               |   6 -
>  arch/riscv/include/asm/barrier.h              |  91 ++++++++++--
>  arch/riscv/include/asm/cmpxchg.h              | 136 ++++++++----------
>  arch/riscv/include/asm/hwcap.h                |   1 +
>  arch/riscv/include/asm/insn-def.h             |  79 ++++++++++
>  arch/riscv/include/uapi/asm/hwprobe.h         |   1 +
>  arch/riscv/include/uapi/asm/kvm.h             |   1 +
>  arch/riscv/kernel/cpufeature.c                |   1 +
>  arch/riscv/kernel/sys_hwprobe.c               |   1 +
>  arch/riscv/kvm/vcpu_onereg.c                  |   2 +
>  .../selftests/kvm/riscv/get-reg-list.c        |   4 +
>  13 files changed, 242 insertions(+), 91 deletions(-)

I wouldn't have rushed this submission while the discussion on v2 seems
so much alive;  IAC, to add and link to that discussion, this version
(not a review, just looking at this diff stat) is changing the fastpath

  read_unlock()
  read_lock()

from something like

  fence rw,w
  amodadd.w
  amoadd.w
  fence r,rw

to

  fence rw,rw
  amoadd.w
  amoadd.w
  fence rw,rw

no matter Zalasr or !Zalasr.  Similarly for other atomic operations with
release or acquire semantics.  I guess the change was not intentional?
If it was intentional, it should be properly mentioned in the changelog.

  Andrea
