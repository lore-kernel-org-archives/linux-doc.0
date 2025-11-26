Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65202FDC4B
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 08:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764145154; cv=none; b=CoHqKGNZ+fGNPeAqIA5apCJmXViua3nB1N3QNj+AJHSIP9lHGOL13bvvJiZXdRea9ZTLsPl8GRsBHoXpKVVEuOHNunJKKfYQ8nbAZc11z2Yi0kUlAsc4yaQgfXJq6mCA9c3N/jW71PuqtcsNw+gJIylxEj5vkkpXR6d8CuMmD4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764145154; c=relaxed/simple;
	bh=Va5CGNuTjaQ+61C1Q+uQU1I3V3X/zhK8i2UpbXmstWk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sV9mZxw/6oISq5Ok4jGc3WeOAeAzudf6fX0eGNSLkaiumhB5oqd+F2WI6jaaFGb64Dx6/UnGsQwep1CSkX1grqAPgXUx7QDWiAiCJS5yOE8FhOQkao7TSJQSImuIJlJfXetSX+qJj0hnlC/vg0WQ8XkMr83/2+CoX9dktSV2a6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jBpW+AaT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NCHAAFWX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jBpW+AaT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NCHAAFWX"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ7uCjt2651096
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 08:19:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=IvDE0Ygyk+QKs5TPrEHv293vjQEPjkX1SpF
	BnjqqKBo=; b=jBpW+AaTTnUzeIYiryuMV+vXX/tmapTOJ6dJDtIOy8NhW/j6CKA
	hY/udiY7bi+Cmy8xugUTHmzKQjV8REgAMXDIqLvt8F/dPd6cF1X5m0bJ76ZyGQIe
	vnYGaRXS4BMmA3Y7FQS0viGPpF65VVdKAGCsarx7MqTwF5KxHA4/02NYWe94jDsa
	it3+eVNCLaKR7aNwuljHUl78bRfq6F/kvHHba2F8iae9b/U5l+vnidOHu4mAQ79G
	woo3ckZRkzHnDHO/QLMQ9CytXOC8W38LhJ7hn8/cz8dVxjkcFspGM257zVgBHg43
	0npvutMwWc5Bkm56y6YIVwUfsd0ge/EjIDA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anaabub9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 08:19:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b1d8f56e24so1767814285a.2
        for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 00:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764145151; x=1764749951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IvDE0Ygyk+QKs5TPrEHv293vjQEPjkX1SpFBnjqqKBo=;
        b=NCHAAFWXfhL0DnWobkEvElSlfcvhAqFHbdczb0RU8f61tKyBbbqfZN8oxQ0A5rUOoA
         oBkP82PBzUn/6XYl38t4swfSIHYhO+1g7SMtEMJwEnVdKUnS4d2V6OPDfKGd8RA7h0B0
         QYUIdkrE4LdadfgcCj1IwZui0Uhso/nxslYgLIjwwCogsxtW1D0dBfhLt/2+q3q2xmGW
         Ugbtyb57NWNqxuzmh2iiZmz95q0J4yNAoBilnrU2EjggnXqnZg1u8QMvKJF0iFVTNx7P
         qCb8WMECrzHw944UPRSuKrSvsstHvqjHSuqq7JLL30CL4P1vPRaXhEFCj2YnuTGn63nR
         sfTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764145151; x=1764749951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IvDE0Ygyk+QKs5TPrEHv293vjQEPjkX1SpFBnjqqKBo=;
        b=rCh1kt7iEpHqKz11nM5CbSLX9v/xtFGpWexaIFL/HLqbKP6dWeKSbhCbJOTPl6pPPw
         w6Jr50HHq0VOrfHOug6NENgFY9m1n8PorweValbIKAdcuRDdO8D6TjBKWdXm0kr1Glls
         PKkLTtCmtUX9iiMFeqoyORqOvGAFyK0F/e9b3afMR/3panJ36+tbN7TP3rSuq2tARhk2
         z6pOczHk+/vLBCh5ThzwXv5Y44rRgoxhR2stbhtIpCuZCNYliEVfV0zHyxGfTIvDkcDd
         lY8yZ8pEdYSjCKbIi7KTXL0Ovl5SoYcnTzrVYVQe2lixEgkR/FVty7fvvTo4M4xhMUJ5
         //sg==
X-Forwarded-Encrypted: i=1; AJvYcCXrFu4y81wnN79NaKaaXkWwwveixpEZkR/5dyit1X61CbDgHnKOIrP7iw3qVAFikjJfTUtgRzdAaL4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk8Bzc63CxgfbsJAlHAxBS9b1x9ST50EdLvJIT/5v8Ew3Q5tiw
	n+Va78noJcwoRBf/TflQiPHjmjtZCM3K9heq5Suy7SPb9hE7Y/O8RHmr5x4zQP5AtHD9YLWOL1r
	ZjmXIgHKVV+kRAhY2pgQ4DYnLXoS6sLskXiejNyLsQ1eeEUhQYwec1IDwymmNeA8=
