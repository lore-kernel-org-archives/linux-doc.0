Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793158341;
	b=G+I/8psMeUP6l6Y04M9DiQXR27h5jWCBIJ8+/x9/sWf7E298UCfFtRqsPuAK73qADc6c
	 CBLQnVVZBtxy3swtuu5BNssn5eoND46+NuHbFx1rbFrxV0mLrxkmFv0vLVMqZfX1G22Hu
	 66OInfORTkZqR40sCC6GiLZIUKa6POiAzuSc9RqBMHB8xBF2bcLgrO1ZYWi3Jc1KhepuM
	 i0xsvub9+DK9UoM3bUgkhJ8hbKQpvEp0ypK/NHYhdbm31IwS5A4/o/8Onw241Xm2LE+9q
	 KFiJMrAIZDgYYrR6nIq5zHNrsDou4ftIQY0TX/Ipi2Kq4xWs1W3bJnE+3YwVWc9rJMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZR3iK/21HRL590OT/HWs7TggzA8Gmahp8IuVcPxIo1I=;
	b=oUfwr17TuSeJTpL5hoqFcVVnmftV2eNymi2mvzGCJ6f7f5l/bkgKsT5JqRR6OBmyjHNQ
	 YdEBjwDLLp+HZun4CPAO2ICEBeMjEOzmIVhDY15cQnnh6j8rr4AS4cyNTj6BmCPEuLOjh
	 g9l1CEdHYB2EFWO6njSZzxXjY7DloXHORxLAqr54FPDXtl+WuBOMVKcRCAtbLaocF1iwY
	 fDZ3QsPmkUOh5pCTIjzYQbTayyc26WC6TKB/zxa5ELnzQjztzjJlouMu2pjtTeZgCeFHz
	 W8zkUHuUpnu3wu+z/C3eKs5Cdc08nM0iBphaizVD41/5iowT0p0a96yQuJrnJmecnyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Td9F3R7p;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C590606A32C
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 03:32:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C590606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Td9F3R7p
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so949585e9.1
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 20:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793158340; x=1793763140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZR3iK/21HRL590OT/HWs7TggzA8Gmahp8IuVcPxIo1I=;
        b=Td9F3R7pKt9XoyGMCk2tSwEFepXc6mG0UKbjwl4qrQPGswD12MrUnQNew0T0VRdVx7
         Z0ASLPwsJAX6QRsg5D6z23EVXQ2Ij7jQvCFtTbdkbwv2ZLCC/x1dqh6Bf1tgIJW8y3zf
         K8R58PTVmwPzqGUT4lIFqDjBHVlL3f8McSL/ryhcPxOO+n36Tl/svJ7iBjqTIdlIDe8S
         YORIEupvQ+PVliBwnBmNTvqvHz64J9V4C495f7Pv297tROUMULxaTRDp6OIyJPGQsbeg
         6UlwdRVZsD3MQN95UOXuEcpKM9WBvg4sTUemDgeJMG5zEst3NYtyD0tLqVDiikRt2uiG
         kmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158340; x=1793763140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZR3iK/21HRL590OT/HWs7TggzA8Gmahp8IuVcPxIo1I=;
        b=TcWlwImPO26/dwtL0W4HqljeMuekyG2PWEH1fLc1WlK7M1eV+KYD6t5P18BlKfFRI8
         OBZoMYbc3Emt3eliCPIRnih4ZivmOuuetTuYdcXlN1W5cLj+x8giwSpT18tXfvBWqFfM
         A15SOs92Eal/LfbyBfbSjlT1xZtKAnoQTBc3wJVOafQ/JaUVZjOp0YjDFpvXTxwtWspE
         B9u3CmDqaB56Pq3aRk0g2AxCPjCPTHghoxy/oQbK8FZPdQJdmRe96pzLL5MZQNtu7b0I
         8xJD+Bzi/NUFpC0QYlza5SJYiNRV5X7izY3LnzcdmLmpNwXXcW/VTGAN1gmJESKi1kbk
         WlfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLP/NBTlLqY3YGzNIqYC1boI8nkSsy+SIPIZyG1fOyApcNtc0El5mcCgt0Ir3wSJ/EzClkIocN6wI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCB8XIFoFXfXhF1qm1wyClrHeHdn2x7+dGYrMOKlfRSmmTAqTN
	ACZholu/30zfmsFEDR29Y/K1+j4HtzNlZYjnti0zH9KEK/HzWjRLaE6B
