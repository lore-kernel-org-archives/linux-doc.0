Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E82B24CEEA
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 12:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778935140; cv=none; b=X/9C4TnCu45ZkaVyxBqACQXWU7FVh8avwp/YD4Eekoix0fcrCMtX52V1g0r6nUAnv/U5YisaxaT6+R9Pf75uKS7qMnRwwzx+BTBjuNsdGLupv8Z1x4LH4pP/9LC95ic4K5OU0GnawgHjHP3YA0Ond2Tc6jGNAyT52fTcCfMiE2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778935140; c=relaxed/simple;
	bh=XownEF1ZA8+BZ4so4kFUJoSB7ccyVoF2TgIsRnoeSVM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W3QDY0/zRrc/wnf1GMJCEn5Yl8Nu4ByivDV3ROwExMlS1iZLmzMq1JuX7H4c6TFqA/1jd1v23U0YCumTQUQ/3D/3b1NmjAFhcSYf1pW19p9Qw0QC4c4sElyFfuCvF6PVbs6xdR6vaVfKoF6J11U1gAK94eEiJ2WgHGo9SuJcSLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n1UZQFJs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bo7gfyuX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n1UZQFJs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bo7gfyuX"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64G4BgnM784784
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 12:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yI+hkDJTFWIfUgvVkqhcukRSCQpMvsqvvsX
	RaQo4gg8=; b=n1UZQFJsW1iLB1o22sqN7gm7ymb0y7jaiKqqVls0qw5s4vtr3l9
	0WCkLOfnFtiit1XhvH/KLnpWQrvNO9XbEC2DgEAhHYWop0mpB/7NLr+ZWykJmRXy
	YcWW4qGk3K6qu3/ISF8l1DoJKif53RCmAkAucgjPrUsuStD8sVe1u/pWoWusptfk
	RLc3AKFBx28/e0SFVoCugsn3tnVilo2mzPtO2P3pUH5iWmVI1q3LxuCt7IKfSA2y
	fsmSSktJQnt3Glq+hfvQOjyhbtxgcLf/gfhuXHVsNWQim32J/cS4xNqCvUMaIWvq
	GtfHrQMyzq/xNJTh1YMISP7dQSonDtub2fA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hbc8t32-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 12:38:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-90cb6202d40so240107385a.1
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 05:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778935137; x=1779539937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yI+hkDJTFWIfUgvVkqhcukRSCQpMvsqvvsXRaQo4gg8=;
        b=Bo7gfyuX6+fXNlzSNf0F8S1MYJLbeId8SvCW0z97Y67wudw9m7xNX/P9xyoZO8/+J3
         YHgrp+/1bE8lsK7DNKV5UhSlms3PfDIT2aTxh0uYkXc31JSIedEaU52vBHg3LLwnQ2nN
         qhqSofNFT1Ege/WQefbWEzxIPqpGm3/Qi78WEHHOAqWUvE9UDAm8wOokOeMFBsaUfdNE
         7Iqgu3rLHFGPr/8APd4AR/s47JNOn0drbhX/tETpR4tQJwHzA/ii3STBdXx9Z3e8Ru7o
         PoiZJotnTKWNfVRtHKQzhiGRR7X69ntw44lec5rjwaor89ydjy68J0MUMhfngAzaz9xU
         xFSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778935137; x=1779539937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yI+hkDJTFWIfUgvVkqhcukRSCQpMvsqvvsXRaQo4gg8=;
        b=VvvYMjqLrBgCM/IvNgXdUzWttpgmuOBoowjvtiHemLIuMl9lOkUkRk2beNbsLa56hv
         Qitj8pFViM2eHCgcRdYrewuXkwz2vScF1pQz59VPCJDirqAxlED2pOpokDKj887iyZcW
         ORprRf9maSLj/UJYsMPnttgE8JkV40Gh31fIIHfxlXgBSbSCnQlct+UBwrvSQnOStGYy
         c6dUnTs3N32xJ09jOQQ9Ll9KQSG6B6+UNg8L9olwJ2ncrnpBO/JA7gfWM6j7TkBeiNZV
         k5inruZ+V9ntfH16L5e0BNAFW+mU5fcg/SFRiIZJVXdwifzat44E3eIyA1aOe6eAno4D
         aX2A==