X-Gm-Gg: ASbGncvPbTOMsiPDWGgjaERDS0OKAisWbVLDAvxHTNVOQmjcB8eizz+eudxP62uhbli
	q8kDR+O8ZlWEq6uNmRyZBIF9RdOjAqBEpMNdShMGkCmDGqmZ8w9i4Ki4yuliDYPz3eH6xGYp4iN
	4aL2aAdHBKJgKwWBU6247AUt7wfWbpc3/cAnvXsckSZvaaM8D1oWZphJFKCGZVEvzC+5xVItlAC
	DDiWjAtf7Ir+LFAFAVl6ELYFBsli/L/tqHw2rugq3eHWl7MSbIYkB8W4V1X+kumX10cwZimeohC
	P+Pc/juWe6k/Wcne/pzje6l8G2OYzX5wXLpHUlFuBQH4Bs6B1x2ZZdBj3Lp2xmUyEQ6zB6VIGCe
	9tZ8+WyZZ+MSFMneri8CzBDd6ReDk
X-Received: by 2002:a05:620a:7003:b0:8a3:1b83:1025 with SMTP id af79cd13be357-8b4ebdc1d29mr759332885a.73.1764145150799;
        Wed, 26 Nov 2025 00:19:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCrKFc7MsUrz6jj+yFbGZMJO8DfX35or9wIKYqC5c7E+xpxX03JyUO+Bw/kGlqeuN77ZtB7Q==
X-Received: by 2002:a05:620a:7003:b0:8a3:1b83:1025 with SMTP id af79cd13be357-8b4ebdc1d29mr759331285a.73.1764145150407;
        Wed, 26 Nov 2025 00:19:10 -0800 (PST)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-645ef325a4asm3868411a12.28.2025.11.26.00.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 00:19:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] docs: submitting-patches: Clarify that removal of Acks needs explanation too
Date: Wed, 26 Nov 2025 09:19:06 +0100
Message-ID: <20251126081905.7684-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Vd36/Vp9 c=1 sm=1 tr=0 ts=6926b7ff cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=mSz3GvdCR8lolErGETwA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: mAmWDjBt9HJnNPNbA_N6kNTfmJzPxU5v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA2NiBTYWx0ZWRfX+xnUFRMLCPHV
 cAJu4NUnSPIojccpKcNR3cEK/ulvMVVkURCAWlGfBY7WzWpOdRcdgZaGxrZ8Q3S+Tnj0MZqZd5z
 Ma9bLzfRhxDsFdLpgsCIaCvBKNmlT4C2eNVfG9yNgycpTaxEpvCXtk2ABm42MVjyudnmxK0xz/v
 4bGY/93ZAZvmgPqvGcjzG2NsngglxojauEcH8d8Lm0EF2KC8RYOIVlpRVGMo0akVThe46hMaJV6
 6G4u+H7/TkUFXT8jFHsxb3x4KzcufLF+iS4qIRmjofqnDfZsDM94dKR6HMmC2lgglYjsi7qBLyK
 S/cTjh3kW+hHQMdbFv+8L/O3SKcrXSYD5R3Ph/EoLEEvkhqC7Fsps3kKn5B4hHmrhT+n3S2/aJf
 4JBX5vdi60nW61v6PES1TCxNHAIKyw==
X-Proofpoint-GUID: mAmWDjBt9HJnNPNbA_N6kNTfmJzPxU5v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260066

The paragraph mentions only removal of Tested-by and Reviewed-by tags as
action needing mentioning in patch changelog, so some developers treat
it too literally.  Acks, as a weaker form of review/approval, should
rarely be removed, but if that happens it should be explained as well.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/process/submitting-patches.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 910e8fc9e3c8..9a509f1a6873 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -592,8 +592,9 @@ Both Tested-by and Reviewed-by tags, once received on mailing list from tester
 or reviewer, should be added by author to the applicable patches when sending
 next versions.  However if the patch has changed substantially in following
 version, these tags might not be applicable anymore and thus should be removed.
-Usually removal of someone's Tested-by or Reviewed-by tags should be mentioned
-in the patch changelog (after the '---' separator).
+Usually removal of someone's Acked-by, Tested-by or Reviewed-by tags should be
+mentioned in the patch changelog with an explanation (after the '---'
+separator).
 
 A Suggested-by: tag indicates that the patch idea is suggested by the person
 named and ensures credit to the person for the idea: if we diligently credit
-- 
2.48.1

