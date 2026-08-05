Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4F53806C4
	for <linux-doc@vger.kernel.org>; Wed,  5 Aug 2026 17:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785951532; cv=pass; b=siS2+CmQlWeIp+Ci60y0Jjlq9scp5kSVmD5CCo+2DZ66Bn1/r5+eWIZTe4oT8lj9eZMEbS9fYJyV+F0dzcIiNJxYCYPAOXGQxNqmzjd7yJQ2ruOK0//1XQFWUlgqcNO5nwuZh//WSzJSpRr3NSmcbfukt1PO0ISIZxYppWclzp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785951532; c=relaxed/simple;
	bh=UXu2ZT4YYHVHvwUkwRhAX40MP9D/8NH4Fp90pgqs0fE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e5akF5pPXfX4G4vX4miK8H+57kIMs99UTRcD0tcMwQKI+9tnj2wPbmulfM97DXl42jRhjhCB0X4aZ/SWc33f9nqwcLCnYXVGHwLBFYNIkg6Lb+POMVCZ68JxbfQXN7aji3Ud3gT3+mBZsvMTSfD2isqHPxmNTgnZZRMFK1aIhqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eFf7q4eH; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=OVtnf8v1; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eFf7q4eH";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="OVtnf8v1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785951528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3lRm7g+n7FF22QeOz+/xTZKQ6F7/TnGjH8qeWFAC3m4=;
	b=eFf7q4eHiImNnBT4bjfoJhUUxbcCdZOHcGPlZ7pM9Bo9WLmSzU0ZMJZP9XLjyRb7UN5smZ
	1JzWjukv6RRxvat89JKGGn1RtlyaT1GHgfXKzPnkSmCISuxUheMw9bkgXQL8wjgpbXrBdY
	rpQpmCqtqnMHesbo/BpK2fj9RMSiB1Q=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-133-UZjpLgH2MRaoDxEc642KXw-1; Wed, 05 Aug 2026 13:38:46 -0400
