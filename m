Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AB0332912
	for <linux-doc@vger.kernel.org>; Wed,  7 Jan 2026 17:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767805978; cv=none; b=mLHu/icyVh8h2NRjC4VI4ZBwcegfZqK3/ZSJH4uAo2VWL/d9hcWgARM6XeA4q8LNjT6ZlkusybdqTCPU1dqY77B1eRBgfJTwkct4KQWsVv+46ccC1u+OI85KOEi0OehB4DzjwHWY1lshhATAR9e/m3yobsOy/UIbPWk5RR5jhKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767805978; c=relaxed/simple;
	bh=N0G2ffuDBbq7gpywhPKYxodelqUo83XYdwlcWpXg4Hk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pboNNZMf0DLTh6NGfR5mqzvAW109sYZdb1Z5XP0C4XUOageIJsM5LjZec04Q5aiWCiebhg7H66ICBtG2M7eeHzSS0eOEZJ8WK+AhBiWBQBeQPEtt9ych7LK4/PAbwx0yfRjXugmyrFBjsSqvt5DXOoTCLS7HRapu4SrPseazdFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N093k1cA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a8K1Euzb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N093k1cA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a8K1Euzb"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607CsS8m2239468
	for <linux-doc@vger.kernel.org>; Wed, 7 Jan 2026 17:12:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BhnC1bjxr1aLOi+Ek+VPvbB77/IQtQmkLcU
	O8GRpqt4=; b=N093k1cABGW2OOdeQRvGwlARqfhw4rQpyRh1/2yUxeFxcPGcj0j
	4iBJMWJZxZHV5GqApW/70CN2AP+O1DH7tNgxdlJ2k+KXRmaE88J2rJiXV2k6rVhc
	+YBZmDFkx1/zQdcDsX6rc6OXwvEUhozI+uhxHZXr4PIq/ZZCpxRF8W9d55/GSjw8
	Tbxa8fNZfiWq45QxEVpublEitrIEyO8PIYW7nWoG6iFOFVOBAWovz0tu68vedHy1
	0QFC+0ohks2uIN0Uvkx+KiCzuGCClMrAEozgADrR5OyMPYTZsw8n3nndeRfv0LR9
	eP1V1RYr03ZF6jDTh1gTz0L8Pkg+GKUgZow==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhqwg0utf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 07 Jan 2026 17:12:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8ba026720eeso625961285a.1
        for <linux-doc@vger.kernel.org>; Wed, 07 Jan 2026 09:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767805973; x=1768410773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BhnC1bjxr1aLOi+Ek+VPvbB77/IQtQmkLcUO8GRpqt4=;
        b=a8K1Euzb6KNH+LgPPk9Y4CJiqsHMeNgDiUErYxZgHxxWmiiia3HFY05ODl19ZWDrkf
         1PGMDnWP+wFBsCxCGloLkaoI+ZOEoT7Y75b8oip5WqZgVxAYLzr14c30I23yPzGIhNcA
         4wUAHk0wNlmfLYJvvzqjNgQSzQP0H2SPGRaP2Z689JmchlhM5tAd9BzxLo157JuXlk3A
         uwG7zZq6lthf42bJAcBFO2IrpswmnU6pJ4rI3+N217mUwOEEO4y/pwB1e8m2okv+7Xty
         hAlpljnsguQdTa1y5P4PORoJdFm+1ZBr8MVs4QH8u+aEbuT/9itfxN+s5ZFe/MqYjHkz
         Vsyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767805973; x=1768410773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BhnC1bjxr1aLOi+Ek+VPvbB77/IQtQmkLcUO8GRpqt4=;
        b=VvZlv1nCaB+4fMEVfznKHEX9dfjX/GjbPEecjGJ3/BzK2mD9xhLxlrhnyUSWy2Ko2/
         YHsZT/EzhmSTYushj4kXT/gXOAbsYDxlA3fkkQF3iOfw87Co91QzfPkef6B/aR0KOLyw
         13ctjWaCbQoWOpzIwjGfqhjjE91k98LI1vB5qtsiwpVqhgpFUUgqaaoSbTg7R3GtLvmK
         p2cxW2ieiDiNSYtEuzgj1BVAxslcAX4Nv/ltQQjjJTXhKKHqOd/QhQ8Iwx2ojv8G4YwC
         /3jqFDnaQxqwHUK4U+kSdsMVTNI/L4H/8weUUAew1vlgxps+JGCZo+k7haScx+/S9Omt
         ypmA==
