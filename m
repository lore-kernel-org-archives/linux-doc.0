Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795114350;
	b=SzhtL9TNaJxbRABYWCH/x/ddrIRir/gt0sJ4+Jo7qy0haxP3BZeUKb1NcdqgePcR8IM1
	 jAZ/xvg3WK/fijZXn5RK2jGgnIYVJjP6p2DNqZmQPb1Jd0/kypxkLM45wZEO1yuwxyHJP
	 AYvddZXkpqdTz/medsdVX5IlbHwVK25kVNcc8HV2/JZsm3i/AhxfaetWZJq7jLAcDwdlG
	 rhOvzssjq0FLIZkxQ2eipZIRMyvLFtrHIothLvK1+qtitOcjzP6FLxQCjb7Q19AVcOL7+
	 sfr1qAdwDhOujDtnRSweOJ7/+ZS9YN7GZMLNdG8X3XsYZQuMzWfAS3tcHXmeA6IqUGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795114350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Dri93dGf86JD2a4x55noboCN1Q6q179kTQsK767li90=;
	b=ot8x78Fu2J/APd4iuRZO9lVUbQrjQcrQZACfeWRyL18kVSrzA6qFxh5yvRr5KHQfWEZV
	 BEGtNWpyLVWo9fTOEqtMudYTrE1M5kdZohLHcCYD/Ua9WoN/ur6gjTrv/DvNXJ+EDT04p
	 LYgjKCvjQ4wnvEp6c0rrwKzGltSSzshrEHfHg90aQQoFYJZwb8m9mY10YJ7crTOeIKRql
	 DPqEU/alE6hS8atjUqv4epASKV/wxM6QaqyG2G/Zo6JnUBCyAxCUA7fXekSbP7npZgehN
	 ptryYw811jBFMdPZ0XFRIEZhWRzcgbYAWyQikjusxp2+AXaZ2m9bTXQRnEJ62N8pLsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=istjwH1u;
	arc=none smtp.remote-ip=209.85.160.70
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D973960A2624
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 18:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D973960A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=istjwH1u
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-49e5451d6a5so161381fac.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 10:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795114349; x=1795719149; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dri93dGf86JD2a4x55noboCN1Q6q179kTQsK767li90=;
        b=istjwH1uDtIuP/hVh9STL+elAXD+Md4rxfVCQ5xDwA4uMSRilEvwlspwj8AzFZeLdl
         G978XmYe0mQRFfhlnOesU+fCAzp+QZ3FO9/PewFgKIz1u1WKgYh7WPG8Vjf0gOttzYoD
         NBOF9g4VbnMqKLPK7GeFgLN9SJowLI+oCYGaW9vZGYsamZJH0tvKRhELL20EhHTTZ6Pc
         h4jrX5sBM74Elcyi9TsU3tNcTnpEsGxL0RYYJW0Lipzyyr4LJQWztXNR3ezqYZ96degl
         Ylt/s++522lJwdrDmW3ytIGAfl8gqmzBVNsp+CoIDdQCovlZBn3Pd/BEmvcOEk+j0M3E
         6TqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114349; x=1795719149;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dri93dGf86JD2a4x55noboCN1Q6q179kTQsK767li90=;
        b=htH3QskI/6dxZ289fXII8xIo/bzyNdtw1rWEz3C27gjSyLlwYGeypQ42nRYhrrkuzS
         XSu3lIshMUATce+5GsKY06SoZdHdYvvjjfIu9eZSwd9kNJciajpEniddHu/nGZL3iYhN
         B76910rhgTU69l8jMJTNqkwzQISxwmC5ZVNe7Sk0cJfOlrASQWQjdgWQ+U1jgCjcswBE
         taqfYX71D6PKylUeRCXCTyOGkntz+/iQqBw0dY/6ykr6rrPJPpmzIiPSgAvJu4fCaY/D
         3rb99xSVFOCp/Snm3lJYreIeJrIi2LCsYNBI1udBbETvIUqDLL5bznIcGogt2JIQbOSH
         cR/g==
X-Forwarded-Encrypted: i=1; AL+hErEDMY2EA3LLhjiFa29OCyAgxe8TAtVhVq+Av4uPAk1Vz/V77Cgute5rXoAvZRt/GCiocJktje9TuhU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6PhectYtNy/j+8Lv2OnjLcPCfqXu+uzRBqm6gA1P2k4+4yNHT
	hzfHTgI3JmcVmUjAxuH8NzU8ZmQy1PnusQ8cCj+/2ByITSaLyR3ZSdvmcIPuqxdXbtdIyH/kb0z
	TrWNlVRViHlrvSwSbQEJZ7kd51A==
X-Received: from iok4-n1.prod.google.com ([2002:a05:6602:c604:10b0:9cb:3bd8:aa36])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1805:b0:549:572c:fd42 with SMTP id 5614622812f47-57a0bb85010mr976405b6e.47.1795114348499;
 Thu, 19 Nov 2026 10:52:28 -0800 (PST)
Date: Thu, 19 Nov 2026 18:51:55 +0000
In-Reply-To: <20261119185215.632334-1-coltonlewis@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119185215.632334-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261119185215.632334-14-coltonlewis@google.com>
Subject: [PATCH v10 13/33] KVM: arm64: Make __vcpu_rmw_sys_reg() atomic
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Russell King <linux@armlinux.org.uk>, Jonathan Corbet <corbet@lwn.net>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, James Clark <james.clark@linaro.org>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Mingwei Zhang <mizhang@google.com>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Use try_cmpxchg_local() in __vcpu_rmw_sys_reg() so read-modify-write
updates to vCPU system registers are atomic with respect to local
interrupts and GICv3 pseudo-NMIs. This prevents lost updates when a PMU
overflow handler (which may run as a pseudo-NMI that is not masked by
local_irq_save()) updates PMOVSSET_EL0 concurrently with vCPU register
accesses.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/asm/kvm_host.h | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 89683a690828e..103c25001c0d2 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1313,12 +1313,14 @@ u64 kvm_vcpu_apply_reg_masks(const struct kvm_vcpu *, enum vcpu_sysreg, u64);
 #define __vcpu_rmw_sys_reg(v, r, op, val)				\
 	do {								\
 		const struct kvm_cpu_context *ctxt = &(v)->arch.ctxt;	\
-		u64 __v = ctxt_sys_reg(ctxt, (r));			\
-		__v op (val);						\
-		if (vcpu_has_nv((v)) && (r) >= __SANITISED_REG_START__)	\
-			__v = kvm_vcpu_apply_reg_masks((v), (r), __v);	\
-									\
-		ctxt_sys_reg(ctxt, (r)) = __v;				\
+		u64 __old = READ_ONCE(ctxt_sys_reg(ctxt, (r)));		\
+		u64 __new;						\
+		do {							\
+			__new = __old;					\
+			__new op (val);					\
+			if (vcpu_has_nv((v)) && (r) >= __SANITISED_REG_START__)	\
+				__new = kvm_vcpu_apply_reg_masks((v), (r), __new); \
+		} while (!try_cmpxchg_local(__ctxt_sys_reg(ctxt, (r)), &__old, __new)); \
 	} while (0)
 
 #define __vcpu_sys_reg(v,r)						\
-- 
2.56.1.708.g77570a6a1d-goog

