Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D022D77F2
	for <linux-doc@vger.kernel.org>; Mon, 21 Jul 2025 12:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753102460; cv=none; b=Sj7+CPtVA8Io58UR4FptDFc+sKaffzvHWXbHbEYtM7KBl7W0fv64duQ9unR45pBkMIF/3CELfFGexDbCerqTiBBfwQaDmpxC3gAYcnqsiNR067noDmWObSVdQendZ3tC5kKnQNFs12Ey/1ZWts+328TU/R52VPvLoPbiY50Xcuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753102460; c=relaxed/simple;
	bh=YxvmYpOV+737fyfcSQi4SIm2ZMFnBONYtUfp6vtMhrI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qq5oQA+dRN5qxYl0t7gEIejGa2sIkwDN+7PDdYVwOxDbNKSgeFDqMCSRIUHRFEENZ7BhuNp79obIr5oD8L41EmPYneOqq9oAgERuVkgaHWOUPt5ZlRHod3+GJLrx+qKSHLUDD9qjj5+l9BSTOOa2WC3XkZHprLqBEPtQlqhLR4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hblcpIbX; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hblcpIbX"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45600581226so44955795e9.1
        for <linux-doc@vger.kernel.org>; Mon, 21 Jul 2025 05:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753102456; x=1753707256; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jJFteMx4M8CuvuwGOOEAn5xVwGW4RJ+pfzFY5hwg8co=;
        b=hblcpIbXA/mas6RnPSYQCu5EBpYi88Pbi5EKFdR71tlI64dg9eV/4CciBaH6XFYfyM
         E7brlzfprUxin4K/GYaOATNaJPxrqTLYFGR4jFGvwuwD7KBkSqrBtT0hi0YrUMRFq0ye
         9xqAUgLQScA2Dp82S+7113XCA+vw5iYBYXwZIDAxKeDRlhUBiF6fo4zBkwbYUhbliMJd
         ZZz+gOCR4pdX+VqDaDpX+1cFqgPq9j193h5DFBfEz/l98toQeO16kTmyiuiWocP5wHlS
         HGQ/8+FWWseaxxvZ8s2uqUOQ6Gx0RI1fw2Oy6Wk5wczHJXuV9ahFq/s/rLsrHjwjREtc
         0O8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753102456; x=1753707256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jJFteMx4M8CuvuwGOOEAn5xVwGW4RJ+pfzFY5hwg8co=;
        b=m3ekOyUt4WMXxUps59j89ucQlpniXURwKGNxjjYQ2s74Mxc9JJfpqhVeOioUQET9Tp
         c/2YwXiv5VWSrEnEkyaCZZGLcoX5F6q7M0zGqgGe6cQFBFJyJvQBSOzU9hJ8rIoK65w2
         tdU+KNkvD2jnp+0MxbfmTKnaUIS4VryAunQLNhXvaG9FWNQQdZUzzNCnGuqAt6B7urHr
         OvN8/7+uS0wwkkJb6yfxzGs0KUqEi8PRVfyseox2bJJ63FiDJXBtrxKsAn+frobsR4a0
         2v7kjqzwYMIKUl+Ec+zqoPQJAm/L1LZ3wZU8jAoP64K3qvriG5GsyUUbGCTxlagEquTs
         rQtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUY5TRnJP3U/jdkAMA4tDi2JJQ9yR+LLGw/7gmAzxWKMGppsZ2JbR4vOoa8krhSkkjtUYiu7FDcPLE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvYiPPTjGSKylVZxjWSqxZrzHE4XLFbyXA8duAy6a86cej59cT
	q/OvBLUWydl6YZgUDIn+MHU6aVwzfYvxnpn/o/RWxoDbyXTdvUqDQ5QfAKfisOUEuU5xO51SyTI
	+/giukOY=
