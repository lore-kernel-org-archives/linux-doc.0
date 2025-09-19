Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71B62F8BEE
	for <linux-doc@vger.kernel.org>; Fri, 19 Sep 2025 10:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758279245; cv=none; b=SVi2rBaXw5S4N6slTtk2fz8pqZnWDzz166GXkZV2Eye7+xrSUpO4031RGas6Sxc0aNsbfpptG3Bu0e63Vi76nmft6+QTJeM8hmjDAKtB1yy2DCw7Gu4q1Ak/I9WBONbgCr5J9yRjq/3mI1DRNZYIPRONdAB/un4gisROUaUERvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758279245; c=relaxed/simple;
	bh=dlBqN6s2KaMTj78q1hAYaCO2jqx4CfAlVXMMxWBVwRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=paQcXsFjEdJF+13p9DwogiONGwhR2IonuzGZsarZqPfm6/xPOEa/XJjMGPpYN3dvkKxXdvmAV9qh11Ea8NIdBFetF5ksYU7OStgwMKuE6yc5GjKApCpA6N1GDexuaHX/SYsA4qspm4Vx6olWLny3aWeDduvdK5o6GGowzTjaFTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=j6AUy+sj; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="j6AUy+sj"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-32eb76b9039so2318069a91.1
        for <linux-doc@vger.kernel.org>; Fri, 19 Sep 2025 03:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758279243; x=1758884043; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VwXF4nj9Ctk9ENZA1Gy7QLttXCNWXb5F14RFISsUWAo=;
        b=j6AUy+sjsf5jch97JcB6QIfaCndwK06Zlj1lIXlmhCFXw92DHL+/v/r+QY3Ss+EZ5r
         wALy7WeyOsgFytV8M+iElL98Y64CHt/3FBvavJQbfBapoLudetClyRWABv+9lOAkbjxV
         6mmfaZrB1AtGNxA3o9TMga+a/7fvQavYjCG9iOajkq4F63GG4gFDRqYT7jEiV1fCloez
         LPm+Bb+0njjIdBWN3Xt0c0v6oIRTAaE9ArBZPIfG4u8Z2kjOzG+xbaahKTaDx2AQyKT4
         hIPBUSI/9A2EJhtTbdUW/oix1ZWhLRZdw08g/U0Lwqmnigg2yvkgKPvmWuPuI9/32Vcs
         5n8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758279243; x=1758884043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VwXF4nj9Ctk9ENZA1Gy7QLttXCNWXb5F14RFISsUWAo=;
        b=Ctgcz6FwXqoWAJjOWFD86kx0P7k+JwHoqP/0b0x9bGESuoEbAlfXLqZJALWCZU/un1
         wiP4FHs6dO3ThM3MCOom+kdDLSXg3E5Ew5FtG51kLuBUt2L7WQ8TszHz/ioU/SMKrwqU
         7k4wqMrICkzujXkSuh9baGoGA85xC2s6vSGSrP2PQcAh9GnWwVW7oO7cq5/fRGJ/h8rJ
         zJ6QS4oPXNDRzObIfXcU7rZ0Ge8qWHoam1KuZ5DtkjZPBMgyULjqjUiqB5Z2bYjgQTAp
         nDwuAfJkh/tk8m0/F9Nd/Gy1gP09KX3b/TIItMIUxsj1c+Z41dWyVQo5WeCPSpJRjWDO
         QGqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPaLo1ugA5Q1NcmscqeVeabYl0Y+4QnrBAa7qayg/1Ajdsi0lHcPwhqXTJjiekHYrPIlRnLOZWv1M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxOaJhDifikmw1xFRA95cO2OubWiPW/wtkfdXkbWcLRUxQ67nl
	xbYLx9PCuhOQwgzxhx14T5VGA4mPykwZ21qhY6ipoDxWzU/mZD2ySSVkNz2keVZp6XqGbDIESNL
	rYd/UK9s996bDSrcl6e9RmfzzGViIjSlNKpOa1dDxhQ==
