Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399A43F075B
	for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 20:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769027080; cv=none; b=pFOS249OjDiOIIRV+Kt2eWYEZKC4zaqPpbvMQYuRlxovBd9bV99SkJ9DAHNbbNb+s1VzHD/edG7RYr2hjWA5dN8v6MqI4yK5N9EOrIM8VZeKP9J039bw4wOvqdxi6t8jUAD56RfLq10U6gm76MjjWGdHDbIELnVC9oNrKrwHlpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769027080; c=relaxed/simple;
	bh=Jaq2jsRG/r4sZNtPJ8ltyTFCbLArZNy2emYqmWGFUaU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Z9Jj2PLL+oLoRVgvLPHRi1USQKdR2gSPX19MIYtS+HwEay51vM4CqL6rqF8uVT6/4Y6+pO3DypnpsF0+KT91lNumFyruDsbfnVu+tpxxWlKUOZ/1m6LDfD1BPxaQ98hehGN5p+vGfIoxZURD4pERkjzSBGjAA+qaVMtf/2VHyrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i+BT9swE; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i+BT9swE"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-352e1a8603bso254663a91.1
        for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 12:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769027078; x=1769631878; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+MgxcQq5Xqx+GbQCEBAnHK7cTgnKSfyobaM2qHohzJ0=;
        b=i+BT9swEet3BcYwvpun23CLnOmfL43ZZZW8N5xVlY1Iu9O+4YBbISMYw2ng9czEDIH
         ciXoYnVPKINZw4o5aGUbHCCHaps6BqB9E02vYE4cQNtseroemksB0RIfCtrSDnHF48To
         UO1uE7TzSrdYZ8OPUhKkvT2evmp4M3K/3Tfe8bq95iBv4YXRC8u0PbnCjL21P2imZdLK
         L4vDBxdTUlKEBoVGLlG+MuYscjNw5jO1WjkBLfZGLl8V2Hbx85B4sjh/rASpmxL/Z4WU
         C7LqMcfwcUkiUIBDxBPxOvuisgkQccqAD83b63g0yk2MeP93Hbm4xjQ2ISrWoxrP1Wqr
         vJ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769027078; x=1769631878;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+MgxcQq5Xqx+GbQCEBAnHK7cTgnKSfyobaM2qHohzJ0=;
        b=WNdnVYpoMMSCyf7meFxmEknmy+X1ix9GHVdeQIwgwgmvZVo+Lfs/8LU1DpILU9Qw4V
         oIHlyhg8Q09TkmRa23lWGZCH7NwIwqUPunPnX95jx7vjpq5ff4GDyMi8dEA2ajAV89s5
         2abN2OLAg9zrmn5RasIRU1u8RZsj9XC+zTxMrXjlljnJPNIc9t+Wxrg/GcumApW2YMrh
         alOj3nthKAasG2LXc0FeuNA1R7EyNBJ1txu8mkxvidkBI9JQwOYic9Hsjq0Vbgrd9tt+
         CKK++DV1P6Yq+1lqnDMr+jOAlMcIZePXxoiWnAu70WA4NlX9FoQ/sunwUPs6CweOAqH4
         Efdg==
X-Forwarded-Encrypted: i=1; AJvYcCVtLtuD4+Xm+0E3Dw9ZrwCyCEV1WVU0K5ckFJ5vKNILQtT4GPX+qzBPf1+3MHSETYVlMFgzgLJam6w=@vger.kernel.org
X-Gm-Message-State: AOJu0YznJ5v0c5TQ30v/+b1RqPGvKQCVizBkz9QqzoiKT2CXVELIf8X2
	3OXU91Mh6OYQvWTyKvh0HqMO9YbLUDI9foBkxpxRzM8M26/J+oRnkahRxqTxTjcP2tSNRpY49iO
	/k9L1JQ==
