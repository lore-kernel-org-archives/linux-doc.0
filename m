Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795761545;
	b=la56DKxEyQLvVoFg7AYTcw+6zCLR1cBiVlOEjUNOWDW8Ruasp6gK+GcMXilq1ywxnz0Y
	 T57t7iKufDHuUc/473VvG1jkI4yFyHg/3WHOa9ZNsUvV8OPP+H79HlvQ/Tdc5c/FuWwIx
	 PFgvk42jgV7PsildvL9hc4Fm6IywSycVrmAJTRC4G7CxIQjre2dl+jUyUFtdf7m11r70k
	 HxsSRy9BgQYlwIq0QSc9cNqXD+5vYPGGwlJPH2G9WV6fkxBILuQBCv7onlADaeftucZAP
	 FL3JxEfrNln4mAK+3rHdjsdlRGDM8VOs5WrxUb4Lu/OfugVn0PIXLG8YUb11P6MkZNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795761545;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=QMVYWj4bXlkZEY5osWZHFiVPY11NYOtrpFxkEUnbsig=;
	b=Kag+CERR3OKWmBLriim2wfLrXQ3A5Io/tk+SZ9pobAuLlGp/Tr+iu9yhJtNY1zl+c9dU
	 97c1rGMUToNCkO/tRZ2Xcptp1OeiEr6Tc28c8wQLfSyONKKUrY1NDj3XoAw7/N7JfMIAv
	 efKSLF3S16Dv6Sz9uZ0sGXCNEmZLEDYFPcqLT3d8t/6HDB8P8A1VyaM4xoJ0tpDjlUcjO
	 71YHZokv6TZWvPQ+B8xurSThKiDCsdhIpOvNSBsttSn4s1Y4kU5jcXhQY7MZXV+2i5Zs7
	 0oBVvOpXuzwwHsWc424DDAn/UYXl2x8H1F0lZFun9bjQ1KcWu3W6CsTP9EjJi+Clngg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nlNdl11d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2117A606A329;
	Fri, 27 Nov 2026 06:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nlNdl11d
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795761544;
	b=IqZHV9oOQlvU72sIHLjaHggl85RZGdygFqW9/i10ofJsBsHlyazP63v/hmSQNETnR/nw
	 vOKVbrNnsJNQBWTDE1TXfBtOsnnuO3TJdJef2TMTTW6aIyPF8SbDz4BL0hj+cRIq+ugFW
	 +gb6RFb4rMOVxuVgQX/COs/tLnm5D3zP4PmBa47P3o1z7Cr7jMt6SILdkIhcQSpTUjWQ8
	 MRx+wS6zqjPjMdkm4yRPEyhIN0SezXQn/vYX9YGh/rvn3mF3sEnxoorcvH0f6oJdYDulz
	 qbKF8xKn+84eE5wYbz/BtK+EWGKzJqTkmEJDGFinL/Oycf8XFsbBr+UltDvNSGbm9og==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795761544;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=QMVYWj4bXlkZEY5osWZHFiVPY11NYOtrpFxkEUnbsig=;
	b=tHotIQBJccm+UfH2BNkAG97HrpC0ZnRTfzyWCG4Hd+58a7KomozdzhxYkVN2K6Sp63Z8
	 gd4rTGd4iJQO/Wo2mBz2/YI4RGJlFdctfnYU/5eFPReV/4CyRta0n8vnW0uSPOUfIsvZj
	 lDsXuAXM5NjCZxNBwEDNaZDCJIjVCZUc6IAmJSsztY4B1e7D+11RBcnP7G3dcJ9tsJXWS
	 ioLKlwanxvMA0yLqDHIvewqiKuGC8lniRzbYFHI4r45FmKqYE6GnTtpF8M+LsH/SyF19o
	 bQmHbOTjtceo9u2mWJXYKI95Q33rW5FnkgtHL1EeSPM4zmLsECR5KnFgkbMbRoVTHeA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 12AD71F0089B;
	Fri, 27 Nov 2026 06:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795761544;
	bh=QMVYWj4bXlkZEY5osWZHFiVPY11NYOtrpFxkEUnbsig=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=nlNdl11dgwxet4s3nqSL17uio0jHoV9xg2pdk82pRoNs+sksrIIaEp2A8Jvwo+Yvc
	 P65I1R/RF+PfIstoZ73A8FLcvP/wO91epxelI0l3THfQMCkuStW60+eFFFubyMlyvY
	 xAAyUyDHPOG2g3NSNnq5zSkJljZW7QZTnClmrJAotyaGqzMJjiAiO2ZbaxBoTWSvsB
	 FhIzYMzftgzmtt4IH3uq+edHOrtzdyhCju3x1Ug9tqsTlet49lw7NClGIXjGt1eEnC
	 IVkaid3ypTUG07fzKyA0ZWHwsA/37YPpzWoboeQIc2XjYaweBoDqdjgIL/fT8jopUH
	 AR/IcJOL8ipGA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 852E84B5CC;
	Fri, 27 Nov 2026 06:38:46 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Fri, 27 Nov 2026 08:38:42 +0200
