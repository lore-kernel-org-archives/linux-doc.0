Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795090192;
	b=SfEDeL14vQkOwryzDeqclqWYDsca1H27hgmYS2VvYSCTpfhC3k4m4i3bi+Tdw0x0Wd2R
	 Io+Pei+3CKmJU2cdXcceWcfO4u66Uo8pwd17DPpF/P5zezjVhlnOIX/c11ru63phnALFr
	 SN1hf6vo0vjiUhSt3zDuzzausDeQK2OZeZdL808QXGKa5v/0ePjjc4evb44mB+K73kfVH
	 OGtwgVWEWWMm/nN4yNqvmC6QekGDVQJmjSU7uqT34buS/xZ0RFmZek/Fg9awPRUlRx+Hs
	 HR8s1EAeLZqLOXsnGUDkKmsqy88to3eln25Tlln7x+dZR2hqsRgcpab/OmrT2BZDXig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795090192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AcX7Wqr/NNBAMKWd7VnVp8UuB/cxD1Kkn3PfU1E+a6g=;
	b=Aw4ga5+a1AQCz513l71S/m80FD7zrZHO7hCYmaqO5vk/zpfmRrx8ve2HM1Ux1p9pbEWk
	 VpZZUznAXA4P8JkkobU5Sc+9VyvpBrjtky4FbX4LEkNe+vLuzbxPol5+ZXckK8XtR6CxM
	 wqRm6qYpEwHaSAaClqaAnuxN0F1KZmHXXF43pqYtz6ZvA/BRKY2o1WY41z5ZZTGo28vPb
	 cCq7iyZaB/iszAzK2M8/2WCEhbc/LsMw7r97EHGGCK8HBmaloatAw3R1PklVmsMOwrIhE
	 enHkDm+AyevPt323kPu8h+vPiS3iA7DhkC3pHGgConi03WbXJsJ/qB/gvGGMJH+IWZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b="i/y7IcXf";
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11A5606A333
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 12:09:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D11A5606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=i/y7IcXf
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-14394530ec6so3300177c88.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 04:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795090191; x=1795694991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AcX7Wqr/NNBAMKWd7VnVp8UuB/cxD1Kkn3PfU1E+a6g=;
        b=i/y7IcXf0zwGemgiNsqbgyLlyIpCBg5BrC6MYRFbLe0zMMYdR8CPiUInf+YtUvRT9B
         aS4uZ8O9wweMkDuRslNIlBBlX82ZeDuEOtJCA9YrxpD3blREpKkin/J+UDO9DSEUPYex
         Cdk3dIpVaSuZRKs+RJDPkVA5U64JWxulVXNjSTwbfq7S56j9A7IFy3SI9jesgcJQg/9H
         vszmXt7E3onYqEHwJckgW8fgPKNcSdgQ2BVKtHfsAJRft3COEMgzzgfAOIxeb6ZBmkQU
         tyBVnCqpSyAO4MzmPBgjynxwWdvW54oY1zvkPBoyh5eVbJcy1eUWJR5yBmK3ktI5ZJE3
         09Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795090191; x=1795694991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AcX7Wqr/NNBAMKWd7VnVp8UuB/cxD1Kkn3PfU1E+a6g=;
        b=WaumpHb9nCvsn0Sd1zMAMoxygQsBaJYh71lX376kMItUBhofweRN/5DYdDwpTx3jEJ
         qAschNd65TN8GvTGK2BOQcWT56weSiR0WVsxvXbyti+4OcSJfaKU9kTKYet4jPBe0ZOM
         k7N0fCWa+tTQmji98p1YrcN8liKoqtRhmPot2AqRAsII/MPuCP3ACilaiPwc7N0Uy9Ya
         4/nugQGFLSNNdHh/yJ/HfWVYsYQllqajtAyFHUJk/Rb6Rt0K0cFs0tyVkoRvqdG/xO4p
         L1QMZ7UMRgShXgFwY8dIZZnT6HdrTFz4pKZUFPXBGqVGY5ficQR20qOV1NqLVyM/r8DL
         qZgQ==
X-Forwarded-Encrypted: i=1; AL+hErF35osqA0VnPT/8QdCjNtZkicTPaZPg/z7j22XxFIBjvkVEiEPJGVQ/gNJAIhwWJYkm+uQ1jhNWeCI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8B2rWrYxTF3suGGC7pegwwUKS/fy2SYkvn2iYGLrdOYeKAcfFR
	FBpNSxT8Lsdn4dY0wYmiQjhNgfkKhgYmlf7lqSd6PvITKexT306soJGnF+r03/FvhsY=
