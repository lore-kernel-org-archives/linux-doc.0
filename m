Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA4B2765F5
	for <linux-doc@vger.kernel.org>; Sun,  1 Mar 2026 14:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772375612; cv=none; b=Z0DQZiX/8ouKxIoQmtqQ86rLS3kTmy42TpJjvt7XbOEbf2Qj04QLz/rJ/Co4oLagVbXVE4yIIwrAWI6iwejRzvhpnKIAzLTWuoERSBRzv0uQOOcmP4QkhJkVvEkOF7qcwXRQz3TtRb+lywzCIHa3jC/a3NhRcBqj3bZiOX37yN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772375612; c=relaxed/simple;
	bh=hepAsTbXOdpEQ283mZa1ve5BGe00kT8YrPrcvwQEyP8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cg0RIr1e0nJpuIUW6mAIMNvkwlGeMcXY3MyNNPnBZJ655TD6fd3LiR/1axLS2r3GzY9fVGW0ObNdTCCp0oSHpnyZILIOTaYKpX5oUxtLAG1PMoOL45NMgdo63NKjLn2S6kTFWJsdAOww47zSBErxvD4wP2czhWAs1tmTE6A0Pj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n2Rd4fxi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JW7O3NLC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n2Rd4fxi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JW7O3NLC"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 621BpXYL3139783
	for <linux-doc@vger.kernel.org>; Sun, 1 Mar 2026 14:33:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9/PjmX8kfjwszjEJKsrBmKTogNX4/jmM1He
	eSPke0Fg=; b=n2Rd4fxij0+y7pqqH5fxhop3muag+bUZdW0LBeC6dK0vrjvv7B/
	Y8bwi1SueLX9rJpmYe4UBBF1zj1EBqNeGeB+r7Z1WAQwKbYVdPhXDplFJ8uF1ToK
	xzgLQmqZrcNAJyVplJulQNGeDKzQeZxKvs1ikMm6fQdujz3IjYUz80WDl7/bNpSk
	KvDG6eTjEl3Pwepv8qHoFMvXE1lEwNIkH/hbsQl4ZKA7JugeVg5cbsKIynJN1tyJ
	HEys2IKrHt0te+1TWokvdi7f3/pGvGwseOSHM1U0yIB4EVOTpbMhBfF6c6YHPjWr
	eD5jeXTPw/hhGHfKdQ5KTbSdE+pyDER5LLA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksf8jusw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sun, 01 Mar 2026 14:33:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70d16d5a9so2838027885a.3
        for <linux-doc@vger.kernel.org>; Sun, 01 Mar 2026 06:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772375608; x=1772980408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9/PjmX8kfjwszjEJKsrBmKTogNX4/jmM1HeeSPke0Fg=;
        b=JW7O3NLC+OBU4/bOaDhdB8mizq/A4R/x+DAKF9GAcO4vIo4/nnFNrgeoxgYNmuV5K6
         ROUvxdo30F0Q3mCixjm5bJ3l0LPnpe/rIpfJpdvtGnmg3wjyjwrQo2543ohGhInRfECv
         5+JxU2yRar63HB9IcSaA1bo0EGV2HCjvGecPKiJCzBG404mYDsNJGay4FscYg2IDrfzV
         G7Few6Gx8I6o5INjF6O/cgFhCv1wPxqH3nD73xXK1xF6a1xnoEd+JtkQwsKgTF2XaAKa
         /A2dzP/rVU2yUUmk5EoYXhhc4HmIkz7uvIzrSLo8FlzedckbbDVYSZ2Vh/1jIJqx0QVB
         dgCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772375608; x=1772980408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/PjmX8kfjwszjEJKsrBmKTogNX4/jmM1HeeSPke0Fg=;
        b=OKxu1Z5sl5PbLJS3yshQ6duK6/Iavn1iBx/3dmkWuOpGrH943g8sfEJ/V38FcztmYz
         gbVETI7kle0tX+cyCXWl7/mHUwKT5k6wBAsfyrSKhetuYi/2NE/oyWoNOyYtF6VBel1r
         FxgSM1iXFZIgROIrAJ2ymvtYWj6p1VX+DHy+6KmCYRVfZgdFaerBfqV2YCPcKQPHDq+s
         u3WTrIorRQ9+mmFzSwatMZw3FJi9QRdZD40ACXJTeL77Pt/s/01ke7BWth0szZfbQYWB
         IsdWzNG3g93MyjSXofa2nuZkTXWZI2yqmT8Y0myZcQyWAAGSB62mXDbX9fs2VKoDiz/I
         V7eQ==
