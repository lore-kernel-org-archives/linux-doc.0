Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4251CAA68
	for <linux-doc@vger.kernel.org>; Sun, 11 Jan 2026 16:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768147682; cv=none; b=ubrUpi6GVcJV6H4JnFFfWJOjKARbOeaZeb4dCEX6C8Fx1TjCSOJDLFwJ/mipJuzXVo+mRiOODmQn/BssR7Xf03Jo8kjHGziWnxOqvjz2sxP37FX0uewnraz3pWqwRIVQfMUXU/Sw51GEzAjiV65PBf5Pklkv/5AduBY9wDpKZ5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768147682; c=relaxed/simple;
	bh=mrJ2r/higfpselGc6ELPbZ4mu5aGxqm5xTx8ZYso3Q8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ecXM1oYCUCdvwC9mP7oM57Gk7mMAQJnLgInLdni9aIfwgWPXblrltdPgBaYC6qHs8R226BKDOk1hOkPyzBykJaKIdxRnJTfnxz4OVCgkSVMFAafVTdveff8sJ1IeEOV3VcO3wKvw8SSsnSsyWmZrCVb3CV+kUv/PLTcMR4jaK8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SZEh7Fna; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OVi0knrj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SZEh7Fna";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OVi0knrj"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BFa7NN3207283
	for <linux-doc@vger.kernel.org>; Sun, 11 Jan 2026 16:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UfXDHbQVS5pwkRsJmLRMNBG+krLGYWt0QDZ
	Ek+fS9RM=; b=SZEh7FnavRWYsAtKGkrVniuyYpnHDKWlXD8k9EFcuM3NvMZ0Lse
	9pMRLlLMPMNgI+A4+oQRBdBc095R8G7p2I7iAK4xvAlssdrhS52D1KWX4Cg8r/jl
	IKZEL5FHcspB5J/GmUE36I+uSu3MULYaXiG7+A2F59rptaxPVDv+aFZcmQJhOJnO
	Mm41ebNgLt8dGzTT5gquOTv2I6uC+/t82EQefZGYGfCl9mfAjliImMEYbELpLeN7
	YxMA4RcAQQgvqsmkqGJR2x1dGStQ1Uvx2r4olY9F7WRiMa92xsF8nQgKnsPqnbgt
	5qUmjB5cgkH2nsajRReMjZ1ANb+ZJUNgMPA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkfhajby6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sun, 11 Jan 2026 16:07:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2e2342803so1493186685a.3
        for <linux-doc@vger.kernel.org>; Sun, 11 Jan 2026 08:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768147679; x=1768752479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UfXDHbQVS5pwkRsJmLRMNBG+krLGYWt0QDZEk+fS9RM=;
        b=OVi0knrjhTvug/OjX79DrMfVRb6dbHrjvHnFa1kXV/lZXV1B3IohD/Ci5NoFxr2yqW
         LQP/b6sYah6IoM40+laAsZGGKAeqGS7oWaRSa+hVxYQ6E36MZHfK2qLVdkV5VJ0K8NF2
         b9YI8Rxmhg9aeC0oN9zsV6MBXBHEFEvmhdgGrbcmWhYbfcVpxJiqVfxGYD6Dil719YOM
         1TYoKIf3nP3NoeFoCXYPHv4rCQkGu/7h+s3nyzkzpy0CZzSoTeqn1u/AZR2376jR+Jmr
         s0dkDBSFxy7YI2VRjphD6ZEHgz04MY0PdtviHfhllQFg428fuf+1DT8nM8nqlKpNpGfz
         ytug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768147679; x=1768752479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UfXDHbQVS5pwkRsJmLRMNBG+krLGYWt0QDZEk+fS9RM=;
        b=m/W++GmmW2+h78AQAw2f1ea1FraG1vP7eHM+zWBunzzbOk6Vs15hvnKGPV49s0pJi1
         lhoR/0qILwJSTL8l5aJeTUICOkjgg4L3ycktX95P1XpehLCXRXxIQXG+8Pee0nJE6sK6
         HKfg/ZcJcqS6nFMh5tCcY8bUm0BIA9DIEKv2OIFy0quaL+41Y6ZQ9ZLV2CUIa4Arov39
         b5QQYnKvhaAZJucJGv9iPmFqfZsXLfzaC5ixpjgMIRNZddqoP5MEP4lndWG4wg1YC2il
         fi92T8udfEI71GVa1u9b0HBZgTAiHYoMihJI+zUNtAS4bLWudzwCStBdZNC3ayn2xWlq
         54PQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlnQ+YAsaSEv8RjisQx+kZIBRBcEIQ+SxyfUetylOA7aHzv7gEjRFweprU1esiKFTRIcAHTLcWafI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8TyZVp/Aj/yS/ZX69PcOGrb9+M1sfuL4Ivxvhcd5O43bPkOE8
	pZ1q9nUBIXvW1l/9wo8WPm9sxfZMhmJFhFYGElUNfGbxjSqWuyXuQC0ODmIfgl8eipdp88x8pHn
	D0OcEx2JY0zBf6ff1y48qId/cBkkHtSsEXRuHMGN4gATGz0ShMonrCquKNEboda1keKwet/Y=
