Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D023C33D4E1
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 10:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100855; cv=none; b=fYNLuFKo47RDWLcIn1pT9Sag6JWdIZrjGHh3J8mY388+8gTklyu3CWHQRf5P3j6rHmtmMiOuaXxrFcC+toogGyr+3Tg4hs2W9J/nlKvW7XMl12wgQovm9SNZzcLErCsPVNTEsaOuy9jq67FIFhjKQvIM4o11RCMvmfzmP0HvVJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100855; c=relaxed/simple;
	bh=f36TM9m/kM8kn4KtZMX/ahZ+rpFYq2S6i1yJCp6/3bk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZRGFttG0IvnGGno51uIcU3NHCrMPYr/Hp2zZLR89sovfY98cezqEDIrooK9ykcQ0Ut9DaMSNAImh5P/92mIUUuer9A/VjJQUXDhDdKn1fHtlD0DL49NomqskGmvCdVYJZd6PP+2+U9K+5yNcFyLWPm7Kt1QQulxAsTtA1JkOPk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MCREJzTK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JR5+G/MN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MCREJzTK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JR5+G/MN"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I9E6Sc4083010
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 10:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=IgBnyP2pKojffPA4QSU1jzOc5PvLyFIiMCF
	jx58a74Y=; b=MCREJzTKzGzVPmqm4h4T0RA42XfiSOGZjUnd2Uzr876cSxDaxIJ
	hRSe6dTpf9wiezUAyScBspg4ke1ECpXqAwwWX8/biQi8QzoXNfcd4ZRbIdxJnY+X
	WZ1zvGHpZj2kLazLJj2CCkxwNdB4hu4j9nXbMRyl5MqIvarBOyj3SH99LEwdMkme
	2jge5vQRqng2dfHN3GhhrzC3Q/Z7Qft3iiCGrWmqmWyKte63SvovARl9tjtnT9Uo
	BUBiwODrqGshfQrK3YBuRZ1RtuiChEBAtSkxDwgk83ZMSf/LppqvNOlNrhM1TlQo
	uDQw947UrcGi0zdj52pT9uZfrDN34H97kHQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0qe27e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 10:40:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-514ae0e3ad6so33915421cf.0
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 03:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779100841; x=1779705641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IgBnyP2pKojffPA4QSU1jzOc5PvLyFIiMCFjx58a74Y=;
        b=JR5+G/MNE8GD7AHzH3tSqXzl0wUTzrlNR/2gWN9C5J92W7duraTLkPEkCOPG/GqN4S
         OxERS+HnTN4zYYnwZAmXbgWVoMDpXrRbtkOefl1xHtJc5MUnyzRjKOEQ856vKtt9NUpY
         c+k7p+0o3OcYsQvPmkaojmQd0YCRGziJ8/3bDhHfsah9AqfJDEei9zUDIab4lCj4733F
         EG8ayXufHP5LhmaO130bYY+nITFfo+v1ypr33KiWWj2OFMyzi9C3co+1e5UF85LfB4iB
         S+fVNI47R6hWp/SZ9N2AS9JORToxz7rXlIrUjAP42lYKm3/TlM2TwHrj/N8Knm7AOIhd
         CZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779100841; x=1779705641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IgBnyP2pKojffPA4QSU1jzOc5PvLyFIiMCFjx58a74Y=;
        b=mp903JRjwQAzXX31FR6z1bXNMW8ehFwlMxn6ilZLTIKFiw9WQeNf0BNZ/1mh7utqoo
         ERqGO4nKEkm2B399pDU34cEeENe/vMzVfUI1HffBS3yu2aF7HXl1l0NcDXBCWOB6YO8j
         N6sz4lqk9dQEuUwjb76DOjJBsLj9Vr7PMbamJeVPrJNHrrTsqdI4jwJyqJ4ihBemgIZD
         DWqXG8ufN4xbDqXIWykUXkFxbpKBOsDqcpPruCCQvG9UxShOMYIP7DqJdKtW1h7i+CCR
         nrLGZzGqXRHaaLa27OS3SpyIjaMc6iFPsmNlfNmPK4lsgCWcnr2vnRfiaGfNWxDnmX5d
         QsOg==
X-Forwarded-Encrypted: i=1; AFNElJ9xgSdFYcif6qCnml97ACOtBOLZuCB0VXdcya/KPxLIwPXEox/TsH55e5GN02OiJxnITYrM5uTL/t8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPdZzEzYlFEwF1OEy/UxgxrN/GxUuO6AIr19jiY59thGPfVDI8
	xiLncw1QDdmjIKSyfDvWoG6dgZ34kOSJ/dJQk8buh1Clyz6jQIzdubeHQ/gyTXnnb3VvNKQaZXP
	zF75OeoKAoA8OfeMl6ftOdCayBNo9wAY+dfAjdnJ3yXUDoXhDt5L2xma1o7urNKA=
X-Gm-Gg: Acq92OEWF8/4nq5k/QIJgPbwTDHI0SyU/kO3x3Vc3Bc/SeXqBbos+ZTlYHQDOSHssiF
	azDAnFefS7cKoPQAWOLUNjfAwaGo9nAgk4oFoakcYxUAlSVLO3p5ZDPBIMZZJMUFrScDIyIyNsu
	Bg2pn425qinuwjkelEOciaS1F9tX8etw+yTVKz06thtfVpS4XFYvB2/qAtH9+cVoU66mkCm1BV8
	kauwyzPoHVHDuEJJuYRwaHPhhvSYvg6LRvWKCw9vEdCJI5ZBsgNDrhE9V7LUQ2zcAhwTfBIvNJb
	OS7lsubMJ/NeSOXZSV90zhG+BSyLRkjwP5wcw2e4lsJ29FJ/oSWUkaPFRvZ2PvwFoh3v25osWiN
	okWJKOIfXMrAR8RzDGWhZl3wvYDouDeqIp8yq2gcV9N+JehQ=
