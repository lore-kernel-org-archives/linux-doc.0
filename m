Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B0D45D1A8
	for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2026 07:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456623; cv=none; b=anlMAvg6srp2Shodmenbt2AAbYJGLTQleIm/yJpbeYqILCK1n4pnQyXvwBWVONgla1QaK03FDyGvM3GmySKCeWLNSut1Ne6WONWN4Ggv9JM/fZtzH6f24q4ZNMqeRvLXtwVFfoecas16LRzjXDWDQ+OUqwxsEHAspE3UIy2yGCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456623; c=relaxed/simple;
	bh=feFwK+YKcjxOr/G3tWc50jSg+BloxgqVLDY49oqg3sM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uliDOnv0hdZnAYJwDhKwDYhh8RMdOVJJ72qR3BaXPMTfHEoQYWTpxKXyEVppt9zxN/zrBXE26mqmla4mV6alirkI5pNGqHyx8hdl6h2Q7AaCAX/sjlLhAGM0vnoPgzRYQzrDcLml+DT6n99BamMBpcZZw9b8ovpe5zNErqtCDf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kz5axk0o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y1uPnGeh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kz5axk0o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y1uPnGeh"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZlZT2792525
	for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2026 07:16:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bib1p+BD2+/9MYZY81r3Zrm+xMekme9OPjDE3KXqXYE=; b=kz5axk0oPAa6ORBv
	oa/GHEOdKUBTGNm4AFvyqqsVFVqOR7BhGAQpklkGwr/AwrcnaiBAAtpGrClwXBBZ
	h68G400IJZnKemtYIZGPUUSyzxc0u9Q8qcsuI3lMPo/UAMxApjA1EDvzW03j+/5Y
	AFTMGQqp+9Iym2SoSZEYr97fjsgEDzw6WDe5+ihHi8/wDDp+Bz2UyqIyYj1zaSeq
	VNZi2Z2BlLiINAM6rDSHJwA2dpYj3eLdwn8KeNhjqKBB6nx1OJbo8l+J0iFhtKIm
	ahBs4bk6WbQq3YOP37EOTJyCnKTxvkC6l2C/2YqTZ7AhRT9WROX4Md1MNpAMJpBr
	W1vQFA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpgvtm2gh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2026 07:16:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so7209394a91.0
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2026 00:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789456611; x=1790061411; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bib1p+BD2+/9MYZY81r3Zrm+xMekme9OPjDE3KXqXYE=;
        b=Y1uPnGehsoIdid8unJsECU0QMdFBKbEhxnH6VJcnYO4itqTMZtbcg7k4YHHpFR+Tzi
         NhL5KUQ5uNu7xIfR00V0Uu2xslyE6sJXJtHzCtFEs5OVJZpLZeknYqb4jziPhsLN6pDa
         RWWWZ5FMNTHvkw+8j8LN1apWRUhWLOuPXwceq+eKOlFILuWTq/S9UsQNBLDXoJTXdLO4
         w8zGRHv/J7Hf6cvSxqyGbHQv2SIXBusV493LiIGTAqEFgL5G1XYxuqDH7YaPXe+1iqSx
         +ddgEZ/K4tV8Za67kgHzMDkmaTXHsd8ydrRMNiXG5R0g4tWycMv8eNiDlmcoMeHEzmnD
         OpSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456611; x=1790061411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bib1p+BD2+/9MYZY81r3Zrm+xMekme9OPjDE3KXqXYE=;
        b=DVZ40JOeHxqf2wNfpQodGsh9Dvvzncj+tLZOpgZkkNQbtiw89bOG5hYYdGYQap3BET
         eg6AYbEe9Zfxaf1loK/PD90uFnvckqH21Vx8i3eu9ek8bawCvQZHK6G6Dmav6JI+QLJ4
         viXVOJ1B3ugqJfWy1erhnL/NupXSN4wwynPcYghPqTgt0oblZv06Es/B1AL3bx2UHYzr
         svKTzGNqStnxEH9z+7CRoAHXKMcuFUdvlcU+lUngr2h/X6R8nU2B/2QhD/PbgDR8+2TR
         f0QM3aySRBktxryE2UnoVayEBQVYZ8/zJvxIFYgz69byPQI4hOY8jksQ9/ooMFdMpzq3
         j/TQ==
X-Gm-Message-State: AFuF++kQ+Ap3DnDRaZPH72hTAw8202y2FFBWM/eEvd9x0sLWRK0bnIzE
	tnJK/sGierS5idxJozOPHBzMLzCLF64AEocQbKWQvFKGU1G1OHBI9K2eI5UA93h5rZ41uEzh5mM
	vo+mJ4PCN7YTE711XRAD7cPIfDchv0/7wuIklcuOhAUIIWv8tq/zf0MxfLyPpPCI=
