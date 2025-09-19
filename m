Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FE82F3C37
	for <linux-doc@vger.kernel.org>; Fri, 19 Sep 2025 07:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758267524; cv=none; b=gt8MR9by0d7JstkeWVj4wdIJQ4vePE2LLAxsQp4nQGLBPqJgg0kABGW5MDk2bq3fGLcB+vidcMg6+rvovpTkBPlgAk7WvIIBVlVBkoudM4VEyDBO3QWKK/Mt7zx0ordqheEz7ZQVUjpdsvmeHTwAFJTRjbljwPLwIb3BVFc1TW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758267524; c=relaxed/simple;
	bh=B02ziWQmo5WsV+VWudXschLhIhlEAVaMv4vSaAYkoAo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ugz92K6QLQiDOKxUccl59zxsXJCZOhxV/A6EqVgcKrj7BCSm11XqY9/FllKe4nhH584X/lmHpd7mRq0Sj77yIUAF1cflOzzHl3wuj+/XHsJmvevpmeZWLfBrTKyCigwCJGgvMxL1r67upBnaq9nSOsSlUVV6yg3hpUdzjdCUiLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=e6xEdJut; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="e6xEdJut"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-77b2e3169dcso2542880b3a.2
        for <linux-doc@vger.kernel.org>; Fri, 19 Sep 2025 00:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758267522; x=1758872322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nvb+N79+1rz+7OJYvNB/1WfSxRwqST+oSw7w/swSoZg=;
        b=e6xEdJutovv8vBWj0Z1OT1M/IjgwrYJQZaoDRwF4mExF/p3dQ1m30MsX1DK3o1Fip6
         Xj3d2436SVMVXkMkpsQag16ghFVSs7Y4CAxmi1KDRxEz5g769CJR3qhU09cUhVNOU23O
         cgbjf7E7dTGVIAGFm2EdYD8UMG+XI0CkT18iLrUdX4gH1Oy5cXi17keS1bij4eVUOGYH
         T72oAo0/FseOHnapMIAcJXEnkEQBoUyq2+gLxYvWVQda2rZK6fzoiCbaFDqDZl1hvCPl
         Ei1Qw6jhdxBCvYWtPTY5rSftB+bNWl9OukGZUiEKEBskQH570v/+bTdAAf8W3wn0l/yo
         DwLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758267522; x=1758872322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nvb+N79+1rz+7OJYvNB/1WfSxRwqST+oSw7w/swSoZg=;
        b=mJjkXELpz2xmgRRwMeBNtuKlpUZrFLjGmHThbsrOEcKcP65E9zm8rDh2H+3b0peVT4
         r2MezN3ktaYNXtIeCUtc6W9Yrfa4oYMR1Ic0J6fvg/WvF3YmV6Y0Xtb7I/uoHrrBpmFb
         Fnv8WKNnaEUK7sY6OkMEhi592kjZrgPnUVZe4tWfjg2B6McfWM/OjLCOu8ERyEo4Oynz
         syDgGUmGH8tYVkabLkdhko4+pXLwnK+hPEJ572q8UGd0/upmvJ6/4MM7dsbAI9ZNGpQM
         +mXkMhWaOwdD0rZ0cD4fP5CmzewZ1pKRSQS5dZhIFZnBHuU2OAW+MEpjiL5hyzfmbiq+
         1s6g==
X-Forwarded-Encrypted: i=1; AJvYcCUv3MS5/oKwV5+Aku+1OcafBhursvQgMYZBNozF6Z4Hj/YNhbTKK/2vYz2Dh4rTuAe9V0tnqJnilEs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWswczOsb+80rojdRyLWN4InX0KmOnAV7zKDckt5W3OFj3OS1i
	YlhrQZSozLHbhJg8aIYry416UupbOBUq0LRQms9Uk4gAAGfulq+V+Clfacgpe6r2QdU=
X-Gm-Gg: ASbGncukDzPKCEvCCgoT1CEIPmNtC3c835uJStGHjpWrTcaZ4mzxwx/K6Rnz9dObwgT
	m4slSGBZOPifbiXVlzlX2dFzGjWHmBxuHBWVasIjOBNf+/NxOsB39lEVZQCX3VofPENqexLPhu1
	+O+ET83Qc6mvKn2ScX6cu75chc+R6g89LN0/s6cdhMxLu6ErvC8XNj1WAmS1w2BR87xJd4EfFVp
	uB4kdEb38oH30A+gWyfisYq6TS5F6QTTZbcGYEFEJth9nD0rBfmVGgpSrtDJoAWBbvT3zwPvUJ/
	VpJDHFwB6lyOXQCmTJLDaVTzrF7HoWYj3S+Nf4y6CjsGfRpD6qJZGrANlIe32k3rV3jBogLT+/N
	FB6u5BqxUZDHKV9O6mK0/uju8kZbdUf+KArqXCktr4upkiA/cRtXOjMA3vywIa3zimj7hR2AQV4
	LkhX8FGBxp1AvJUbs477q/f2z14CtXpq0fOEtIfGLPQA==
X-Google-Smtp-Source: AGHT+IG/JWbqV8e1pPBSIjwkXI4z09a5l0oBx141z64CDaoUW0Ejq4ZhQwv8kxbRs5Suvs4P3rGR7g==
X-Received: by 2002:a05:6a20:549d:b0:250:b053:53c5 with SMTP id adf61e73a8af0-2927405e4c0mr3586688637.51.1758267521877;
        Fri, 19 Sep 2025 00:38:41 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.57])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b550fd7ebc7sm2679096a12.19.2025.09.19.00.38.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Sep 2025 00:38:41 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: corbet@lwn.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	will@kernel.org,
	peterz@infradead.org,
	boqun.feng@gmail.com,
	mark.rutland@arm.com,
	parri.andrea@gmail.com,
	ajones@ventanamicro.com,
	brs@rivosinc.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pbonzini@redhat.com,
	shuah@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v3 7/8] RISC-V: KVM: Allow Zalasr extensions for Guest/VM
Date: Fri, 19 Sep 2025 15:37:13 +0800
Message-ID: <20250919073714.83063-8-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250919073714.83063-1-luxu.kernel@bytedance.com>
References: <20250919073714.83063-1-luxu.kernel@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the KVM ISA extension ONE_REG interface to allow KVM user space
to detect and enable Zalasr extensions for Guest/VM.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu_onereg.c      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index ef27d4289da11..4fbc32ef888fa 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -185,6 +185,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZICCRSE,
 	KVM_RISCV_ISA_EXT_ZAAMO,
 	KVM_RISCV_ISA_EXT_ZALRSC,
+	KVM_RISCV_ISA_EXT_ZALASR,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index cce6a38ea54f2..6ae5f9859f25b 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -50,6 +50,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(ZAAMO),
 	KVM_ISA_EXT_ARR(ZABHA),
 	KVM_ISA_EXT_ARR(ZACAS),
+	KVM_ISA_EXT_ARR(ZALASR),
 	KVM_ISA_EXT_ARR(ZALRSC),
 	KVM_ISA_EXT_ARR(ZAWRS),
 	KVM_ISA_EXT_ARR(ZBA),
@@ -184,6 +185,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_ZAAMO:
 	case KVM_RISCV_ISA_EXT_ZABHA:
 	case KVM_RISCV_ISA_EXT_ZACAS:
+	case KVM_RISCV_ISA_EXT_ZALASR:
 	case KVM_RISCV_ISA_EXT_ZALRSC:
 	case KVM_RISCV_ISA_EXT_ZAWRS:
 	case KVM_RISCV_ISA_EXT_ZBA:
-- 
2.20.1

