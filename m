Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795415320;
	b=rKQhkbSPzJxl3GshNkZXkDqpD1pAZLbu2M+3XeOdW102onWKG9SgvJEvpco23frACKsb
	 GbBXmVrmi6KVvI+EwbYYtEW44QAAE6JJwfiF6XrogcqT6Ogc/pwIv1lUydQ8/uhF3Rn+c
	 hPmosnBor1lIBs2X+0tmrSKPcBBYe6cob/tW5VC8gkJl8qQf7DqQdtD+XXYgaHf260gac
	 YoQzIPqMXpz/2pY1/YMJUo+XeN2ALSPWhX00N24ZzgZ1j20j0TWINgW0kg9qfY3+ilbBy
	 +L7dj4sNslZdGUHz628vHgzO1EHMaZtafKFsVGA96y3IgjNLn8OXs+tlkkfHB5DoaHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795415320;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DW12okt755HtwVLpnWjRB9wGxkDaJvfH8W6M6BhHEO8=;
	b=RHnTvqiMLW6+wTP+sNxJ7eaqlehxYJOQHkjf45HIAdlhgRf38dpV/sDFyG51R/rGujGP
	 EC/ia8P98j8UN3Ft5TOaSdCo1N3GhBw00yJUTeZj+HgzsdBXhJyQzpdLyrcBu4BPQyj60
	 jxNJskSTmU623YJdVUvQ/cEtDK9jrsLiCR4WKDiVwpzsCSOWvhle3aISIhhdEPgDbuVAQ
	 1rB1JUFgFwVL9Mb1clMcpPWFoUd/N9A+cGfwvf3jPCPcrLTo4/wszGnlbJVAr9jybfFY5
	 bnQg458YasaSpGSfehkltExLrVahxUKx0V4CymzaET/rdv6+3Jotr95yv8SMOiFL7og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kOJ5iFQx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zxtl5aDS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E5C606A332
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 06:28:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6E5C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kOJ5iFQx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zxtl5aDS
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN698UD2372570
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 06:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DW12okt755HtwVLpnWjRB9wGxkDaJvfH8W6M6BhHEO8=; b=kOJ5iFQxLqGnHt5G
	VtkhBb7vWjdmQUvSoffpIXHnPnT1xZc3pChrOPDCA8IM+j68rf8y9NmiLY7PM4NX
	ye4kDncIjSYqRLJ+pnGw+3PawUnq2AwR5aTP9GN0lx1R2IrqLt8pOVLY1+omkcLM
	AUGcXEXtFYaoGuCZ5bWGOzWOBcc4cQgtZQJrrWgCikz33L1JY7k1xegUtBmyjSpz
	xU1R06AqKUTKUTAld6nsi2KGtPHyAxWtGNeebnhxTxMftVP9f8WixUJUziJLn1uB
	9HzKl324iREdwY2iP9qdL+/THh8Lp1SvsGs7O9OAQRKAy3ndFgv6qCc7coEjEcTb
	WaluRQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd0255-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 06:28:39 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4e937c5bd4fso2484792b6e.2
        for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 22:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795415318; x=1796020118; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DW12okt755HtwVLpnWjRB9wGxkDaJvfH8W6M6BhHEO8=;
        b=Zxtl5aDScmU6mMpS6Oz9R9LvEdGSf5DFyyd1bf1zg0LXccdY8bya2wvtiT/+/capkQ
         ETTNDb2W15+6Yp6QJhdFtYTq12/FS1De9g5gnoZzB9eiQDLFYQ3JA3MlyeXUwRBXkoGJ
         58l6Fsx7PpGXFpDiz6ZpKaZ9pZFva71gL4xiEksoirlCtXpZqOKUZ6Rk5wqLxYWgwOdO
         Qm6ru0i/0ktlzFvbl1SoEtnj9Nlz2UglDFOYMu8Hn0p8/LbaF4F5ye/Opq5S7hOgPYWS
         SVjKeBkvZBNZNPcEDjAQgzTItXcwBeE3tsKwusDVx10A+FWHK1rJrYnERDvbjBmRfskv
         x4yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795415318; x=1796020118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DW12okt755HtwVLpnWjRB9wGxkDaJvfH8W6M6BhHEO8=;
        b=ZEdVy2kSs1rhNoXIDhUezQYACaM6Fb8wxZdLgZWbo+rR9CpGH6Y1YkSQ+0lSazThKV
         6gG7DCF9f1+pd6TRgKEWZeceFoALP9SAXiryxIXjF32ldgiaozcnvkjsX7c8nfcQbiGb
         f+VDlistotFRX1YZdhy2wt4Ouv+oFoQsU3Zr4eBQqaV8fauEv41FsG0g/Hs06g49d1rp
         F2wrCdUDcvstgjC0k8P3wIQzB17f50EhMNUVHrWfRq4CwUb4+osXz9St8U/p52mZ5Lix
         kK9rxPIqizlSqjsIDRkBa2VcKK6w8aSzUIZXmEYJsZpTKHycQoeEB9xq5yZ5FCBX+GYd
         Qz2g==
X-Forwarded-Encrypted: i=1; AL+hErEJwtm0hYPqjel8Usemvix6+an9WSfOXByq1aoWQQLgKWjPxYPAG42G8dIQagnJw4IZf3429eXNVu8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RXykMdtHcSVQvkEQYp7C08iBPmQbOQHrV787NzCe38fwVr6Ts
	2EMvEWVIEU30lifguVso2oU2bvyK1Ko4J1cjuFkvGuKOYUByZ7NoM71eB9iyhGn+OKU2I+1shwl
	Mg4jLh7ziSbEEHoKtvAbc4fkfGw/EVn14R/2Ne7j5c2fatx2VxOw3b5yVuJX8viU=