X-Gm-Gg: ASbGncsUPtwuwnkWdp5rM6ePGXtUYhG2woe+0Bj6GF5uXAZm7U1ouNWlmnTq3+Wiqko
	GKu1ALOpm8vpzeclocFt+kTJ4zMScpeOEQ8Xk2RZxm0+x29FF0cnUkvFQiDnhwySd/k0dfpINIf
	XAqsHTM0UJNyt8Fabg1l10lMSdq9FKbai2jFfeMa2F3aktTulxba9IrDheIv8THQHSGgr49YdvP
	+kDABkGn8fNoECx579xrxSXKgOhwwnN6NGSfqygxISAepdHvxIC
X-Google-Smtp-Source: AGHT+IFxeJMPLYhVopFZ/wMGe4/MLpf50j7fyW/JSos7YqNV48KuEAenh3nTAVS5vu18B3CE2dLqvQk2LQK3xveldfU=
X-Received: by 2002:a17:90b:3fcf:b0:330:6f16:c4d8 with SMTP id
 98e67ed59e1d1-33097fd4e41mr3511663a91.7.1758279243172; Fri, 19 Sep 2025
 03:54:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250919073714.83063-1-luxu.kernel@bytedance.com>
 <aM0qlTNPiaQRY2Nv@andrea> <CAPYmKFsP+=S56Cj2XT0DjdvBT_SY84moM4LVeqxHTVWbtq4EVw@mail.gmail.com>
In-Reply-To: <CAPYmKFsP+=S56Cj2XT0DjdvBT_SY84moM4LVeqxHTVWbtq4EVw@mail.gmail.com>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Fri, 19 Sep 2025 18:53:52 +0800
X-Gm-Features: AS18NWDkb7q9MGkDnErZbfpP4LgF33f4wEnUX8H6rIWl06tQwmVParxSdVieQQ4
Message-ID: <CAPYmKFsV_ZPifJBtvPOdqM6_Mzhac9A4-PH9zt8TirOqAwKGhw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3 0/8] riscv: Add Zalasr ISA extension support
To: Andrea Parri <parri.andrea@gmail.com>
Cc: corbet@lwn.net, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, will@kernel.org, peterz@infradead.org, boqun.feng@gmail.com, 
	mark.rutland@arm.com, ajones@ventanamicro.com, brs@rivosinc.com, 
	anup@brainfault.org, atish.patra@linux.dev, pbonzini@redhat.com, 
	shuah@kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, apw@canonical.com, joe@perches.com, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 19, 2025 at 6:39=E2=80=AFPM Xu Lu <luxu.kernel@bytedance.com> w=
rote:
>
> Hi Andrea,
>
> On Fri, Sep 19, 2025 at 6:04=E2=80=AFPM Andrea Parri <parri.andrea@gmail.=
com> wrote:
> >
> > On Fri, Sep 19, 2025 at 03:37:06PM +0800, Xu Lu wrote:
> > > This patch adds support for the Zalasr ISA extension, which supplies =
the
> > > real load acquire/store release instructions.
> > >
> > > The specification can be found here:
> > > https://github.com/riscv/riscv-zalasr/blob/main/chapter2.adoc
> > >
> > > This patch seires has been tested with ltp on Qemu with Brensan's zal=
asr
> > > support patch[1].
> > >
> > > Some false positive spacing error happens during patch checking. Thus=
 I