X-MC-Unique: UZjpLgH2MRaoDxEc642KXw-1
X-Mimecast-MFC-AGG-ID: UZjpLgH2MRaoDxEc642KXw_1785951525
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4740be00302so1013210f8f.2
        for <linux-doc@vger.kernel.org>; Wed, 05 Aug 2026 10:38:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785951525; cv=none;
        d=google.com; s=arc-20260327;
        b=bPdCdy0309TM1mx0Rngl8jgbqkqxTeXpmZbjaa4519sZK3Kpjfm7vqrqa9ytgKpx41
         wqHVum1Z0d7fHiv9YHKkxM6zViVMrt1f25CYvfttW6NtXV6qBwUttnlcSsPsqmuqrwAv
         gSpDqrELiH2MSOIx3nVJMsqHuk8I1TULNxTynSLD+vJ4WSfH1iabNg36v3QbRtPPLH6A
         LkPLx3+D+OAIKTyeLykAakDM5DFAMVrjCbg/1W2aA+pAYGVWmv0yy4e8jdNQ2y38hUMC
         9lZL/B6DqNOS5fWGAmtv52jB0mYMaE+fCqLLEFT/rEfelav37TXMQ7NVsaURkdDiiOlm
         cotA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3lRm7g+n7FF22QeOz+/xTZKQ6F7/TnGjH8qeWFAC3m4=;
        fh=+l5i5MYS3aH/dBzkw5e/rpzkIrJni24cAh63Au8xBW0=;
        b=k72/zj+4MPwRWzF9RG/ovF9URwnSQzd6ji2gp9Og0xw5TE4fk0240qyjlpu7Hs6XCv
         ce86KQOu0OrDlV7wKB2g82DH7D+pNv748P4i4SzVdK59zfZ0Sk69BKg+STauk6FfuvqA
         LYAKbVsgtmzVyvKUGLnUMl8/Lc/KPoxtE2Mo6E9r1HxgYXOoeykYN+fBzv0OuQ0WtEA3
         fXVgrsGFKk/GrZUTJIWZufGHUD5LVpe0LMEvNzRTdxM0mQjGwV4oGdiblX2qGc5fAPc3
         qjnmfRGZHkuTcRRz10KPkRrMxrKg/i+UrM8BPbiRr3/LtWFINT7hBDMPbutl+NAON6Py
         gUiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785951525; x=1786556325; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3lRm7g+n7FF22QeOz+/xTZKQ6F7/TnGjH8qeWFAC3m4=;
        b=OVtnf8v1SaWQsPlBe2fRHANaq9X1u9b9fpW8UNmEWUcXPc+KjgsE8XcXMSSV3230MF
         TOZDL6ujcoIctHLk9UfxzlrMkpjbYyyPkImUIg8/4hrEDITQPxtjnBpbPXGHu9oWOF3a
         XiF0XEk40cQfD310/pDXcAM6eeemKHv+DvN4PJwbo9mxfTf8q2CXxcVjslfJJmUhJ4tE
         NvqktuToHdJ+BIdVC5y/aqWiar0wW5zQHaycUvUr5YhxxBhoNjafncFXnstCdlDOIF65
         adY2WCI0kZx9gtt97xBAbIs+C2xjfFmwbYmvcauEf2/Fdzp8dTXtu8AtguyXBQEGpl70
         l8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785951525; x=1786556325;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3lRm7g+n7FF22QeOz+/xTZKQ6F7/TnGjH8qeWFAC3m4=;
        b=LRaWnA9TMGM8R3jL2XltssDOSBmSJfajpGxOgYBMmkYcAk+HhaQPvLcFMy5oYR4Mdj
         6pxci1kSFqYE0L+fWZRsL35ump8um7E3FpNW7N8ew6Yhe4AF5R+BCM+EIJCJQYzT76z9
         9wNtcNjg4R+KOsTLj6D5XxH38kw09D77zAcx+pXM4XCaWaAPVdBFzP1H7QT8nG6gOpoZ
         IWwjQn950brcjdTLOm363rgCLoRlytqesGtAzr3DZ44UFehkfIG5LOuxl54GMVyoNWSF
         PCjwveHR+LVTA6FphLeyqb9uDohZiieV103irmgcVj1v5V76IqHWn8rNInYCweQK1tFd
         MTrg==
X-Forwarded-Encrypted: i=1; AHgh+Rr3maaf/1TDHzUAyMYyPxIepO/SaKTPbYSfEdPf389CWLc6TsSH9Yn5cxt4DQv+vq9ji71JCI6wkxA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlbBdnkSYwxXkHaA0McVFzcFsku29/0RgWD9nQE0Kc31ruLe7v
	BqpKHDdrcFBLaETJXDtRKzA8SyHRe0n8qCnseT0g/T+pw9DTTFJbfpEUKbUk6WqHLikQj30/T6U
	ZYnk6i0wqV4FjYN2Pk1XJEMUGn/TS1yGasWIzqU4A1AP+99AgqixDrh1xhuW2edlpWWsVauaskI
	yDFGlBmdVZ5MlKYcm7lCbKZgxmm0fHxDnbj5n8
X-Gm-Gg: AR+sD10lx4ZgCxe9ai1a+EugWtdMnV95jsVH1EmS+ALuqDEv73fY4B/oskP4IZY2Rzz
	BMWLksELMsyzwFvwtiDOZZrZuE+un6RHoeZIrSJwUu+LBfXE0EYfE4fN+NxXBZoIUmB34s+XTGB
	3+KbcmTgU7vY12PndLhtDeTTWQ0Wdv30deDRJTepk/DpTMezHaAoVWTo1QZzxyam+QA4TynxPbH
	4ELz77zCLQIa/xsPQ==