X-Gm-Gg: AYBFou2P+V8Kygd3TL9j6ZVIEO4RBNrwOFOmB1rp3D5I0Ceso51p1ereuhhgmGF7tvA
	evyIaMIfxE4P9/8OFaIkRFOyk1wvgCu8ov7Cnz/0FyxjhI/HmBvO3/dHlbajKdsQc8cNboymYpn
	Bgkt7vLEgeALuZpD6G21QxqLmuRIkJnwoUoiljD9prhpsthycNkHXgFSL1oAXfZY9HlYS/W85MY
	gMqLAqFHnhd3y99/grzCUhEVzAJJDtgS9AU+EcPuKPvaVoZ70+4PK+5p5D5RW1UXrx6ntGDb9x2
	FMt1kL4V+/oNiCs/QMPb+75cWg9dugU1ilL8EIsnvx6dHHGDe1IYgEvs5I+I
X-Received: by 2002:a17:90b:384d:b0:398:dcfe:968e with SMTP id 98e67ed59e1d1-39dec0f7135mr11151413a91.20.1789456610951;
        Tue, 15 Sep 2026 00:16:50 -0700 (PDT)
X-Received: by 2002:a17:90b:384d:b0:398:dcfe:968e with SMTP id 98e67ed59e1d1-39dec0f7135mr11151274a91.20.1789456609849;
        Tue, 15 Sep 2026 00:16:49 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdaccc0fsm3447120a91.15.2026.09.15.00.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:16:49 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 03:15:30 -0400
Subject: [PATCH v7 04/11] riscv: Add Zic64b to cpufeature and hwprobe
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rva23u64-hwprobe-v2-v7-4-aa35ebd9ae96@oss.qualcomm.com>
References: <20260915-rva23u64-hwprobe-v2-v7-0-aa35ebd9ae96@oss.qualcomm.com>
In-Reply-To: <20260915-rva23u64-hwprobe-v2-v7-0-aa35ebd9ae96@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        spacemit@lists.linux.dev, sophgo@lists.linux.dev,
        linux-kselftest@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>,
        Andy Chiu <tchiu@tenstorrent.com>, Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Qingwei Hu <qingwei.hu@bytedance.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5858;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=O11yGb/wRFqA37mTtx66TEu8+w8Pb+GTV3KD9OD/Jlo=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqwVH7aI/LjL7XXKLGVebOoDpa7nnYWFTOvm78vsaklNi
 0rNUd/XUcrCIMbFICumyHL4aEv21lc+0b7POX/AzGFlAhnCwMUpABMpdGJkeOJ3mPXx/fdPmE9u
 vV/mtObOk2+PZn1cKhi63GOBfHjAXFmG/2Hv9D/a7BS5EyoiftAjcue1I3PjnD5oLz+g9JJFzee
 IBi8A
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Authority-Analysis: v=2.4 cv=c/0+0h9l c=1 sm=1 tr=0 ts=6aa8f0e4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=HwFc7jivAAAA:8
 a=968KyxNXAAAA:8 a=EUspDBNiAAAA:8 a=XYAwZIGsAAAA:8 a=fFnMLytXjIv02VNa_WYA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=kr7TZk85JJIQSqC0cl8G:22
 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfXz39/NmG4p3GE
 M5ELP1MDSE+hGmr/LNU6rOFtlxFBMCv2Jj2/rUqU5OvI+m5xq8QHjJKEyMAdtXjySUrCGiXpjU+
 YwLTu8NY06r5XU3hpxj275GSl7k6Paq/+HqbhRAhRmwla1M9tiq6KWDSZz2fOSB58DfNMqryLG4
 j7/49cHTGdKVirfIY5bBdbUieu0N5VJEDgnlxt9whkGl4CgenSWMjFQHnpGdz1JpTXRL3KhoeET
 xgdE0D/atuo2seVoowmHLABF8cKQFbf2nTaHmxhKBWdzPAfbtLZL8mVUJFZDQOEsfY+NcPqs4ON
 17C+eP+4uyKwGmJz4ayX5aQlVnNP7yR4dBoeGdnrybZxpqS8iWvUonu9M1jUCWYv+L4/y/bERcP
 K2OnwANVeHC7PXnwYjVj/fm1hHqALHp79sKdmLeWKU0mDmna4tlcxTYT0k8d0dbzDfvjoAa/Uos
 MPO2y+jv/vBDUDnOSmg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX/lEBwSlqkBTP
 8suRPrigVFHVouxCxoelDuFrMcLCpSkna3ydDE55Gw3h+14tfK9T0NeqU9188yRVsmvvS3vlJO/
 MVgUKoP5dPE/Y/vSDbhuD36VXSoUICo=
X-Proofpoint-ORIG-GUID: EMffYKMgP_DuiM7SfWvu3I2xF8U0G7aj
X-Proofpoint-GUID: EMffYKMgP_DuiM7SfWvu3I2xF8U0G7aj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150102

From: Qingwei Hu <qingwei.hu@bytedance.com>