X-Received: from pjbca22.prod.google.com ([2002:a17:90a:f316:b0:33b:ba24:b207])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:dfce:b0:353:3977:a082
 with SMTP id 98e67ed59e1d1-3533977a5ddmr180576a91.1.1769027078236; Wed, 21
 Jan 2026 12:24:38 -0800 (PST)
Date: Wed, 21 Jan 2026 12:24:36 -0800
In-Reply-To: <BEB86711-AE1D-4438-8278-229275493134@zytor.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251026201911.505204-1-xin@zytor.com> <20251026201911.505204-12-xin@zytor.com>
 <9a628729-1b4f-4982-a3e6-b9269c91b3c2@linux.intel.com> <BEB86711-AE1D-4438-8278-229275493134@zytor.com>
Message-ID: <aXE2BPCKvcIiQbqU@google.com>
Subject: Re: [PATCH v9 11/22] KVM: x86: Add a helper to detect if FRED is
 enabled for a vCPU
From: Sean Christopherson <seanjc@google.com>
To: Xin Li <xin@zytor.com>
Cc: Binbin Wu <binbin.wu@linux.intel.com>, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, pbonzini@redhat.com, 
	corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, luto@kernel.org, 
	peterz@infradead.org, andrew.cooper3@citrix.com, chao.gao@intel.com, 
	hch@infradead.org, sohil.mehta@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026, Xin Li wrote:
>=20
> > On Jan 21, 2026, at 12:05=E2=80=AFAM, Binbin Wu <binbin.wu@linux.intel.=
com> wrote:
> >=20
> >=20
> > Not sure if it's OK with empty change log even though the patch is simp=
le and
> > the title has already described it.
>=20
> IIRC, Sean changed it this way ;)

I doubt that.  Ha!  Found it.  From: https://lore.kernel.org/all/ZmszIOsGtN=
svqbpI@google.com
as an attachment:

[-- Attachment #4: 0013-KVM-x86-Add-a-helper-to-detect-if-FRED-is-enabled-f=
o.patch --]
[-- Type: text/x-diff, Size: 1418 bytes --]

From f38dcc04e334cda572289f05f4be7702bebfc96a Mon Sep 17 00:00:00 2001
From: Xin Li <xin3.li@intel.com>
Date: Wed, 7 Feb 2024 09:26:31 -0800
Subject: [PATCH 13/28] KVM: x86: Add a helper to detect if FRED is enabled =
for
 a vCPU

Add is_fred_enabled() to detect if FRED is enabled on a vCPU.

Signed-off-by: Xin Li <xin3.li@intel.com>
Tested-by: Shan Kang <shan.kang@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/kvm_cache_regs.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/x86/kvm/kvm_cache_regs.h b/arch/x86/kvm/kvm_cache_regs.h
index 75eae9c4998a..fe5546efd388 100644
--- a/arch/x86/kvm/kvm_cache_regs.h
+++ b/arch/x86/kvm/kvm_cache_regs.h
@@ -187,6 +187,21 @@ static __always_inline bool kvm_is_cr4_bit_set(struct =
kvm_vcpu *vcpu,
 	return !!kvm_read_cr4_bits(vcpu, cr4_bit);
 }
=20
+/*
+ * It's enough to check just CR4.FRED (X86_CR4_FRED) to tell if
+ * a vCPU is running with FRED enabled, because:
+ * 1) CR4.FRED can be set to 1 only _after_ IA32_EFER.LMA =3D 1.
+ * 2) To leave IA-32e mode, CR4.FRED must be cleared first.
+ */
+static inline bool is_fred_enabled(struct kvm_vcpu *vcpu)
+{
+#ifdef CONFIG_X86_64
+	return kvm_is_cr4_bit_set(vcpu, X86_CR4_FRED);
+#else
+	return false;
+#endif
+}
+
 static inline ulong kvm_read_cr3(struct kvm_vcpu *vcpu)
 {
 	if (!kvm_register_is_available(vcpu, VCPU_EXREG_CR3))
--=20
2.45.2.627.g7a2c4fd464-goog
