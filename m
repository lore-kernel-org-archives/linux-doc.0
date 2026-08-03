Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E703F3803F1
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 09:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785748672; cv=none; b=t6kWnQ3S4oOB4G5xaCeaXd3hfguIZ/QlUYMO2nwCtOzX/ePbSVVZ2AH02dJj0e0LRlGeIHFEEel2VU4TSFTGsGIqMQj2V6gHAhlMki7DE+77g3it6a4d9xUSwR89SUZV/oU9v2IOPvliLeu2vTiYLHDd4zO3tJhu4ITxIFTYlpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785748672; c=relaxed/simple;
	bh=7tObqCPMzjUbkFLV5jV01Q6RuX4OHirNpsj++DKUtOk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CTyz9MrACLX/fc/GP2P9gfHp0qpUlVc/HF+Cn+4YF11kO7Ms2E14MXJNwng65SbRMJWMzMSWHX/M5rL6Fz0DHv/O98MOJ15unPxRq8MyjXwY4lmvLq2eX/jli1XZcyQzawcqk5RjhvGv/lxid00lDp+ZY1rcOzo9DYIHtbB3kJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PhVGF0X6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VN7qCICb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PhVGF0X6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VN7qCICb"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736saJ93790826
	for <linux-doc@vger.kernel.org>; Mon, 3 Aug 2026 09:17:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9ILIOUd1+9kSWEGJ5b/2AYjVfXn0sjWle5m
	TjxTvHaQ=; b=PhVGF0X6zlYiODI5cQ+Yw9/piNp0eZ+laGtU1A+lvmoq7VkLvv0
	yLNamzN1ujbd/fbIkIGWEd2Ph8D/6GiA6D7Fuxi+yJDzYQA/ihk4q+rxlnYkwFLn
	Smj/qOpcCcuWGqgOH3VlzdLJhwglgVXuFBm2RrBZaNF7n2qqyILRsASLQB9De74I
	fFnU0ydJOKBgCITV8Xac50J7uRBkuaz3dXTWerIXiYtj9ktZveRgCm5mq3SQDy/t
	0YyBp7EaK0GRkDc/SLcTFcLa9QipawJ2iLxHEMZ1r1W02wJ41wY5eJvz5TWZ+MIa
	bzUQL39muhEmBeMTtIMXRo4UxEGWIkLFvbw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftp4r0npx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 03 Aug 2026 09:17:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51ebdfceddcso34745421cf.3
        for <linux-doc@vger.kernel.org>; Mon, 03 Aug 2026 02:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785748669; x=1786353469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9ILIOUd1+9kSWEGJ5b/2AYjVfXn0sjWle5mTjxTvHaQ=;
        b=VN7qCICbMUnpEjb2vhJHlI3APREy/80vLcSp6QBfzBVS4YZFouC7FhEk4t9QyzE73r
         Vx7vdUxWFAEU/2LrW+T3UcttmrQnPJ+8rdkWng+5A4Gt0fjIGHlEZ3+lFOoWOSpw8qA+
         NPrny6s1pWyx8hDRj+8QnTqL9CTeb7+3hg59S1J1fulni9P2gp3E9mlReqFJWdbe0NV1
         v/hXbiYn4ODX7oRag03LCnlFpeNcVtC0Pgo2PtR7lFI69T0U8HkE5UqpON4meBnRF2MI
         GJ5KHChOPoqmywlxOH79LQhUd0HS/0XySzP+scJWeNJbUOQpjKe11EAtCuPXysDyxRD5
         KSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785748669; x=1786353469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ILIOUd1+9kSWEGJ5b/2AYjVfXn0sjWle5mTjxTvHaQ=;
        b=T2RBKsewWyab43x0GAbIoFyRwPnNgTw50ffLyhFe95cW8a/g3PVvbVLpLUGa18zD8D
         k25T/lExtUFAN+a4LDtK+wLgftH3wFSuO6QUolIHQ5jNz0YqlwIIE0vvIWGHSgJfc/wZ
         C0z8gE0WAQ7hxbUrY0+3kwDHOu6eg1W8seC3lKefghhkpvgcl4kZre+v7zjImlcJb+AG
         Dq+2qzjwgOsKediOF/cjv0IYHLHlZ5I6UTCTle7tbjOWNFPOgj6ofdgfFh47uApL4lKA
         PHJ/d5F4SS003c6OBbvM40MXNyxmzAnJn3T62o64osyPA6BYoZzf8gVJMlyXIiab92hy
         i9xw==
