Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF58D34F47E
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 20:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769718314; cv=none; b=W1O6pzXPAhz5WXfeYJwB4cSu1dTueyOSLrzvd437HuaYtRcX+D3X6OQXNLS7OeCFFtrHf/FnsKd497gxLOiaBy9sUR1qYeEuASvqw/WGMHy2G1dofQASQljyCCPZE1OHSFLQuM0/iZZQ3BfY2npzARPRt75SH/CO5Z1mxTvr3h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769718314; c=relaxed/simple;
	bh=v/AZkG/28KlNhb9unjxf+fqtqEO0ZP93Qeegkhk42mQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=BTnSMkq9ijLMPqwEShpqzVZxwVOtd9KPCqxP1BpPqDfDxUn/CA9GySSM8vnej+p8lTP0pUw7aEd/1xi/nBoB8YWz0jX/oA8w2JdWmAvXwqC+uMK46Ng/cmp4TG2ifa8eVqEDlz9t/9tgAMvqppAAmpFE4OuZIUjXb5Pf9vgWpqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E8Pv08Ca; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DsdqLgsQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E8Pv08Ca";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DsdqLgsQ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60THLvTZ3914272
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 20:25:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TIyWfuFKG9M3pO5hQmbVZSaW8RBimd7V3pBdTPjwJ6A=; b=E8Pv08Ca/oUQS9hB
	ZCNVdyUPaPmHAb0tMd7umdEzkgtxTGSdyG1uqAi43M6r2rSBv/lE44S0NvIsO7mG
	ht4+V1T+H/jRPH5MqvDVwwFkGaOQVpNkNHxuLukDN6ZsJ8bys/HeO0Jd8pkefF7I
	XwCMLPB8VHsjr5MQg1QSYDdb8IGe08ZHn2kMq402lNbe+MiVsjM244MMOqCY6uZc
	S0cpcWEsw0L3xJq7fGO2PoCFkExVUb5oP2J4cMkd5Xa0GOQuhvEEaUy3t/7n3b6C
	dsKPWTBc8HOSEm4By3h5FB25ZvI8zcoTLiZufLbAStS6YiK/ohLGtUgqicyQZ/L+
	/T4x1g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0bvvgjt8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 20:25:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c71655aa11so424910785a.3
        for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 12:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769718311; x=1770323111; darn=vger.kernel.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TIyWfuFKG9M3pO5hQmbVZSaW8RBimd7V3pBdTPjwJ6A=;
        b=DsdqLgsQ1P/J/X7q+4yjQQX7wT5NRr84qYnnrB78gfkCqyXgVv8wDydWYLDtovvpo7
         XleXsM5PS/YGgDfDIQo9RCuzFXuTndB86wDg7+xxV4izn4ZX417JckugsiGSDCrDG4E+
         mtCG98P9EEFWzGHNJivanWzKc6tqjpI3926q7XYT/IAFphFs2RZjpdalrkeL0/78sXSr
         zgFksIJNcAKfzUxU9DRO8g8z6KoyjZEY3yfvPR1fs1QPYW6tLel2BO+q32LUw5TH3T3Y
         NYpkYyvaggdsWIJvJEtLzUrzeHOjDUNzIwYFPlgp51gGmkO45p0r4IegkbCSxObjc4js
         +nkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769718311; x=1770323111;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TIyWfuFKG9M3pO5hQmbVZSaW8RBimd7V3pBdTPjwJ6A=;
        b=erKAYf5owDcL3LrXxqzEg9hmhYbVfn3m6WMkPyb1zFKFGMl80Jt/jI9O2vX1CBWmHp
         CQPNz4RCxRLi6AG9UHejLifmBkEiqOxPWdk9MJCSKFq0EuWetuB03oqS5CL9z73Ad+Wa
         PG2et/UtSItGfhj80mqqWMVUbKEMzimrwiZVd5i3lH7KDorngIPtH2Gk1oqbO7u+4o5r
         6ijYpQxwIMqBQfGiJcRrk98cb7JfwbXbGTzl8Z/b3RcOlKPtj3CemzTmTL9mlsLBuXJU
         MZ7T6c92VLp2lA2sWwuhYN192keY6Xn43C1Led2ZNqxnA7U0Y2Bf3NdSbZdKoPKk9N/I
         +q0w==
