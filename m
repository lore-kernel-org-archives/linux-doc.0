Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795761551;
	b=IKfi6Mj88Rak8VhRDKgwpDMBtDUiEnMdHbkXqGHjnskB/8Ds76IQN3uEZlBjCscbm14l
	 /byJxTfR4o+I+W3okpVJ3YtKEBDdxibCcbOYkv1CO7SOKqukpRZat01bBTJYVU4hQs3CM
	 d1rSajFnaxOmaEGU0Uy1u0OMskFCsPJFjZic6UkTCitpSbX6B+A2z4tg4MplyGkipD+J+
	 m0C81j2qhFI77io6nneaBOQ2nq8ClXHZraRw63HJUotyrO2DLXdwjZVsFd8TlQdHZ94zX
	 anmXgPyTMCRJmtFdvR3QK6wYpzncREo/cqdMoguhyteL7/+vBAf+mgaw0PsGf+DPxng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795761551;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=sZra0TerZldsipBHqTv2P3SPEtapFN7ughUiasP/Bg0=;
	b=FL2Kk71vwu2tEZAk+BPJDuebBbeHxAUFmClshX18zYM0kMbfEaWNplF6fdyXX3XwIfb+
	 3bjW//wpAwIkv2L79pFIINy4VQrR+c7mbwwzcRXiHVteP4c21DfbNDUErXjLAEIYCO5KP
	 j5QcDaPjdYzHsJYSJejlAYuwj75zp2UY5I4db+qKD7+DIAlUmwwMMxW0LcLpukC9+OBXf
	 WVX0yM4Y4t/N4IjMbg4sOD+eUEXJZOXk5uPwqis6HC04uiy98JjlDkJ8JpC1Yoabx1sP4
	 FQeMxiycqQDok2Jk1GRZIJld+GbieHlawKJBiXgsZf3rS/36Wz2RiTLnZ/4QCrOp1pQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gJn55Qyy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101F7606A31C;
	Fri, 27 Nov 2026 06:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gJn55Qyy
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795761550;
	b=Vc02bz1GUABVFi8MnPqPixVakVTViN5frsU9hwfewlvx+U6XOg3pOBmtjyc/jm2fkhMX
	 SCi5FtvGy1qtQKJl0GzWaX4IaT4alMwZNWqeATx6P+KlM55n1RdXcdUwd6hp4ph1bURkP
	 PF+BcIsWsi3V57L+4JjquV87b3n9aZeuxqoPkLiQbcHh+yNfXWccPLaXPxjFEqJ3ojgFc
	 W3K37x6Fo1pTAeYIidmhGYsxgipbLdj0hlOZt582vT8EnrRlxApe6/9w6fMu2t0WoD0oh
	 UGM6nWc6Zhmg7cpmqqqMwSAlWrXTF3LnkjTJ1DFHeQi6PyOwDACDBclRF9d5ck5k4vg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795761550;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=sZra0TerZldsipBHqTv2P3SPEtapFN7ughUiasP/Bg0=;
	b=FI9OzQwd55ofDgtQ/aVzriSuGxkqc2MXEL9MIspDkN+cmoV6y3fHZmtiLE0n+RWcz6o7
	 qQBrkpE8poVzVPdI2ADwVvwtZYCmKh+bHVqRsubEZUPpiOo8UpsNSpnwDD+QauZZJV1OJ
	 LgtQtNSSO+XQfp7TYGwxXgNNSgwkJeWB01EqvkKSDeF+WGAvJd5EVBLV9iniCHK5+u6WV
	 1A2gjq/gS+JrJnE6TGRKgw9zYe0IN6xytmUBg7UizW4pPaYD04lkncr7vssKSO+B6x186
	 WfvRlORQROdTU/Pjr6yN1lAUPKRh8SDe8aNEyV7Hl4IfXi8VvGWtSMjzM8jgGvQFOJg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 15EBB1F00933;
	Fri, 27 Nov 2026 06:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795761550;
	bh=sZra0TerZldsipBHqTv2P3SPEtapFN7ughUiasP/Bg0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=gJn55QyyIb4stKiE3ASfxqRw9o67SeZVvlvtfHjq4dKkujTTe3fysROXdlq1XYpie
	 0ZrpVJlIeSijBLgnndfuqtpEZtjMl/RIkSwd/yxwHH/fDaXJaVXp7+sAuzve500owx
	 JgvFEx8FEe7by/o6r2c4sHEjdzegO+FXKGc7Ht6bZogEmyQdsgPfBBlowvIKMVAz1N
	 7q4rf2IrCh5oZyqaXoaulv1KQ57t4k7KvXww/HWYMftK5VohKqIX+CmoKCljJSrr9c
	 wiKLT+M4KvdaBcTp/DD5ksjC5CYgdGedJX+48fJGn9ZUQJjftl4D9mA1i74VE0GQDV
	 liAT/uAiSKd/Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 365A74B5E0;
	Fri, 27 Nov 2026 06:38:47 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Fri, 27 Nov 2026 08:38:47 +0200