Zic64b mandates 64-byte naturally aligned cache blocks and is a
mandatory extension of the RVA22 and RVA23 profiles.  Allocate a
RISCV_ISA_EXT_ZIC64B id, parse "zic64b" from the ISA string with a
validate callback that requires each cbom/cbop/cboz cache block size to
be 64 bytes when it is present, and export it through hwprobe.

Link: https://lists.riscv.org/g/tech-unprivileged/topic/question_about_zic64b_and/119631059
Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
Co-developed-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v7: No change.
v6: Rebase onto riscv/for-next: RISCV_ISA_EXT_ZIC64B renumbered 110
    to 116; RISCV_HWPROBE_EXT_ZIC64B now uses the _BITULL() style of
    commit 8da45c93dfa9.
v5:
- Collected Reviewed-by from Andrew Jones and Conor Dooley.
v4:
- Credit Qingwei Hu's earlier Zic64b cpufeature patch: set him as
  author, with Co-developed-by (Guodong Xu).
- Validate only the cbom/cbop/cboz block sizes that are present; Zic64b
  does not imply the CMO extensions (Conor, Qingwei, Greg).
- Add a Link: to Greg's confirmation on the tech-unprivileged list.
- Add the missing blank line before the ZIC64B hwprobe.rst entry
  (Andrew).
- Did not carry Andrew Jones's v3 Reviewed-by: the validation was
  rewritten (present block sizes only) and the patch is now authored by
  Qingwei, so it warrants a fresh review.
v3: New patch.
---
 Documentation/arch/riscv/hwprobe.rst  |  4 ++++
 arch/riscv/include/asm/hwcap.h        |  1 +
 arch/riscv/include/uapi/asm/hwprobe.h |  1 +
 arch/riscv/kernel/cpufeature.c        | 19 +++++++++++++++++++
 arch/riscv/kernel/sys_hwprobe.c       |  1 +
 5 files changed, 26 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index fc68dea397aae..32a14331eb9de 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -425,3 +425,7 @@ * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_1`: A bitmask containing additional
   * :c:macro:`RISCV_HWPROBE_EXT_B`: The B extension is supported, as defined
     in version 1.0 of the Bit-Manipulation ISA extensions, and implies the
     presence of the Zba, Zbb, and Zbs sub-extensions.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZIC64B`: The Zic64b extension is supported,
+    as defined in the RISC-V Profiles specification starting from commit
+    b1d80660 ("Updated to ratified state.")
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 6a693210b2519..b103aaeafa47d 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -123,6 +123,7 @@
 #define RISCV_ISA_EXT_ZICCAMOA		113
 #define RISCV_ISA_EXT_ZICCIF		114
 #define RISCV_ISA_EXT_ZA64RS		115
+#define RISCV_ISA_EXT_ZIC64B		116
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 9323feb7c3c81..9a121ee3b4369 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -123,6 +123,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZICCRSE	_BITULL(4)
 #define		RISCV_HWPROBE_EXT_ZA64RS	_BITULL(5)
 #define		RISCV_HWPROBE_EXT_B		_BITULL(6)
+#define		RISCV_HWPROBE_EXT_ZIC64B	_BITULL(7)
 
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 7f615d1a175b9..de7cff5f48c34 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -136,6 +136,24 @@ static int riscv_ext_zicbop_validate(const struct riscv_isa_ext_data *data,
 	return 0;
 }
 
+static int riscv_ext_zic64b_validate(const struct riscv_isa_ext_data *data,
+				     const unsigned long *isa_bitmap)
+{
+	/*
+	 * Zic64b mandates 64-byte naturally aligned cache blocks; cross-check the
+	 * cbom/cbop/cboz block-size (when declared) device-tree properties to
+	 * avoid inconsistency.
+	 */
+	if ((riscv_cbom_block_size && riscv_cbom_block_size != 64) ||
+	    (riscv_cbop_block_size && riscv_cbop_block_size != 64) ||
+	    (riscv_cboz_block_size && riscv_cboz_block_size != 64)) {
+		pr_err("Zic64b detected in ISA string, disabling as a CBO block size is not 64 bytes\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int riscv_ext_f_validate(const struct riscv_isa_ext_data *data,
 				const unsigned long *isa_bitmap)
 {
@@ -529,6 +547,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_V, riscv_v_exts,
 					  riscv_ext_vector_float_validate),
 	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_H),
+	__RISCV_ISA_EXT_DATA_VALIDATE(zic64b, RISCV_ISA_EXT_ZIC64B, riscv_ext_zic64b_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 12ea4f39a8381..656cb100ac489 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -208,6 +208,7 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 		EXT_KEY(isainfo->isa, ZICCRSE, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZA64RS, pair->value, missing);
 		EXT_KEY(isainfo->isa, B, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZIC64B, pair->value, missing);
 	}
 
 	/* Now turn off reporting features if any CPU is missing it. */

-- 
2.43.0

