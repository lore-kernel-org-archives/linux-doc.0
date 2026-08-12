Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6573D481647
	for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 23:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786577784; cv=none; b=ejZuCoVkwoDnsBEfGQ4tV281yDBIDvj2g4iduwmWGaTJ4RRHlav071u/g8CeJP/FbMDnfkW0xVWVDD2lTbXIyRhLXMWnyfM4j+tdofL61cX2bamqrqcbWMsXUHyY1T+uixV0WDK0WzyplfEjOlFWNajY4GYEFNcB6ZKUkxC0WV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786577784; c=relaxed/simple;
	bh=9dW4VaF+cpQj6n2di2ZHB9qHayVfEQpRJEGaM1jJjX0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RDxhntxSNn4vX9VtCZhRRtMQhB/ojCfb+Doqd8f9MqHgWlQr3EFH2vfWkmF548XIb7VX1XztX6ITMnR/bgRAXShdOQZn6Azz70J4dUVoBuj+98cGKOln0VHch8K3RoKtk0nBQT15wrboDFk0Cv10FOORbHjd7m5t6UkV0I4aCPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FY6MSVFU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cz9yXhcn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FY6MSVFU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cz9yXhcn"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CNLniT1590646
	for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 23:36:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	chxsFMJd/v7CYPQftCpnnBz6h3uko0w0S390Jkq42v0=; b=FY6MSVFUEMiPzpg2
	OKRL7GB/xap1n4MlUb7m/HmTY4QneQSgQ9aZzpmIEnjOhePICgOQxfTZCYMNb7E5
	IfRRns8mwvp/yNrvCsEczXLTeeu9KI+fgDBAJ3+mgfAjc1UW1zR8fdXPqzuiN9VW
	0rpvQpDd+uTIWso7GidRmSH4PqSlQAlRb9u8RHbgknk8elLYDApRf855F95R4ObX
	qOx78VaMUnets4fiZ1/SS1LINYUuOOs4FdX1NcWxHp2gjEV9c6aYffMR75DUOiGk
	bZsSHpl8i8gsrxTGfWiHM8IrKp9SaoH7wshIWBx4WjNDOZWrFHn0oQZP8hjjDlns
	nVwpvw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0sk42ne5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 23:36:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc6dd43737so30133125ad.2
        for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 16:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786577780; x=1787182580; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=chxsFMJd/v7CYPQftCpnnBz6h3uko0w0S390Jkq42v0=;
        b=Cz9yXhcnR0xNQ9NsEhL4Krq70rqyvBr9HvFr0/gflqmGVUwcgjrVizBYo1qw4fFfzI
         tlt5kXmDqIwa9AXEiRuTe/PTMmdio1IpnRflT/6UjWMchnGEzXMlwXiUkuWBOJzcyJLH
         l4nUBrIz7kwxa2LDJ7FFoxpaixj1WuB4u94QfVvbFRTifGf6/nerPxCmKiBRJPa/uKxY
         rna4PuY1sogm8s1iuclVKlfoyGO/QmcVR2FM+g7zkzgMKCthN8skjJ54XIvklXSzo6Oz
         9q8C2EzLJLbeQdZdtmfZir2K86HJC5mw3tBG3QegiO4vuiwnYUQRwAwliiYL5caNnU9s
         GiDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786577780; x=1787182580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=chxsFMJd/v7CYPQftCpnnBz6h3uko0w0S390Jkq42v0=;
        b=oxhSfcYhyD1V0juOJWWBXMe/jI/2iOOzneKT3fEjp1MAfHJpenPEuxy5hhyuvrWA8J
         hUc38tcI2v9fBKK6iESq752VLsRla5jJclmJMrTINK6aVLQDKnCeCGtduQdR4BO2Homj
         VtvxouyVcl2I0xuX9fud5AtoLa/YaVwazRc6Anl7CeYUjmJ1ya3STI7llm/V2PQT0Fsj
         zDBVK9sJCSAXmlx290E6I3jo993zoWVmNm85QOVxbX09eKMXGX5c3H9aMVsE9yt3+VU+
         4sq8CxgtCLPWutuFp6S2iNUDMFQFzKvZhtaHNmQK+j/ajX4TSudnCsvLJJRIPTPZbeQS
         2hdw==
X-Gm-Message-State: AOJu0Ywu+aIGu44LMNhYIsq6Dhxou8OD/aaFwXmi6X3r70xYvGyr+bPa
	Kk6dTm4o9WjK1RXZRu1c8YYJcCWkUyzDWqB2l7oSibv5fzTtY+CDokD9/Za82vS6/Tr5CSQpZmx
	kwmc6XtHdgaMhOXRIjTXj6Q5kSds4Hx/PmZwyB1hKnKga6GqekY9YYz4TMac3+JM=