X-Forwarded-Encrypted: i=1; AJvYcCWl09iQRu/4xiclqGIb0BWAPGV4MvG2VHn118BFzNISbBPDKNZ8YpwHmNCPFc9zZwLtNOHUSZvWk10=@vger.kernel.org
X-Gm-Message-State: AOJu0YzI+N/lPmE9UUQ6oqlHv7jPxQbfhCnm3QLSUJ17EootvpEmlq+b
	z41Qk0IxiVd/8jlBQrA6K+qFUXB45AWd92MzmlPzjujM78YRaQQZDyNUNGQhl7mBUGXXi1RZuor
	5yBKlRHS9Goqr0NxpiCmCVPraCeLf/PILCZ4xvPEi/Kj62Jor+1vqzEHGHiHS2OE=
X-Gm-Gg: AZuq6aJecLv/6CGDlwxdXKjiFG5lbuy4VAj/iHLjD3fUlduM4qWkSPzk+Gvhf/Vvsqg
	cDgRCAwBWg8Ke7v22Gu6iDKA6gsxBPmBdFhtUJZwP8ljMVMYWttzFdb90D+suA7DpmPk6Pjr8Yj
	6l8YWm2GYiCo2BxW/7L8guRMT46PYpsOVaX6s8+sBHLIyss99x1stnKo5PiuTG0YcbRG06BBGjk
	xVEv2ycvQRVpwKDzB7M3CRnteNMlGVr4AiBpFTdDc2DX7flzFlAckpSj63TB9Us1YkwJ6WX7AxB
	P1ZvTEB7c0DQOYire2tPoFCIDJJ4xa3Wj8Xyv8CZZPpviWBhaQiwtzxd3SytcNcLizR8jcUqrjb
	3XcaO4mskl4Ir8JnmA+zQQVjdO7fr+w8QmcBcRFSybnX/MYQW
X-Received: by 2002:a05:620a:29d2:b0:8c5:36be:41fe with SMTP id af79cd13be357-8c9eb32be89mr118653285a.60.1769718311169;
        Thu, 29 Jan 2026 12:25:11 -0800 (PST)
X-Received: by 2002:a05:620a:29d2:b0:8c5:36be:41fe with SMTP id af79cd13be357-8c9eb32be89mr118650785a.60.1769718310701;
        Thu, 29 Jan 2026 12:25:10 -0800 (PST)
