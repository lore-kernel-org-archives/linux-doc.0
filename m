Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1664041B36E
	for <linux-doc@vger.kernel.org>; Fri,  6 Mar 2026 17:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772817804; cv=none; b=FA0I7IxboFLc8FkmvcjQSxarAuP81Ku8kjtUJQKG1KO4OUOwv6n19ou1fBcifb/xDiJHiQTmagFrDzuQ9yoZOrQ6Qfbz6oY3nCxeckojTk0iuUwZkHy0njfTrbDIjw1c1GXxWHsIIMzmH1hUm9zpRxOBAG+xNch+iDhFSQ8va9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772817804; c=relaxed/simple;
	bh=C48vFSRrg2JEknHH444d34BLohfOaAI8aBE9ypO2ysg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hy1MN/MEdpUK5M0pEylAUhoYs/dJbbnq/26XFVq2jyvvoVXrZHTimaRhSKSrAqAzQqPtmP0ejbQg1CrIxJVA+yHf+evPf0tM4AF51jW4TyBo5uJccFq1jHZWPRn4wyXQDhOrygS5mgxtL2s1MnQl3vuDw1y7f2s8jDDopg5oKdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mXgVFsak; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jzogJlgn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mXgVFsak";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jzogJlgn"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626H2H0g2734430
	for <linux-doc@vger.kernel.org>; Fri, 6 Mar 2026 17:23:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tt2DVErFoT4UqoXMqFcWdciyF+4IHYB0aOM/UZND7O8=; b=mXgVFsakfIdySeqw
	Bx+x0EY6gquAnHaVBBQk4QeCzHk5nGDDxOE+qT1dplDKIZ+7ZpS0W047PrPUImQA
	p0zpPeJc8GtfdXSNZQeSd+54C6s79Jnhb/0NRDtPw2UR0JWlzCBTbMNl0clQpTkQ
	1M6kXCDz6CD9glFJg71tK1QhogcFTtCrq/OTQpxDIAGPm6QcA7vuO6qUYLkMlguu
	PQI+vuMF644Jx/6FrORPGYRYBdyWYhW/NJfEDeXXIpk58HoQwLTW4nGmIHZJ7HYz
	dyCUSDs2wSXI8wcTZzid05MC2vrSko+fs2jdxeT6XafpGT9M/l6Z6VPuhywBZgG7
	jUnxcA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr2utr464-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 06 Mar 2026 17:23:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70ef98116so6167933585a.1
        for <linux-doc@vger.kernel.org>; Fri, 06 Mar 2026 09:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772817801; x=1773422601; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tt2DVErFoT4UqoXMqFcWdciyF+4IHYB0aOM/UZND7O8=;
        b=jzogJlgnIZVMG7COtkr628Ymt/NB3lCSXZlhmiYijQPofrQgqQFoB0QY+yIe+3jg9h
         +0OuChyz4Y55VX/aN9lRtJpMcvhtZroll/qYTJvhpF35cQYnvcMtDrVbMnkLd/5jYkPM
         /BUUCEzno/krstqpS7aTvHVCWuX1N5qfQw01u913elv1p6woA2G16XJ5E9KBWDic9K2F
         ZUngE7UWNh9l0WWrhL+7OD5t8x01F+vCEExdRqWjAXdElGLqo9V/C+HZAPY+/3sLG+nE
         /2z3CsTs8f/oC38LMYES6yBpW8NXFNoPM1z602xZlqIqgzfigL7K2ZOxi63Kc7StpU51
         6l3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772817801; x=1773422601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tt2DVErFoT4UqoXMqFcWdciyF+4IHYB0aOM/UZND7O8=;
        b=hwSR8aUhN/QbJMT5yBcmF4bRU7hZycUaC/+jniXPEyAj9Hq8V3OBQdPokOFppTNEWM
         L2vWjdysH4R6gW4lizG+zNv7EcFf7/3TIoa+BN7YpiBaIKjmZgoIbDPmIo3eyLjwbzn5
         pg6giBRoPV76rCB0j4+W0mqF7uIBuJWhrsvm6PvBe3mE3d8FCsgSQ5kRLEihXxfLYVbJ
         QYM4XHDStngeR73XLrxUwuaQYrRszKRfGfLcCp/JyrTIWH/vmtxNxzFIKM9wPpljO594
         U6QRb321kDB/IDhh8ukOnWcjoVLfPFPsGRxn7dZQutcj5zy0oJod4ox3LCoi+LdHCrY7
         hrjg==