Subject: [PATCH RFC 10/10] coresight: cpu-debug: Print the dump at the
 warning level
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-b4-coresight-cpu-debug-lockup-v1-10-69d3ad1e0fc8@iav.lv>
References: <20261127-b4-coresight-cpu-debug-lockup-v1-0-69d3ad1e0fc8@iav.lv>
In-Reply-To: <20261127-b4-coresight-cpu-debug-lockup-v1-0-69d3ad1e0fc8@iav.lv>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Leo Yan <leo.yan@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Douglas Anderson <dianders@chromium.org>, Petr Mladek <pmladek@suse.com>, 
 Feng Tang <feng.tang@linux.alibaba.com>, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3896; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=GCm7+tmPZo0cIkK8iPjB0jGTJ009NE8OZzHsJ6RWlHA=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDNmcqiXz/09TsGsyPXvvBUfXipd7OoqmvfQ19tR3f7m79
 B535MvZHaUsDGJcDLJiiiwTDmncylhy9a+/h/kDmDmsTCBDGLg4BWAiAf6MDPdqecSNy8X+Py/T
 LEy7fChNt6qdJf33/f9f3TWmXgnf9YWRocF6R198nnRh7No5vtP0RSa8sn51VaNsa3BpUbO4pvY
 UNgA=
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Reply-To: iav@iav.lv
Content-Transfer-Encoding: 7bit

From: Igor Velkov <iav@iav.lv>

The dump comes from backtrace requests, which also happen on a system
that keeps running, for example on SysRq-l or on an RCU stall warning.

Print it at the warning level, like the "these CPUS still haven't
responded" line it follows.

Signed-off-by: Igor Velkov <iav@iav.lv>
---
 drivers/hwtracing/coresight/coresight-cpu-debug.c | 44 +++++++++++------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
index 5c5a1f6a6e33..860c31b4e025 100644
--- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
+++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
@@ -321,8 +321,8 @@ static unsigned long debug_adjust_pc(struct debug_drvdata *drvdata)
 	 * case and print info for notice.
 	 */
 	if (pc & BIT(1))
-		dev_emerg(drvdata->dev,
-			  "Instruction offset is implementation defined\n");
+		dev_warn(drvdata->dev,
+			 "Instruction offset is implementation defined\n");
 	else
 		pc = (pc & EDPCSR_ARM_INST_MASK) - arm_inst_offset;
 
@@ -335,38 +335,38 @@ static void debug_dump_regs(struct debug_drvdata *drvdata)
 	struct device *dev = drvdata->dev;
 	unsigned long pc;
 