X-Received: by 2002:a05:622a:509:b0:50f:c133:2dc6 with SMTP id d75a77b69052e-5164186c224mr243583861cf.19.1779100841182;
        Mon, 18 May 2026 03:40:41 -0700 (PDT)
X-Received: by 2002:a05:622a:509:b0:50f:c133:2dc6 with SMTP id d75a77b69052e-5164186c224mr243583661cf.19.1779100840763;
        Mon, 18 May 2026 03:40:40 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fead15bf3sm81574875e9.6.2026.05.18.03.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 03:40:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Davidlohr Bueso <dave@stgolabs.net>,
        =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] MAINTAINERS: tip: Include maintainer profile
Date: Mon, 18 May 2026 12:40:32 +0200
Message-ID: <20260518104031.38457-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=883; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=f36TM9m/kM8kn4KtZMX/ahZ+rpFYq2S6i1yJCp6/3bk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqCuyf0URT4xep5o5r+N9xm0Vam1NPy6nWoBAZP
 Zh7bchlpPKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCagrsnwAKCRDBN2bmhouD
 12laD/9z0hcsE4Lnsm/OOdoJtx455aRkLOy3wlmj2vI8HBRx/kgmo/5Yd8Z3eh2zChAz9ptEyDX
 kFOC3xDrLd1hwFJIzrvw+0rJNTMfTnspyUbuV+hALeTSFAn5NEZsy052/DDfF8KM2FKL8Es3ddd
 kr9momdO1otSSGWjDQO1/wE9MPt2xG27GxqyEfUjsZyOaF5AGQUVe2ku4F5LPJ+hyntCyqjEnad
 T6FZxybRc5/YxQsRYB7meCmCjk0X/NJpGZJ2ARkU+YBY5gpYG9twkJ4NVQfXBwFYNcIC5QMok8T
 4PJAcuOZgnewZcwNYfnrBic7rTKvXJzei27ohV/o5TmrwqJAUK2crkCk4O+xjcre3xZDRdnNJId
 JDtLwM3IlhVT+rpwOXpDwOW3pzCr6lZmuGMsAZ9x7IVlpulRN4PBUUythE0BL1wXl54CWseNwDj
 Mr5/z5b+Y4Xb8tDecPsgbJ5F7Nl6VyTnn3UHiczbfIJRYLBSgEsPbJZUgOghLwpEc0CPgCSi1kX
 M1CfR5RZENjWsb2QDQh/qEHm4A4LRAqVCsCZhs9OP2PGt///2NfA5lU/MUhA5UtiEeqxdWf7o+e
 RoayqaBjlmsxxz7EDNBGz3G44xzw4OmdYRYHvtd5p0+iWlR4P/0Mll/B8WzSlBGBzc5e300Tcyu e3QvMwDiPHWHeGw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6X_AZIADuka89wZ4sGj1s22imq6PFxWy
X-Proofpoint-GUID: 6X_AZIADuka89wZ4sGj1s22imq6PFxWy
X-Authority-Analysis: v=2.4 cv=fIMJG5ae c=1 sm=1 tr=0 ts=6a0aeca9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=uSXuay7hLokiUHiS13cA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEwMiBTYWx0ZWRfX29GjwLHN/bzd
 FpjYX9awGF9tssKVCXurMuKyangHhhFtMNZHhCghJfxYgflDlhqhButmI0FSaXdRamMkDsWMLos
 fprkq5IExZTsPU/5a0mFCADM7RAsosCZNm2yoPfLqGpbRWOIk0CA1wZLSwpPhAHc+wlg19p6ESd
 cStkIK/jZV/7MYhd6vtYmHG0EitqFD22bbMVjzdSfZVTM110QTrLHGU6Vgag9/0s9YAoxQ5trOk
 8yNOfFWejafbh2t7xuGoOBEwwVIV5J7TaoX3z8gbzr4xXBCxeUG8gRIHkQSFBrzdSU33KWOjn4o
 CjKqOMTu28TPTGrskLD+fCn0iyIoF0JN7ITwClFBRfLhDydBQk6mBvkksQliaSr3bHM2fCYKTCj
 WVlGuSdLmBcb6dYHs0iEveRmv4J7U3+LfX5gKnaAxRpdQW5yD5Df2jw+ZbzH+zQyszLegKUE34v
 PNwfsF6BBTzi4aENGIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180102

No dedicated TIP maintainers are returned by get_maintainers.pl for the
subsystem maintainer profile, thus patches changing that file miss
the actual owners of the file.

This maintainer profile appears in a few entries, but place it one
matching the most of TIP names.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 843f1d124446..a6553271e19a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10658,6 +10658,7 @@ S:	Maintained
 P:	Documentation/process/maintainer-tip.rst
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/core
 F:	Documentation/locking/*futex*
+F:	Documentation/process/maintainer-tip.rst
 F:	include/asm-generic/futex.h
 F:	include/linux/futex.h
 F:	include/uapi/linux/futex.h
-- 
2.51.0

