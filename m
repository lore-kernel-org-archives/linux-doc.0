Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793812676;
	b=zpH5Ae9Z6S5Lz0mF+jDutrU+K61p3H+IrbcdcfqzM8kkUoEDRZZOiDmKjAeY0GC4eM15
	 YmAdvecLUDh/8fhtfWC3zxcpKjEMky2WQqp6b4MOe9N1gPA5FpKwFzZ3lRKwhHwbVOl8D
	 Iv9QdQR1whwVqmOjW1PR0s0dlXjPesbKQWY1WcndU1bQlJ+W7E95PFs+k3RxAC1/zy2O9
	 2GqGcQn0uBR4CLPE3EA0KIW5AKIFnKOz6FbAPC4fSlicU1ve7KnhzyjdwueRBmWP7mR/u
	 7JDhgs5ug5XoNd5q+bNuN2qFIOa1DxpisqdmnR44ePttZz3RtBZv7/5pIofbmuCLovg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793812676;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vDq4jcasy1FzneuDHCPEGX95otXyZHVoDWeWUfLVLyg=;
	b=h4SFOfOolTMgutSPzOpduAz0XEjkwfJdDF7BBrHloeL7g2wbzmpTaFUZIHszH+dAvCsr
	 9/ElSjgq+FgPRNg3tX0TBDpzk5CzFtVZiPb0VsWxNlygQ+BdETZpaXZztzRVxmK5tca7G
	 dJWxFOAxbnSgfEq70INfxD/7V1yQAbd0V13Ho2UzMYAO2F7pBBXYNeYPctbQn6zWIs6Y1
	 7cbq12AEl9aeR1gZFvW9PmmmfrC5h/vTgu0a2NX3jCj9MBsDitD8TolK9b5wSNg3KFqCF
	 V5AtZr61a/7xPsTHpjRK/Qj7Q4t5atUE1c2f1YMk5LtJySHBC5L73/1yFCikE4AwyeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eMpkcoXX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SocRZjCG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85496606A328
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 17:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85496606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eMpkcoXX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SocRZjCG
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Fisb72210737
	for <linux-doc@vger.kernel.org>; Wed, 4 Nov 2026 17:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vDq4jcasy1FzneuDHCPEGX95otXyZHVoDWe
	WUfLVLyg=; b=eMpkcoXXzDEWl3wxSJHK8piqJ4g2QEVSlcz5wztoaXod8HKy3L+
	51ZTsYD4RENgquw+WqA8Kf0iau46QGBIfMkNKto7l33Pz68M9b2aXvDiyykdg5sr
	2SBEZdOpRZnAKUd5mgdjxZ1v+VXOF0bxazIh36VFDgDkj86KC3BfEvMZN/tLjepB
	tVvl3SgWSIcQOiak0qG0Z6sli/O3CYhQxgNz084JOEm67cRdQamoLXvkTZQ09Gke
	uTD+clj7UBGZuPnG02ivJWCm6/W7FGyS4FVTcWLldwIep/933HnYFPGLh5JjyhHG
	TL5ZCADLr3gLkD2tudY7MveN4gZXTq+HuuQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bdrs0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 17:17:54 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7b206156cc6so659551137.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 09:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793812674; x=1794417474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vDq4jcasy1FzneuDHCPEGX95otXyZHVoDWeWUfLVLyg=;
        b=SocRZjCGReEg0AvjUHKYuRq1KIuYG2xjNdhJNQWP0m2FoBEmEgDiltANfMHDxzO9zR
         2+GkvTEPBa1sz4osz4S0SpCA8ym83Q8CcIzmUJw/H5wsNWlSh8EUf3H3jlEZoQI0FBeU
         JJgU7OGApfQrBcWEOjrWL4c59/UGdFLBgx1bcT+QG01lkpcvgUt3XsrUEILxRb/tde6I
         qoZcavP1zzje/jskt369U0/C7OO76IHwn7U2MU0oeKmyO/iYZTbUdgXM38cDBzASpDQ/
         FUA52tIy3ApDjakWNF5ZL9T7THBtXrJmSAA2EUfRSQEMQs/TH8TwrC12pVhtCMMuNubz
         LYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793812674; x=1794417474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vDq4jcasy1FzneuDHCPEGX95otXyZHVoDWeWUfLVLyg=;
        b=gND9IrWZ2+8Qa2eXV7dEh1c3Oz2YPY7Yw6eWX3Kf+SOoK5kQg+Ck9qXK8Hd8LuqXJo
         VTkGdKJnFPD8RHWNO1RLV8H4XT94E3DefImRIzu/Etf/VCWU4HTbeOl9BZzwx0mXUjIi
         tMYvHrV7dvjCq1KcUJro/GDNcWD0Fx4/Rw4N0GD+Eh2qXF9HCIUJmUMU+MgsgrR8998W
         QGabm29ha0x4M19EXZ0284pUM9pr3d1mEQ8bO4L4S+XBwETqLwj8Rx+qpSigRoMPvJRt
         IL/R5zDJfh+Ag4JqYvKTZFL1eKGpzVBnoya0JN2E62dFKVPCAHUkRvfHuGLkxsplb8sY
         oawg==