> > > CCed maintainers of checkpatch.pl as well.
> > >
> > > [1] https://lore.kernel.org/all/CAGPSXwJEdtqW=3Dnx71oufZp64nK6tK=3D0r=
ytVEcz4F-gfvCOXk2w@mail.gmail.com/
> > >
> > > v3:
> > >  - Apply acquire/release semantics to arch_xchg/arch_cmpxchg operatio=
ns
> > >  so as to ensure FENCE.TSO ordering between operations which precede =
the
> > >  UNLOCK+LOCK sequence and operations which follow the sequence. Thank=
s
> > >  to Andrea.
> > >  - Support hwprobe of Zalasr.
> > >  - Allow Zalasr extensions for Guest/VM.
> > >
> > > v2:
> > >  - Adjust the order of Zalasr and Zalrsc in dt-bindings. Thanks to
> > >  Conor.
> > >
> > > Xu Lu (8):
> > >   riscv: add ISA extension parsing for Zalasr
> > >   dt-bindings: riscv: Add Zalasr ISA extension description
> > >   riscv: hwprobe: Export Zalasr extension
> > >   riscv: Introduce Zalasr instructions
> > >   riscv: Use Zalasr for smp_load_acquire/smp_store_release
> > >   riscv: Apply acquire/release semantics to arch_xchg/arch_cmpxchg
> > >     operations
> > >   RISC-V: KVM: Allow Zalasr extensions for Guest/VM
> > >   KVM: riscv: selftests: Add Zalasr extensions to get-reg-list test
> > >
> > >  Documentation/arch/riscv/hwprobe.rst          |   5 +-
> > >  .../devicetree/bindings/riscv/extensions.yaml |   5 +
> > >  arch/riscv/include/asm/atomic.h               |   6 -
> > >  arch/riscv/include/asm/barrier.h              |  91 ++++++++++--
> > >  arch/riscv/include/asm/cmpxchg.h              | 136 ++++++++--------=
--
> > >  arch/riscv/include/asm/hwcap.h                |   1 +
> > >  arch/riscv/include/asm/insn-def.h             |  79 ++++++++++
> > >  arch/riscv/include/uapi/asm/hwprobe.h         |   1 +
> > >  arch/riscv/include/uapi/asm/kvm.h             |   1 +
> > >  arch/riscv/kernel/cpufeature.c                |   1 +
> > >  arch/riscv/kernel/sys_hwprobe.c               |   1 +
> > >  arch/riscv/kvm/vcpu_onereg.c                  |   2 +
> > >  .../selftests/kvm/riscv/get-reg-list.c        |   4 +
> > >  13 files changed, 242 insertions(+), 91 deletions(-)
> >
> > I wouldn't have rushed this submission while the discussion on v2 seems
> > so much alive;  IAC, to add and link to that discussion, this version
>
> Thanks. This version is sent out to show my solution to the FENCE.TSO
> problem you pointed out before. I will continue to improve it. Look
> forward to more suggestions from you.
>
> > (not a review, just looking at this diff stat) is changing the fastpath
> >
> >   read_unlock()
> >   read_lock()
> >
> > from something like
> >
> >   fence rw,w
> >   amodadd.w
> >   amoadd.w
> >   fence r,rw
> >
> > to
> >
> >   fence rw,rw
> >   amoadd.w
> >   amoadd.w
> >   fence rw,rw
> >
> > no matter Zalasr or !Zalasr.  Similarly for other atomic operations wit=
h
> > release or acquire semantics.  I guess the change was not intentional?
> > If it was intentional, it should be properly mentioned in the changelog=
.
>
> Sorry about that. It is intended. The atomic operation before
> __atomic_acquire_fence or operation after __atomic_release_fence can
> be just a single ld or sd instruction instead of amocas or amoswap. In
> such cases, when the store release operation becomes 'sd.rl', the
> __atomic_acquire_fence via 'fence r, rw' can not ensure FENCE.TSO
> anymore. Thus I replace it with 'fence rw, rw'.

This is also the common implementation on other architectures who use
aq/rl instructions like ARM. And you certainly already knew it~

>
> I will make it a separate commit and provide more messages in the
> changelog. Maybe alternative mechanism can be applied to accelerate
> it.
>
> Best Regards,
> Xu Lu
>
> >
> >   Andrea