X-Received: by 2002:a05:6000:2004:b0:47f:5a97:2a63 with SMTP id ffacd0b85a97d-47fec4f0502mr14593987f8f.9.1785951525134;
        Wed, 05 Aug 2026 10:38:45 -0700 (PDT)
X-Received: by 2002:a05:6000:2004:b0:47f:5a97:2a63 with SMTP id
 ffacd0b85a97d-47fec4f0502mr14593913f8f.9.1785951524656; Wed, 05 Aug 2026
 10:38:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260725001614.2578617-1-tchiu@tenstorrent.com> <20260725001614.2578617-3-tchiu@tenstorrent.com>
In-Reply-To: <20260725001614.2578617-3-tchiu@tenstorrent.com>
From: Jesse Taube <jtaubepe@redhat.com>
Date: Wed, 5 Aug 2026 13:38:33 -0400
X-Gm-Features: AUfX_mxLbKolS7UpTADOOxeTj5u1JQXH0y9GOdihL1xAtI41ka4rWlrusCIRWNU
Message-ID: <CADRr4bccaiDeMF+R94Sd8hetoi84Z0p9Dxin5TCm3iAy8r9phA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] riscv: hwprobe: export the availability of vector
 to user
To: Andy Chiu <tchiu@tenstorrent.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bergner@tenstorrent.com, 
	kito.cheng@sifive.com, dfustini@oss.tenstorrent.com, greentime.hu@sifive.com, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Guodong Xu <docular.xu@gmail.com>, 
	Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, 
	Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>, Xu Lu <luxu.kernel@bytedance.com>, 
	Yao Zihong <zihong.plct@isrc.iscas.ac.cn>, Jingwei Wang <wangjingwei@iscas.ac.cn>, 
	Deepak Gupta <debug@rivosinc.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 24, 2026 at 8:17=E2=80=AFPM Andy Chiu <tchiu@tenstorrent.com> w=
