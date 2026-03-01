Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71D032BF44
	for <linux-doc@vger.kernel.org>; Sun,  1 Mar 2026 13:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772372468; cv=none; b=P/kYbYQPuwfIzYQs3fJ6zFgmFBCaY933oRMIplPLfQF1Qcj/jr6tqcTEHkeC3lnOt4VAstFdzIJYECethZsbxABfKN3PebX6hBLXHaiMDjoB1jmNqqI7xGO1roLWroJM12/xRXW3l2lk1Sjy0q8rrfRNsW9Rmmlfff5Tyf4L7es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772372468; c=relaxed/simple;
	bh=+ES5/OC/9LPBAa993HFBienoS1osDIOASawAF5IW9TQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TnnEAFKOlpq7l22RAVpYGdS7dP/bI4cxOfbX8BMxIfndCy8MEgpt8b/1beyJDR3GrYqpRpttixfbZKXZzV5IO04YY6SoWADiF8bgLBo/4SGZVsVYg0SAV6PCZHljBGl6nXfr0qModJbo3uZxYMexK07X4kU2KtjlTAyxn/I43iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Td17FqzE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BQms9avH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Td17FqzE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BQms9avH"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 621AviWC118739
	for <linux-doc@vger.kernel.org>; Sun, 1 Mar 2026 13:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7xlenVyuNtjntNFqpEinehs1xY4pgd5f7lk
	7THeCl2Y=; b=Td17FqzEfTGEK5beOqSpZBhpp8WhB9khRw+FmgBOWe6ZUeRw5sm
	4W2lxDTnRfYKuPhAXvstaTfGgxbNVUxMdbplh2UekKWxnhD7V+5P9RvN4erbjaLe
	ItxjsPeIpTQ2D2LeJfEkL6zAnKZXtPToSBsTBJWQD5ABxvD2r6us6Ta1/WwPi++H
	9U0PzHC2q3zbuNAMkQZ/9o882mwqB3pGODtVly1dVu+UrdVRG0NceTyVtDJasRjc
	nXJo8wIHUu/tEM35FxtCan0iBnStCXANbw6/DtKPMbKFPBKOp5fHeveS6BTOgzBJ
	6rnYTS6N8Pp26f1UgfUoiJnRZlC85Ga0+pg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksn42rx3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sun, 01 Mar 2026 13:41:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-503810dba87so669169781cf.1
        for <linux-doc@vger.kernel.org>; Sun, 01 Mar 2026 05:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772372465; x=1772977265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7xlenVyuNtjntNFqpEinehs1xY4pgd5f7lk7THeCl2Y=;
        b=BQms9avHRMozheEVje/NBX1MxSJIFEmNPwmcecGNeIDQC06kOfJIuo1HlNkDc7lFxz
         MwWQtQ4HLDOY7Tug9tyYKroRdJmyZO0/GDpvMPykKfWy0B96JNB7w8rhwQmVB2FIDo/T
         nVyDZK9YV6yTpFe5eMpKk8a75SRtt9QiUMwhQIyUNpxABtxFBqPCMpRnqSv0tL2H5fZQ
         6f3xulFY8HnSWX4TCRzoxraen7ztGnyk5IFH7Rumq/RzC6ODsQ8tQfEf0ksRRyoH/QfJ
         KWEcDjzp5u/sFNRsPUA8zKfSIIWrAZ7jqR4Df971k/FItkmtMHwbMppAHIraHnPdN/69
         l8Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772372465; x=1772977265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xlenVyuNtjntNFqpEinehs1xY4pgd5f7lk7THeCl2Y=;
        b=MWdnT2uD0CNBaQ2yi8GF7ZDllZVqVR15j5QMbtiaJlCRV2VmRQ4oPu0TQK1hFIQNg2
         KJfOCPOvMg+Fhb+xa8J4HQPbtrDFByHtQ/3AwwoiqHge1t5ojt/bsNEs+x8gSqtpUu3r
         Mf1LSvEPPySiMpDsrQl1Yl8JQ8ZvzFALiv4CbZnf43lNG87ux4P3T4xCV1D1vU9lFypg
         PkCGa63tDxYO4/ESJw0yaBNwYpIxDvw8mUW0cgUQqordUW47/cNSw5JWadDK4ny9TB+Q
         YUomZCRVhDT4WYMqpKcFV05ABdHsIJgvqoLNhDty5cc/4N8NqAILekP8ZkNp2jmyPYFO
         Wo0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWpAnQdyAbEjUlOn925ZmbJGpnAjBhihM/YBLkZ0Jsx87aortRmgM5wZ4EISW10PSJTLfavWZjmOe0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6Ci6mrB3XDLlwrqjslG8NgAookvyMw4mTp9bB2Ocs+0shuvNC
	k9kmFUzMQ4LPAaqU3wkeL/C+YWP2Zt4Sx5c6Orf0DV22OxXngxBbip72ob2v42iPNuSLsTHwTJ4
	avNj5QZ9CDEXcQlGXWgWbFd9/3rU4mzwl1YGdJBmXL3GSRuTG7L6FBI8f4mLxEjLZuBs0hhQ=
