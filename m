Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799CD17BED0
	for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 04:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760934883; cv=none; b=T6JJ8bLndpQmL19l6glLE91kMgkKEpQl+uL+9ZVPv+QeAkpKwzVYvsi4a/cvbnRfgG+5npDxdmmllFtW63BG/EvaDDxl9ZJB2kk/66i/Heusf6/9lPV6qIpPxdvr0aRBn7oWOnWIHeNPc4qjM5sNrlbnJpRYufkd/WwRSA4R5RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760934883; c=relaxed/simple;
	bh=7ewcKsl4gSix4JTKxm4T8FGk4nC5GRnthKInzNEJlTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sPgXgdpuCynfzmjW7vSElqJ2I9UzV83+dbdJEv+0D517oYakkj6TDU2Al1oyPkvTki4E1yVafh9O1O/FQv/El5SLc+owdHx+9ebYXUXo6RxchYEKu3ewUFrx+TBZr3Hkr8ieVO3YYv880bTjRjPqy+VLluGs+NkxRsNLIJh0RHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=NfAyEKYW; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="NfAyEKYW"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-33c4252c3c5so2331717a91.0
        for <linux-doc@vger.kernel.org>; Sun, 19 Oct 2025 21:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1760934881; x=1761539681; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+onDgxMPyKLOY40mbxy0dXul6lSc7HSME7/BE/rGWAw=;
        b=NfAyEKYWo82OpAZIbTWLx75EMDh5FhuZBaTsW0RAyNMPjXQ+sr+CBlaTAFBZLagSh6
         vggU/q6Zei07093xZj/SDfED2I8Tso9wzBBJC1Z9JgcVtGalglXcY5k0XXgwdnD2ZhM3
         ya6owBHGnr27ZLYfm7peX6Kf78k7CteKOUXKXu+LWz3FNyJw7BTgHi8JiWIJWyDGWKn4
         tnYQL0mAAu7SzBTmUsCIh/C/8SkNM2SQAtpAC7DqJTduRGsNeaC9oIZr3uXpEleK7j4b
         /PAr0/cmDG+Hjl+0Voi0YXcnBdef/n3RKjzje5V1XhCO8E7XaOJOt95ClaTGmFr3f8MC
         s5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760934881; x=1761539681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+onDgxMPyKLOY40mbxy0dXul6lSc7HSME7/BE/rGWAw=;
        b=rY3WHakXTz6VB3cF5hWWa9WDdn5uJ7lAY1OU5j1+hrDLc9Uf0sdAms0QWgXZfOApT1
         /D//BkNowT4dY/ww+UpC0r+6yxuUtN3DGCBOjgmohfv0LTg5WhF00Z8/q7k6CExW+lKx
         MBNalW7iimRwzWuUHhIeLZPApuSiFhwadysbawR5zJGCi3EhLTqkQY+MgukI/AZgksNz
         JROiuXSTcTLHMhy643UWTYaO4SdF96fiTB9WDpczGhCPX7h/DA/oTKt7Cz2O36QRglYN
         JoyAYoFUSjNavh077GRKPP/rg638WThBXKQyg64pKIELbIhRTwbAXPSk6J7+f7SXexfg
         oO3g==
X-Gm-Message-State: AOJu0Yx1bC95afWQ1pNHTRMpbwsseUkM/7WQEwd0GMNUXdS5e+T4llW5
	jjdJK/WhZpndIywNlaGMjUQziODWsz5fLvhvWjP+XCJaCOAVd8PWCqOJplC/V++1q/qQVGJNGnJ
	FNnsx/oFJQJxOIE74k4r++ijeXwDZb9o4H3GkEFfLAQ==
X-Gm-Gg: ASbGncsjFZM1ZPAyVSweQ6wARs485pnh6TRAKt7z7qU1dGcix9wz77YyUJK5xwy5zlI
	xQkATztv6p1UbbVlu21GoRuUf88nf5uy9qkZS8vURo9d+1Rv5OvwT80r9h13w5B2AA55GktZxFZ
	vnuPTBPh72qCYztNrVJAJEymoK0cLoiX7dgWW/srypOQTbK5JrHjLgNhiXJ13l2eARWe5G4Xr3c
	dbPsjLBSfMxZkffOHQMS9wrRC5qIrj3MpiBOHuSHFxnkOCiRl7GKWYp/DnM5Bzaw3hOSQhbvTAh
	BHXH4V+Spv5Iq67EHY4=
X-Google-Smtp-Source: AGHT+IH9a1FKrBN3wWlaNuwKbnc7SmqwwgKUv1BbHl2nQXJtIw5nLWAzBwdqnbFCmBJfMi6jc127yHWzB+hEpQgkJLs=
X-Received: by 2002:a17:90b:3510:b0:32c:2cd:4d67 with SMTP id
 98e67ed59e1d1-33bcf892b26mr17239614a91.13.1760934880715; Sun, 19 Oct 2025
 21:34:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251020042056.30283-1-luxu.kernel@bytedance.com>
In-Reply-To: <20251020042056.30283-1-luxu.kernel@bytedance.com>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Mon, 20 Oct 2025 12:34:29 +0800
X-Gm-Features: AS18NWCAyFau_n9LGvHEY6sx4LEsfPQSzxZhTugNhp11gJ7ivOgOscG6Z4MCNx8
Message-ID: <CAPYmKFs5ATB26ZWtP3vyT=zhJHrafgvBAm6GUw27AM7h5vE9Kw@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] riscv: Add Zalasr ISA extension support
To: corbet@lwn.net, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, will@kernel.org, peterz@infradead.org, 
	boqun.feng@gmail.com, mark.rutland@arm.com, anup@brainfault.org, 
	atish.patra@linux.dev, pbonzini@redhat.com, shuah@kernel.org, 
	parri.andrea@gmail.com, ajones@ventanamicro.com, brs@rivosinc.com, 
	guoren@kernel.org
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	apw@canonical.com, joe@perches.com, lukas.bulwahn@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This series was automatically blocked by Gmail due to too many
recipients, so I resent it twice, causing the emails to appear
discontinuous. I apologize for any inconvenience this may have caused
to the reviewer.

Best regards,
Xu Lu

On Mon, Oct 20, 2025 at 12:21=E2=80=AFPM Xu Lu <luxu.kernel@bytedance.com> =
wrote:
>
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
> [1] https://lore.kernel.org/all/CAGPSXwJEdtqW=3Dnx71oufZp64nK6tK=3D0rytVE=
cz4F-gfvCOXk2w@mail.gmail.com/
>
> v4:
>  - Apply acquire/release semantics to arch_atomic operations. Thanks
>  to Andrea.
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