X-Forwarded-Encrypted: i=1; AJvYcCW3hODL3i6F0PZlBTwS7fIcIYPo8Jzaqo8rmfiQERR4s2YRaOIcyLLIKjwgCtYKQ0gYJwcT+XK+Ck0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvCy7t1iVGYMudt1kBPWxC9uTUY/xms0dH9vjUITvw4fnm0I6C
	BWcxymHZtlsz0dlOXZ7MCxNhtL2IsZxjQphUfw4sW4+LyfBcAXlrhUXxvNKxOvuV8t2xeJ+aChn
	osoZ2hflqPBgs2n8KLfW5DdzNqPvMNPeJT+6JWt4tWn5cIS3+NgkeSGMAiwc6kHw=
X-Gm-Gg: ATEYQzzDFv0ZnwUQ+SKPjLtxrRn6IFrnFylH5gLHOSmTRAmvjzejH+0IEkjA/G5eAiN
	l4jNHdeAlRlGY7SYIq2rn92Yt2tFuQ2Tl7/kd/pgeGPO7U7Ls/63iWb+m5VfMTp+Q5jL+b0NJKx
	7+vwmFeHmfGsZONvMrbYJ2mv3Ai47szUTW2ody/lKSeNhBeEeCxZy3M+yVXCNQqGeINKEuZEoZ9
	g5oyhtvEAtyyl/Ig26S6B3a4GhsWw1Rg4nI68ufm37SZSKcbmA50Lqg9imsROe3lRGsqbJjQJuw
	WWH1Fdaeioactx33SNJ1JKT1INg6dHsnsMQgKbcoIiQRWvm2eJw/D5MfQ31ZDxvlRm47fz866BP
	uKkUr5K7zOuvpFjMhN78WR+BR8jUltVR9GHRtOiTQH6APNJ2U5EF2
X-Received: by 2002:a05:620a:372a:b0:8ca:110b:38cc with SMTP id af79cd13be357-8cd6d448a12mr350719385a.27.1772817801462;
        Fri, 06 Mar 2026 09:23:21 -0800 (PST)
X-Received: by 2002:a05:620a:372a:b0:8ca:110b:38cc with SMTP id af79cd13be357-8cd6d448a12mr350715785a.27.1772817800987;
        Fri, 06 Mar 2026 09:23:20 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:28b1:4950:7702:bb20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527686fa9sm61488475e9.8.2026.03.06.09.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 09:23:20 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:22:49 +0100
