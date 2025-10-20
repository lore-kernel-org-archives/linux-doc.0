Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E986C2BE035
	for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 04:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760934072; cv=none; b=hcoFO4POBcRsABn5XDxgxzMt6mxZ38qYYV9SqAxm/RVqQDhZ+QYUAJv266ud7bDn5JjSQOcLwuyPb81mU3Ua3IPyNdHdCBgM/23WH1hXlNhrmMEqlOTsVyVcJRXlwOv31bqAdBijuCZiaMRjovthdfPhGvWcT+AggTWtR74YVk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760934072; c=relaxed/simple;
	bh=KSjoxuwSlFaFq4TJcoW0tRdCftkDMdzYUiOjhUqgUR0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GvXcS1L9M54Ynnops+3wEkLSOXE7rki5o+JOLc8xyBqBGzQvs4aJsMvwAENIkQXLzBNbXMGr6bP62eFMf9Ch0UOCL+B9Ao7/zuf7zGShq4HoQ/V/ipKz9nk38aVxl66jlfdtAgVYqHwZ05P7sxVMB2XTEtkJiuJXWeUydR0ohow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=NzraLz31; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="NzraLz31"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-33d463e79ddso2863212a91.0
        for <linux-doc@vger.kernel.org>; Sun, 19 Oct 2025 21:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1760934070; x=1761538870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=conQFyh0ywHaD293wZYZONSgw/GLLJWk5gnj1mP84r4=;
        b=NzraLz3102v6ehlBEAVRV9f1Ok1HDyPK+1tRUW79Wa0oG7FGeo7ruUdMP1CeyBjm8y
         n+0+oPEaUTPef9c6NFgmz4m4MqXFUxhpzQ+Rd+HjvzzA0m1PimfQR2oSTLDkTPyJurkD
         zS0TSjk/KWlXvSnRfN5W1cUH9C0upyQjZ6Sn1DacODGoLgQrM1w5tqvujyFMOPboYv/P
         CIT3qBZJkB+ri82n0Q3szP/QCDewqZ3A0FqMIC2aG4Lp9cumz7a+W3fqKy6SQdCqIi5s
         EHP3M9HW5Gb5shh5r/m6+YtFvn2/unBxzGZhMETpCv24FPAiLTLw7hmJ/i5HSVzcftrT
         oRww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760934070; x=1761538870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=conQFyh0ywHaD293wZYZONSgw/GLLJWk5gnj1mP84r4=;
        b=NqawCj0v5tabbTMXoFdXeinJ/85aySOXtNrWU8pku8VWVnVEyb0FAW6UKdSDEdrrvO
         4nkQ23hZzQhiRzZQNmIVV2P1JR+y51z/B3YmFdbVbyrbyox7hWlEgi6Jz0WJDgFs2G+f
         0PQ1jHXG2fOLOPHhboPxbipD1qCvi65lae+WRhrRwyLs0cVXGrxeqpp28k0+FiFSe/Fu
         bL/hYb6Hxvr9Ij8LUwvzeWnHXtQFtVDtzcADY86w4yZugQJj0BfCBLG6Z9N2zaQVryl8
         C0M4Ck2c4PUo9ZUVf+kYTUnTIuI4HMUY2+68ErotVHbg1emgYYgMKtDFGBEsAmYZkJWg
         31jw==
X-Gm-Message-State: AOJu0Yx6wYTkkmNjEhl7TR+xLXltPChSNb5eaizJr/3C5KZrDTKQsk5g
	PXpVdwFmgNpBz2BXI5jI3tfpXi3ASN1Gt1mtEx5zmeSU1IkONIB2lBTz6z16T31eJdE=
X-Gm-Gg: ASbGncuqsqO+wG4AYnQYHHF3kIRQqi1ldDxssbBFyeOjG/5uFrFFCodFFp8abvZLI9P
	zcHg+R0odx0BHx9zlCon5SBcHohJjeT0AiQNrYyT/UxOAp6/CUdZFdqMszmQDPMh7nVMBNR4bz9
	jILY2jMI7dyhofuUQfOcPAjWTEqYH1SikWGnJNe1YdgXSkOiD21WMSIcZzOHGoDgi656Ojfy0Ua
	2EVTVtJ7NdU/2ZXzTvP3uZoS3jg/mr1hziTThXtBij8k+iWC2freLhcvgECWkLVNpYNHw+d/Lrr
	hZikoLOyjlYkEjsH2dayrxS3PnC7rp7yDOqlgAwKs0Yhatnjq8SuD1UXwnCaK4UQfvD+qwR3kJW
	huItSz5oW1FX/50nCi5ViduZbXS5pUSGzn+zVDGnJZZ4EyjXOgIL+mrMa+1lzKZvUpg7NeVf1xt
	p1mU99eEctXjOw2Pw+H9SwR0OgwhqYAmarTEe7F+2d6lDo+l1NefYR5BqIcRLBzw9t9Iffkn66W
	w==
