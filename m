Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC8434572B
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 10:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100927; cv=none; b=T5r0OYHHBwFtvPh7lrpkofp5I+pA8X0pCV1rixaxu0xl1nEt7zCfBa/DDQJ8ER3a4IMXbAQVy8cnCnRVAWsn8US0AZ4gxAPRnCIPPQcPojMcvFcM/9gyz0VU8mxRz3iaVXGNn7dW2qyd+kIxslNkfRcoU4LbpV4IJ0BEzuwws94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100927; c=relaxed/simple;
	bh=Jhlv8/0m1/grDmNWxSqUkf5oeR7IEG5tUINb4nG2ENk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XsyiDMFurZaoCGOsM+8KjZW6GqhxOfisr9ufJhL73cUYeaiULPHoxHgUQQErpgMUDC4mjfrEYNTHYwp8BvIzVe9LRs559J7YkgBScsk+iZ6Npm05Zw8qtT0/cSX6BDRfFF7x1/NpgQ0E2gn7mQF5343BBRqYWg022b7UtCkM0Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HnWN9V3m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EnyNY6GL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HnWN9V3m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EnyNY6GL"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IA8fpp2091264
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 10:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oHkrSqxcx/8hwXMIcSAALuKdtDlXR8XEzbS
	1uvqBKpo=; b=HnWN9V3mqsDp+onQWJzEl7Ah0kixCph68X64O0I+VmlyTgdfrEd
	maStHVqxJIIHAzye7mKWz7/tDYdY7a4J0fWDJrRurUNi58g62OeWxAmwVw5Tbz7U
	cBRfy7FLl0daYBzzJmy6Dta8cmfND0tRXyh+TyiLr6NITbVlGZylKt4+e9mxkKW1
	CPxaBOLk42JrwENv9dj5HHxIakuGf6bsJhjXJR5UTzZSCd7VdBFLWHwqcnCNqjLW
	JQMA/IzZd+TvBRvcC8m15H/BOuH2jxk9jROXpQCfFesQikdHjNMPRols7OwduIH3
	j/vdoCIexlS7e2GqNAnCIA9HUPc/eGJfDEQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e80rpg4mk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 10:42:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9112b2756fbso555097285a.0
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 03:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779100920; x=1779705720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oHkrSqxcx/8hwXMIcSAALuKdtDlXR8XEzbS1uvqBKpo=;
        b=EnyNY6GLSt8hpvQXmOXIkKdBHtJW9SzWx8X7DLa3HiGTdnqYl0VvroMsApzc4NHuKU
         98noRTayUjwnSX2YGOwjNAWQIC6MGWeQdryQm7+o296zq4oyqE29QcU1vG7gPyr7+YL3
         yX4zAQzsSYctpXQ0CpbTFw2/eoRfKRrqzZ5pvp3pEJQx5aJgU25iSRYy0yQ9z/5A9wj2
         EU2d7X+gh7bSZZa8DCt3hNsowQv5IK7KcDXvuTTZ9gtjaD1HgQqRSzHTE3H1y0JAlf3T
         rBTE0yEza1zaQbP6uQ35WXg7b9lzzz+VWRM8RMm0mSGhKK2TtrogoJDr3z3h2PrIsV88
         9MIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779100920; x=1779705720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oHkrSqxcx/8hwXMIcSAALuKdtDlXR8XEzbS1uvqBKpo=;
        b=Yi66E6N2w2M5veTu+2FPopgIF+2fdW3k7dhSUhtoE2AWNU3AIDXxmrUkOUVV+aYH4l
         RG7qZZurQasb1no6ysvMgrsB2EHCGLgLqNcB5+IunsjGkivh54WcHDQAcgx08NyiH4mI
         LT4Y0s61EsZsg2ztg2+dpJK54KfndtkACA25aynwa/hJp+Kzv+TIA3M0fhOcvEnQEfxS
         HNH6PTanQ0l3iJX2ABemmvzSupTdgmy8BTgVpOQ3ZoVaHOOxQg03AkZcwK2oXp9xrVGK
         McSYIvZlKTHB3Ok6cTPo2fAinn+OCuYByYpMD021vmq/dzPMvMXmQNznqyC+GSELiKUa
         sDTQ==
X-Forwarded-Encrypted: i=1; AFNElJ/6K2IM/TjEmQeoF1XQMcjEDnQUblNZpXJ7jrUYyuzgCUB8Hgl+wcxFmQ+z26+TXnpeUgMMjjmWypQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiQvIgTMwFD477bHJpIe1qSW+6kwZRVgs/FazQJXJFs5absGaw
	9htzmqxP260RVJCxO60zNuOF1oQLwJJm60cdabTvu80EQKzAX6iJRCmqSUsrYtdrVlu/yxl237+
	1SfNvvz4Jcj5ThuanBxDni+QBW9+gDk4OBkgOnJyxXC4B9JWlRu7M0GcXmxhQIsM=
X-Gm-Gg: Acq92OFqFlOK+w6rONyUCbwgz6Xc18XcPC0oSk7Idb/REwWsTRC0n4ceUZbus2CEreZ
	XG/VuxgPuAKFdnQJQY5LdcBrGf/Fb0dv5aiU498h5+0Ux5nc3p3UTf4QIqxPdkBzUMpw91tUikj
	H5kughxwmAN6uHbnbJ++Y9Hd/7SAL0SyuljtGY91byn7xCp05slJZ9wtkq9iRT3AOHxZmOKKYmN
	5DtT032y2o5OjXIC+vspPBD6XuHzZpaD4fI4ncZlu37A1i9VNcUU750lG6w1dktfLyPu8/6Jp73
	aDJeYuKI9ZNmTW4DI5R8oNgqDZfwvpolB+uZhLA3tB+0FjZU/KYqV3nhteNGdgzLf/X1jOuptcX
	uzq93Rn/UxxLKanhJ2Ft2W+wIG/m8wTqBKxzG