X-Forwarded-Encrypted: i=1; AJvYcCXSg15Gz0XUdyPPlltNICxZDY/FHpiIL8+zbiZRKZ/DznGQTVCQNDav4mwP1qwdArQJF5+d7U68emc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSEYXZeVC4iyywRVQ5C3BneOrQ22nv81uyEWfWr5ft3iBqIuOq
	ejUTfCZuw9iErzpE6URooxSozHXUln2oaB91BxYLMoxQHjEC7EEC/cbF6Ev7GJVMl35n9ibuUkM
	WMca0zxmcW15/k2kyFzBXOD9e89X+R4ve6DwJNbSuTgh2Qffde4EX2RznJUSuOXA=
X-Gm-Gg: AY/fxX420C4p2mEFaDZXi0Q21UeV9MC7YIUE9MwrmQxDGLozrcFw8KGXTJAbTIux2RQ
	d9Ja4bQsY1MGrhz5Qg0t24oXfUBddZBN9qfNqCX+kkUh7XUTtSU8wYghGGncCR8Gb6Tbf15gge2
	k1uwTpEOPYAWZRdlNgOEZYagx9y9bPEAdwNvNSSM6AOB3k1xMtR2HqNBJQ6RBEQtFF2cvzONjvt
	cyxgpZEshAALkH1ZQPSgTtEIMy2/piiLjk9u4paIkVJLQNmbDA+wkDYYOHfzVZtHPD8Qyr6d6LZ
	fq9mKdhWf70v8MZgFajpeOvIyY9U2vWWeSiIX7NQFvonSRUoFez8KjqhHsE4gMaIhK4ew0Dzgy7
	hm3j/DqnmK7QApdjiVRGy7yY7Zw==
X-Received: by 2002:a05:620a:298c:b0:89f:764b:a4aa with SMTP id af79cd13be357-8c389368df1mr410775685a.18.1767805973279;
        Wed, 07 Jan 2026 09:12:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGLq08CZ8nR23ucExLb4CvsXiIo6kX5gKzzk5m3Bnc4mP9c5+jrDXuBenuswHmQfCHvBHgBhQ==
X-Received: by 2002:a05:620a:298c:b0:89f:764b:a4aa with SMTP id af79cd13be357-8c389368df1mr410770885a.18.1767805972725;
        Wed, 07 Jan 2026 09:12:52 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b9d4c89sm5013433a12.10.2026.01.07.09.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 09:12:52 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>, Andy Whitcroft <apw@canonical.com>,
        Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-spdx@vger.kernel.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] LICENSES: Explicitly allow SPDX-FileCopyrightText