X-Forwarded-Encrypted: i=1; AKwUvBzEABmBzAIpYYXA+feCEzX+MOEa+Afk3LgiNwbtr63jZ2j8SxwmsbHzDME4WG9Pin+Xms8U0DS2WKQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/cBwsJiMPSuetW0dEM2PLyWrMQIZmplX/6yAykj4Vf47GcP2n
	zFKDIYYSZcr2VhKF7gfg1BH5R3EHJVEx+7mZvAEbDp1JyB000xSS2D2wDsLaE2LWPX5ht8iFB9w
	JdVLNu5HKFjxaaf4oBmaPkJLJq1LoIeA5j4l2hsmjXkezMyW2NJP9eQvJOaYh8SA=
X-Gm-Gg: AYBFou3gSJD+iUzCg+75/xfx4QpZbrTeYqHH3xWJ1/TKOI1yJH4jse7Yst+L+QKQwIs
	LuiEKiJfZqCUmLqygDW+3bral8Z0lhq76hQK/i/aHER6+rdCtVzZb5IIhfgnz2NPbuT6T8UPTkZ
	myelUFJeDnwzauZ2HZY59faCkjCMUljLiwmu340i3QKXMYamZwks1tLsDDXHmopgv2/stNpN9Cm
	d+fh/gbXAliFQbgnlUoHYCuULOKFggavgT+OLVsvpjJYBOc0pYefkE1TDgkEcpAN7Vh9+wi8gUE
	37kSaq9v95NXp8rNPj2NOB2Lzp+sXV3kMi3+5HRjDV54p+2d4fdsT1vqtCvLxsVI6kPocTAhBFv
	HWzJkMKi+VBlB/GYikqQPG++scYUXVk+XKUZjKmgHoEIJsoH9ripMNLSWPmTgFg==
X-Received: by 2002:a05:6102:fa0:b0:7cc:26a8:e716 with SMTP id ada2fe7eead31-7d072c3bac2mr7340168137.18.1793812673682;
        Wed, 04 Nov 2026 09:17:53 -0800 (PST)
X-Received: by 2002:a05:6102:fa0:b0:7cc:26a8:e716 with SMTP id ada2fe7eead31-7d072c3bac2mr7340143137.18.1793812673218;
        Wed, 04 Nov 2026 09:17:53 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43cff3fcdsm68837495e9.11.2026.11.04.09.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 09:17:52 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] docs: submitting-patches: Clarify half-baked review tags