X-Gm-Gg: AY/fxX6jH9anFruaIL/YxLW7LlEZItYlupp92KOzmCKdJ75ojMVqFUZ177iACgcE8V6
	iRm+hwS8CaJy4r0Rf99w/uvu5tCq24VE9zXQg59peS/ucGjasas4Rutsl4S51KKbqEkhvkRi6xN
	oKgLnlRByRhImE+0l1CPnmwxqDyEOkK2GG4kYbgx+C7DeIAMOBviEUCtcFQ4Wyyn8jtkp496zk4
	xPN4+u+EBsYZGNJqvBkzMsldZiOZWjiSAJlTdxAoTeayt2++7tR2Bm5uoV5omqush8aqAsveDVY
	NEpxH53WUmzENOfysd8GudE91CGtmIMiVugHtMI1XaejbMBzquEFon2snNWP2tDSEJL7RDiol9e
	RGqw+FDaYFEqSRCYXUM9kYApRPw==
X-Received: by 2002:a05:620a:2915:b0:8b2:dfb3:dc2a with SMTP id af79cd13be357-8c3894072a3mr2212354885a.75.1768147678691;
        Sun, 11 Jan 2026 08:07:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwCjCH6EdXW2J7irnqLz5o/yB3SzSXcXwviTX1wmXmPQwpzYcLaFaox6xfVLe5CbPSPXUU3Q==
X-Received: by 2002:a05:620a:2915:b0:8b2:dfb3:dc2a with SMTP id af79cd13be357-8c3894072a3mr2212351785a.75.1768147678294;
        Sun, 11 Jan 2026 08:07:58 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f6f0e15sm307246465e9.10.2026.01.11.08.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 08:07:56 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>, Andy Whitcroft <apw@canonical.com>,
        Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-spdx@vger.kernel.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2] LICENSES: Explicitly allow SPDX-FileCopyrightText
Date: Sun, 11 Jan 2026 17:07:51 +0100
Message-ID: <20260111160750.17569-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2749; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=mrJ2r/higfpselGc6ELPbZ4mu5aGxqm5xTx8ZYso3Q8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpY8rWn4lKtNED4bXwPlQGOV2waA/b7Ss9A0shQ
 JaUJWeko+WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWPK1gAKCRDBN2bmhouD
 1xFWD/92jI3k/cDAvEeWpS0m/rW9JKqyC+dXTlXNEjYOdi9kh4F0TP1H5C75exA91rVOncDuBTi
 XsdsRmcYK1wNS3cPjmqsUEU/axosOqgvqLH8LZ/zZgkbTjDur5sF6YYKFfgJDy7zO+nYPRWPxTo
 M7TREvFci/b1Fdzk4p0qhXu8mIxofsTHqpA4mBM+l2qHoHhWKnuxC0XZE2sXw9FyfxRIL6E1BnB
 zDi9PER2GG5LNNbjPUhN2Tt6u16An+vqZx9By2ccLAxg5E7H3Y/19qrOXi5BirPQsdbkGh7uuMh
 xCbmfVyMWmRprbEjg2wFIJ0LWNz4MRdiD/1Zgv0Rxu2k5ZJONzG/EycoAZ9PseivLDBnJ03SVCz
 ylE2sI68mSbTnfzUqa1wbUaYQ9r6RnQHK+/CM/zwmt9bnLo4pxEMPvKBAx7gYvYkhRRDlRm2e3r
 D6ZnCeD30Q1npEpVCcuxsC3Lr+xdIKA/LoiUfxbJepaRbQh5Vg+N4JHYkcw3CW/77Xu3FKbE8xL
 ESnVAwUUBWhR7KS1+9P4zaY5GKSOPMxiDcacU/x0kXM4Ys3qivg3APpXCM+zDXXgcpRaGVq5s93
 llk5SBAyLcWZn9fbJIjaHL1nW6ztUPvKdnYy2HMbzKSb4L9yuCjYRWlpuNvzFRNsiyvHtYwwano 19EIqgGPxKabXxQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 9R5VeGrbtL7eYQ4Ma2psroPPOoHBX7Dn