X-Received: by 2002:a05:622a:5910:b0:50e:5aed:caea with SMTP id d75a77b69052e-5165a01ff56mr195424551cf.14.1779100919893;
        Mon, 18 May 2026 03:41:59 -0700 (PDT)
X-Received: by 2002:a05:622a:5910:b0:50e:5aed:caea with SMTP id d75a77b69052e-5165a01ff56mr195424261cf.14.1779100919484;
        Mon, 18 May 2026 03:41:59 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febf81970sm107925215e9.8.2026.05.18.03.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 03:41:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Sean Christopherson <seanjc@google.com>,
        Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, kvm@vger.kernel.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] MAINTAINERS: KVM: Include maintainer profile
Date: Mon, 18 May 2026 12:41:55 +0200
Message-ID: <20260518104154.38915-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=756; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Jhlv8/0m1/grDmNWxSqUkf5oeR7IEG5tUINb4nG2ENk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqCuzycMGxH0KIuWwO+nCp+yWtpNWjL8u1iwNgT
 JybLuAEgniJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCagrs8gAKCRDBN2bmhouD
 11yXEACK6Av5rc7TCEHRdgiSP8S0hQcHH5AiIJ1skGnSoeWV5zpCQT52LHREKmIo2IZmZJGrB2Z
 mVnBoT/DtMkV+HNqal1gjKQ8t7c1sMATfTJchQjCh+hJfXn4QDJvKxMrDlM3fiFupj5Emp22by4
 ZGl6Fx86CU23pHcWEQ5NtTq1kAQgjpzb2ijZF5C9u7GbefOs8c6gxpeRaVjuhjNn+hJQxAO3U8q
 /TgpJ1yL5VOpeU8iA5+h3V9pGvRZFwTX1M2VK4WPk6rkSY7oQqu1MMwfVcL8wI6jRiAFrF8o3hQ
 2+IexfOWlQREG84jjjFSdYchvpuDnWx8cV4kEDPyXJkTu9cEV/X+GRgfwWNaU77uwW6GyvexjQj
 E+sav+UZXQqQ3NPskirUAxexeTB4x16+KdvuL/1GmBqNjbNhUh+0JO0t8znlRd8sseRnTQ3e605
 jTDqS9U/SzBCkV5RLUDzaqrdvnC8KuMgww6Dj+R+1LoUFtUlx2suc42bsZiZpovs8JUzcyOzq2r
 pP9zzNh1MyYYhfx0z9C6/qVmh92vETgSi7sWCb9LzY+h9pjbH1s/8QWAvfT1krs2ttXZIvM2KwL
 HF4iCeRxMUT8rLBfrzE5iSouC8HUoMigFwROZfWpBnAFb6h3IlsloMsAj0I6uSwB5pvdmVrLMSL 0Yp1e9tHXNwQU3A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: t4TkzMmGnsqIEBkIxGtGz--9ansEywAT
X-Proofpoint-ORIG-GUID: t4TkzMmGnsqIEBkIxGtGz--9ansEywAT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEwMyBTYWx0ZWRfXwRMbAe26zVpU
 D2Ea1GI090A8NcycjljqPxtCDjzyRdVw+pPKvMR1XNzgC0bb7jYetJEO/VfCXbT5MnOxfIGh3fW
 iKhvUpqbnAe9hmcesboacV8uFeM6DbRjUBvotITy4Eu972t9Pi+M+glaus/r3bYmL1aD8/jr0V8
 XpKAeeaRq0+lG13aU+eWVjohCW6arU01yofeNl8DWmXARba8CY/JsKq32N/5wbk31yUp0Lx7hkC
 uJF43UvyxXoBPzYikwWG1bTQ3LoTzUgVHsgtI8566xurugUQlwT8uuMn9FPYYZypm1R6Y7/KwPE
 kEol5C3p8onBeWZop4szKCcs8saEgyXDeZqbgjphQ4dqov7vvT1EaUvpDn0siXpdkyRbFU1XStH
 05xhDwtRQA/NW0AjJrlGzCvFytVO07BOw+r3pVcBAwFG0pQPgDrQ5RgzpPfH5WUm9o97rV+Y6PJ
 b1T3bnmx9cKZFYTJiIg==
X-Authority-Analysis: v=2.4 cv=ecMNubEH c=1 sm=1 tr=0 ts=6a0aecf8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=2_xvK-_yVxHKdB_OxrQA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180103

No dedicated KVM maintainers are returned by get_maintainers.pl for the
subsystem maintainer profile, thus patches changing that file miss
the actual owners of the file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a6553271e19a..7a65b220d93f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14205,6 +14205,7 @@ L:	kvm@vger.kernel.org
 S:	Supported
 P:	Documentation/process/maintainer-kvm-x86.rst
 T:	git git://git.kernel.org/pub/scm/virt/kvm/kvm.git
+F:	Documentation/process/maintainer-kvm-x86.rst
 F:	arch/x86/include/asm/kvm*
 F:	arch/x86/include/asm/svm.h
 F:	arch/x86/include/asm/vmx*.h
-- 
2.51.0