X-Forwarded-Encrypted: i=1; AJvYcCXz4gTR1Q4sPf+Ks8Tb/Bv7RA+sFeFsHd5MBzek0QPZOcyKQIHhgH6XsDjJaNEHR9idMlQ6nTWhp+I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyL0FyQBKpzY2iyQG15yht9P/ddha/5l+hrHe5S9vvOCKRs8sq
	5sUoCqWvItkIHuXXm/a7vQkShrWct/oPvsydS+WsNvFxKz2g/C4mDGhF2HKqf4ap6+x5hCnLD7O
	27wkxymS7iqJAKiIHYIcS/yK5ZMrwlySrdVPZPH3iT8nuvb8iGsU4b6V0P1zSV9A=
X-Gm-Gg: ATEYQzyugQrhdPMhzFqLoSE5G462P8LTDMKaBnKzUTVAryclSNm4yBDzJlwV5NroEdD
	P1nI4vtm6sgXGibpo6mPliuYpFIkd4whIQeVVznk9kqPi4E/munsYs8Ap4rPhFsvjVa/DZllV6o
	IcXqZu47aoCWRorqjqJNMk9pkxCI93YEKYN5mnfaZSvKV2Tb4GUPFcrtLL5pz8nc8G/edDAcv8T
	2t0Fkp9y60xhXXavNIZ5qa6ICiQETqYhJs6ZSN8ZFev5h39a+pm8Z9EtQJYEThm3Zu4QPiJu6mv
	DZQ4n/O40kfKLJuud2qYlMXklIL19u144ElYGAutXsaQAY8MZDsoHmQuDIrftNTAhpoTpxKOVkW
	yrWBUA4vNAAqPupR4jJheWSyjMfpw1QZZPUO9
X-Received: by 2002:a05:620a:190a:b0:8cb:4d05:aa43 with SMTP id af79cd13be357-8cbc8e187camr1065907685a.59.1772375608108;
        Sun, 01 Mar 2026 06:33:28 -0800 (PST)
X-Received: by 2002:a05:620a:190a:b0:8cb:4d05:aa43 with SMTP id af79cd13be357-8cbc8e187camr1065903985a.59.1772375607546;
        Sun, 01 Mar 2026 06:33:27 -0800 (PST)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcbf789sm110700135e9.17.2026.03.01.06.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 06:33:26 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-spdx@vger.kernel.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4] LICENSES: Explicitly allow SPDX-FileCopyrightText
Date: Sun,  1 Mar 2026 15:33:23 +0100
Message-ID: <20260301143322.92894-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2924; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=hepAsTbXOdpEQ283mZa1ve5BGe00kT8YrPrcvwQEyP8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBppE4yzr81YaW4Dl6FtLqzHGA07kx+X6aHi/CKL
 tKuVG2PZeeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaaROMgAKCRDBN2bmhouD
 1y7DD/4hrk+Ktgai+hvAoEYD7rn8j2xWnIKtpFwdFmZ7xo0DXI4lDPcdXRmn0HZAYkaTkWVFG54
 KsFZxTnUm/KCAdmczjPDRCmsm7VRgnWN+1cTh80CQGEjGytoNOPCgaPBjC8cOF0IMc7cCFLRm6y
 EfaSi227B+Z6s9lfYazFSt6ZP4hIoK+zwSNUHVhYPlcotvJVlBCrSDF0fXc6XwHmOih9v+mz2L+
 DdFhpffwAjuBl6xJOGeCL7XT/dH6tBEzY/jKd4sxWihwyaMCkqZZMriSs+HkculsP3xpLb5xwt5
 yjRR1ydK3F8JoCCupJdHlwJooDVtxF9OD8vJC9hu795FaM79iTWAjWgLL/WR+q4alDzW88V6JAm
 sWyKiCLzfb0ds7AEr8WQc3WKTKIYK5gnW644Kfkn966CbcYHJBHCgJs0SU8pG1JFT/SpNxbEqwK
 JrY8wPSfTcRxs8++ivUN9KJx1JCIo/t2uilbGY4Ee5e/8K0qbagtsg5mEvsx57ZOBHbrqlXxcGP
 pdD80gLvwiIPBaBpbfhJRZJX9qbGnetT2GC0HXu60euZfGDrH30ofimlvBj8x5Ywf3UjGUvDyhV
 RBBxIgVqhc1ZfLTDyR4ykUeyCf+m1ZLmaV8dfpR+SFMJ0+QV2AROTqG6p32/5L8nC7RVTpyiZJv +zuO6gKljIBpUzg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDEzMiBTYWx0ZWRfX1XluuiK1cs62
 0g7Jnaspg09KbJId0ciOe3f0YUzeniS5ECGF1/3+4QFGuICqdrWwLuLpl45ym/v4aii+XOSIs0e
 FBAz+lqUbAsSQ5S4NeoHVg63rgbP4mbRjMHOPxHwZuQteRA+6kb2oW5QvN43S+/5vzV9aiHmsVj
 Kf0zNkGeI10xZVAQXHCmPB3l7vlIFR3ENaWRuCQFqHdxbGohd8Rw+GlTbf85seynBpgCwrS4UYj
 uuGIMmHv1W6cs+dukSr57IFb1FOErgV0MB9bfGksAh86o9uosaqmLcRMUO5JOX0GwupmrrePd5s
 p/GQpubTWb3qvGCAWARgVk4ULSTuy6kZ4L2iDrovTGlHQFcBzzMqj4wUTPzlwh18draJxop3011
 umuoISZp9V99CO0/u/USX2u0vPCgLQLDRh9JO89yMg0U/8uEohzIDy7fisFJdLV07U3DrJ/4iUq
 uK8iPQ5Li0fDWfGxTEA==