X-Google-Smtp-Source: AGHT+IEdkgCehFcbIRaUApmCfafCEhZVkAa78hZZpBjec5gPS2C5TVHNU0zWNgu3Z2IjgaK3I7rtpw==
X-Received: by 2002:a17:902:f687:b0:26e:49e3:55f1 with SMTP id d9443c01a7336-290c9cbc867mr157233355ad.18.1760934069971;
        Sun, 19 Oct 2025 21:21:09 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ec14e9sm68762035ad.9.2025.10.19.21.21.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 19 Oct 2025 21:21:09 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	will@kernel.org,
	peterz@infradead.org,
	boqun.feng@gmail.com,
	mark.rutland@arm.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pbonzini@redhat.com,
	shuah@kernel.org,
	parri.andrea@gmail.com,
	ajones@ventanamicro.com,
	brs@rivosinc.com,
	guoren@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	lukas.bulwahn@gmail.com,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v4 00/10] riscv: Add Zalasr ISA extension support
Date: Mon, 20 Oct 2025 12:20:46 +0800
Message-ID: <20251020042056.30283-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds support for the Zalasr ISA extension, which supplies the
real load acquire/store release instructions.

The specification can be found here:
https://github.com/riscv/riscv-zalasr/blob/main/chapter2.adoc

This patch seires has been tested with ltp on Qemu with Brensan's zalasr
support patch[1].

Some false positive spacing error happens during patch checking. Thus I
CCed maintainers of checkpatch.pl as well.

[1] https://lore.kernel.org/all/CAGPSXwJEdtqW=nx71oufZp64nK6tK=0rytVEcz4F-gfvCOXk2w@mail.gmail.com/

v4:
 - Apply acquire/release semantics to arch_atomic operations. Thanks
 to Andrea.

v3:
 - Apply acquire/release semantics to arch_xchg/arch_cmpxchg operations
 so as to ensure FENCE.TSO ordering between operations which precede the
 UNLOCK+LOCK sequence and operations which follow the sequence. Thanks
 to Andrea.
 - Support hwprobe of Zalasr.
 - Allow Zalasr extensions for Guest/VM.

v2:
 - Adjust the order of Zalasr and Zalrsc in dt-bindings. Thanks to
 Conor.

Xu Lu (10):
  riscv: Add ISA extension parsing for Zalasr
  dt-bindings: riscv: Add Zalasr ISA extension description
  riscv: hwprobe: Export Zalasr extension
  riscv: Introduce Zalasr instructions
  riscv: Apply Zalasr to smp_load_acquire/smp_store_release
  riscv: Apply acquire/release semantics to arch_xchg/arch_cmpxchg
    operations
  riscv: Apply acquire/release semantics to arch_atomic operations
  riscv: Remove arch specific __atomic_acquire/release_fence
  RISC-V: KVM: Allow Zalasr extensions for Guest/VM
  RISC-V: KVM: selftests: Add Zalasr extensions to get-reg-list test

 Documentation/arch/riscv/hwprobe.rst          |   5 +-
 .../devicetree/bindings/riscv/extensions.yaml |   5 +
 arch/riscv/include/asm/atomic.h               |  70 ++++++++-
 arch/riscv/include/asm/barrier.h              |  91 +++++++++--
 arch/riscv/include/asm/cmpxchg.h              | 144 +++++++++---------
 arch/riscv/include/asm/fence.h                |   4 -
 arch/riscv/include/asm/hwcap.h                |   1 +
 arch/riscv/include/asm/insn-def.h             |  79 ++++++++++
 arch/riscv/include/uapi/asm/hwprobe.h         |   1 +
 arch/riscv/include/uapi/asm/kvm.h             |   1 +
 arch/riscv/kernel/cpufeature.c                |   1 +
 arch/riscv/kernel/sys_hwprobe.c               |   1 +
 arch/riscv/kvm/vcpu_onereg.c                  |   2 +
 .../selftests/kvm/riscv/get-reg-list.c        |   4 +
 14 files changed, 314 insertions(+), 95 deletions(-)

-- 
2.20.1