X-Forwarded-Encrypted: i=1; AFNElJ8G62XV66ASGcm2cEPVKhqQ1kaB1LeynO1YGsuldmy/x4I1P7TC+7xq/LqwFuk73VgBY8qKWwp9thE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv2iXMGY+1ReIKoZfNzbHSBcDi2vZ4NKgzgshkfHXaYnJAXaZ7
	jh9n80j/fXwCeThDh7YsbFaPRS+Vw2bun8EAlLaj9m4pHaurWZQM5+VOPe3kuyaZWEI7e5/iPpj
	uPeunT+mhw2hO8YTNfZQrR5GIFA8bvEEr3vjGemLl4aGa4ajqwZhKUfIUM4vbQ4GNhEHAIus=
X-Gm-Gg: Acq92OH+YE+Tng7/YhtrM8O6vceGJOEmd8O6IvUt2qHGWnGntSqm5rSajIDsfqUNIMb
	1X71LFVmGSZMXr6HqOxLFS67OIvMBEBYn5/vR9EyRd3C3rfnqVsNaMNzHWGtnvEhphaSlnH6R81
	guPpP+5IFteQKNxxoYTT6glNnNMiBGWVqOjEBpTcxlPcBBsBZQqnKbROIUM6JPASl8MZiWXqMzg
	NUkJzhqe7qpChzQfYVlXmrMOpAt18bQH0UwZiRABWKshwaQRgdhTAWEVNnLyxFHKkeMzvdNKNU2
	whpbVN+Nnh7fdt3eHpu4/83v2wl2Ufp9aT+yWyz7jsD9owSkXYbGvOBn2vnUWe9JeT5TMpEaVf/
	vXmmISu+qZm53rdW4s07bjjvXP3w29CwCKJnt
X-Received: by 2002:a05:622a:5:b0:50f:b81e:c663 with SMTP id d75a77b69052e-5165a20bbd0mr116096621cf.40.1778935137533;
        Sat, 16 May 2026 05:38:57 -0700 (PDT)
X-Received: by 2002:a05:622a:5:b0:50f:b81e:c663 with SMTP id d75a77b69052e-5165a20bbd0mr116096011cf.40.1778935136969;
        Sat, 16 May 2026 05:38:56 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe661e1sm36867215e9.22.2026.05.16.05.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 05:38:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vlastimil Babka <vbabka@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH] docs: submitting-patches: Clarify that in English "reviewer" is a person
Date: Sat, 16 May 2026 14:38:47 +0200
Message-ID: <20260516123846.63413-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2902; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=XownEF1ZA8+BZ4so4kFUJoSB7ccyVoF2TgIsRnoeSVM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqCGVWgOdJBmpcR1EUc81fTjGqI+PwlEiLtcipB
 3Cdyovlra2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaghlVgAKCRDBN2bmhouD
 153JD/4wQ6vQeXwCR4wuMqwWJoKGxC+tr9Td9WFleL89/wtk1PG1ebQmC4Pc0aESUDN5LvXgbVM
 1UVbsBpFd0zjOH9k4/X6ly2tU/+IhKnsbnKgYSrz2H/wZs/O73/Q9dR84Xf1puEhoLnW9L+BN/n
 4Fjmvs9NcK2eSxVOFm7omFg3yJL6wRUDMAerBX5nlHeag4u0FKeWdLlL0gTTuFUFxTQE3yGRbRb
 UYWipXNyZoB0Eg9rdhGY0/ogETXIRjw9x4UNJ6J9mRGt4Ogx/DJfXz4jhjPZXAwMH12FkR33oll
 YOp/9wIGq+oClecDbQamHEil2sKsdt1zEj57xVpu79IOS/0BgNKnPZLCJOqK0km7MQzbwP5EPZw
 9pphGsGYmzvjxU5+gm/Z27K1VIVKzcaxIXoeKvP1DdCUhGPhwFG2Sozly9doh+C8pW5YnuAMAJo
 I4WcaN+O+bFb4MVagH2Y+5+se2XnRZ5LK3stVJnCAFBXllYwL5bCFw2v1YY7LsuO3gRjTlBdA4u
 kMzhDCU5H6z5SMyICuRGuqeDpvN59zzvV7SiwUaJb1avTX/2gXZLIrGnnSGrsJicAELhLrDB8KU
 1EHo2Pp1Fbpluj9/mHwAiNW1JsSXF0QCrRsCLsJUKfgTXFBuJigT68viMYN0Qd06QxJ5Z7Bip4D CV3sXK1kLPWJiwg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cuSrVV4i c=1 sm=1 tr=0 ts=6a086562 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=1Qhj-OTkAAAA:8
 a=VwQbUJbxAAAA:8 a=_jlGtV7tAAAA:8 a=ag1SF4gXAAAA:8 a=Z4Rwk6OoAAAA:8
 a=EUspDBNiAAAA:8 a=wap1pylHR8j5C7hGLnoA:9 a=IoWCM6iH3mJn3m4BftBB:22
 a=nlm17XC03S6CtCLSeiRr:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=HkZW87K1Qel5hWWM3VKY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE2MDEyNCBTYWx0ZWRfX/NjI2xECJslI
 zsttpjKHK+NOa8JHir/Rx+hMnJAqanCcwQQOp3ZzFwTM2jZ9f/SzljCaMMqIMOlEU/rn/rTEL8F
 Xtl129Xte2pt32eUc8LlUTeRuKdqEp26vnLnO09JcF/q1FtW6ZHHS2Zw8Y81+4TY5zm9fCIvLgO
 NDceeBPvvKrVR0bSbc5h3JpmMnBo46dcW9hrZ1PvhpaOu8r9rMWZ+bS07naUonxjNFcbT8I8gKQ
 P5gDOgZR4TTbb0WOZCznF9BaRLdXjuLqEhDv0CsS2rbzeoL635ZDVVoqV7gRKRlNDkNMWKNHTHr
 FOjiO5I6pg6ljgCDTfDrctk0bRDjl33xW2mGXWDWf7OAa+3PMVUDMwj9+SgW9GpP8F2YjCnS0Vu
 w5+EgV9BgTdSCA6fO5SYuSw9SDoVPvUh9hyjEPr8uVRe9GmgqNFwlxm4TRvRK0chSpZTx7EvtTU
 yGnWmoKqHfghB8WIfrg==