X-Proofpoint-ORIG-GUID: mUYf8l-bgT9ZxOp8l1nfEwBCE0NFeo2n
X-Proofpoint-GUID: mUYf8l-bgT9ZxOp8l1nfEwBCE0NFeo2n
X-Authority-Analysis: v=2.4 cv=I5dohdgg c=1 sm=1 tr=0 ts=69a44e39 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=P1BnusSwAAAA:8
 a=ag1SF4gXAAAA:8 a=IJv9LcIfAAAA:8 a=EUspDBNiAAAA:8 a=_UQAGB7oVweOm72raGYA:9
 a=PEH46H7Ffwr30OY-TuGO:22 a=D0XLA9XvdZm18NrgonBM:22 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=cmr4hm9N53k6aw-X_--Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603010132

Sources already have SPDX-FileCopyrightText (~40 instances) and more
appear on the mailing list, so document that it is allowed.  On the
other hand SPDX defines several other tags like SPDX-FileType, so add
checkpatch rule to narrow desired tags only to two of them - license and
copyright.  That way no new tags would sneak in to the kernel unnoticed.

Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Joe Perches <joe@perches.com>
Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Other way would be to remove SPDX-FileCopyrightText from existing files
and disallow this, but one way or another we should be explicit about
it.  Otherwise people will be sending more of these and each maintainer
would need to make their own call.

Changes in v4:
1. Grammar - "unsupported" -> "disallowed"
2. Add tag

Changes in v3:
1. Typo "or multiple"

Changes in v2:
1. Doc adjustments based on feedback from Greg and Laurent.
2. "unused" -> "unsupported"
3. Drop redundant blank line
---
 Documentation/process/license-rules.rst | 7 +++++--
 scripts/checkpatch.pl                   | 8 ++++++++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/license-rules.rst b/Documentation/process/license-rules.rst
index 59a7832df7d0..b0176bb8a465 100644
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
+   The license identifier line can then be followed by one or multiple
+   SPDX-FileCopyrightText lines if desired.
 
 |
 
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index bec7930cdd66..c0025d2f5741 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3856,6 +3856,14 @@ sub process {
 			     "Misplaced SPDX-License-Identifier tag - use line $checklicenseline instead\n" . $herecurr);
 		}
 
+# check for disallowed SPDX file tags
+		if ($rawline =~ /\bSPDX-.*:/ &&
+		    $rawline !~ /\bSPDX-License-Identifier:/ &&
+		    $rawline !~ /\bSPDX-FileCopyrightText:/) {
+			WARN("SPDX_LICENSE_TAG",
+			     "Disallowed SPDX tag\n" . $herecurr);
+		}
+
 # line length limit (with some exclusions)
 #
 # There are a few types of lines that may extend beyond $max_line_length:
-- 
2.51.0