rote:
>
> Userland IFUNC resolvers use hwprobe to decide whether to dispatch to
> vectorized routines. But RISCV_HWPROBE_KEY_IMA_EXT_0 only reports what
> is present in hardware, not what the calling process may actually use:
> when Vector is disabled for a process via
> prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_OFF), it is still
> reported as present. A resolver that trusts this and runs a vector
> instruction crashes with SIGILL.
>
> Add RISCV_HWPROBE_KEY_EXT_ENABLED, a positional modifier key that carries
> no value of its own. Within a single request, keys placed after it report
> extensions that are both present and enabled for the calling process,
> while keys before it keep reporting hardware presence. This masks out V
> and its V-dependent sub-extensions when V is disabled for the process, an=
d
> lets userland obtain both views in one query:
>
>       [ {IMA_EXT_0}, {EXT_ENABLED}, {IMA_EXT_0} ]
>           present       modifier       enabled
>
> The enabled view depends on per-process state, so it cannot be served fro=
m
> the vDSO's process-independent cache; requests carrying the modifier are
> deferred to the syscall. Unknown keys are still reported as -1, so the
> feature is detectable and existing users are unaffected.
>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D220795
> Link: https://lore.kernel.org/all/20260107000609.63892-1-andybnac@gmail.c=
om/
> Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>
> ---
> Changelog v2:
>  - rebase on top of latest for-next
>  - add test_avail to sifive's vector depending extensions
> ---
>  Documentation/arch/riscv/hwprobe.rst          | 27 ++++++++++++++
>  arch/riscv/include/asm/hwprobe.h              |  2 +-
>  .../asm/vendor_extensions/sifive_hwprobe.h    |  6 ++--
>  .../asm/vendor_extensions/thead_hwprobe.h     |  6 ++--
>  arch/riscv/include/uapi/asm/hwprobe.h         |  2 ++
>  arch/riscv/kernel/sys_hwprobe.c               | 36 +++++++++++++------
>  arch/riscv/kernel/vdso/hwprobe.c              | 25 +++++++++----
>  .../kernel/vendor_extensions/sifive_hwprobe.c | 16 ++++++---
>  .../kernel/vendor_extensions/thead_hwprobe.c  |  9 +++--
>  9 files changed, 100 insertions(+), 29 deletions(-)
>
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/ri=
scv/hwprobe.rst
> index d9928641deb9..b9b3cf23c212 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -401,3 +401,30 @@ The following keys are defined:
>      as defined in version 1.0 of the RISC-V Control-flow Integrity (CFI)
>      extensions specification, ratified in commit 302a2d45c243
>      ("Update build-pdf.yml") of riscv-cfi.
> +
> + * :c:macro:`RISCV_HWPROBE_KEY_EXT_ENABLED`: A modifier key. It reports =
no
> +  value of its own (its value is always 0) and instead changes how the
> +  extension-bitmask keys that follow it in the same request are reported=
.
> +  Keys placed before it report the extensions that are present in hardwa=
re,
> +  as usual. Keys placed after it additionally require each reported exte=
nsion
> +  to be enabled for the calling process, i.e. usable without receiving a
> +  SIGILL.
> +
> +  Currently this applies to Vector. When V has been disabled for the pro=
cess
> +  with ``prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_OFF)``,
> +  :c:macro:`RISCV_HWPROBE_IMA_V` and the V-dependent sub-extensions are
> +  cleared from any :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0` that follows t=
he
> +  modifier, and :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR` is clea=
red
> +  from any :c:macro:`RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0` that follows =
it,
> +  while a preceding key still reports them as present. A single request =
can
> +  therefore return both the hardware-present set and the process-usable
> +  set::
> +
> +      struct riscv_hwprobe pairs[3] =3D {
> +          { .key =3D RISCV_HWPROBE_KEY_IMA_EXT_0, },   /* present in har=
dware */
> +          { .key =3D RISCV_HWPROBE_KEY_EXT_ENABLED, }, /* modifier      =
      */
> +          { .key =3D RISCV_HWPROBE_KEY_IMA_EXT_0, },   /* present and en=
abled */
> +      };
> +
> +  The effect is positional: reordering the pairs changes which keys have=
 the