X-Forwarded-Encrypted: i=1; AHgh+RqDOiXh2PID4RJPVndculyOkDcMDyY3kYreoxqe4zlV0smy/sCUkFa1UxkKdipHKBkMjw/5aZyHvG4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPGHJtN5tIK8NjCUBo9431tEJFG6pLJMsxBaKojsyAXqP3OjuM
	Kz09Z5fo/51uSKOsCWvVdJec2oqYJM8wZePQ4qggl8w1KNFWhmnggQyq9IYEujJTvv7fkekG7Nm
	uvKtPuKT3FQYMcWNxsQvzN+BHHWyfdzO+JGA3eRqxdUkwczhryyAV863GoVm75FA=
X-Gm-Gg: AR+sD13uR5pCfSaCadGpKOwmfhTrNNRw682AeCBohNoijrVZVhzB/liQzpmp/xkLMw8
	8cRTKv/HNokg95ZW7Ro7KAKZ6/+agjhIp+jjMsyKVKDzVjwKSXmQZWR/YB11NPmFfV99XDyexGo
	YJ6MBq2WY5t2D70rrT5Bz0xydxiWLKwS7vcVNDVZuooxAE8QH23h4TuO8XoJSvGWpxIPlXxCUuO
	6PjXCw4uhUiD5884q5tEQHxGVnWpsTzy+c4EnJCzBOGoxsjITF8Qfi6CTcSCCY5WPr5XdlSkpK1
	kO2ZbjtWoFMl9LeIrV0xTIWlaqSxtWDtRIr+Wod7S12jWppsqpoqC2bWy4D0f3XKSMLFyjL+d5v
	g0rhaHtQqgN9ybJAH
X-Received: by 2002:a05:622a:1214:b0:516:e0eb:d7d with SMTP id d75a77b69052e-52b56777af4mr169109381cf.27.1785748669229;
        Mon, 03 Aug 2026 02:17:49 -0700 (PDT)
X-Received: by 2002:a05:622a:1214:b0:516:e0eb:d7d with SMTP id d75a77b69052e-52b56777af4mr169109061cf.27.1785748668765;
        Mon, 03 Aug 2026 02:17:48 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41e2961sm34636955f8f.13.2026.08.03.02.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:17:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] Documentation/process: maintainer-soc: Mention expectation about dt-check-style