Received: from localhost (ip-86-49-253-11.bb.vodafone.cz. [86.49.253.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce4c3c6sm150902865e9.10.2026.01.29.12.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 12:25:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Jan 2026 20:25:08 +0000
Message-Id: <DG1CS7KB3C6N.10FWH79J7UZHB@oss.qualcomm.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
Subject: [SUGGESTION] KVM: RISC-V: detect gstage mode hierarchy
Cc: <guoren@kernel.org>, <ajones@ventanamicro.com>,
        <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <pbonzini@redhat.com>,
        <corbet@lwn.net>, <anup@brainfault.org>, <atish.patra@linux.dev>,
        <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <andrew.jones@oss.qualcomm.com>
To: <fangyu.yu@linux.alibaba.com>
References: <20260125150450.27068-1-fangyu.yu@linux.alibaba.com>
 <20260125150450.27068-2-fangyu.yu@linux.alibaba.com>
 <DG16GDMKZOBM.2QH3ZYM2WH7RO@oss.qualcomm.com>
In-Reply-To: <DG16GDMKZOBM.2QH3ZYM2WH7RO@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ZdEQ98VA c=1 sm=1 tr=0 ts=697bc227 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=HFCiZzTCIv7qJCpyeE1rag==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=B30jFbksMaAZlFPmlSQA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: XUkm-8bWL2RFQGuG0r0qtu2CJ4lgyKhN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDE0NyBTYWx0ZWRfX6J4TAM323pUn
 HC7X2MJyauWimLtLDyyr1C44joR3ha47z+7JCWvBoN6qIeA/JQxYKRHQtpKFN/71s/G0FTGIhAp
 MYlu641/ERnDbioMUTZhB0JmUiFaJNWT/F2iX+6FJnhdGOtecYxqRap8GCgN5ahpIxyuv68aYd6
 KZ2FaXk9afsq6nhY+S+Poh1fL7vcuKiNg1UR4JYGAlRTvRzijO67DXMXbp7y0cLLk3IHj7qqKVF
 rub6/ajcj5JWC19RocFpNlnYPdX/akK89mvf3VfYJ3cbxrj7TaeJRt7wq9/PCNhWMdj3zurPzai
 KK0ls72D/BqDDC13v6luVjoZvWT1vI6A1MMI32mliKleecVb6RzwRFgvGmcWRA+0+ZOFL3dJONu
 +lzLhZ/ftXeLiB6f+lTMIDORmg5tn47H8vt2CAz/c5Wq3nBU8bf01RaAYAMpzBaq5DrsoJR7IHT
 qaWGdvhddx21Ey2Ne2Q==
X-Proofpoint-ORIG-GUID: XUkm-8bWL2RFQGuG0r0qtu2CJ4lgyKhN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601290147

2026-01-29T15:27:35+00:00, Radim Kr=C4=8Dm=C3=A1=C5=99 <radim.krcmar@oss.qu=
alcomm.com>:
> (I'll reply with a patch later.)

Something like this would avoid a bit of technical debt.
The solution could be even more generic by returning a bitmap of
supported modes, but that would be larger refactoring...

Feel free to use it in the series, but beware: only compile-tested.
It's late and hope it at least boots. :)

Thanks.
---8<---
RISC-V ISA does not require a hierarchy of standard hgatp mode (i.e.
57x4 does not depend on 48x4 onr 39x4), yet future patches want to
assume that the hierarchy exists, for simplicity.

Only accept a hgatp mode if all narrower modes are supported as well.

All sensible RISC-V implementations should have the hierarchy, since
it's very cheap to add the narrower modes.

Signed-off-by: Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar@oss.qualcomm.com>
---
The hunk that removes the default values at the beginning of gstage.c
should have been a separate patch, sorry.
---
 arch/riscv/include/asm/kvm_gstage.h |  2 +-
 arch/riscv/kvm/gstage.c             | 66 ++++++++++++-----------------
 arch/riscv/kvm/main.c               |  6 ++-
 3 files changed, 32 insertions(+), 42 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_gstage.h b/arch/riscv/include/asm/k=
vm_gstage.h
index 595e2183173e..18db474ce583 100644
--- a/arch/riscv/include/asm/kvm_gstage.h
+++ b/arch/riscv/include/asm/kvm_gstage.h
@@ -67,6 +67,6 @@ void kvm_riscv_gstage_unmap_range(struct kvm_gstage *gsta=
ge,
=20
 void kvm_riscv_gstage_wp_range(struct kvm_gstage *gstage, gpa_t start, gpa=
_t end);
=20
-void kvm_riscv_gstage_mode_detect(void);
+unsigned long kvm_riscv_gstage_mode_detect(void);
=20
 #endif
diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index b67d60d722c2..678b304553bc 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -11,13 +11,8 @@
 #include <linux/pgtable.h>
 #include <asm/kvm_gstage.h>
=20
-#ifdef CONFIG_64BIT
-unsigned long kvm_riscv_gstage_mode __ro_after_init =3D HGATP_MODE_SV39X4;
-unsigned long kvm_riscv_gstage_pgd_levels __ro_after_init =3D 3;
-#else
-unsigned long kvm_riscv_gstage_mode __ro_after_init =3D HGATP_MODE_SV32X4;
-unsigned long kvm_riscv_gstage_pgd_levels __ro_after_init =3D 2;
-#endif
+unsigned long kvm_riscv_gstage_mode __ro_after_init;
+unsigned long kvm_riscv_gstage_pgd_levels __ro_after_init;
=20
 #define gstage_pte_leaf(__ptep)	\
 	(pte_val(*(__ptep)) & (_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC))
@@ -313,47 +308,38 @@ void kvm_riscv_gstage_wp_range(struct kvm_gstage *gst=
age, gpa_t start, gpa_t end
 	}
 }
=20
-void __init kvm_riscv_gstage_mode_detect(void)
+static inline unsigned long __init __kvm_riscv_gstage_mode_detect(void)
 {
 #ifdef CONFIG_64BIT
-	/* Try Sv57x4 G-stage mode */
-	csr_write(CSR_HGATP, HGATP_MODE_SV57X4 << HGATP_MODE_SHIFT);
-	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) =3D=3D HGATP_MODE_SV57X4) {
-		kvm_riscv_gstage_mode =3D HGATP_MODE_SV57X4;
-		kvm_riscv_gstage_pgd_levels =3D 5;
-		goto done;
-	}
-
-	/* Try Sv48x4 G-stage mode */
-	csr_write(CSR_HGATP, HGATP_MODE_SV48X4 << HGATP_MODE_SHIFT);
-	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) =3D=3D HGATP_MODE_SV48X4) {
-		kvm_riscv_gstage_mode =3D HGATP_MODE_SV48X4;
-		kvm_riscv_gstage_pgd_levels =3D 4;
-		goto done;
-	}
-
-	/* Try Sv39x4 G-stage mode */
 	csr_write(CSR_HGATP, HGATP_MODE_SV39X4 << HGATP_MODE_SHIFT);