Subject: [PATCH RFC 05/10] coresight: cpu-debug: Do not sample a core that
 is in reset
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
Message-Id: <20261127-b4-coresight-cpu-debug-lockup-v1-5-69d3ad1e0fc8@iav.lv>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3674; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=tmVd95P84NWuwX8kkEkvDAkpADpu+/ySXwvKuYqsquA=;
 b=kA0DAAoWMpeVi+pfeQMByyZiAGsJJXKg9FySgRgbmMFUWOvWYE0orsAY00k/u3+touPMlk4B5
 Ih1BAAWCgAdFiEEkMIo2mik1f1PSDfgMpeVi+pfeQMFAmsJJXIACgkQMpeVi+pfeQMN1wD/UpEA
 FZm0PvjJa04cuKMqqOm4nD33RYPU2BkA8Wmw6EUA/1/s6XKuTmM6gF+QdwdvAb1B58oTyOLXyNZ
 t1hM4TAoG
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Reply-To: iav@iav.lv
Content-Transfer-Encoding: 7bit

From: Igor Velkov <iav@iav.lv>

debug_access_permitted() lets the driver read the sampling registers
when EDPRSR shows the core powered and the OS Double Lock clear. A core
can be powered and held in reset: an idle Cortex-A72 on RK3399 reads
PU = 1, R = 1, and a read of its EDPCSR aborts.

Treat a core that EDPRSR reports in reset as not accessible, and print
the bit in the dump.

debug_read_regs() writes EDOSLAR before it reads EDPRSR, and on RK3399
that write already faults for such a core. The check covers the path
added later in this series, which reads EDPRSR first.

Signed-off-by: Igor Velkov <iav@iav.lv>
---
 Documentation/trace/coresight/coresight-cpu-debug.rst | 4 ++--
 drivers/hwtracing/coresight/coresight-cpu-debug.c     | 9 ++++++++-
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/Documentation/trace/coresight/coresight-cpu-debug.rst b/Documentation/trace/coresight/coresight-cpu-debug.rst
index 32fbae244524..04bfd318cb2b 100644
--- a/Documentation/trace/coresight/coresight-cpu-debug.rst
+++ b/Documentation/trace/coresight/coresight-cpu-debug.rst
@@ -182,12 +182,12 @@ Here is an example of the debugging output format::
 
   ARM external debug module:
   coresight-cpu-debug 850000.debug: CPU[0]:
-  coresight-cpu-debug 850000.debug:  EDPRSR:  00000001 (Power:On DLK:Unlock)
+  coresight-cpu-debug 850000.debug:  EDPRSR:  00000001 (Power:On Reset:No DLK:Unlock)
   coresight-cpu-debug 850000.debug:  EDPCSR:  handle_IPI+0x174/0x1d8
   coresight-cpu-debug 850000.debug:  EDCIDSR: 00000000
   coresight-cpu-debug 850000.debug:  EDVIDSR: 90000000 (State:Non-secure Mode:EL1/0 Width:64bits VMID:0)
   coresight-cpu-debug 852000.debug: CPU[1]:
-  coresight-cpu-debug 852000.debug:  EDPRSR:  00000001 (Power:On DLK:Unlock)
+  coresight-cpu-debug 852000.debug:  EDPRSR:  00000001 (Power:On Reset:No DLK:Unlock)
   coresight-cpu-debug 852000.debug:  EDPCSR:  debug_notifier_call+0x23c/0x358
   coresight-cpu-debug 852000.debug:  EDCIDSR: 00000000
   coresight-cpu-debug 852000.debug:  EDVIDSR: 90000000 (State:Non-secure Mode:EL1/0 Width:64bits VMID:0)
diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
index 9a8ce85fc468..64b5abe33aa8 100644
--- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
+++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
@@ -51,6 +51,7 @@
 
 /* bits definition for EDPRSR */
 #define EDPRSR_DLK			BIT(6)
+#define EDPRSR_R			BIT(2)
 #define EDPRSR_PU			BIT(0)
 
 /* bits definition for EDVIDSR */
@@ -129,6 +130,7 @@ static void debug_os_unlock(struct debug_drvdata *drvdata)
  * registers to avoid lockup issue:
  *
  * - CPU power domain is powered off;
+ * - The CPU is in reset;
  * - The OS Double Lock is locked;
  *
  * By checking EDPRSR can get to know if meet these conditions.
@@ -139,6 +141,10 @@ static bool debug_access_permitted(struct debug_drvdata *drvdata)
 	if (!(drvdata->edprsr & EDPRSR_PU))
 		return false;
 
+	/* CPU is in reset */
+	if (drvdata->edprsr & EDPRSR_R)
+		return false;
+
 	/* The OS Double Lock is locked */
 	if (drvdata->edprsr & EDPRSR_DLK)
 		return false;
@@ -293,9 +299,10 @@ static void debug_dump_regs(struct debug_drvdata *drvdata)
 	struct device *dev = drvdata->dev;
 	unsigned long pc;
 
-	dev_emerg(dev, " EDPRSR:  %08x (Power:%s DLK:%s)\n",
+	dev_emerg(dev, " EDPRSR:  %08x (Power:%s Reset:%s DLK:%s)\n",
 		  drvdata->edprsr,
 		  drvdata->edprsr & EDPRSR_PU ? "On" : "Off",
+		  drvdata->edprsr & EDPRSR_R ? "Yes" : "No",
 		  drvdata->edprsr & EDPRSR_DLK ? "Lock" : "Unlock");
 
 	if (!debug_access_permitted(drvdata)) {

-- 
2.43.0