X-Proofpoint-GUID: c5KyrFy0GH-Qua3DePUudF8c-bPohCxM
X-Proofpoint-ORIG-GUID: c5KyrFy0GH-Qua3DePUudF8c-bPohCxM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-16_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605160124

Common understanding of word "Reviewer" is: a person performing a review
work [1]. Tools are not persons, thus cannot be reviewers in this term.
Also tools cannot make statements ("A Reviewed-by tag is a statement of
opinion"), since making a statement needs some sort of conscious mind.

Our docs already clearly mark that "Reviewed-by" must come from a
person:

 - "By offering my Reviewed-by: tag, I state that:"

   Usage of first person "I" and word "state"

 - "A Reviewed-by tag is *a statement of opinion* that the patch is an
    appropriate modification of the kernel without any remaining serious"

   Only a person can make a statement of opinion.

 - "Any interested reviewer (who has done the work) can offer a
   Reviewed-by"

   A person can offer a tag thus above does not grant the tool
   permission to offer a tag.

However this is not enough and apparently English is not that precise,
so let's clarify that only a person can state the "Reviewer's statement
of oversight".

Link: https://en.wiktionary.org/wiki/reviewer [1]
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Vlastimil Babka <vbabka@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

I find it silly to need to describe English, but it seems it is needed.

https://lore.kernel.org/all/fd3b2ca7-4d64-4c4b-98a3-7d3285fa6826@roeck-us.net/
---
 Documentation/process/submitting-patches.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index d7290e208e72..a989de43f3db 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -581,10 +581,10 @@ By offering my Reviewed-by: tag, I state that:
 
 A Reviewed-by tag is a statement of opinion that the patch is an
 appropriate modification of the kernel without any remaining serious
-technical issues.  Any interested reviewer (who has done the work) can
-offer a Reviewed-by tag for a patch.  This tag serves to give credit to
-reviewers and to inform maintainers of the degree of review which has been
-done on the patch.  Reviewed-by: tags, when supplied by reviewers known to
+technical issues.  Any interested reviewer (who has done the work and is a
+person) can offer a Reviewed-by tag for a patch.  This tag serves to give
+credit to reviewers and to inform maintainers of the degree of review which has
+been done on the patch.  Reviewed-by: tags, when supplied by reviewers known to
 understand the subject area and to perform thorough reviews, will normally
 increase the likelihood of your patch getting into the kernel.
 
-- 
2.51.0