X-Gm-Gg: ASbGncsJl06zd+GAzQ8Z/stMRWwAb138vGrQGNWFlyWIiht/yK1BRS5Nbm2gIIXYxY7
	zyz0N/hjJTL1TmcCNc3UZcMXj4n/MJ9Q/g+TMkJ+Il4daBSmNIXZrGwEugri//Yv2nVS2Wlk6im
	YlfOoKGd7KpWabRQ1i9Ith/o+Cm/Z6p2nzb44TFtKowLuxB9HT+AsX7XnBonhmEzE7Src/X5E7x
	Euj1n0sbuOgdmlcg01vkl+a9zEPcE+houlXk59lmTjVlpLcgozaPmV1n5x6giWIHmoFP9Enl7zC
	gWTY8u68vl1NMXn8XvgdQKCVTbRvKkpIewXbbQRDSFa0twfFlKID23nj20BtG95R3+cE2gqu3YX
	OAe5JU5To9dcKT5nDnjWEeN7TH6fQiEY=
X-Google-Smtp-Source: AGHT+IGmbQWssAINXf1JMCsxu7iT/5v/bYbxuFsBy9x2nb4iGuog7PTzyHokdJFF6f22G9q2Sa/2qg==
X-Received: by 2002:a05:600c:4f91:b0:456:25e7:bed with SMTP id 5b1f17b1804b1-4562e23b6a5mr208680525e9.14.1753102456271;
        Mon, 21 Jul 2025 05:54:16 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4563b75de26sm98995225e9.33.2025.07.21.05.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 05:54:15 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 21 Jul 2025 13:53:36 +0100
Subject: [PATCH v4 05/12] arm64/boot: Factor out a macro to check SPE
 version
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-james-perf-feat_spe_eft-v4-5-0a527410f8fd@linaro.org>
References: <20250721-james-perf-feat_spe_eft-v4-0-0a527410f8fd@linaro.org>
In-Reply-To: <20250721-james-perf-feat_spe_eft-v4-0-0a527410f8fd@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

We check the version of SPE twice, and we'll add one more check in the
next commit so factor out a macro to do this. Change the #3 magic number
to the actual SPE version define (V1p2) to make it more readable.

No functional changes intended.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/include/asm/el2_setup.h | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index 9f38340d24c2..2bb0d28952e4 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -103,8 +103,7 @@
 	csel	x2, xzr, x0, eq			// all PMU counters from EL1
 
 	/* Statistical profiling */
-	ubfx	x0, x1, #ID_AA64DFR0_EL1_PMSVer_SHIFT, #4
-	cbz	x0, .Lskip_spe_\@		// Skip if SPE not present
+	__spe_vers_imp .Lskip_spe_\@, ID_AA64DFR0_EL1_PMSVer_IMP, x0 // Skip if SPE not present
 
 	mrs_s	x0, SYS_PMBIDR_EL1              // If SPE available at EL2,
 	and	x0, x0, #(1 << PMBIDR_EL1_P_SHIFT)
@@ -189,6 +188,14 @@
 .Lskip_set_cptr_\@:
 .endm
 
+/* Branch to skip_label if SPE version is less than given version */
+.macro __spe_vers_imp skip_label, version, tmp
+    mrs    \tmp, id_aa64dfr0_el1
+    ubfx   \tmp, \tmp, #ID_AA64DFR0_EL1_PMSVer_SHIFT, #4
+    cmp    \tmp, \version
+    b.lt   \skip_label
+.endm
+
 /* Disable any fine grained traps */
 .macro __init_el2_fgt
 	mrs	x1, id_aa64mmfr0_el1
@@ -196,10 +203,8 @@
 	cbz	x1, .Lskip_fgt_\@
 
 	mov	x0, xzr
-	mrs	x1, id_aa64dfr0_el1
-	ubfx	x1, x1, #ID_AA64DFR0_EL1_PMSVer_SHIFT, #4
-	cmp	x1, #3
-	b.lt	.Lskip_spe_fgt_\@
+	/* If SPEv1p2 is implemented, */
+	__spe_vers_imp .Lskip_spe_fgt_\@, #ID_AA64DFR0_EL1_PMSVer_V1P2, x1
 	/* Disable PMSNEVFR_EL1 read and write traps */
 	orr	x0, x0, #(1 << 62)
 

-- 
2.34.1