X-Gm-Gg: ATEYQzzd0KEMjoqIs0+Ugm0hnUC0DILXxp/g9E/RyjYbh+SI4/71B3NLDRrqAQBbEWf
	6/j/Qc3sMDaNROeN6wU1jtrmejxpn5Oyh+WUxv2wlT18lVlhSOhZKZ+xSQIffe9sboU5mw9Ruq6
	5wJpoP+OW+KXCRknujBxhtwbhuighWZEz2TJUo8S4uTXA5BazoOb0/homsYw/1Y/jWnAOkNmC8J
	zdtx0M/8EOSUwOrA0bj8C8/OJvktRjnNLyCar3qOGIPWbxxvuX5ovVg4Enul+zHNA9H6gmAQ79B
	7/SqgXeRdt/J4CUvbTOSYAbYNLMAHVuEtceJidiREcXusisoUiwgzwJjFwV+olkdAyNvUZAPbHG
	7jlDYDKHUf2eEHNZPqmnJ1C0oRIDGMs3gHcmV
X-Received: by 2002:a05:620a:2947:b0:8c7:1986:6b3e with SMTP id af79cd13be357-8cbc8def8camr1140379585a.32.1772372464605;
        Sun, 01 Mar 2026 05:41:04 -0800 (PST)
X-Received: by 2002:a05:620a:2947:b0:8c7:1986:6b3e with SMTP id af79cd13be357-8cbc8def8camr1140374685a.32.1772372464007;
        Sun, 01 Mar 2026 05:41:04 -0800 (PST)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439abded86esm9847067f8f.6.2026.03.01.05.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 05:41:03 -0800 (PST)
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
Subject: [PATCH v3] LICENSES: Explicitly allow SPDX-FileCopyrightText
Date: Sun,  1 Mar 2026 14:40:55 +0100
Message-ID: <20260301134054.44229-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2790; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=+ES5/OC/9LPBAa993HFBienoS1osDIOASawAF5IW9TQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBppEHmK/0xzDXEFIefYYocp9laE66FRSmlk6eBm
 Juur/xk0vmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaaRB5gAKCRDBN2bmhouD
 18AoEACHaXDFDxGawaFu1oOLvwIynprJbUpmMovJXVw6SSMjRFIAUQWKJjjBO3NoegzdynlrPe0
 mEl2Vby5k+zfFJVXeqLrBt1RaeMNSL1G0HPcPc0XYnPrBEH9FvzCtMdxjrWlCc/TwB9R0F6Dy9a
 zvMCZq5ShdgMt8bigrJ8eiUUcc76aF/q9/r3mVNbpxx+QTG0DCtBVxBYiTfL4dbGyjPV6K1NWK3
 lAnkS109Cky7tzkK0Q8t4pCa3kCGELDLaVEumc51FXPncMYHVAOjAZZTlbfqFx93a9vfHKfmPaW
 hjpp7J9+uqiDVlERI09lII0KofDF6ijc/66yh3zpvVG44lVcOWK9AWMJgf+ZeiQa3CNAhVHPPd7
 IH/2SEAndxQDLUGQTKeqBIlTFw6erWPFCvEePGQ+XoC7BWDOuVSU5GdJAfDJS7NbgPszU+83gRv
 9Bs8zxSNMIJeDi+cOW/7dKoJysohNRzYjcHKB1K/Jnk6JycuUjrzFWzUqfO0JdaqoNxv5ClQTDl
 Sueiq/KqkHpAgvbGyQDUZsJwjtl6c/faxM/8JiKLx+WyywSqxy2cefSL4bS+yzpFJbYafoed9EU
 wiywXGHl7t3Zp8gYTYDR6G7W3hZuDFZikCXIoQR5+L7PkT5kAfIvD8jqoBtT2gzs17OIKvhif4J 7k9/VDjmwQH9pHQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Tq3rRTXh c=1 sm=1 tr=0 ts=69a441f2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=P1BnusSwAAAA:8
 a=ag1SF4gXAAAA:8 a=IJv9LcIfAAAA:8 a=EUspDBNiAAAA:8 a=_UQAGB7oVweOm72raGYA:9
 a=a_PwQJl-kcHnX1M80qC6:22 a=D0XLA9XvdZm18NrgonBM:22 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=cmr4hm9N53k6aw-X_--Q:22
X-Proofpoint-ORIG-GUID: LZMkTWYOOqtevebeVevkSBpJX8wqbKby
X-Proofpoint-GUID: LZMkTWYOOqtevebeVevkSBpJX8wqbKby
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDEyNCBTYWx0ZWRfX53qsEEoNi7yo
 5D2blAT+Mm/eQGc46chGOkSCYUcgR16NTb2ArJocqtt1npQ8cFKbtOXA1tl/XetMnFf+89DEQnt
 V7ezO59l1qOY9Z3usOAbi24neyKxBbho6mq2XO6UFDHIxZQZCeCn8n48LnNvYScUv5VLXtWxp2m
 avIROTEnxKWqmv3HLNdtyJOCLUwc2mPr4jr72pWqsNKuDMX6p8uG0Q0IErEXEKUmgDbQSODi8yS
 no9vXHcq6rlQ7NPb7Co5ZEJ7yy0IzYh4/4pDl82o+YqvVsyma7aDh1WmnyKVzPnU86UfOyeJ2/3
 5S5FzpMaVeMvVN/BMgMbztby97/VF5kTrlroecZv2gvnr0YdfqL7I8uf/Ft/ZX0n4XJ9eORFxv/
 JvwbRHVNqSwgRmhd9I3oVoOch5b1ORdeNwN3M8wHaQmMHNKZt4o7iJMy1BRnO2YaPuj2F/Zxv+K
 ebFQDZqSKpW3yktOb0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603010124

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
index bec7930cdd66..e317cf2ffc58 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3856,6 +3856,14 @@ sub process {
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