Subject: [PATCH v3 05/14] reset: warn on reset-gpio release
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-reset-core-refactor-v3-5-599349522876@oss.qualcomm.com>
References: <20260306-reset-core-refactor-v3-0-599349522876@oss.qualcomm.com>
In-Reply-To: <20260306-reset-core-refactor-v3-0-599349522876@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, brgl@kernel.org, linux-doc@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=C48vFSRrg2JEknHH444d34BLohfOaAI8aBE9ypO2ysg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpqw12HkyjK5bgPZQxYnSqEQfVK3Ze2+rWpiKQU
 JxnI6lHWg6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaasNdgAKCRAFnS7L/zaE
 w/6IEACdr/8UDzbi6fv6V8F0zt9ZvL7NDhCktZ/nOVsWUG/0o6zNpCOYtNBWdw3+SpBsFPYhpgr
 UgfMSiJaFg3c7kGiFfL86XGctwbJqaEeKehg9q6FDlThI2TX+QEZR1iT+d1xNXvfGA0Ugs3te2+
 6PuzMeGmiadbXlXqB4hjIJ4wGt46eh0+6rO8glZ5mY58eXxvC0UNHWQgKPLqqXEZV8ly3dOJY39
 2p7cODS1yE8nXyr/1FsoQ9Web2UHmvv0VZE2maW30Hbvu7xAM9taIidtP5HxdfCylnZmwttvfi3
 Zgm3VOC+k1u8kBF9toOwCyb7l0epdLQM5sgmrjKK5gGkI1aNLpyXeDhqtJsbauXjI5YFgVkCg3f
 U26BF2snVdGNBu/+mNxEGhJBAuynaZMf51v9PMFpReU42Gdfafg0Ff3JlqQzaydNbCnsopu+ogx
 JE0XqlT1gn81FYQ5zekGgJqPjBHD7o0gRpxLOshT0xt3DO1bfUlFpzk2MSthvvSHDV+7GvuSRv/
 VMB/XZJGvK4iJ/H7NEGk+KXU2hW4QAS4W1siGu5prKOHfcV9Qmy7En3j7/L2r6BmO2X/r0DRmmM
 cVdVxl4fjaYAZN5F/uLpUSR1N/sF/qmP+3rEGcLjYqhozY0+5veA1AVan5fLPT3D7mOCpO5qaxT
 9W9eqWHCDEqJs/g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=N8ok1m9B c=1 sm=1 tr=0 ts=69ab0d8a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=ZUnkwru6gbkhQxgbgcoA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE2NCBTYWx0ZWRfX/UY0i6/QsMDM
 j6GXFgTayQ7lJ4VNgMaHzN/w+FYfkReo3eNhLylK4xW3bjTluNc15T58nzB9I6DYvYFi66Nl4nj
 p8RMaFIcScc7+bZseKcP6uqryxqmLeLXC6bzvSLwBm8e8cjQajTHUDAXcMsca8ZTbPSXngj3gY8
 o34OAibpes5V9YBZgyqwDt5rUF6cOMR/qFdHaHIcpuvFFgczR8zPLUkVYMZftb94PI4AhQcb9J4
 dwoihWqiAnCyDhO0bJuOXRIHwPUD4/RHlhkS8yh2rECZH7A0pk3/628PobFo+nqJicliM7OCnoM
 d5ogkYpoXHy8WfWgacWxQf+iAwU/XFzJpYVGbpSX0GU09INDuWg6Ri8spiZ1Ff/1jqb5d8SuRy8
 OKiDYrbIR+CwT9OUGCkE729G9uPAWiF5fCzEG+utcFb27xjS3ysUp4ZDf25Y6cy/LNYFh/JZb8w
 n1SJRj3DPHa1H/Pks+A==
X-Proofpoint-GUID: exrjPK6XSjKC6i321HPZIdJE5muN4G8W
X-Proofpoint-ORIG-GUID: exrjPK6XSjKC6i321HPZIdJE5muN4G8W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603060164

While we implement an empty .release() callback for reset-gpio (driver
core requires it), this function will never actually be called as nobody
ever removes the device and the last reference is not dropped anywhere.

This is by design - once created, the reset-gpio device stays in memory.
Make the .release() callback emit a warning, should it ever be called
due to a programming bug.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/reset/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 954df36a242e804b639027384700b8d988be0e90..3e55f794d539e4edc99104cb5396cac72ba30618 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -820,7 +820,7 @@ static void __reset_control_put_internal(struct reset_control *rstc)
 
 static void reset_gpio_aux_device_release(struct device *dev)
 {
-
+	WARN("reset-gpio device %s should never have been removed", dev_name(dev));
 }
 
 static int reset_create_gpio_aux_device(struct reset_gpio_lookup *rgpio_dev,

-- 
2.47.3