-	dev_emerg(dev, " EDPRSR:  %08x (Power:%s Reset:%s DLK:%s)\n",
-		  drvdata->edprsr,
-		  drvdata->edprsr & EDPRSR_PU ? "On" : "Off",
-		  drvdata->edprsr & EDPRSR_R ? "Yes" : "No",
-		  drvdata->edprsr & EDPRSR_DLK ? "Lock" : "Unlock");
+	dev_warn(dev, " EDPRSR:  %08x (Power:%s Reset:%s DLK:%s)\n",
+		 drvdata->edprsr,
+		 drvdata->edprsr & EDPRSR_PU ? "On" : "Off",
+		 drvdata->edprsr & EDPRSR_R ? "Yes" : "No",
+		 drvdata->edprsr & EDPRSR_DLK ? "Lock" : "Unlock");
 
 	if (!debug_access_permitted(drvdata)) {
-		dev_emerg(dev, "No permission to access debug registers!\n");
+		dev_warn(dev, "No permission to access debug registers!\n");
 		return;
 	}
 
 	if (drvdata->edpcsr == EDPCSR_PROHIBITED) {
-		dev_emerg(dev, "CPU is in Debug state or profiling is prohibited!\n");
+		dev_warn(dev, "CPU is in Debug state or profiling is prohibited!\n");
 		return;
 	}
 
 	pc = debug_adjust_pc(drvdata);
-	dev_emerg(dev, " EDPCSR:  %pS\n", (void *)pc);
+	dev_warn(dev, " EDPCSR:  %pS\n", (void *)pc);
 
 	if (drvdata->edcidsr_present)
-		dev_emerg(dev, " EDCIDSR: %08x\n", drvdata->edcidsr);
+		dev_warn(dev, " EDCIDSR: %08x\n", drvdata->edcidsr);
 
 	if (drvdata->edvidsr_present)
-		dev_emerg(dev, " EDVIDSR: %08x (State:%s Mode:%s Width:%dbits VMID:%x)\n",
-			  drvdata->edvidsr,
-			  drvdata->edvidsr & EDVIDSR_NS ?
-			  "Non-secure" : "Secure",
-			  drvdata->edvidsr & EDVIDSR_E3 ? "EL3" :
+		dev_warn(dev, " EDVIDSR: %08x (State:%s Mode:%s Width:%dbits VMID:%x)\n",
+			 drvdata->edvidsr,
+			 drvdata->edvidsr & EDVIDSR_NS ?
+			 "Non-secure" : "Secure",
+			 drvdata->edvidsr & EDVIDSR_E3 ? "EL3" :
 				(drvdata->edvidsr & EDVIDSR_E2 ?
 				 "EL2" : "EL1/0"),
-			  drvdata->edvidsr & EDVIDSR_HV ? 64 : 32,
-			  drvdata->edvidsr & (u32)EDVIDSR_VMID);
+			 drvdata->edvidsr & EDVIDSR_HV ? 64 : 32,
+			 drvdata->edvidsr & (u32)EDVIDSR_VMID);
 }
 
 static void debug_init_arch_data(void *info)
@@ -441,18 +441,18 @@ static int debug_stall_notifier_call(struct notifier_block *self,
 			continue;
 
 		if (!banner) {
-			pr_emerg("ARM external debug module:\n");
+			pr_warn("ARM external debug module:\n");
 			banner = true;
 		}
 
 		idle = cpumask_test_cpu(cpu, stall->idle);
 		if (idle && READ_ONCE(debug_skip_idle)) {
-			dev_emerg(drvdata->dev, "CPU[%d]: idle, not sampled\n",
-				  drvdata->cpu);
+			dev_warn(drvdata->dev, "CPU[%d]: idle, not sampled\n",
+				 drvdata->cpu);
 			continue;
 		}
 
-		dev_emerg(drvdata->dev, "CPU[%d]:\n", drvdata->cpu);
+		dev_warn(drvdata->dev, "CPU[%d]:\n", drvdata->cpu);
 
 		if (idle)
 			debug_read_regs(drvdata);

-- 
2.43.0