Date: Wed,  7 Jan 2026 18:12:47 +0100
Message-ID: <20260107171246.242973-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2059; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=N0G2ffuDBbq7gpywhPKYxodelqUo83XYdwlcWpXg4Hk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpXpQONpIx8JizfVZLFVjxx6DLOMsYGW8KsBkpa
 qAMvsTQAxaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaV6UDgAKCRDBN2bmhouD
 1/LiD/92HMWwthUq97pAgrlmQK2KTUMQjI9xM8nj8LLUUNsUwbFN3r27YcK9rePVTFHJ/zN5sWB
 cly/tUfSL+BxCpmm6bAfN3UYQESDPPl9mXRI7CxoBVxLax0+pyEtUThr3efoWCFDNKfoCMCTOIZ
 M9Uk/bs2QH9zQEXqerzDItocxG3uQmWF97/NFmMWVf5ehWLVjsl7X9IuZ20QnW7gx5WdB7GPalN
 hFNsBnCJTvGXxVBL18k0oAFbBo5w0fTdTt/j+naBjpbv1NA5DrGpyPoe5xfs/wRZZusyX7uOLjU
 N8Q3ULMTn9zGOU3w2itOFTh5cXH1W/11epzr9pDrrF4tJ0TFC6uS+x6kMkClIdfS+ds5DhdPnG5
 J6BrnYHLXWq/Jx/uSVQm4kP68pKhUCevjA5wC+n1DpApFGpgR9J0351hgzmA2Bjqe04OL/P17BL
 bg7plkzZCQWcI07zR3d9Owmp8AGL7YJrE986nITr4A0ienJOxvodLSMQnVclW8UhtbiL4gcMrSx
 hVsDwlB81FUhIbmMqSQzNaaSEFvOZCGYkK/mBr2yI0XljFoZDl+8a9WouxnXzgVTi/214PHmoqF
 s7HzuOJ0C0BIdNlysX4O7GHLRO3oPXsHJt7uTTWgFbAIepIoyyDTuRKobcIHJCWpTHVcS0ROdb/ R4X+yxCv2lZz9Hw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: zeFSlL0vwT4rRxCj99BtkbRV6RE1Lm01
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDEzNSBTYWx0ZWRfX5X+ab162omke
 rT/4OaRrRYxLrRXYmqKWiVVXi6kn12b97bRQy+qpwd0pipGkhXsR5UI9vTRcd0MBVhePnU7SLJI
 4IVv1MH6mUMj1kiCe3C6kNI0zYUICcwq/5zkZI6Z2PzuQAj3rGiFPvtDNTjnjTI1gMLitdyYuyR
 tWyqiTrltr/UrkO3CzlJtvqLiqf2Gcl1V8svvS7i/B/zu+ocuYGpmNopG3L4UYytNcKXeiOmSGd
 +8DZR+H50kuTuhoA4VFBvna6jtcHWSOQ8tHRaToAYH9RgaF8hv+cAhZ9CvFC19VI/MXzcfWu+hz
 ItPt/KKtGoQQliNZVZYN3L2g+7ZgQrSTl9CrHGTupysuUelmPWU2nhsscVgSojIfkl/BX0XrWX9
 aySrGsTVebAGL7IdMnQjuDW5QFHQOIdfuESozVuBZ7tXuZeefX+ogGwUk9utpWNGEXLqxNlq54X
 Ghw58pSoXg2s08g3daA==
X-Authority-Analysis: v=2.4 cv=Pa7yRyhd c=1 sm=1 tr=0 ts=695e9415 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dRIqDbwSeJKetXV8Y-0A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: zeFSlL0vwT4rRxCj99BtkbRV6RE1Lm01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070135

Sources already have SPDX-FileCopyrightText (~40 instances) and more
appear on the mailing list, so document that it is allowed.  On the
other hand SPDX defines several other tags like SPDX-FileType, so add
checkpatch rule to narrow desired tags only to two of them - license and
copyright.  That way no new tags would sneak in to the kernel unnoticed.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Other way would be to remove SPDX-FileCopyrightText from existing files
and disallow this, but one way or another we should be explicit about
it.  Otherwise people will be sending more of these and each maintainer
would need to make their own call.
---
 Documentation/process/license-rules.rst | 2 ++
 scripts/checkpatch.pl                   | 9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/Documentation/process/license-rules.rst b/Documentation/process/license-rules.rst
index 59a7832df7d0..8d7c0214f283 100644
--- a/Documentation/process/license-rules.rst
+++ b/Documentation/process/license-rules.rst
@@ -66,6 +66,8 @@ License identifier syntax
    '#!PATH_TO_INTERPRETER' in the first line.  For those scripts the SPDX
    identifier goes into the second line.
 
+   Identifier line can be followed by another one with SPDX-FileCopyrightText.
+
 |
 
 2. Style:
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 362a8d1cd327..98261ee97e2b 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3844,6 +3844,15 @@ sub process {
 			     "Misplaced SPDX-License-Identifier tag - use line $checklicenseline instead\n" . $herecurr);
 		}
 
+# check for unused SPDX file tags
+		if ($rawline =~ /\bSPDX-.*:/ &&
+		    $rawline !~ /\bSPDX-License-Identifier:/ &&
+		    $rawline !~ /\bSPDX-FileCopyrightText:/) {
+			WARN("SPDX_LICENSE_TAG",
+			     "Unsupported SPDX tag\n" . $herecurr);
+		}
+
+
 # line length limit (with some exclusions)
 #
 # There are a few types of lines that may extend beyond $max_line_length:
-- 
2.51.0