X-Gm-Gg: AR+sD11RQoO9qT/Xei8Q6TC9G8CeQ5g+nsgLH/7WuD+0lJax/zYiAu3/9O89r3K3w64
	1xKW4scyCC45Z+SGyUaoMYpDSW/eydkIh0cOyjrtinkbqKqXr+UUhu9WvIAvdQOrALAOWUOW2BI
	PXAaZWq3mXXwdiVtfO+bh5pWiILgeagYNt0Dz8gx8l5EfI/gP2Z1QbtsEy9jTfSBE6PCv28MfUw
	mjGLSiDe7E/n3iKVXDBIr2b19GH4i9gMHG+IrDNisJwNEDUOX+zAg8FqJG+Y+RR43mqJfWFNban
	wsXhbysuxemoS05mNIRzCZRe26Lfn0Qj6zk5WeIBPB+OpypqsGgaQLFZ04cJTg==
X-Received: by 2002:a17:902:c412:b0:2c7:f4bd:91b5 with SMTP id d9443c01a7336-2d37d1c1926mr15942285ad.0.1786577779896;
        Wed, 12 Aug 2026 16:36:19 -0700 (PDT)
X-Received: by 2002:a17:902:c412:b0:2c7:f4bd:91b5 with SMTP id d9443c01a7336-2d37d1c1926mr15941865ad.0.1786577779333;
        Wed, 12 Aug 2026 16:36:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c26d0fbsm2136805ad.37.2026.08.12.16.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 16:36:18 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 19:33:57 -0400
Subject: [PATCH v6 11/11] riscv: hwprobe: Introduce rva23u64 base behavior
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-rva23u64-hwprobe-v2-v6-11-c985af3256b8@oss.qualcomm.com>
References: <20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com>
In-Reply-To: <20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        spacemit@lists.linux.dev, sophgo@lists.linux.dev,
        linux-kselftest@vger.kernel.org,
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5002;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=9dW4VaF+cpQj6n2di2ZHB9qHayVfEQpRJEGaM1jJjX0=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqxaZrEt9omnjF9tX/pU9lBCyb+leTM4jW+UijyUf866p
 +uu367ujlIWBjEuBlkxRZbDR1uyt77yifZ9zvkDZg4rE8gQBi5OAZiIXhLD/xqf3ffnKQev/cCa
 KZFhbhhqbvXdVeSqRd3u9qXTT7384cHIMM+gTH/NlW4Gkc/7GZ5eemTyfcbBgk0b73KGBmd2GLL
 9YgcA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-GUID: qYDz9KZH9JCj5UX_ihk3MNsXDUCYUhRn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE5MSBTYWx0ZWRfX9Us35SbefHrl
 Q8nLpKbgZcyqETFReE43//OfQRdQabBg6zyZz6arz4pf9nZD7e+ngqdZWVf0yDbi1Wf1yTI/Lsy
 KfCb7GymuGATWAA9KLSJ9ta67rTtAYCeKhZkMK5mcKuMraroAvFm5ayB8yX0LKEGQGl8nGxmXhb
 UPmIEX17ybT33VCMnw+o3U3X51MwR2prHKKH7erbg/kg9KSeiQmgirmdLyN9Za6vVhnPYFPfR+S
 jF0VNZMOYaoYwXvLeyx7o8FRlVvSA1hPrNifhKuT1OlIW4eUTJq5EeuSDgzWXd6wU6vHQOFvGuE
 7R8H1uDu/jL+7ZAT2lHGJFbeHUxLwCrlH9f/huENC3IG/8VW7XdZsj49qTEG6hB2pL40isCnS+4
 wF7wM7F4uU+OvMDtwUdDhVapau6Cr+06CM22DIxaQaBnZ9R4HB6EaLeU1NtwNEe6nVh7j0Pp4LY
 939xRPdTmvtQvnamwsw==
X-Authority-Analysis: v=2.4 cv=E8n9Y6dl c=1 sm=1 tr=0 ts=6a7d0374 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=jBCMAwuHs6T3S2td1yAA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE5MSBTYWx0ZWRfX31hzHxwVuoF0
 +XkO68r8cnbuDWSeO9vLUvm1VGPNbkGPPda1QH/PCaPSKJA7N3V+7BNvv8DB94wYetEOoZ9l8MQ
 o3Cl4WsRsKIZC+dUtSqcZruQMODxsHY=
X-Proofpoint-ORIG-GUID: qYDz9KZH9JCj5UX_ihk3MNsXDUCYUhRn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120191