> +  enablement filter applied.
> diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hw=
probe.h
> index 8b9f5e1cf4cb..e8364a3eaeef 100644
> --- a/arch/riscv/include/asm/hwprobe.h
> +++ b/arch/riscv/include/asm/hwprobe.h
> @@ -8,7 +8,7 @@
>
>  #include <uapi/asm/hwprobe.h>
>
> -#define RISCV_HWPROBE_MAX_KEY          16
> +#define RISCV_HWPROBE_MAX_KEY          17
>
>  static inline bool riscv_hwprobe_key_is_valid(__s64 key)
>  {
> diff --git a/arch/riscv/include/asm/vendor_extensions/sifive_hwprobe.h b/=
arch/riscv/include/asm/vendor_extensions/sifive_hwprobe.h
> index 90a61abd033c..c961c78a7927 100644
> --- a/arch/riscv/include/asm/vendor_extensions/sifive_hwprobe.h
> +++ b/arch/riscv/include/asm/vendor_extensions/sifive_hwprobe.h
> @@ -7,10 +7,12 @@
>  #include <uapi/asm/hwprobe.h>
>
>  #ifdef CONFIG_RISCV_ISA_VENDOR_EXT_SIFIVE
> -void hwprobe_isa_vendor_ext_sifive_0(struct riscv_hwprobe *pair, const s=
truct cpumask *cpus);
> +void hwprobe_isa_vendor_ext_sifive_0(struct riscv_hwprobe *pair,
> +                                    const struct cpumask *cpus, bool tes=
t_avail);
>  #else
>  static inline void hwprobe_isa_vendor_ext_sifive_0(struct riscv_hwprobe =
*pair,
> -                                                  const struct cpumask *=
cpus)
> +                                                  const struct cpumask *=
cpus,
> +                                                  bool test_avail)
>  {
>         pair->value =3D 0;
>  }
> diff --git a/arch/riscv/include/asm/vendor_extensions/thead_hwprobe.h b/a=
rch/riscv/include/asm/vendor_extensions/thead_hwprobe.h
> index 65a9c5612466..3e1c4271383f 100644
> --- a/arch/riscv/include/asm/vendor_extensions/thead_hwprobe.h
> +++ b/arch/riscv/include/asm/vendor_extensions/thead_hwprobe.h
> @@ -7,10 +7,12 @@
>  #include <uapi/asm/hwprobe.h>
>
>  #ifdef CONFIG_RISCV_ISA_VENDOR_EXT_THEAD
> -void hwprobe_isa_vendor_ext_thead_0(struct riscv_hwprobe *pair, const st=
ruct cpumask *cpus);
> +void hwprobe_isa_vendor_ext_thead_0(struct riscv_hwprobe *pair,
> +                                   const struct cpumask *cpus, bool test=
_avail);
>  #else
>  static inline void hwprobe_isa_vendor_ext_thead_0(struct riscv_hwprobe *=
pair,
> -                                                 const struct cpumask *c=
pus)
> +                                                 const struct cpumask *c=
pus,
> +                                                 bool test_avail)
>  {
>         pair->value =3D 0;
>  }
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/u=
api/asm/hwprobe.h
> index 9139edba0aec..561483172ce5 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -116,6 +116,8 @@ struct riscv_hwprobe {
>  #define RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE    15
>  #define RISCV_HWPROBE_KEY_IMA_EXT_1            16
>  #define                RISCV_HWPROBE_EXT_ZICFISS       (1ULL << 0)
> +/* Modifier key working as a signal to the kernel to gather enablement s=
tatus */
> +#define RISCV_HWPROBE_KEY_EXT_ENABLED  17
>
>  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
>
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwpr=
obe.c
> index d2bb70fed8b9..5949e3d9146f 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -79,8 +79,9 @@ static void hwprobe_arch_id(struct riscv_hwprobe *pair,
>  }
>
>  static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
> -                            const struct cpumask *cpus)
> +                            const struct cpumask *cpus, bool report_avai=
l)
>  {
> +       bool report_v;
>         int cpu;
>         u64 missing =3D 0;
>
> @@ -91,7 +92,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair=
,
>         if (riscv_isa_extension_available(NULL, c))
>                 pair->value |=3D RISCV_HWPROBE_IMA_C;
>
> -       if (has_vector() && riscv_isa_extension_available(NULL, v))
> +       report_v =3D report_avail ? riscv_v_vstate_ctrl_user_allowed() : =
true;
> +       if (has_vector() && riscv_isa_extension_available(NULL, v) && rep=
ort_v)
>                 pair->value |=3D RISCV_HWPROBE_IMA_V;
>
>         /*
> @@ -146,7 +148,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pa=
ir,
>                  * All the following extensions must depend on the kernel
>                  * support of V.
>                  */
> -               if (has_vector()) {
> +               if (has_vector() && report_v) {
>                         EXT_KEY(isainfo->isa, ZVBB, pair->value, missing)=
;
>                         EXT_KEY(isainfo->isa, ZVBC, pair->value, missing)=
;
>                         EXT_KEY(isainfo->isa, ZVE32F, pair->value, missin=
g);
> @@ -215,7 +217,7 @@ static bool hwprobe_ext0_has(const struct cpumask *cp=
us, u64 ext)
>  {
>         struct riscv_hwprobe pair;
>
> -       hwprobe_isa_ext0(&pair, cpus);
> +       hwprobe_isa_ext0(&pair, cpus, false);
>         return (pair.value & ext);
>  }
>
> @@ -293,7 +295,7 @@ static u64 hwprobe_vec_misaligned(const struct cpumas=
k *cpus)
>  #endif
>
>  static void hwprobe_one_pair(struct riscv_hwprobe *pair,
> -                            const struct cpumask *cpus)
> +                            const struct cpumask *cpus, bool test_avail)
>  {
>         pair->value =3D 0;
>
> @@ -314,7 +316,7 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pa=
ir,
>                 break;
>
>         case RISCV_HWPROBE_KEY_IMA_EXT_0:
> -               hwprobe_isa_ext0(pair, cpus);
> +               hwprobe_isa_ext0(pair, cpus, test_avail);
>                 break;
>
>         case RISCV_HWPROBE_KEY_IMA_EXT_1:
> @@ -351,11 +353,11 @@ static void hwprobe_one_pair(struct riscv_hwprobe *=
pair,
>                 break;
>
>         case RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0:
> -               hwprobe_isa_vendor_ext_sifive_0(pair, cpus);
> +               hwprobe_isa_vendor_ext_sifive_0(pair, cpus, test_avail);
>                 break;
>
>         case RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0:
> -               hwprobe_isa_vendor_ext_thead_0(pair, cpus);
> +               hwprobe_isa_vendor_ext_thead_0(pair, cpus, test_avail);
>                 break;
>         case RISCV_HWPROBE_KEY_VENDOR_EXT_MIPS_0:
>                 hwprobe_isa_vendor_ext_mips_0(pair, cpus);

It might be good to add a warning if `RISCV_HWPROBE_KEY_EXT_ENABLED`
is ever passed to `hwprobe_one_pair` in the future as it should never
be passed here.

> @@ -378,6 +380,7 @@ static int hwprobe_get_values(struct riscv_hwprobe __=
user *pairs,
>                               unsigned long __user *cpus_user,
>                               unsigned int flags)
>  {
> +       bool test_avail =3D false;
>         size_t out;
>         int ret;
>         cpumask_t cpus;
> @@ -418,7 +421,10 @@ static int hwprobe_get_values(struct riscv_hwprobe _=
_user *pairs,
>                         return -EFAULT;
>
>                 pair.value =3D 0;
> -               hwprobe_one_pair(&pair, &cpus);
> +               if (pair.key =3D=3D RISCV_HWPROBE_KEY_EXT_ENABLED)
> +                       test_avail =3D true;
> +               else
> +                       hwprobe_one_pair(&pair, &cpus, test_avail);
>                 ret =3D put_user(pair.key, &pairs->key);
>                 if (ret =3D=3D 0)
>                         ret =3D put_user(pair.value, &pairs->value);
> @@ -437,6 +443,7 @@ static int hwprobe_get_cpus(struct riscv_hwprobe __us=
er *pairs,
>  {
>         cpumask_t cpus, one_cpu;
>         bool clear_all =3D false;
> +       bool test_avail =3D false;
>         size_t i;
>         int ret;
>
> @@ -476,6 +483,10 @@ static int hwprobe_get_cpus(struct riscv_hwprobe __u=
ser *pairs,
>                         if (ret)
>                                 return -EFAULT;
>                 }
> +               if (pair.key =3D=3D RISCV_HWPROBE_KEY_EXT_ENABLED) {
> +                       test_avail =3D true;
> +                       continue;
> +               }
>
>                 if (clear_all)
>                         continue;
> @@ -485,7 +496,7 @@ static int hwprobe_get_cpus(struct riscv_hwprobe __us=
er *pairs,
>                 for_each_cpu(cpu, &cpus) {
>                         cpumask_set_cpu(cpu, &one_cpu);
>
> -                       hwprobe_one_pair(&tmp, &one_cpu);
> +                       hwprobe_one_pair(&tmp, &one_cpu, test_avail);
>
>                         if (!riscv_hwprobe_pair_cmp(&tmp, &pair))
>                                 cpumask_clear_cpu(cpu, &cpus);
> @@ -535,8 +546,11 @@ static int complete_hwprobe_vdso_data(void)
>          * save a syscall in the common case.

By the way this got removed in for-next
("Revert "riscv: hwprobe: Fix stale vDSO data for late-initialized
keys at boot"")

>          */
>         for (key =3D 0; key <=3D RISCV_HWPROBE_MAX_KEY; key++) {
> +               if (key =3D=3D RISCV_HWPROBE_KEY_EXT_ENABLED)
> +                       continue;
> +
>                 pair.key =3D key;
> -               hwprobe_one_pair(&pair, cpu_online_mask);
> +               hwprobe_one_pair(&pair, cpu_online_mask, false);
>
>                 WARN_ON_ONCE(pair.key < 0);
>
> diff --git a/arch/riscv/kernel/vdso/hwprobe.c b/arch/riscv/kernel/vdso/hw=
probe.c
> index 8f45500d0a6e..f40c21e44ef9 100644
> --- a/arch/riscv/kernel/vdso/hwprobe.c
> +++ b/arch/riscv/kernel/vdso/hwprobe.c
> @@ -14,7 +14,7 @@ extern int riscv_hwprobe(struct riscv_hwprobe *pairs, s=
ize_t pair_count,
>
>  static int riscv_vdso_get_values(struct riscv_hwprobe *pairs, size_t pai=
r_count,
>                                  size_t cpusetsize, unsigned long *cpus,
> -                                unsigned int flags)
> +                                unsigned int flags, bool avail_test)
>  {
>         const struct vdso_arch_data *avd =3D &vdso_u_arch_data;
>         bool all_cpus =3D !cpusetsize && !cpus;
> @@ -27,7 +27,8 @@ static int riscv_vdso_get_values(struct riscv_hwprobe *=
pairs, size_t pair_count,
>          * homogeneous, then this function can handle requests for arbitr=
ary
>          * masks.
>          */
> -       if (flags !=3D 0 || (!all_cpus && !avd->homogeneous_cpus) || unli=
kely(!avd->ready))
> +       if (flags !=3D 0 || (!all_cpus && !avd->homogeneous_cpus) ||
> +           unlikely(!avd->ready) || avail_test)
>                 return riscv_hwprobe(pairs, pair_count, cpusetsize, cpus,=
 flags);
>
>         /* This is something we can handle, fill out the pairs. */
> @@ -48,7 +49,7 @@ static int riscv_vdso_get_values(struct riscv_hwprobe *=
pairs, size_t pair_count,
>
>  static int riscv_vdso_get_cpus(struct riscv_hwprobe *pairs, size_t pair_=
count,
>                                size_t cpusetsize, unsigned long *cpus,
> -                              unsigned int flags)
> +                              unsigned int flags, bool avail_test)
>  {
>         const struct vdso_arch_data *avd =3D &vdso_u_arch_data;
>         struct riscv_hwprobe *p =3D pairs;
> @@ -68,7 +69,8 @@ static int riscv_vdso_get_cpus(struct riscv_hwprobe *pa=
irs, size_t pair_count,
>                 }
>         }
>
> -       if (empty_cpus || flags !=3D RISCV_HWPROBE_WHICH_CPUS || !avd->ho=
mogeneous_cpus)
> +       if (empty_cpus || flags !=3D RISCV_HWPROBE_WHICH_CPUS ||
> +           !avd->homogeneous_cpus || avail_test)
>                 return riscv_hwprobe(pairs, pair_count, cpusetsize, cpus,=
 flags);
>
>         while (p < end) {
> @@ -105,10 +107,21 @@ int __vdso_riscv_hwprobe(struct riscv_hwprobe *pair=
s, size_t pair_count,
>                          size_t cpusetsize, unsigned long *cpus,
>                          unsigned int flags)
>  {
> +       struct riscv_hwprobe *p =3D pairs;
> +       bool avail_test =3D false;
> +       size_t i;
> +
> +       for (i =3D 0; i < pair_count; i++) {
> +               if (p[i].key =3D=3D RISCV_HWPROBE_KEY_EXT_ENABLED) {
> +                       avail_test =3D true;

NIT: `avail_test` is very similar to `test_avail`, which confused me at fir=
st.
I would change `avail_test` to `has_avail_test` or `does_avail_test`
so its more readable.


> +                       break;
> +               }
> +       }
> +
>         if (flags & RISCV_HWPROBE_WHICH_CPUS)
>                 return riscv_vdso_get_cpus(pairs, pair_count, cpusetsize,
> -                                          cpus, flags);
> +                                          cpus, flags, avail_test);
>
>         return riscv_vdso_get_values(pairs, pair_count, cpusetsize,
> -                                    cpus, flags);
> +                                    cpus, flags, avail_test);
>  }
> diff --git a/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c b/arch/=
riscv/kernel/vendor_extensions/sifive_hwprobe.c
> index 1f77f6309763..379ea16bd89f 100644
> --- a/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c
> +++ b/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c
> @@ -6,17 +6,23 @@
>
>  #include <linux/cpumask.h>
>  #include <linux/types.h>
> +#include <asm/vector.h>
>
>  #include <uapi/asm/hwprobe.h>
>  #include <uapi/asm/vendor/sifive.h>
>
> -void hwprobe_isa_vendor_ext_sifive_0(struct riscv_hwprobe *pair, const s=
truct cpumask *cpus)
> +void hwprobe_isa_vendor_ext_sifive_0(struct riscv_hwprobe *pair, const s=
truct cpumask *cpus,
> +                                    bool test_avail)
>  {
> +       bool report_v =3D test_avail ? riscv_v_vstate_ctrl_user_allowed()=
 : true;
> +
>         VENDOR_EXTENSION_SUPPORTED(pair, cpus,
>                                    riscv_isa_vendor_ext_list_sifive.per_h=
art_isa_bitmap, {
> -               VENDOR_EXT_KEY(XSFVQMACCDOD);
> -               VENDOR_EXT_KEY(XSFVQMACCQOQ);
> -               VENDOR_EXT_KEY(XSFVFNRCLIPXFQF);
> -               VENDOR_EXT_KEY(XSFVFWMACCQQQ);
> +               if (report_v) {
> +                       VENDOR_EXT_KEY(XSFVQMACCDOD);
> +                       VENDOR_EXT_KEY(XSFVQMACCQOQ);
> +                       VENDOR_EXT_KEY(XSFVFNRCLIPXFQF);
> +                       VENDOR_EXT_KEY(XSFVFWMACCQQQ);
> +               }
>         });
>  }
> diff --git a/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c b/arch/r=
iscv/kernel/vendor_extensions/thead_hwprobe.c
> index 2eba34011786..28c58a7123d5 100644
> --- a/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c
> +++ b/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c
> @@ -6,14 +6,19 @@
>
>  #include <linux/cpumask.h>
>  #include <linux/types.h>
> +#include <asm/vector.h>
>
>  #include <uapi/asm/hwprobe.h>
>  #include <uapi/asm/vendor/thead.h>
>
> -void hwprobe_isa_vendor_ext_thead_0(struct riscv_hwprobe *pair, const st=
ruct cpumask *cpus)
> +void hwprobe_isa_vendor_ext_thead_0(struct riscv_hwprobe *pair, const st=
ruct cpumask *cpus,
> +                                   bool test_avail)
>  {
> +       bool report_v =3D test_avail ? riscv_v_vstate_ctrl_user_allowed()=
 : true;
> +
>         VENDOR_EXTENSION_SUPPORTED(pair, cpus,
>                                    riscv_isa_vendor_ext_list_thead.per_ha=
rt_isa_bitmap, {
> -               VENDOR_EXT_KEY(XTHEADVECTOR);
> +               if (report_v)
> +                       VENDOR_EXT_KEY(XTHEADVECTOR);
>         });
>  }
> --
> 2.43.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
>