-	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) =3D=3D HGATP_MODE_SV39X4) {
-		kvm_riscv_gstage_mode =3D HGATP_MODE_SV39X4;
-		kvm_riscv_gstage_pgd_levels =3D 3;
-		goto done;
-	}
+	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) !=3D HGATP_MODE_SV39X4)
+		return HGATP_MODE_OFF;
+
+	csr_write(CSR_HGATP, HGATP_MODE_SV48X4 << HGATP_MODE_SHIFT);
+	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) !=3D HGATP_MODE_SV48X4)
+		return HGATP_MODE_SV39X4;
+
+	csr_write(CSR_HGATP, HGATP_MODE_SV57X4 << HGATP_MODE_SHIFT);
+	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) !=3D HGATP_MODE_SV57X4)
+		return HGATP_MODE_SV48X4;
+
+	return HGATP_MODE_SV57X4;
 #else /* CONFIG_32BIT */
-	/* Try Sv32x4 G-stage mode */
 	csr_write(CSR_HGATP, HGATP_MODE_SV32X4 << HGATP_MODE_SHIFT);
-	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) =3D=3D HGATP_MODE_SV32X4) {
-		kvm_riscv_gstage_mode =3D HGATP_MODE_SV32X4;
-		kvm_riscv_gstage_pgd_levels =3D 2;
-		goto done;
-	}
+	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) !=3D HGATP_MODE_SV32X4)
+		return HGATP_MODE_OFF;
+
+	return HGATP_MODE_SV32X4;
 #endif
+}
=20
-	/* KVM depends on !HGATP_MODE_OFF */
-	kvm_riscv_gstage_mode =3D HGATP_MODE_OFF;
-	kvm_riscv_gstage_pgd_levels =3D 0;
+/* We could probably omit the HGATP write and fence. */
+unsigned long __init kvm_riscv_gstage_mode_detect(void)
+{
+	unsigned long gstage_mode =3D __kvm_riscv_gstage_mode_detect();
=20
-done:
 	csr_write(CSR_HGATP, 0);
 	kvm_riscv_local_hfence_gvma_all();
+
+	return gstage_mode;
 }
diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index 45536af521f0..58fd6ae8e04a 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -104,19 +104,23 @@ static int __init riscv_kvm_init(void)
 	if (rc && rc !=3D -ENODEV)
 		return rc;
=20
-	kvm_riscv_gstage_mode_detect();
+	kvm_riscv_gstage_mode =3D kvm_riscv_gstage_mode_detect();
 	switch (kvm_riscv_gstage_mode) {
 	case HGATP_MODE_SV32X4:
 		str =3D "Sv32x4";
+		kvm_riscv_gstage_pgd_levels =3D 2;
 		break;
 	case HGATP_MODE_SV39X4:
 		str =3D "Sv39x4";
+		kvm_riscv_gstage_pgd_levels =3D 3;
 		break;
 	case HGATP_MODE_SV48X4:
 		str =3D "Sv48x4";
+		kvm_riscv_gstage_pgd_levels =3D 4;
 		break;
 	case HGATP_MODE_SV57X4:
 		str =3D "Sv57x4";
+		kvm_riscv_gstage_pgd_levels =3D 5;
 		break;
 	default:
 		kvm_riscv_nacl_exit();
--=20
2.51.0