X-Authority-Analysis: v=2.4 cv=bOEb4f+Z c=1 sm=1 tr=0 ts=6963cae0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P1BnusSwAAAA:8 a=ag1SF4gXAAAA:8 a=IJv9LcIfAAAA:8 a=EUspDBNiAAAA:8
 a=_UQAGB7oVweOm72raGYA:9 a=bTQJ7kPSJx9SKPbeHEYW:22 a=D0XLA9XvdZm18NrgonBM:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=cmr4hm9N53k6aw-X_--Q:22
X-Proofpoint-GUID: 9R5VeGrbtL7eYQ4Ma2psroPPOoHBX7Dn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTExMDE0OSBTYWx0ZWRfX033L6FyZ61bL
 a9WOdOVamPuhR1z13peBQDUQ2cmY6LYdrCdZqap6n1DyX+YOk/rcTxYISjRApJ0E8k7+CklgYmw
 LDyfp4o0yee9LkyJiBiBuBfLhqpP/A/f3NRhNhx6lBIto1pb4R91E8/rrSwowmMdnvj7skdm/3F
 kvmIC50vQ5ojeurKS2EQmfUoCn781gJUzj3UJbQPVQqEKcJCJaPmSxo4Fbm6AdyLnUUp2Qul2HS
 Yff6666R0atkuL1w1AC1VtVhQjJanR9O1c9sIl0MNhim0gOQaAHHjyKWmMQueDZB80pI263EDC0
 +zPVaT7kLmVdkRtVvPoe2QGNrB/TQ1EKjZYuF5AslXlwZ64K782QdA5MmUrYE1UZBaZDcrfEqh8
 nKnNIU2KC+io9pF3Ch+nt3Z+nQSLba0/LxYzpbmE3M60koPSGROhA4/Mj7bpQgMz/t+CdydF3L4
 yLrl5vB2VtdWBJcNERg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601110149

Sources already have SPDX-FileCopyrightText (~40 instances) and more
appear on the mailing list, so document that it is allowed.  On the
other hand SPDX defines several other tags like SPDX-FileType, so add
checkpatch rule to narrow desired tags only to two of them - license and
copyright.  That way no new tags would sneak in to the kernel unnoticed.

Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Joe Perches <joe@perches.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Other way would be to remove SPDX-FileCopyrightText from existing files
and disallow this, but one way or another we should be explicit about
it.  Otherwise people will be sending more of these and each maintainer
would need to make their own call.

Changes in v2:
1. Doc adjustments based on feedback from Greg and Laurent.
2. "unused" -> "unsupported"
3. Drop redundant blank line
---
 Documentation/process/license-rules.rst | 7 +++++--
 scripts/checkpatch.pl                   | 8 ++++++++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/license-rules.rst b/Documentation/process/license-rules.rst
index 59a7832df7d0..5cc58168e3d9 100644
--- a/Documentation/process/license-rules.rst
+++ b/Documentation/process/license-rules.rst
@@ -63,8 +63,11 @@ License identifier syntax
    The SPDX license identifier in kernel files shall be added at the first
    possible line in a file which can contain a comment.  For the majority
    of files this is the first line, except for scripts which require the
-   '#!PATH_TO_INTERPRETER' in the first line.  For those scripts the SPDX
-   identifier goes into the second line.
+   '#!PATH_TO_INTERPRETER' in the first line.  For those scripts, the SPDX
+   license identifier goes into the second line.
+
+   The license identifier line can then be followed by one of multiple
+   SPDX-FileCopyrightText lines if desired.
 
 |
 
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 362a8d1cd327..cc2a5882fef8 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3844,6 +3844,14 @@ sub process {
 			     "Misplaced SPDX-License-Identifier tag - use line $checklicenseline instead\n" . $herecurr);
 		}
 
+# check for unsupported SPDX file tags
+		if ($rawline =~ /\bSPDX-.*:/ &&
+		    $rawline !~ /\bSPDX-License-Identifier:/ &&
+		    $rawline !~ /\bSPDX-FileCopyrightText:/) {
+			WARN("SPDX_LICENSE_TAG",
+			     "Unsupported SPDX tag\n" . $herecurr);
+		}
+
 # line length limit (with some exclusions)
 #
 # There are a few types of lines that may extend beyond $max_line_length:
-- 
2.51.0