X-Gm-Gg: AYBFou2F2QmEU6JQqcSgQlrYrzrO9WYDgfVXLbS5AQ6VR1kPnjz2Mq4wP1vII1AdY8e
	fOnn23xVixAhNgdBbJAgLSuCWMmVT9pFBjLvGPAxJgLgtmYCDYY/hysOipy2AhcF0A5rqDXMP1A
	fO52XEBQFDsoX4YRqJh07KDu4aEXovoptXpTA9xmdsWEksEaNu9gKKza+Q1zaVoH6COon7mUDgi
	W0aLGT7Fml3d2lLEbtCyM/XkCNAQ9IX78R2MJZl9JgaB/iL8d7sKWrgRvj+8LcZ/9Al/4Mgk7Wb
	UXU4us0HDPPjmV0PzDYIyYpn7XvJS59KIofbHOnmRyRMx2Mllrh80ySjFdRrud+KIslS2DIXuFt
	GBDQSaFivnuR9v1z0RjJQ8PK8xK8Qqk1L8++eKAwIs7Du1DJI2WWVMkSCgOIM0Z05JESdQVWNSk
	wuHMSWebpowfOvJP3WRBe4ovMXMArMWA64IijdDSzVOKHJLWEtxRkh2Hd1gDK7qJxMoccxuaiDq
	WD0weZ3oaI/kfjFZN2uaImG4woNB3oTD9yXeIiHUb7TTa+mtEDByqU4bBw11kyF18YmW04lCL5H
	ZxiU1Op5pUZrjT2AAub5CNOcXgMOBp5Txu5vcztewPYgD6fKSs6UHzN0iTbgQwDQ146E7QRO+NG
	B/EB/nB1/dCB+rVVM84dEkRIpCdNNHuRfgTruzx3bI2LYpdLuakCveF2VEABATVJ6Jzv2aLX4w2
	iULc54t5MPFFAvh+HhwEADPbSkc8b4gTWU
X-Received: by 2002:a05:600d:8641:20b0:4a2:10d:5e0d with SMTP id 5b1f17b1804b1-4a7c58f389cmr88355155e9.14.1793158339700;
        Tue, 27 Oct 2026 20:32:19 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm24290569f8f.56.2026.10.27.20.32.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 20:32:19 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Hongyan Xia <hongyan.xia@transsion.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 13/13] locking/selftest: Exercise hardirq return-tail preparation
Date: Wed, 28 Oct 2026 04:31:27 +0100
Message-Id: <20261028033127.82193-14-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028033127.82193-1-kmehltretter@gmail.com>
References: <20261028033127.82193-1-kmehltretter@gmail.com>
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

The return-tail lockdep preparation must see a live hardirq context. A zero
depth must fail. Depth one and nested contexts must pass. The ordinary
preparation helper must continue to reject a live hardirq context.

Add focused boot-time lockdep cases for those four states. Skip the final
IRQ-state transition after an expected preparation failure so that each
failure remains attributable to the preparation invariant.

Assisted-by: LLM
---
 lib/locking-selftest.c | 53 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/lib/locking-selftest.c b/lib/locking-selftest.c
index c3d976c801bb4..7e26b757344a4 100644
--- a/lib/locking-selftest.c
+++ b/lib/locking-selftest.c
@@ -222,6 +222,55 @@ static void init_shared_classes(void)
 		local_irq_enable();		\
 		local_bh_enable();
 
+static void irqtail_prepare_test_enter(unsigned int nr)
+{
+	unsigned int i;
+
+	local_irq_disable();
+	for (i = 0; i < nr; i++)
+		__irq_enter_raw();
+	trace_hardirqs_on_prepare();
+}
+
+static void irqtail_prepare_test_exit(unsigned int nr)
+{
+	unsigned int i;
+
+	for (i = 0; i < nr; i++)
+		__irq_exit_raw();
+	if (debug_locks)
+		lockdep_hardirqs_on(_THIS_IP_);
+	raw_local_irq_enable();
+}
+
+static void prepare_irqtail_0(void)
+{
+	irqtail_prepare_test_enter(0);
+	lockdep_hardirqs_on_prepare_irqtail();
+	irqtail_prepare_test_exit(0);
+}
+
+static void prepare_irqtail_1(void)
+{
+	irqtail_prepare_test_enter(1);
+	lockdep_hardirqs_on_prepare_irqtail();
+	irqtail_prepare_test_exit(1);
+}
+
+static void prepare_irqtail_2(void)
+{
+	irqtail_prepare_test_enter(2);
+	lockdep_hardirqs_on_prepare_irqtail();
+	irqtail_prepare_test_exit(2);
+}
+
+static void prepare_regular_1(void)
+{
+	irqtail_prepare_test_enter(1);
+	lockdep_hardirqs_on_prepare();
+	irqtail_prepare_test_exit(1);
+}
+
 /*
  * Shortcuts for lock/unlock API variants, to keep
  * the testcases compact:
@@ -2934,6 +2983,10 @@ void locking_selftest(void)
 	DO_TESTCASE_6x2x2RW("irq read-recursion", irq_read_recursion);
 	DO_TESTCASE_6x2x2RW("irq read-recursion #2", irq_read_recursion2);
 	DO_TESTCASE_6x2x2RW("irq read-recursion #3", irq_read_recursion3);
+	DO_TESTCASE_1B("IRQ tail prepare", prepare_irqtail, 0);
+	DO_TESTCASE_1("IRQ tail prepare", prepare_irqtail, 1);
+	DO_TESTCASE_1("IRQ tail prepare", prepare_irqtail, 2);
+	DO_TESTCASE_1B("regular IRQ prepare", prepare_regular, 1);
 
 	ww_tests();
 
-- 
2.39.5 (Apple Git-154)