Provide a hwprobe base-behavior bit so userspace can check RVA23U64
support in one call.  Without it, a consumer needs five hwprobe
calls and four prctl calls, which is error-prone to require of every
caller.  Most software treats RVA23U64 as a new base anyway, so
expose it directly.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v6: Rebase onto riscv/for-next: define
    RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64 in the _BITULL() style of
    commit 8da45c93dfa9.
v5: No change.
v4: No change.
v3: No change.
v2:
- Detect RVA23U64 by reading from the cached hart_isa[].isa_bases
  bitmap populated by riscv_init_isa_bases() at init time, sharing
  one source of truth with /proc/cpuinfo.
---
 Documentation/arch/riscv/hwprobe.rst               |  8 ++++++++
 arch/riscv/include/uapi/asm/hwprobe.h              |  3 ++-
 arch/riscv/kernel/sys_hwprobe.c                    | 23 +++++++++++++++-------
 tools/testing/selftests/riscv/hwprobe/which-cpus.c |  2 +-
 4 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 32a14331eb9d..dc70470093b1 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -67,6 +67,14 @@ The following keys are defined:
       programs (it may still be executed in userspace via a
       kernel-controlled mechanism such as the vDSO).
 
+  * :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64`: Support for all mandatory
+    extensions of RVA23U64, as defined in the RISC-V Profiles specification
+    starting from commit 0273f3c921b6 ("rva23/rvb23 ratified").
+
+    The RVA23U64 base is based upon the IMA base and therefore IMA extension
+    keys (e.g. :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0`:) may be used to probe
+    optional extensions.
+
 * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0`: A bitmask containing extensions
   that are compatible with the :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`:
   base system behavior.
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 9a121ee3b436..4f5d51788c41 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -22,7 +22,8 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_MARCHID	1
 #define RISCV_HWPROBE_KEY_MIMPID	2
 #define RISCV_HWPROBE_KEY_BASE_BEHAVIOR	3
-#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA	_BITULL(0)
+#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA		_BITULL(0)
+#define		RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64	_BITULL(1)
 #define RISCV_HWPROBE_KEY_IMA_EXT_0	4
 #define		RISCV_HWPROBE_IMA_FD		_BITULL(0)
 #define		RISCV_HWPROBE_IMA_C		_BITULL(1)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 656cb100ac48..a18465e734b5 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -223,6 +223,17 @@ static bool hwprobe_ext0_has(const struct cpumask *cpus, u64 ext)
 	return (pair.value & ext);
 }
 
+static bool hwprobe_has_isa_base(const struct cpumask *cpus, unsigned int base)
+{
+	int cpu;
+
+	for_each_cpu(cpu, cpus) {
+		if (!test_bit(base, hart_isa[cpu].isa_bases))
+			return false;
+	}
+	return true;
+}
+
 #if defined(CONFIG_RISCV_PROBE_UNALIGNED_ACCESS)
 static u64 hwprobe_misaligned(const struct cpumask *cpus)
 {
@@ -305,14 +316,12 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 	case RISCV_HWPROBE_KEY_MIMPID:
 		hwprobe_arch_id(pair, cpus);
 		break;
-	/*
-	 * The kernel already assumes that the base single-letter ISA
-	 * extensions are supported on all harts, and only supports the
-	 * IMA base, so just cheat a bit here and tell that to
-	 * userspace.
-	 */
 	case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
-		pair->value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
+		pair->value = 0;
+		if (hwprobe_has_isa_base(cpus, RISCV_ISA_BASE_IMA))
+			pair->value |= RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
+		if (hwprobe_has_isa_base(cpus, RISCV_ISA_BASE_RVA23U64))
+			pair->value |= RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64;
 		break;
 
 	case RISCV_HWPROBE_KEY_IMA_EXT_0:
diff --git a/tools/testing/selftests/riscv/hwprobe/which-cpus.c b/tools/testing/selftests/riscv/hwprobe/which-cpus.c
index 587feb198c04..f8c797b1d0fd 100644
--- a/tools/testing/selftests/riscv/hwprobe/which-cpus.c
+++ b/tools/testing/selftests/riscv/hwprobe/which-cpus.c
@@ -105,7 +105,7 @@ int main(int argc, char **argv)
 	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_BASE_BEHAVIOR, };
 	rc = riscv_hwprobe(pairs, 1, 0, NULL, 0);
 	assert(rc == 0 && pairs[0].key == RISCV_HWPROBE_KEY_BASE_BEHAVIOR &&
-	       pairs[0].value == RISCV_HWPROBE_BASE_BEHAVIOR_IMA);
+	       (pairs[0].value & RISCV_HWPROBE_BASE_BEHAVIOR_IMA));
 
 	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_IMA_EXT_0, };
 	rc = riscv_hwprobe(pairs, 1, 0, NULL, 0);

-- 
2.43.0