X-Gm-Gg: AZFdTZdsAFfk+2+RkZz7tyS5bN+uIevvIKPe6L3MjoMBOsS20uHsnjyDYrCLB+CwUKK
	I8srjDIAFRyiF5id1qOwI9CDFEJNx//dpQtNhlOOMsSHzlZ0WEweDna1tjGWeuzTkbhbBe/JY17
	UlEAtYURsD/FbpsH6DzMCr25Oqg7ZjGU0IIVTBISyumbusG4wIiGN4qSbXSoUFsfp7M1K+DKIgb
	pV+MeVBe0secrAnUNZRp/02WMPz3ovgg6eljzJod3yKJwkN9Z6GX1mHYwARRK2TyuT2OxUk46jB
	+FvelohgI+xFP4/gixi8kQQS3zBV6a2Y2HXdIm0vcYFS1PIkir8bWvMw06Wl6gUN5Qx/PdRGdZ5
	1RJqolsh79koXPRl0W2QW2rf7vNC/NaIVH+5Msd3975KIZYbpr+WaZtrgwqFHRyxO0b/9vROTzj
	mnbbiwkx0gTCcUsX9T2miUV1rgaA==
X-Received: by 2002:a05:6808:6413:b0:574:9463:5511 with SMTP id 5614622812f47-57a0b64e63emr10305934b6e.48.1795415318450;
        Sun, 22 Nov 2026 22:28:38 -0800 (PST)
X-Received: by 2002:a05:6808:6413:b0:574:9463:5511 with SMTP id 5614622812f47-57a0b64e63emr10305924b6e.48.1795415317985;
        Sun, 22 Nov 2026 22:28:37 -0800 (PST)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a362575fbsm8762533b6e.17.2026.11.22.22.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:28:37 -0800 (PST)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 22:28:09 -0800
Subject: [PATCH v2 3/4] leds: rgb: leds-qcom-lpg: Add mutex lock in
 lpg_pwm_get_state()
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261122-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v2-3-2e885f60fbeb@oss.qualcomm.com>
References: <20261122-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v2-0-2e885f60fbeb@oss.qualcomm.com>
In-Reply-To: <20261122-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v2-0-2e885f60fbeb@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Griffin Kroah-Hartman <griffin@kroah.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Anjelique Melendez <quic_amelende@quicinc.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-doc@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795415311; l=812;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=E9cLjwDx5BK+zqMQtgOEwMzmeW7XdmjYZZoDgxpPWPY=;
 b=ehXU+osAStcKgvOmBX+U39c081WCbpCMsxGMgWGRC4JcPzKSYDLvwF00BsXf/XqO2HVbLJ1Ms
 Myww3XaRcV/AX9Kgqh1dmfCyAefHpUPgvwQzNxiIiL+uNoVHerQl8di
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-ORIG-GUID: dA1IMe_DXu1CgeSVEBLFN06tN9bAhEc2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyNSBTYWx0ZWRfXzOIiXE509hZh
 3wGB7X7GqC4a41EyAUr/X9IxuPiw3oVK4S+GyNxdL38k5pA9M9mXfzCJiLb+gx5Fpp9GWzmr59O
 TYPa72m7kEpKc6jecS3yJFTLAA2nPkJBe2WdbGfO5JJI4Ph8tHs0I+3eWVppNooBvBN70XRPai6
 91ayfIO80WI8bvOoI/vUGF0PWL7oXIdzG4RXYklcr8Xd3BzjqrYybIrv4BnJgmUi/oAb/qjctaD
 555UDgM3YDEpPXYa9uP6puj+C6F0HAtGM3FTBCzC7REiEBwAS8PInW3k28nN2r7GZLKNr4bohMP
 q1rJLqoAjmagS+FPPIQ9DvMsNBKlvgS2+B7agO0ZKsFBpmy8k4cu9NWwuyW1bYGCbqLgCGuGzvD
 uL9rOqREEHj407YfcKe1+8Y4AB9ixIl5PGgj38sv25NeFFH34pp6DevnXyJewD6LLRg89ZfbGc2
 QXrBlDEjt6EBVoDLA3Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyNSBTYWx0ZWRfX/6OBCsDoBRBv
 WDRBcdoR+2/i2fKWzABRjuO1PJRkqCrbvXVcglKxI8B/j4XmtNLzdVRTSb0+vQIqKSpGu88qnay
 6aLpQTiVDJkY0N4u8EQ8O75DyHCXs2Q=
X-Proofpoint-GUID: dA1IMe_DXu1CgeSVEBLFN06tN9bAhEc2
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b03dd17 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=_SGh9dyU8YcHfL2lJxYA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230025

Guard mutex lock at the top of lpg_pwm_get_state(), to make the
register read atomic against the register write in LED callbacks.

Fixes: 24e2d05d1b68 ("leds: Add driver for Qualcomm LPG")
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 drivers/leds/rgb/leds-qcom-lpg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 763d6379bd2e..5d8f82ed228a 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -1470,6 +1470,8 @@ static int lpg_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	u16 pwm_value;
 	int ret;
 
+	guard(mutex)(&lpg->lock);
+
 	ret = regmap_read(lpg->map, chan->base + LPG_SIZE_CLK_REG, &val);
 	if (ret)
 		return ret;

-- 
2.43.0