X-Gm-Gg: AZFdTZc8Mwt/LyjanwV+UIvNM8YIIChx/KOTnBCup+p1mUn/e9tlt24Wx+5doY/lZ/O
	2sieBSVLXk9Pm8dMT8afffI23d7epa+e00Ee3GStA2pum3xsXJL+LzAeXlMYurXqdvgPgZjPfLS
	ay3mv1FM1M5nXFBv4wYY7ZfIm2mGLy5Pfw9WOXKdcPuH41UHCmiYrdb2Dh/469uhQZWZeC3xKTh
	vNWxRykYEy0wa5JNESn3UKHK4uvtFSWOmtZtmlCyaPnxez1YcOHlLc1IdRWpFV8TxrHejQ9xNDq
	swIhIONPFF6u/kDiRmK+Jn2AtmfGmv//uvEaZBD6Dd8YpOpZY2BAbr8vlWNs4u7fsH8jcmtbEAG
	+SKboj8DVPG+M6Hz5n7lybKrovoCgmnWCVk79K/zUJYiYQeEWcoU0ODE7Vjitpt0HfwLptX1KJw
	Q4L33X7+IHV0ImyErZFtKEd3vlc0GjsgdCg50yKpFy/PBUP/5jjn0qC3zBw91zGVJ0qYPeHiKzg
	EljGiyooYAsHQf7/EdHXzKsRFQUxNAgj/kCEaAkv8k19aQxmaqy6g9srjAPif9vDbls6MhGuCwo
	Dj4bXqvZxX/9aIA71WiVP5PBTeA5tjoxdu6/+QpskHVymJSKj7onREjCNWZKJfFl1T7Er69/LMs
	OG+3o2nc=
X-Received: by 2002:a05:7300:8288:b0:384:6487:b155 with SMTP id 5a478bee46e88-3846487bba9mr1500897eec.29.1795090190796;
        Thu, 19 Nov 2026 04:09:50 -0800 (PST)
Received: from FJ7FR2JRQ3.bytedance.net ([186.240.245.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7bc05cfsm17604650eec.26.2026.11.19.04.09.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 04:09:50 -0800 (PST)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	himanshu.chauhan@oss.qualcomm.com,
	conor@kernel.org,
	anup.patel@oss.qualcomm.com
Cc: clement.leger@linux.dev,
	cuiyunhui@bytedance.com,
	atish.patra@linux.dev,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	will@kernel.org,
	tglx@kernel.org,
	corbet@lwn.net,
	rdunlap@infradead.org,
	shuah@kernel.org,
	yuanzhu@bytedance.com,
	yang.susheng@zte.com.cn,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhangzhanpeng.jasper@bytedance.com
Subject: [PATCH v13 06/11] riscv: enable NMI-safe lockdep irqflags tracking
Date: Thu, 19 Nov 2026 20:08:30 +0800
Message-ID: <20261119120824.13969-19-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261119120824.13969-13-zhangzhanpeng.jasper@bytedance.com>
References: <20261119120824.13969-13-zhangzhanpeng.jasper@bytedance.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An SSE handler runs with interrupts masked, but can interrupt code whose
lockdep hardirq state is enabled. Bare nmi_enter()/nmi_exit() do not
update that state. Consequently, lockdep_assert_irqs_disabled() in the
perf overflow path can report a warning despite interrupts being masked.

Select TRACE_IRQFLAGS_NMI_SUPPORT so lockdep can update its hardirq state
inside an NMI. Pair this with irqentry_nmi_enter()/irqentry_nmi_exit() in
the SSE wrapper: these helpers save the previous tracked state, mark
interrupts disabled on entry and restore the tracked state on exit.
Selecting the configuration option alone does not perform those updates.
This follows the entry helpers used by the other RISC-V NMI-like traps.

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 arch/riscv/Kconfig          | 1 +
 arch/riscv/kernel/sbi_sse.c | 7 ++++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d2db8f40c616..5501c02a07eb 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -225,6 +225,7 @@ config RISCV
 	select SYSCTL_EXCEPTION_TRACE
 	select THREAD_INFO_IN_TASK
 	select TRACE_IRQFLAGS_SUPPORT
+	select TRACE_IRQFLAGS_NMI_SUPPORT
 	select UACCESS_MEMCPY if !MMU
 	select VDSO_DATASTORE if MMU
 	select VDSO_GETRANDOM if MMU && 64BIT
diff --git a/arch/riscv/kernel/sbi_sse.c b/arch/riscv/kernel/sbi_sse.c
index 032fcc07abcf..59e47a39589d 100644
--- a/arch/riscv/kernel/sbi_sse.c
+++ b/arch/riscv/kernel/sbi_sse.c
@@ -2,7 +2,7 @@
 /*
  * Copyright (C) 2025 Rivos Inc.
  */
-#include <linux/nmi.h>
+#include <linux/entry-common.h>
 #include <linux/sched.h>
 #include <linux/scs.h>
 #include <linux/bitfield.h>
@@ -36,9 +36,10 @@ void noinstr do_sse(struct sse_event_arch_data *arch_evt,
 {
 	struct riscv_sse_interrupted_context context = { regs, hstatus };
 	struct riscv_sse_interrupted_context *previous;
+	irqentry_state_t state;
 	struct sbiret sret;
 
-	nmi_enter();
+	state = irqentry_nmi_enter(regs);
 	instrumentation_begin();
 
 	/* Retrieve missing GPRs from SBI */
@@ -84,7 +85,7 @@ void noinstr do_sse(struct sse_event_arch_data *arch_evt,
 
 out:
 	instrumentation_end();
-	nmi_exit();
+	irqentry_nmi_exit(regs, state);
 }
 
 static void *alloc_to_stack_pointer(void *alloc)
-- 
2.50.1 (Apple Git-155)