Date: Wed,  4 Nov 2026 18:17:45 +0100
Message-ID: <20261104171744.439209-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2448; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=ejtDMhtNy0vfqQL4gCXN771YJIQNVqhh0UeBvMROUkc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq62i4Cb37I7TOu4fOpk3k5OZDZ0G/MkaumRoxd
 IlMq/KUOQaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCautouAAKCRDBN2bmhouD
 1+eqEACNdFFzEnUL+ZR2Mrqj1ckYKxDVuIyvcagE1kTtiN1mGmqANzsE3BrTQntNvRj1C9bJEW6
 UEYRUGpnjcVI/0Nkrh3mAnfnGjkAteJJLDuxrC9YecD0vVi/5ykARPxt4FE+jqWmZ2Rcz9F5Tj3
 7vnO05/gXx5RCw7TrkRAR2+nEoyTwTmeqba/GIN5qNnkxRvqbt+tUqQhu13akYR8ho9sxiICCWf
 2t35dxqebDmzfDbslBwuPTCm6Z1bpci7wzFwEbnHcAwiPxnY/OtIZxVbPXuQkBWkgo3rDQIRmli
 uX8j+qdZnL9H571lfu2cjSM3gYG/p1bBwTYrcInH2Ii31pwyRkyi+GOVo/d4/wGVuKT80qOyuW3
 GjyrVQQj5mdYLGdQAAZBd6SrJ+e2DmKyGFs4OjOCQlp1Fj6q25mg6sXHUCa6ISxdGfC9FtchvEm
 B9aD7/Zq0pJWOaSejynmO8OZRyOsp2NDBoIG7O5R0znS6twqNB5J88ityLw+GEPVdc2olGwBPBq
 QzBWfL30BnfLhVmiYaPphN+oIdEY3NRmVVh8RwTz6Kwj4sX5JdUWy1UBYgKNSopaPHQMQHesMQp
 Q0Niuzq4TJLf62RRnyxeKGZ6VKYeaAxCJzMxsd0cTrpPM7D6/eNAucVEzjg4njvSXJ3Dg8KUi5u iJtIcH/MZ/rNLGA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2OCBTYWx0ZWRfX/4lNrJv7QrQR
 DVRC+Ky3NpivM05kJNp/rZnF1CJL0xAFq+CZ+Kmp0nCVigCZQD2iTJrlH52uzdC0SAWEqrNdS3F
 UF1E7S2IUpVi2d6i0xS6njFPeHESu6c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2OCBTYWx0ZWRfX2gzDtt45sS72
 nivbkyR6csCTZHbjm3x4J57vjPEfY93m2EohMz+L5CUxSCRtfD9XhnWVvvgzZ4XKX8eI0hYNxM5
 OOD9L0flTBH3Xi5Kc4hyHxNP/LLjoXMo7ZGIQ6lTX47RC8nXGLfWcf1wmg0eyKQqlE9yHP+7tAx
 XHU2boBjFt9OKOpnlNHT976BMAIzhP+2ziuzhPWs9R+TD2W87pm9TM+Jcum9L3h7q82kbdvxzzT
 a8paNJhyQUoVr9xz3vLIQG3ci9H/2pTXIMuHhzJVdHM4bwLh1p9HDgnBvxXVsFuYchezkl2dsvx
 zh60ThyrxkA0SsLSEIrlmzNQcX2kKBkEiBuvVmuiNeaGvI2Vui/PGPDAEJjOyloIJhIxaWHUxVi
 CGsk+bidnt7TsFas6KG9W2l7wrWFBGgmhVPMZu45/wGlhiimieVPvX9o+wE4mKNt6xoeiCGAruZ
 i8fNvqvlKoZmPLTlnAw==
X-Proofpoint-ORIG-GUID: 49G6rj11cKho08gQ2SdBrYhypoeH56VV
X-Authority-Analysis: v=2.4 cv=D4XSufRj c=1 sm=1 tr=0 ts=6aeb68c2 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Gamr-6wvbtm0q60XBNAA:9 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: 49G6rj11cKho08gQ2SdBrYhypoeH56VV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1011 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040068

Refactoring of driver subsystems or some core driver parts often come
with change of the actual drivers.  If that happens within one patch,
people giving "Reviewed-by" tag only to piece of the patch, like one
driver, and ignoring entire rest including the main concept of the
patch, are not really reviewing "the patch".

As explained in Submitting Patches document, the "Reviewer's statement
of oversight" is for patch:

  (a) I have carried out a technical review of this patch to
      evaluate its appropriateness and readiness for inclusion into
      the mainline kernel.

The sentence is complete, meaning it does not allow implicit variations
"this patch or part of this patch".

Reviewing pieces of patch while ignoring the main part of it, is
much closer to Acknowledgment, thus Ack, and "Reviewed-by" credit should
not be applicable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

And let me even bring a better example. Imagine a patch, doing massive
refactoring of core SPI stuff, 1000 lines of code, complex locking and
also simultaneously updates drivers to the new API changed in here.

Reviewing that 1000 lines of code in core SPI with complex locking takes
someone 30 minutes. He gives Rb tag, gets credit.

Now another person comes, looks at a SINGLE line in one driver he is
responsible for and gives Rb tag. For 10 seconds job of looking at one
changed call in one driver.
---
 Documentation/process/submitting-patches.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index f271d7413f72..d2aa31bdee1e 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -585,6 +585,8 @@ serves to give credit to reviewers and to inform maintainers of the degree of
 review which has been done on the patch.  Reviewed-by: tags, when supplied by
 reviewers known to understand the subject area and to perform thorough reviews,
 will normally increase the likelihood of your patch getting into the kernel.
+If the reviewer checks only piece of the patch, leaving the rest unreviewed,
+then more appropriately is Acked-by tag.
 
 Both Tested-by and Reviewed-by tags, once received on mailing list from tester
 or reviewer, should be added by author to the applicable patches when sending
-- 
2.53.0