Date: Mon,  3 Aug 2026 11:17:41 +0200
Message-ID: <20260803091740.232536-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1065; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=7tObqCPMzjUbkFLV5jV01Q6RuX4OHirNpsj++DKUtOk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqcFy0UG+dPkodNTdXFRBRzXijTLDSiofm3qvCm
 +CC05n7edSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanBctAAKCRDBN2bmhouD
 13VSEACWf5BxgM1MPzs3SLlZHSkBJOO1mrOcICYXTCj2UBu25FpFzZJ0cQuyRYs6c3ytPFXBJz+
 mKqQuylHd9dTGFMgCBnoR2Wdp9/RDRAXpMwPWQoOmVBFZPThU5RX/v2wbK8Ax/441CzZaxD4eRa
 1FhFuSYhdJlbeI3BqMplkaqIwbFOtgrmJY5HOIJHTQCLRplxG7YEydQ3zEJoo0h5Xp/ruyjgShc
 mjf19HoLI2h3OCOZROvwvwRSQ4OTZ7JF8A7Tk7DYSl45um/jgQn4F4db3TriryvKSSzx28eQZzS
 x2Z7s+gT6yQqHKyoTHyv4Thn2Lfb8yYrK/1QpPFqhBLT42BiBk+GI9mdvBzLrU3K9xidHDUjAn4
 cUA0tD+F/HIZBvy/pLrfLE8XGBk0XYDIeUs7XA5P2Stt3QLya1dy51hQrlPdTTeYMg0wA9BqAHr
 jkFGS4GPtV/MI7HszORjyfzI2umXiFrbiZaPdxhf2UefXZKLpyl6OM9IdVjoBb5F1pVoV+oH3yG
 fv3ViAdfvdRIctv+8YP5lkh8a9soJ1Ldhm8kgmLVLondNx58adtJnzLiF5LkQQkr6nT7p9i+Wot
 d/LQrAzycObnbm8QF1mo7pnUjXGy2cf7XokenDiNfEAjhE5W8LYIOup053kyWm/D6xrWEhNIQng MBlArMunvGyhdew==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=X9Ri7mTe c=1 sm=1 tr=0 ts=6a705cbd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=gSc81ffI4h0EHLWcGl4A:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: GA0KzDafduRI_oPisobQhRFS2IMMRyhW
X-Proofpoint-GUID: GA0KzDafduRI_oPisobQhRFS2IMMRyhW
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4MiBTYWx0ZWRfX/MWuch9LYIGY
 FliwdIiQAFoJyjnJ4UvgLji4CTE+ZQDnP7aEVBBUcfD8h++vukCoGOrbDKbg0LSkK3WollY+afo
 2Wsl7vrWMDkYL/LQy1ZyYQ5Pu1F0aH8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4MiBTYWx0ZWRfXzHyVugjw7d43
 lZUt6QZaDvZ3x6D6M1s+Sp0VwRlKuBrbOXlKhuDhuNtRQPLBTNGvDMRmWgWql6bMjuh6umI2hDD
 BV59Z06HFEcOOoWySdnBeQQufVvOlLg7hRrXR6Wh1C0/dwxU/QsDeD30IRb4b5+8zftdeZAcQ+G
 HpAdsJ+E9/VNqZ4/A5m1o6BlF1MhTjksbItIHm+JfA96tst+C2KV9I3mY859ErN3QjYg+3Tb0V0
 2IlZvUyT3KI8m8Ry3RkcPxjGpKVMZjE3MqxSIMm+BTl6Vo8chW+2hcI0kdlHPMD6VDn03Xc6Yqu
 eqNsbZAoXrG6i96EuefR6vR1pgku6Hd62upn9Onqu5coEWoYCjKbOrpEczFkfD8g9FmegxiijGE
 V8kJaU2pNT+jJIuSFJ/USYyIp1QBGkCfHh6XQphbrqmikYPwDI2I06+NJNQo1/VxpwrOO4UiZcw
 gpTsuL+OQxE97mF9uQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030082

Any new DTS code should pass dt-check-style 'relaxed' mode without
warnings and should have addressed most of applicable 'strict' mode
ones.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/process/maintainer-soc.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/process/maintainer-soc.rst b/Documentation/process/maintainer-soc.rst
index fa91dfc53783..96a87794583b 100644
--- a/Documentation/process/maintainer-soc.rst
+++ b/Documentation/process/maintainer-soc.rst
@@ -170,6 +170,10 @@ For new platforms, or additions to existing ones, ``make dtbs_check`` should not
 add any new warnings.  For RISC-V and Samsung SoC, ``make dtbs_check W=1`` is
 required to not add any new warnings.
 
+Additionally new code must not have any scripts/dtc/dt-check-style warnings in
+'relaxed' mode and should have addressed most of the warnings in 'strict' mode
+(the latter mode might produce false positives).
+
 Branches and Pull Requests
 ~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-- 
2.53.0

